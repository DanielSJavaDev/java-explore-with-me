package ru.practicum.dto;

import com.sun.istack.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HitDto {
    @NotNull
    String app;
    @NotNull
    String uri;
    @NotNull
    String ip;
    @NotNull
    String timestamp;
}