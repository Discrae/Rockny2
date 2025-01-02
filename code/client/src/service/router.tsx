import { createBrowserRouter } from "react-router";
import HomePage from "../page/HomePage";
import BaseLayout from "../layout/BaseLayout";

const router = createBrowserRouter([
	{
		path: "/",
		element: <BaseLayout />,
		children: [
			{
				path: "",
				element: <HomePage />,
			},
		],
	},
]);

export default router;
