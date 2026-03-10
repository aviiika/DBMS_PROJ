import { useEffect, useState } from 'react';
import { getHealth, getProjects } from '../services/api';

export function Dashboard() {
  const [health, setHealth] = useState<string>('Loading...');
  const [projects, setProjects] = useState<Array<{ id: number; name: string; status: string }>>([]);

  useEffect(() => {
    getHealth()
      .then((res) => setHealth(`${res.status} (${res.service})`))
      .catch(() => setHealth('Backend unavailable'));

    getProjects()
      .then((res) => setProjects(res))
      .catch(() => setProjects([]));
  }, []);

  return (
    <section style={{ padding: 24, fontFamily: 'Inter, sans-serif' }}>
      <h1>Hospital Project Management</h1>
      <p>Backend health: {health}</p>

      <h2>Current Projects</h2>
      {projects.length === 0 ? (
        <p>No projects yet. Seed data will appear after API writes.</p>
      ) : (
        <ul>
          {projects.map((project) => (
            <li key={project.id}>
              {project.name} — {project.status}
            </li>
          ))}
        </ul>
      )}
    </section>
  );
}
