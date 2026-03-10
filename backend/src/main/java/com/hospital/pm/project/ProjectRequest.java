package com.hospital.pm.project;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record ProjectRequest(
        @NotBlank @Size(max = 120) String name,
        @NotBlank @Size(max = 30) String status,
        @NotNull Long departmentId
) {
}
