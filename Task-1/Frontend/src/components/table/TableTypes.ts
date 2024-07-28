interface IFild {
  name: string;
  type: string;
  required?: boolean;
  readonly?: boolean;
  max?: number;
  min?: number;
  maxlength?: number;
}

interface IFildObject {
  [key: string]: IFild;
}

export type { IFild, IFildObject };
