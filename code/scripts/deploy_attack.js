async function main() {
    const vulnerableDAOAddress = "0xc83003B2AD5C3EF3e93Cc3Ef0a48E84dc8DBD718";

    // Implantar o contrato ReentrancyAttack
    const ReentrancyAttack = await ethers.deployContract("ReentrancyAttack", [vulnerableDAOAddress]);
    await ReentrancyAttack.waitForDeployment();
    
    console.log("Contrato ReentrancyAttack implantado em: ", ReentrancyAttack.target);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
