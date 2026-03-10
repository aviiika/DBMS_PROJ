package com.hospital.pm.project;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class ProjectService {

    private final ProjectRepository projectRepository;

    public ProjectService(ProjectRepository projectRepository) {
        this.projectRepository = projectRepository;
    }

    public List<ProjectResponse> listProjects() {
        return projectRepository.findAll().stream()
                .map(ProjectResponse::fromEntity)
                .toList();
    }

    public ProjectResponse createProject(ProjectRequest request) {
        Project project = new Project();
        project.setName(request.name());
        project.setStatus(request.status());
        project.setDepartmentId(request.departmentId());
        Project saved = projectRepository.save(project);
        return ProjectResponse.fromEntity(saved);
    }
}
