From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 14/35] mtd: rawnand: mtk: convert driver to nand_scan()
Date: Sat, 21 Jul 2018 19:10:04 +0200
Message-ID: <20180721191004.26fc9290@bbrezillon>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-15-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180720151527.16038-15-miquel.raynal@bootlin.com>
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

On Fri, 20 Jul 2018 17:15:06 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Two helpers have been added to the core to make ECC-related
> configuration between the detection phase and the final NAND scan. Use
> these hooks and convert the driver to just use nand_scan() instead of
> both nand_scan_ident() and nand_scan_tail().
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/mtk_nand.c | 75 ++++++++++++++++++++++++-----------------
>  1 file changed, 44 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
> index 7bc6be3f6ec0..967418f945ea 100644
> --- a/drivers/mtd/nand/raw/mtk_nand.c
> +++ b/drivers/mtd/nand/raw/mtk_nand.c
> @@ -1250,13 +1250,54 @@ static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
>  	return 0;
>  }
>  
> +static int mtk_nfc_attach_chip(struct nand_chip *chip)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct device *dev = mtd->dev.parent;
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
> +	int len;
> +	int ret;
> +
> +	if (chip->options & NAND_BUSWIDTH_16) {
> +		dev_err(dev, "16bits buswidth not supported");
> +		return -EINVAL;
> +	}
> +
> +	/* store bbt magic in page, cause OOB is not protected */
> +	if (chip->bbt_options & NAND_BBT_USE_FLASH)
> +		chip->bbt_options |= NAND_BBT_NO_OOB;
> +
> +	ret = mtk_nfc_ecc_init(dev, mtd);
> +	if (ret)
> +		return ret;
> +
> +	ret = mtk_nfc_set_spare_per_sector(&mtk_nand->spare_per_sector, mtd);
> +	if (ret)
> +		return ret;
> +
> +	mtk_nfc_set_fdm(&mtk_nand->fdm, mtd);
> +	mtk_nfc_set_bad_mark_ctl(&mtk_nand->bad_mark, mtd);
> +
> +	len = mtd->writesize + mtd->oobsize;
> +	nfc->buffer = devm_kzalloc(dev, len, GFP_KERNEL);
> +	if (!nfc->buffer)
> +		return  -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static const struct nand_controller_ops mtk_nfc_controller_ops = {
> +	.attach_chip = mtk_nfc_attach_chip,
> +};
> +
>  static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
>  				  struct device_node *np)
>  {
>  	struct mtk_nfc_nand_chip *chip;
>  	struct nand_chip *nand;
>  	struct mtd_info *mtd;
> -	int nsels, len;
> +	int nsels;
>  	u32 tmp;
>  	int ret;
>  	int i;
> @@ -1287,6 +1328,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
>  
>  	nand = &chip->nand;
>  	nand->controller = &nfc->controller;
> +	nand->controller->ops = &mtk_nfc_controller_ops;

Just like for the marvell driver, this assignment should be moved here
[1]. Also, it looks like this driver is open-coding
nand_controller_init(), probably something we should fix (in a separate
patch).

With this fixed:

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

>  
>  	nand_set_flash_node(nand, np);
>  	nand_set_controller_data(nand, nfc);
> @@ -1324,36 +1366,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
>  
>  	mtk_nfc_hw_init(nfc);
>  
> -	ret = nand_scan_ident(mtd, nsels, NULL);
> -	if (ret)
> -		return ret;
> -
> -	/* store bbt magic in page, cause OOB is not protected */
> -	if (nand->bbt_options & NAND_BBT_USE_FLASH)
> -		nand->bbt_options |= NAND_BBT_NO_OOB;
> -
> -	ret = mtk_nfc_ecc_init(dev, mtd);
> -	if (ret)
> -		return -EINVAL;
> -
> -	if (nand->options & NAND_BUSWIDTH_16) {
> -		dev_err(dev, "16bits buswidth not supported");
> -		return -EINVAL;
> -	}
> -
> -	ret = mtk_nfc_set_spare_per_sector(&chip->spare_per_sector, mtd);
> -	if (ret)
> -		return ret;
> -
> -	mtk_nfc_set_fdm(&chip->fdm, mtd);
> -	mtk_nfc_set_bad_mark_ctl(&chip->bad_mark, mtd);
> -
> -	len = mtd->writesize + mtd->oobsize;
> -	nfc->buffer = devm_kzalloc(dev, len, GFP_KERNEL);
> -	if (!nfc->buffer)
> -		return  -ENOMEM;
> -
> -	ret = nand_scan_tail(mtd);
> +	ret = nand_scan(mtd, nsels);
>  	if (ret)
>  		return ret;
>  
