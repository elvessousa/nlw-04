import app from '../app';
import request from 'supertest';

import createConnection from '../database'

describe("Users", () => {
  beforeAll(async () => {
    const connection = await createConnection();
    await connection.runMigrations();
  });

  it('Should be able to create a user', async () => {
    const response = await request(app).post('/users').send(
      {email: 'user@example.com', name: 'Example User'}
    );

    expect(response.status).toBe(201);
  });

  it('Should not be able to create a user with an existing email', async () => {
    const response = await request(app).post('/users').send(
      {email: 'user@example.com', name: 'Example User'}
    );

    expect(response.status).toBe(400);
  });
});
