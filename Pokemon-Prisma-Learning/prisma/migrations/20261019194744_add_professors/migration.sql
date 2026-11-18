-- CreateTable
CREATE TABLE "Professor" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "labCityId" INTEGER NOT NULL,

    CONSTRAINT "Professor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameProfessor" (
    "gameId" INTEGER NOT NULL,
    "professorId" INTEGER NOT NULL,

    CONSTRAINT "GameProfessor_pkey" PRIMARY KEY ("gameId","professorId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Professor_name_key" ON "Professor"("name");

-- AddForeignKey
ALTER TABLE "Professor" ADD CONSTRAINT "Professor_labCityId_fkey" FOREIGN KEY ("labCityId") REFERENCES "City"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameProfessor" ADD CONSTRAINT "GameProfessor_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameProfessor" ADD CONSTRAINT "GameProfessor_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "Professor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
