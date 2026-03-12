import { ApiProperty } from '@nestjs/swagger';
<<<<<<< HEAD
import { IsNotEmpty, IsString, IsUrl } from 'class-validator';

export class VerificationDocumentDto {
  @ApiProperty({
    example: 'https://cdn.example.com/docs/passport-1.jpg',
    description: 'URL of the verification document photo',
  })
  @IsString()
  @IsNotEmpty()
  @IsUrl()
=======
import { IsNotEmpty, IsString } from 'class-validator';

export class VerificationDocumentDto {
  @ApiProperty({
    example: '/uploads/kyc/documents/passport-1.jpg',
    description: 'Path of the uploaded verification document',
  })
  @IsString()
  @IsNotEmpty()
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
  documentUrl: string;
}