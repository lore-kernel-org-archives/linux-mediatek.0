From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v4 25/35] mtd: rawnand: vf610: convert driver to
 nand_scan()
Date: Wed, 25 Jul 2018 10:57:29 +0200
Message-ID: <5a2276ee7a79e7258234f553167bf469@agner.ch>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-26-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180720151527.16038-26-miquel.raynal@bootlin.com>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Mans Rullgard <mans@mansr.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>, Josh Wu <rainyfeeling@outlook.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, Sylvain Lemieux <slemieux.tyco@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vladimir Zapolskiy <vz@mleia.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>, Xiaolei Li <xiaolei.li@mediatek.com>, linux-arm-kernel@lists.infradead.or
List-Id: linux-mediatek@lists.infradead.org

On 20.07.2018 17:15, Miquel Raynal wrote:
> Two helpers have been added to the core to make ECC-related
> configuration between the detection phase and the final NAND scan. Use
> these hooks and convert the driver to just use nand_scan() instead of
> both nand_scan_ident() and nand_scan_tail().

Reviewed-by: Stefan Agner <stefan@agner.ch>

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/vf610_nfc.c | 127 ++++++++++++++++++++-------------------
>  1 file changed, 66 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
> index d5a22fc96878..6f6dcbf9095b 100644
> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> @@ -747,6 +747,69 @@ static void vf610_nfc_init_controller(struct
> vf610_nfc *nfc)
>  	}
>  }
>  
> +static int vf610_nfc_attach_chip(struct nand_chip *chip)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +
> +	vf610_nfc_init_controller(nfc);
> +
> +	/* Bad block options. */
> +	if (chip->bbt_options & NAND_BBT_USE_FLASH)
> +		chip->bbt_options |= NAND_BBT_NO_OOB;
> +
> +	/* Single buffer only, max 256 OOB minus ECC status */
> +	if (mtd->writesize + mtd->oobsize > PAGE_2K + OOB_MAX - 8) {
> +		dev_err(nfc->dev, "Unsupported flash page size\n");
> +		return -ENXIO;
> +	}
> +
> +	if (chip->ecc.mode != NAND_ECC_HW)
> +		return 0;
> +
> +	if (mtd->writesize != PAGE_2K && mtd->oobsize < 64) {
> +		dev_err(nfc->dev, "Unsupported flash with hwecc\n");
> +		return -ENXIO;
> +	}
> +
> +	if (chip->ecc.size != mtd->writesize) {
> +		dev_err(nfc->dev, "Step size needs to be page size\n");
> +		return -ENXIO;
> +	}
> +
> +	/* Only 64 byte ECC layouts known */
> +	if (mtd->oobsize > 64)
> +		mtd->oobsize = 64;
> +
> +	/* Use default large page ECC layout defined in NAND core */
> +	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> +	if (chip->ecc.strength == 32) {
> +		nfc->ecc_mode = ECC_60_BYTE;
> +		chip->ecc.bytes = 60;
> +	} else if (chip->ecc.strength == 24) {
> +		nfc->ecc_mode = ECC_45_BYTE;
> +		chip->ecc.bytes = 45;
> +	} else {
> +		dev_err(nfc->dev, "Unsupported ECC strength\n");
> +		return -ENXIO;
> +	}
> +
> +	chip->ecc.read_page = vf610_nfc_read_page;
> +	chip->ecc.write_page = vf610_nfc_write_page;
> +	chip->ecc.read_page_raw = vf610_nfc_read_page_raw;
> +	chip->ecc.write_page_raw = vf610_nfc_write_page_raw;
> +	chip->ecc.read_oob = vf610_nfc_read_oob;
> +	chip->ecc.write_oob = vf610_nfc_write_oob;
> +
> +	chip->ecc.size = PAGE_2K;
> +
> +	return 0;
> +}
> +
> +static const struct nand_controller_ops vf610_nfc_controller_ops = {
> +	.attach_chip = vf610_nfc_attach_chip,
> +};
> +
>  static int vf610_nfc_probe(struct platform_device *pdev)
>  {
>  	struct vf610_nfc *nfc;
> @@ -827,67 +890,9 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  
>  	vf610_nfc_preinit_controller(nfc);
>  
> -	/* first scan to find the device and get the page size */
> -	err = nand_scan_ident(mtd, 1, NULL);
> -	if (err)
> -		goto err_disable_clk;
> -
> -	vf610_nfc_init_controller(nfc);
> -
> -	/* Bad block options. */
> -	if (chip->bbt_options & NAND_BBT_USE_FLASH)
> -		chip->bbt_options |= NAND_BBT_NO_OOB;
> -
> -	/* Single buffer only, max 256 OOB minus ECC status */
> -	if (mtd->writesize + mtd->oobsize > PAGE_2K + OOB_MAX - 8) {
> -		dev_err(nfc->dev, "Unsupported flash page size\n");
> -		err = -ENXIO;
> -		goto err_disable_clk;
> -	}
> -
> -	if (chip->ecc.mode == NAND_ECC_HW) {
> -		if (mtd->writesize != PAGE_2K && mtd->oobsize < 64) {
> -			dev_err(nfc->dev, "Unsupported flash with hwecc\n");
> -			err = -ENXIO;
> -			goto err_disable_clk;
> -		}
> -
> -		if (chip->ecc.size != mtd->writesize) {
> -			dev_err(nfc->dev, "Step size needs to be page size\n");
> -			err = -ENXIO;
> -			goto err_disable_clk;
> -		}
> -
> -		/* Only 64 byte ECC layouts known */
> -		if (mtd->oobsize > 64)
> -			mtd->oobsize = 64;
> -
> -		/* Use default large page ECC layout defined in NAND core */
> -		mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> -		if (chip->ecc.strength == 32) {
> -			nfc->ecc_mode = ECC_60_BYTE;
> -			chip->ecc.bytes = 60;
> -		} else if (chip->ecc.strength == 24) {
> -			nfc->ecc_mode = ECC_45_BYTE;
> -			chip->ecc.bytes = 45;
> -		} else {
> -			dev_err(nfc->dev, "Unsupported ECC strength\n");
> -			err = -ENXIO;
> -			goto err_disable_clk;
> -		}
> -
> -		chip->ecc.read_page = vf610_nfc_read_page;
> -		chip->ecc.write_page = vf610_nfc_write_page;
> -		chip->ecc.read_page_raw = vf610_nfc_read_page_raw;
> -		chip->ecc.write_page_raw = vf610_nfc_write_page_raw;
> -		chip->ecc.read_oob = vf610_nfc_read_oob;
> -		chip->ecc.write_oob = vf610_nfc_write_oob;
> -
> -		chip->ecc.size = PAGE_2K;
> -	}
> -
> -	/* second phase scan */
> -	err = nand_scan_tail(mtd);
> +	/* Scan the NAND chip */
> +	chip->dummy_controller.ops = &vf610_nfc_controller_ops;
> +	err = nand_scan(mtd, 1);
>  	if (err)
>  		goto err_disable_clk;
