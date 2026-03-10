const BASE_URL = import.meta.env.VITE_API_BASE_URL ?? 'http://localhost:8080';

export async function getHealth(): Promise<{ status: string; service: string; timestamp: string }> {
  const response = await fetch(`${BASE_URL}/api/health`);
  if (!response.ok) {
    throw new Error('Failed to fetch health status');
  }
  return response.json();
}

export async function getProjects(): Promise<Array<{ id: number; name: string; status: string; departmentId: number }>> {
  const response = await fetch(`${BASE_URL}/api/projects`);
  if (!response.ok) {
    throw new Error('Failed to fetch projects');
  }
  return response.json();
}
