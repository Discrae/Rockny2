import { Outlet } from "react-router";
import Footer from "../component/common/Footer";
import Nav from "../component/common/Nav";

const BaseLayout = () => {
	return (
		<>
			<Nav />
			<Outlet />
			<Footer />
		</>
	);
};

export default BaseLayout;
