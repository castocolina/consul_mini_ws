package com.example.consuldemo

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import java.util.concurrent.TimeUnit

@RestController
@RefreshScope
public class GreetingController {

	@Value("\${spring.application.name:Sample}")
	private final String appName;

	@Value("\${common.greeting:Hell0, %s!}")
	private final String commonTemplate;

    @Value("\${consul-demo2.greeting:Hell0, %s!}")
	private final String template;

    @Value("\${common.delay:5}")
	private final Integer commonDelay;

	@Value("\${consul-demo2.delay:5}")
	private final Integer delay;

	private final AtomicLong counter = new AtomicLong();

	public GreetingController(){
		super();
		System.out.println(String.format("APP NAME: %s", appName));
	}

	@GetMapping("/common")
	public Greeting common(@RequestParam(value = "name", defaultValue = "Common World") String name) {
		TimeUnit.SECONDS.sleep(commonDelay);
		return new Greeting(counter.incrementAndGet(), String.format(commonTemplate, name));
	}

	@GetMapping("/greeting")
	public Greeting greeting(@RequestParam(value = "name", defaultValue = "Special World") String name) {
		TimeUnit.SECONDS.sleep(delay);
		return new Greeting(counter.incrementAndGet(), String.format(template, name));
	}
}