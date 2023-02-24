package ru.practicum.client;

import org.springframework.web.client.RestTemplate;

public class HitClient extends BaseClient {
    public HitClient(RestTemplate rest) {
        super(rest);
    }
}
