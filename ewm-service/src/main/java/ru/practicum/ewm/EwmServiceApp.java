package ru.practicum.ewm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class EwmServiceApp {
    public static void main(String[] args) {
        SpringApplication.run(EwmServiceApp.class, args);
    }
}
/*
Public
Возможность показать рейтинг asc и desc с пагинацией+++
Получение рандомного события из списка+++
Добавить методы в паб и прив контроллеры+++
Private
Возможность ставить лайки и дизлайки+++
Возможность удалять лайки и дизлайки+++
Возможность показать рейтинг asc и desc с пагинацией+++
Получение рандомного события из списка+++
Добавить один репозиторий(Like)+++
Проверка на то, что человек уже оценивал событие+++
Добавить лайк сервис+++

Для подсчёта лайков делать запрос к бд на ограниченное кол-во евентов,
 отсортированных по каунту лайков, дизлайков, общему каунту.

 */