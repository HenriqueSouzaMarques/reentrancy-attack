async function main() {
    const VulnerableDAO = await ethers.deployContract("VulnerableDAO");
    await VulnerableDAO.waitForDeployment();
    console.log("Contrato implantado em: ", VulnerableDAO.target);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });