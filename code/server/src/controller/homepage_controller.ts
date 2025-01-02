import {json, type Request, type Response} from "express";
import RoleRepository from "../repository/role_repository.js";

class HomepageController {
	
    public index = async (req: Request, res: Response) => {
		// Status: code de status HTTP
        // Json : formater une réponse en JSON
        const result = await new RoleRepository().selectAll();
        console.log(result);
        
        res.status(200).json({
            status: 200,
            message: "Welcome to my Homepage; DISCRAE Prod. API",
        });
	};
}
export default HomepageController