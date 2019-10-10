From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 01/22] mtd: spi-nor: hisi-sfc: Drop nor->erase NULL
 assignment
Date: Thu, 10 Oct 2019 08:49:46 +0200
Message-ID: <20191010084946.62fb8449@dhcp-172-31-174-146.wireless.concordia.ca>
References: <20190924074533.6618-1-tudor.ambarus@microchip.com>
        <20190924074533.6618-2-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190924074533.6618-2-tudor.ambarus@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tudor.Ambarus@microchip.com
Cc: vigneshr@ti.com, marek.vasut@gmail.com, linux-mtd@lists.infradead.org, geert+renesas@glider.be, jonas@norrbonn.se, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, richard@nod.at, linux-kernel@vger.kernel.org, vz@mleia.com, linux-mediatek@lists.infradead.org, joel@jms.id.au, miquel.raynal@bootlin.com, matthias.bgg@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 24 Sep 2019 07:45:50 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> The pointer to 'struct spi_nor' is kzalloc'ed above in the code.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/hisi-sfc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
> index 6dac9dd8bf42..c99ed9cdbf9c 100644
> --- a/drivers/mtd/spi-nor/hisi-sfc.c
> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
> @@ -364,7 +364,6 @@ static int hisi_spi_nor_register(struct device_node *np,
>  	nor->write_reg = hisi_spi_nor_write_reg;
>  	nor->read = hisi_spi_nor_read;
>  	nor->write = hisi_spi_nor_write;
> -	nor->erase = NULL;
>  	ret = spi_nor_scan(nor, NULL, &hwcaps);
>  	if (ret)
>  		return ret;
