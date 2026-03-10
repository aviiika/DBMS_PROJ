package com.hospital.pm.project;

public record ProjectResponse(Long id, String name, String status, Long departmentId) {

    public static ProjectResponse fromEntity(Project project) {
        return new ProjectResponse(
                project.getId(),
                project.getName(),
                project.getStatus(),
                project.getDepartmentId()
        );
    }
}
