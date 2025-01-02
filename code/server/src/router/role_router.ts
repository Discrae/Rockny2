import express, {type Response, type Request} from "express";
import RoleController from "../controller/role_controller.js";

class RoleRouter {
    // Propriétés
    private router = express.Router();

    // Méthode  
    public getRoutes = () => {
        this.router.get("/", new RoleController().index);

        // Créer une variable de route en la préfixant d'un --> :
        this.router.get("/:id", new RoleController().one)

        return this.router;
    };
}
export default RoleRouter