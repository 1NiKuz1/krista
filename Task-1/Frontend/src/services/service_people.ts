import { api } from "./api";

interface IPerson {
  id_person?: number;
  login: string;
  age: number;
  email: string;
}

interface IPeopleService {
  getAll(): Promise<IPerson[] | never>;
  getOne(id: number): Promise<IPerson | never>;
  add(person: IPerson): Promise<any | never>;
  update(id: number, person: IPerson): Promise<any | never>;
  delete(id: number): Promise<any | never>;
}

class PeopleService implements IPeopleService {
  async getAll(): Promise<IPerson[] | never> {
    try {
      const result = await api.get("/people");
      return result?.data != null ? result.data : [];
    } catch (error) {
      return Promise.reject(error);
    }
  }
  async getOne(id: number): Promise<IPerson | never> {
    try {
      const result = await api.get("/people/" + id);
      return result?.data != null ? result.data : {};
    } catch (error) {
      return Promise.reject(error);
    }
  }
  async add(person: IPerson): Promise<any | never> {
    try {
      return api.post("/people/add", person);
    } catch (error) {
      return Promise.reject(error);
    }
  }
  async update(id: number, person: IPerson): Promise<any | never> {
    try {
      return await api.put("/people/update/" + id, person);
    } catch (error) {
      return Promise.reject(error);
    }
  }
  async delete(id: number): Promise<any | never> {
    try {
      return await api.delete("/people/delete/" + id);
    } catch (error) {
      return Promise.reject(error);
    }
  }
}

export { PeopleService };
export type { IPeopleService, IPerson };
