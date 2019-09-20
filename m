From: <Tudor.Ambarus-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH 19/23] mtd: spi-nor: Rework
 spansion(_no)_read_cr_quad_enable()
Date: Fri, 20 Sep 2019 04:42:55 +0000
Message-ID: <9aa3cc95-33f1-74b5-d739-d4e7ef92d242@microchip.com>
References: <20190917155426.7432-1-tudor.ambarus@microchip.com>
 <20190917155426.7432-20-tudor.ambarus@microchip.com>
 <f811a9a6-4b88-e017-5cc6-ad758edbcab3@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <f811a9a6-4b88-e017-5cc6-ad758edbcab3-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Content-ID: <24E54A8CF30EF742803303509F7A70A7-Hry67jCOGbCcE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: vigneshr-l0cyMroinI0@public.gmane.org, boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org



On 09/19/2019 08:34 PM, Vignesh Raghavendra wrote:
> 
> 
> On 17-Sep-19 9:25 PM, Tudor.Ambarus-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org wrote:
>> From: Tudor Ambarus <tudor.ambarus-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>
>> Merge:
>> spansion_no_read_cr_quad_enable()
>> spansion_read_cr_quad_enable()
>>
>> in spi_nor_sr2_bit1_quad_enable().
>>
>> Avoid duplication of code by using spi_nor_write_16bit_sr_and_check(),
>> the SNOR_F_NO_READ_CR case is treated there.
>>
>> We now do the Read Back test even for the old
>> spansion_no_read_cr_quad_enable() case.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 89 ++++++++++---------------------------------
>>  include/linux/mtd/spi-nor.h   |  4 +-
>>  2 files changed, 22 insertions(+), 71 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 2f79923e7db5..8648666fb9bd 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -907,7 +907,7 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 status_new,
>>  		 * Write Status (01h) command is available just for the cases
>>  		 * in which the QE bit is described in SR2 at BIT(1).
>>  		 */
>> -		sr_cr[1] = CR_QUAD_EN_SPAN;
>> +		sr_cr[1] = SR2_QUAD_EN_BIT1;
>>  	} else {
>>  		sr_cr[1] = 0;
>>  	}
>> @@ -1963,81 +1963,34 @@ static int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
>>  }
>>  
>>  /**
>> - * spansion_no_read_cr_quad_enable() - set QE bit in Configuration Register.
>> + * spi_nor_sr2_bit1_quad_enable() - set the Quad Enable BIT(1) in the Status
>> + * Register 2.
>>   * @nor:	pointer to a 'struct spi_nor'
>>   *
>> - * Set the Quad Enable (QE) bit in the Configuration Register.
>> - * This function should be used with QSPI memories not supporting the Read
>> - * Configuration Register (35h) instruction.
>> - *
>> - * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
>> - * memories.
>> - *
>> - * Return: 0 on success, -errno otherwise.
>> - */
>> -static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
>> -{
>> -	u8 *sr_cr = nor->bouncebuf;
>> -	int ret;
>> -
>> -	/* Keep the current value of the Status Register. */
>> -	ret = spi_nor_read_sr(nor, &sr_cr[0]);
>> -	if (ret)
>> -		return ret;
>> -
>> -	sr_cr[1] = CR_QUAD_EN_SPAN;
>> -
>> -	return spi_nor_write_sr(nor, sr_cr, 2);
>> -}
>> -
>> -/**
>> - * spansion_read_cr_quad_enable() - set QE bit in Configuration Register.
>> - * @nor:	pointer to a 'struct spi_nor'
>> - *
>> - * Set the Quad Enable (QE) bit in the Configuration Register.
>> - * This function should be used with QSPI memories supporting the Read
>> - * Configuration Register (35h) instruction.
>> - *
>> - * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
>> - * memories.
>> + * Bit 1 of the Status Register 2 is the QE bit for Spansion like QSPI memories.
>>   *
>>   * Return: 0 on success, -errno otherwise.
>>   */
>> -static int spansion_read_cr_quad_enable(struct spi_nor *nor)
>> +static int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
>>  {
>> -	u8 *sr_cr = nor->bouncebuf;
>>  	int ret;
>>  
>> -	/* Check current Quad Enable bit value. */
>> -	ret = spi_nor_read_cr(nor, &sr_cr[1]);
>> -	if (ret)
>> -		return ret;
>> -
>> -	if (sr_cr[1] & CR_QUAD_EN_SPAN)
>> -		return 0;
>> +	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
>> +		/* Check current Quad Enable bit value. */
>> +		ret = spi_nor_read_cr(nor, &nor->bouncebuf[0]);
>> +		if (ret)
>> +			return ret;
>>  
>> -	sr_cr[1] |= CR_QUAD_EN_SPAN;
>> +		if (nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)
>> +			return 0;
>> +	}
>>  
>>  	/* Keep the current value of the Status Register. */
>> -	ret = spi_nor_read_sr(nor, &sr_cr[0]);
>> -	if (ret)
>> -		return ret;
>> -
>> -	ret = spi_nor_write_sr(nor, sr_cr, 2);
>> -	if (ret)
>> -		return ret;
>> -
>> -	/* Read back and check it. */
>> -	ret = spi_nor_read_cr(nor, &sr_cr[1]);
>> +	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
>>  	if (ret)
>>  		return ret;
>>  
>> -	if (!(sr_cr[1] & CR_QUAD_EN_SPAN)) {
>> -		dev_err(nor->dev, "Spansion Quad bit not set\n");
>> -		return -EIO;
>> -	}
>> -
>> -	return 0;
> 
> You need to set QE bit here before writing to CR register. This function
> does not do that.>
>> +	return spi_nor_write_16bit_sr_and_check(nor, nor->bouncebuf[0], 0xFF);>
> Neither does spi_nor_write_16bit_sr_and_check().

pff, you're right, I thought I did set it in spi_nor_write_16bit_sr_and_check(),
but in spi_nor_write_16bit_sr_and_check() I just read the CR, without setting
the QE bit. Will respin the entire series, thanks for catching this!

> We need a function that allows to modify SR2/CR register content as well
> so as to set QE bit right?
> 
> Regards
> Vignesh
> 
>>  }
>>  
>>  /**
>> @@ -2117,7 +2070,7 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
>>   *
>>   * Read-modify-write function that clears the Block Protection bits from the
>>   * Status Register without affecting other bits. The function is tightly
>> - * coupled with the spansion_read_cr_quad_enable() function. Both assume that
>> + * coupled with the spi_nor_sr2_bit1_quad_enable() function. Both assume that
>>   * the Write Register with 16 bits, together with the Read Configuration
>>   * Register (35h) instructions are supported.
>>   *
>> @@ -2138,7 +2091,7 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
>>  	 * When the configuration register Quad Enable bit is one, only the
>>  	 * Write Status (01h) command with two data bytes may be used.
>>  	 */
>> -	if (sr_cr[1] & CR_QUAD_EN_SPAN) {
>> +	if (sr_cr[1] & SR2_QUAD_EN_BIT1) {
>>  		ret = spi_nor_read_sr(nor, &sr_cr[0]);
>>  		if (ret)
>>  			return ret;
>> @@ -3642,7 +3595,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>  		 * supported.
>>  		 */
>>  		nor->flags |= SNOR_F_NO_READ_CR;
>> -		flash->quad_enable = spansion_no_read_cr_quad_enable;
>> +		flash->quad_enable = spi_nor_sr2_bit1_quad_enable;
>>  		break;
>>  
>>  	case BFPT_DWORD15_QER_SR1_BIT6:
>> @@ -3663,7 +3616,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>  		 * assumption of a 16-bit Write Status (01h) command.
>>  		 */
>>  		nor->flags |= SNOR_F_HAS_16BIT_SR;
>> -		flash->quad_enable = spansion_read_cr_quad_enable;
>> +		flash->quad_enable = spi_nor_sr2_bit1_quad_enable;
>>  		break;
>>  
>>  	default:
>> @@ -4626,7 +4579,7 @@ static void spi_nor_info_init_flash_params(struct spi_nor *nor)
>>  	u8 i, erase_mask;
>>  
>>  	/* Initialize legacy flash parameters and settings. */
>> -	flash->quad_enable = spansion_read_cr_quad_enable;
>> +	flash->quad_enable = spi_nor_sr2_bit1_quad_enable;
>>  	flash->set_4byte = spansion_set_4byte;
>>  	flash->setup = spi_nor_default_setup;
>>  	/* Default to 16-bit Write Status (01h) Command */
>> @@ -4844,7 +4797,7 @@ static int spi_nor_init(struct spi_nor *nor)
>>  	int err;
>>  
>>  	if (nor->clear_sr_bp) {
>> -		if (nor->flash.quad_enable == spansion_read_cr_quad_enable)
>> +		if (nor->flash.quad_enable == spi_nor_sr2_bit1_quad_enable)
>>  			nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
>>  
>>  		err = nor->clear_sr_bp(nor);
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index 3a835de90b6a..5590a36eb43e 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -144,10 +144,8 @@
>>  #define FSR_P_ERR		BIT(4)	/* Program operation status */
>>  #define FSR_PT_ERR		BIT(1)	/* Protection error bit */
>>  
>> -/* Configuration Register bits. */
>> -#define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
>> -
>>  /* Status Register 2 bits. */
>> +#define SR2_QUAD_EN_BIT1	BIT(1)
>>  #define SR2_QUAD_EN_BIT7	BIT(7)
>>  
>>  /* Supported SPI protocols */
>>
> 
