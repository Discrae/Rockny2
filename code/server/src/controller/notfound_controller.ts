import {json, type Request, type Response} from "express";

class NotFoundController {
	
    public index = (req: Request, res: Response) => {
		// Status: code de status HTTP
        // Json : formater une réponse en JSON
        
        res.status(200).json({
            status: 200,
            message: "Welcome to my API",
        });
	};
}
export default NotFoundController