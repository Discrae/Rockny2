import type Role from "./role.js";

// Reprendre strictement le nom des colonnes SQL
type User = {
	id: number;
	nickname: string;
	email: string;
	password: string;

	id_role: number;
	role: Role;
};

export default User;
