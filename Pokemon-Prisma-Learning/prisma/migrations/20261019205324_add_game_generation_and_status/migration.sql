-- AlterTable
ALTER TABLE "Game" ADD COLUMN     "generation" INTEGER,
ADD COLUMN     "releaseStatus" TEXT NOT NULL DEFAULT 'Released';
