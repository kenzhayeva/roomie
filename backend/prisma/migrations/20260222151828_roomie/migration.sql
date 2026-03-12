CREATE TYPE "UserRole" AS ENUM ('USER', 'MODERATOR', 'ADMIN');

ALTER TABLE "users" ADD COLUMN "role" "UserRole" NOT NULL DEFAULT 'USER',
ADD COLUMN "verificationRejectReason" TEXT,
ADD COLUMN "verificationReviewedAt" TIMESTAMP(3),
ADD COLUMN "verificationReviewedBy" TEXT,
ADD COLUMN "verificationSelfieUrl" TEXT,
ALTER COLUMN "photos" DROP DEFAULT;

<<<<<<< HEAD
-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('USER', 'MODERATOR', 'ADMIN');

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "role" "UserRole" NOT NULL DEFAULT 'USER',
ADD COLUMN     "verificationRejectReason" TEXT,
ADD COLUMN     "verificationReviewedAt" TIMESTAMP(3),
ADD COLUMN     "verificationReviewedBy" TEXT,
ADD COLUMN     "verificationSelfieUrl" TEXT,
ALTER COLUMN "photos" DROP DEFAULT;
=======
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
