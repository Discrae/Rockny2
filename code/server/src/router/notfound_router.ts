import express, {type Response, type Request} from "express";
import NotFoundController from "../controller/notfound_controller.js";

class NotFoundRouter {
    // Propriétés
    private router = express.Router();

    // Méthode  
    public getRoutes = () => {
        this.router.get("*", new NotFoundController().index);
        return this.router;
    };
}
export default NotFoundRouter