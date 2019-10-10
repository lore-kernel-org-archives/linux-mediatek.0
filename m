From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 05/22] mtd: spi-nor: Rework read_sr()
Date: Thu, 10 Oct 2019 09:13:56 +0200
Message-ID: <20191010091356.5d9a4e44@dhcp-172-31-174-146.wireless.concordia.ca>
References: <20190924074533.6618-1-tudor.ambarus@microchip.com>
 <20190924074533.6618-6-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190924074533.6618-6-tudor.ambarus@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tudor.Ambarus@microchip.com
Cc: linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, geert+renesas@glider.be, andrew@aj.id.au, richard@nod.at, linux-kernel@vger.kernel.org, vz@mleia.com, marek.vasut@gmail.com, jonas@norrbonn.se, linux-mtd@lists.infradead.org, joel@jms.id.au, miquel.raynal@bootlin.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, computersforpeace@gmail.com, dwmw2@infradead.org, linux-aspeed@lists.ozlabs.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 24 Sep 2019 07:46:08 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> static int read_sr(struct spi_nor *nor)
> becomes
> static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> 
> The new function returns 0 on success and -errno otherwise.
> We let the callers pass the pointer to the buffer where the
> value of the Status Register will be written. This way we avoid
> the casts between int and u8, which can be confusing.
> 
> Prepend spi_nor_ to the function name, all functions should begin
> with that.
> 
> S/pr_err/dev_err and drop duplicated dev_err in callers, in case the
> function returns error.

Too many things done in a single patch, can you split that please?

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 131 +++++++++++++++++++++---------------------
>  1 file changed, 65 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 7d0c1b598250..a23783641146 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -388,12 +388,14 @@ static ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>  	return nor->controller_ops->write(nor, to, len, buf);
>  }
>  
> -/*
> - * Read the status register, returning its value in the location
> - * Return the status register value.
> - * Returns negative if error occurred.
> +/**
> + * spi_nor_read_sr() - Read the Status Register.
> + * @nor:        pointer to 'struct spi_nor'
> + * @sr:		buffer where the value of the Status Register will be written.

You should definitely mention that this sr pointer has to be DMA-safe.

> + *
> + * Return: 0 on success, -errno otherwise.
>   */
> -static int read_sr(struct spi_nor *nor)
> +static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>  {
>  	int ret;
>  
> @@ -402,20 +404,17 @@ static int read_sr(struct spi_nor *nor)
>  			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR, 1),
>  				   SPI_MEM_OP_NO_ADDR,
>  				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
> +				   SPI_MEM_OP_DATA_IN(1, sr, 1));
>  
>  		ret = spi_mem_exec_op(nor->spimem, &op);
>  	} else {
> -		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
> -						    nor->bouncebuf, 1);
> +		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR, sr, 1);
>  	}
>  
> -	if (ret < 0) {
> -		pr_err("error %d reading SR\n", (int) ret);
> -		return ret;
> -	}
> +	if (ret)
> +		dev_err(nor->dev, "error %d reading SR\n", ret);
>  
> -	return nor->bouncebuf[0];
> +	return ret;
>  }
