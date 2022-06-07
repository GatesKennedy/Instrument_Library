import { EnvType, load } from 'ts-dotenv';
 
export type Env = EnvType<typeof schema>;
 
export const schema = {
    NODE_ENV: String,
    PORT: String
};
 
export let env: Env;
 
export function loadEnv(): void {
    env = load(schema);
}