package com.github.x3n0r.soccerbet.services;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author A6714
 *
 */
public abstract class Service {

	protected static final Logger LOGGER = LoggerFactory.getLogger(Service.class);
	protected static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
	protected static final Lock INSERT_LOCK = new ReentrantLock(true);
	private static final String PARAM_ENCRYPTION = StandardCharsets.UTF_8.name();
	private static final ReadWriteLock CACHE_LOCK = new ReentrantReadWriteLock(true);
	private static final Map<String,Object> RESPONSE_CACHE;
	private static final String USER;
	private static final String PASSWORD;
	static {
		int maxCacheSize = 0;
		float maxCacheLoadFactor = 0F;
		String user = null;
		String password = null;
		Properties prop = new Properties();
		try (InputStream input = Service.class.getResourceAsStream("service.properties")) {
			prop.load(input);
			user = prop.getProperty("user");
			password = prop.getProperty("password");
			maxCacheSize = Integer.parseInt(prop.getProperty("max_cache_size"));
			maxCacheLoadFactor = Float.parseFloat(prop.getProperty("max_cache_load_factor"));
		} catch (Exception e) {
			maxCacheSize = 0;
			maxCacheLoadFactor = 0F;
		}
		int finalMaxSize = maxCacheSize;
		RESPONSE_CACHE = maxCacheSize > 0 && maxCacheLoadFactor > 0 ?
				new LinkedHashMap<String,Object>(Math.round(maxCacheSize/maxCacheLoadFactor),
				maxCacheLoadFactor, true) {
			
			private static final long serialVersionUID = 1L;
		
			@Override
			protected boolean removeEldestEntry(Entry<String,Object> eldest) {
				return size() > finalMaxSize;
			}
		} : null;
		USER = user;
		PASSWORD = password;
	}
	
	protected final String decodeUrlParameter(String parameter) {
		try {
			return URLDecoder.decode(parameter, PARAM_ENCRYPTION);
		} catch (UnsupportedEncodingException e) {
			// Cannot happen.
			return null;
		}
	}
	protected boolean authenticate(String user, String password) {
		return USER != null && USER.equals(user) && PASSWORD != null && PASSWORD.equals(password);
	}
	protected final void clearCache() {
		if (RESPONSE_CACHE == null)
			return;
		CACHE_LOCK.writeLock().lock();
		try {
			RESPONSE_CACHE.clear();
		} finally {
			CACHE_LOCK.writeLock().unlock();
		}
	}
	protected final void cacheResponse(String request, Object response) {
		if (RESPONSE_CACHE == null)
			return;
		CACHE_LOCK.writeLock().lock();
		try {
			RESPONSE_CACHE.put(request, response);
		} finally {
			CACHE_LOCK.writeLock().unlock();
		}
	}
	protected final Object lookUpResponse(String request) {
		if (RESPONSE_CACHE == null)
			return null;
		CACHE_LOCK.readLock().lock();
		try {
			return RESPONSE_CACHE.get(request);
		} finally {
			CACHE_LOCK.readLock().unlock();
		}
	}
	protected final Response buildOkResponse(Object entity) {
		return Response.ok(entity, MediaType.APPLICATION_JSON).build();
	}
	protected final Response buildErrorResponse(int statusCode, String errorMessage) {
		return Response.status(statusCode).entity(errorMessage).build();
	}
	
}
