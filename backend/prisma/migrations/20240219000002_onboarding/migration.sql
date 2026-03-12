CREATE TYPE "OnboardingStep" AS ENUM ('NAME_AGE', 'GENDER', 'CITY', 'DONE');

<<<<<<< HEAD
-- CreateEnum
CREATE TYPE "OnboardingStep" AS ENUM ('NAME_AGE', 'GENDER', 'CITY', 'DONE');

-- AlterTable
=======
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
ALTER TABLE "users" 
  ALTER COLUMN "firstName" DROP NOT NULL,
  ALTER COLUMN "lastName" DROP NOT NULL,
  ADD COLUMN "city" TEXT,
  ADD COLUMN "onboardingCompleted" BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN "onboardingStep" "OnboardingStep" NOT NULL DEFAULT 'NAME_AGE';
<<<<<<< HEAD
=======

>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
