import {json, type Request, type Response} from "express";
import RoleRepository from "../repository/role_repository.js";
import { stat } from "node:fs";
import { resourceLimits } from "node:worker_threads";

class RoleController {
	
    public index = async (req: Request, res: Response) => {
        // Récupérer tous les enregistrements
        const results = await new RoleRepository().selectAll();

        // Si la requête SQL renvoie une erreur
        if (results instanceof Error){
            res.status(400).json({
                status: 400,
                // Afficher un simple message pour la production, sinon afficher l'erreur
                message: process.env.NODE_ENV === "prod" ? 'Error' : results  
            });
            // Bloquer la suite du script
            return;
        }
        
        // status: Code du statut HTTP
        // json: Formater une réponse en JSON
        res.status(200).json({
            status: 200,
            message: "OK",
            data: results
        });
        return;
	};

    public one = async (req: Request, res: Response) => {
        // Récupérer un enregistrement
        const results = await new RoleRepository().selectOne(req.params);

        // Si la requête SQL renvoie une erreur
        if (results instanceof Error){
            res.status(400).json({
                status: 400,
                // Afficher un simple message pour la production, sinon afficher l'erreur
                message: process.env.NODE_ENV === "prod" ? 'Error' : results  
            });
            // Bloquer la suite du script
            return;
        }
        
        // status: Code du statut HTTP
        // json: Formater une réponse en JSON
        res.status(200).json({
            status: 200,
            message: "OK",
            data: results
        });
        return;
	};
}
export default RoleController