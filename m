From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 12/35] mtd: rawnand: lpc32xx_slc: convert driver to
 nand_scan()
Date: Sat, 21 Jul 2018 17:27:49 +0200
Message-ID: <20180721172749.05529c8f@bbrezillon>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-13-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180720151527.16038-13-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Mans Rullgard <mans@mansr.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>, Josh Wu <rainyfeeling@outlook.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, Sylvain Lemieux <slemieux.tyco@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vladimir Zapolskiy <vz@mleia.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>, Xiaolei Li <xiaolei.li@mediatek.com>, linux-arm-kernel@lists.infradead.org, Richard
List-Id: linux-mediatek@lists.infradead.org

On Fri, 20 Jul 2018 17:15:04 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Two helpers have been added to the core to make ECC-related
> configuration between the detection phase and the final NAND scan. Use
> these hooks and convert the driver to just use nand_scan() instead of
> both nand_scan_ident() and nand_scan_tail().
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/lpc32xx_slc.c | 77 +++++++++++++++++++++-----------------
>  1 file changed, 42 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
> index 42820aa1abab..a4e8b7e75135 100644
> --- a/drivers/mtd/nand/raw/lpc32xx_slc.c
> +++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
> @@ -779,6 +779,46 @@ static struct lpc32xx_nand_cfg_slc *lpc32xx_parse_dt(struct device *dev)
>  	return ncfg;
>  }
>  
> +static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
> +
> +	/* OOB and ECC CPU and DMA work areas */
> +	host->ecc_buf = (uint32_t *)(host->data_buf + LPC32XX_DMA_DATA_SIZE);
> +
> +	/*
> +	 * Small page FLASH has a unique OOB layout, but large and huge
> +	 * page FLASH use the standard layout. Small page FLASH uses a
> +	 * custom BBT marker layout.
> +	 */
> +	if (mtd->writesize <= 512)
> +		mtd_set_ooblayout(mtd, &lpc32xx_ooblayout_ops);
> +
> +	/* These sizes remain the same regardless of page size */
> +	chip->ecc.size = 256;
> +	chip->ecc.bytes = LPC32XX_SLC_DEV_ECC_BYTES;
> +	chip->ecc.prepad = 0;
> +	chip->ecc.postpad = 0;
> +
> +	/*
> +	 * Use a custom BBT marker setup for small page FLASH that
> +	 * won't interfere with the ECC layout. Large and huge page
> +	 * FLASH use the standard layout.
> +	 */
> +	if ((chip->bbt_options & NAND_BBT_USE_FLASH) &&
> +	    mtd->writesize <= 512) {
> +		chip->bbt_td = &bbt_smallpage_main_descr;
> +		chip->bbt_md = &bbt_smallpage_mirror_descr;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
> +	.attach_chip = lpc32xx_nand_attach_chip,
> +};
> +
>  /*
>   * Probe for NAND controller
>   */
> @@ -884,41 +924,8 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Find NAND device */
> -	res = nand_scan_ident(mtd, 1, NULL);
> -	if (res)
> -		goto release_dma;
> -
> -	/* OOB and ECC CPU and DMA work areas */
> -	host->ecc_buf = (uint32_t *)(host->data_buf + LPC32XX_DMA_DATA_SIZE);
> -
> -	/*
> -	 * Small page FLASH has a unique OOB layout, but large and huge
> -	 * page FLASH use the standard layout. Small page FLASH uses a
> -	 * custom BBT marker layout.
> -	 */
> -	if (mtd->writesize <= 512)
> -		mtd_set_ooblayout(mtd, &lpc32xx_ooblayout_ops);
> -
> -	/* These sizes remain the same regardless of page size */
> -	chip->ecc.size = 256;
> -	chip->ecc.bytes = LPC32XX_SLC_DEV_ECC_BYTES;
> -	chip->ecc.prepad = chip->ecc.postpad = 0;
> -
> -	/*
> -	 * Use a custom BBT marker setup for small page FLASH that
> -	 * won't interfere with the ECC layout. Large and huge page
> -	 * FLASH use the standard layout.
> -	 */
> -	if ((chip->bbt_options & NAND_BBT_USE_FLASH) &&
> -	    mtd->writesize <= 512) {
> -		chip->bbt_td = &bbt_smallpage_main_descr;
> -		chip->bbt_md = &bbt_smallpage_mirror_descr;
> -	}
> -
> -	/*
> -	 * Fills out all the uninitialized function pointers with the defaults
> -	 */
> -	res = nand_scan_tail(mtd);
> +	chip->dummy_controller.ops = &lpc32xx_nand_controller_ops;
> +	res = nand_scan(mtd, 1);
>  	if (res)
>  		goto release_dma;
>  
