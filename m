From: <Tudor.Ambarus-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH 17/23] mtd: spi-nor: Fix clearing of QE bit on
 lock()/unlock()
Date: Fri, 20 Sep 2019 05:23:26 +0000
Message-ID: <06a6e4e8-6802-3f85-ec3c-6295cd703c85@microchip.com>
References: <20190917155426.7432-1-tudor.ambarus@microchip.com>
 <20190917155426.7432-18-tudor.ambarus@microchip.com>
 <dceca616-2b98-9bc8-73e4-32fb06fc753d@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <dceca616-2b98-9bc8-73e4-32fb06fc753d-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Content-ID: <C2F6B467087FEE42995F694D31906562-Hry67jCOGbCcE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
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

Hi, Vignesh,

On 09/19/2019 05:33 PM, Vignesh Raghavendra wrote:
> External E-Mail
> 
> 
> Hi Tudor
> 
> [...]
> 
> On 17-Sep-19 9:25 PM, Tudor.Ambarus-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org wrote:
>> +static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 status_new,
>> +					    u8 mask)
>> +{
>> +	int ret;
>> +	u8 *sr_cr = nor->bouncebuf;
>> +	u8 cr_written;
>> +
>> +	/* Make sure we don't overwrite the contents of Status Register 2. */
>> +	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
> 
> Assuming SNOR_F_NO_READ_CR is not set...
> 
>> +		ret = spi_nor_read_cr(nor, &sr_cr[1]);
>> +		if (ret)
>> +			return ret;
>> +	} else if (nor->flash.quad_enable) {
>> +		/*
>> +		 * If the Status Register 2 Read command (35h) is not
>> +		 * supported, we should at least be sure we don't
>> +		 * change the value of the SR2 Quad Enable bit.
>> +		 *
>> +		 * We can safely assume that when the Quad Enable method is
>> +		 * set, the value of the QE bit is one, as a consequence of the
>> +		 * nor->flash.quad_enable() call.
>> +		 *
>> +		 * We can safely assume that the Quad Enable bit is present in
>> +		 * the Status Register 2 at BIT(1). According to the JESD216
>> +		 * revB standard, BFPT DWORDS[15], bits 22:20, the 16-bit
>> +		 * Write Status (01h) command is available just for the cases
>> +		 * in which the QE bit is described in SR2 at BIT(1).
>> +		 */
>> +		sr_cr[1] = CR_QUAD_EN_SPAN;
>> +	} else {
>> +		sr_cr[1] = 0;
>> +	}
>> +
> 
> CR_QUAD_EN_SPAN will not be in sr_cr[1] when we reach here. So code
> won't enable quad mode.
> 

I get the problem now. spi_nor_write_16bit_sr_and_check() does not modify the
value of the QE bit, which is good in the lock/unlock() case. We want to
lock/unlock() without enabling or disabling the Quad Mode.

As you found, the problem comes later in spi_nor_sr2_bit1_quad_enable() because
I use there spi_nor_write_16bit_sr_and_check() which keeps the value of the QE
bit, without setting it to one, so the spi_nor_sr2_bit1_quad_enable() did not
enable the Quad Mode if not previously enabled.

What I'll do is to introduce a new argument to:
static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 status_new,
					    u8 mask, bool set_quad_enable)

and do a
if (set_quad_enable)
	sr_cr[1] |= CR_QUAD_EN_SPAN;
after initializing sr_cr[1]

The lock/unlock() methods will call the function with set_quad_enable being
false (we don't want to modify the QE value), and the
spi_nor_sr2_bit1_quad_enable() will call it with set_quad_enable being true, we
want to set QE to one (we don't care of the QE bit previous value).

We'll avoid code duplication, lock/unlock() and spi_nor_sr2_bit1_quad_enable()
calling the same method.

Cheers,
ta
