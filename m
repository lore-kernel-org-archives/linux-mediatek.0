From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 17/23] mtd: spi-nor: Fix clearing of QE bit on
 lock()/unlock()
Date: Thu, 19 Sep 2019 20:03:34 +0530
Message-ID: <dceca616-2b98-9bc8-73e4-32fb06fc753d@ti.com>
References: <20190917155426.7432-1-tudor.ambarus@microchip.com>
 <20190917155426.7432-18-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917155426.7432-18-tudor.ambarus@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tudor.Ambarus@microchip.com, boris.brezillon@collabora.com, marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, joel@jms.id.au, andrew@aj.id.au, matthias.bgg@gmail.com, vz@mleia.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Tudor

[...]

On 17-Sep-19 9:25 PM, Tudor.Ambarus@microchip.com wrote:
> +static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 status_new,
> +					    u8 mask)
> +{
> +	int ret;
> +	u8 *sr_cr = nor->bouncebuf;
> +	u8 cr_written;
> +
> +	/* Make sure we don't overwrite the contents of Status Register 2. */
> +	if (!(nor->flags & SNOR_F_NO_READ_CR)) {

Assuming SNOR_F_NO_READ_CR is not set...

> +		ret = spi_nor_read_cr(nor, &sr_cr[1]);
> +		if (ret)
> +			return ret;
> +	} else if (nor->flash.quad_enable) {
> +		/*
> +		 * If the Status Register 2 Read command (35h) is not
> +		 * supported, we should at least be sure we don't
> +		 * change the value of the SR2 Quad Enable bit.
> +		 *
> +		 * We can safely assume that when the Quad Enable method is
> +		 * set, the value of the QE bit is one, as a consequence of the
> +		 * nor->flash.quad_enable() call.
> +		 *
> +		 * We can safely assume that the Quad Enable bit is present in
> +		 * the Status Register 2 at BIT(1). According to the JESD216
> +		 * revB standard, BFPT DWORDS[15], bits 22:20, the 16-bit
> +		 * Write Status (01h) command is available just for the cases
> +		 * in which the QE bit is described in SR2 at BIT(1).
> +		 */
> +		sr_cr[1] = CR_QUAD_EN_SPAN;
> +	} else {
> +		sr_cr[1] = 0;
> +	}
> +

CR_QUAD_EN_SPAN will not be in sr_cr[1] when we reach here. So code
won't enable quad mode.


> +	sr_cr[0] = status_new;
> +
> +	ret = spi_nor_write_sr(nor, sr_cr, 2);
> +	if (ret)
> +		return ret;
> +
> +	cr_written = sr_cr[1];
> +
> +	ret = spi_nor_read_sr(nor, &sr_cr[0]);
> +	if (ret)
> +		return ret;
> +
> +	if ((sr_cr[0] & mask) != (status_new & mask)) {
> +		dev_err(nor->dev, "Read back test failed\n");
> +		return -EIO;
> +	}
> +
> +	if (nor->flags & SNOR_F_NO_READ_CR)
> +		return 0;
> +
> +	ret = spi_nor_read_cr(nor, &sr_cr[1]);
> +	if (ret)
> +		return ret;
> +
> +	if (cr_written != sr_cr[1]) {
> +		dev_err(nor->dev, "Read back test failed\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +

Regards
Vignesh
