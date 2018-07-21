From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 10/35] mtd: rawnand: jz4780: convert driver to
 nand_scan()
Date: Sat, 21 Jul 2018 17:23:19 +0200
Message-ID: <20180721172250.723b4fd2@bbrezillon>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-11-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180720151527.16038-11-miquel.raynal@bootlin.com>
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

On Fri, 20 Jul 2018 17:15:02 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Two helpers have been added to the core to make ECC-related
> configuration between the detection phase and the final NAND scan. Use
> these hooks and convert the driver to just use nand_scan() instead of
> both nand_scan_ident() and nand_scan_tail().
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Harvey Hunt <harveyhuntnexus@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/jz4780_nand.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
> index 49841dad347c..db4fa60bd52a 100644
> --- a/drivers/mtd/nand/raw/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/jz4780_nand.c
> @@ -158,9 +158,8 @@ static int jz4780_nand_ecc_correct(struct mtd_info *mtd, u8 *dat,
>  	return jz4780_bch_correct(nfc->bch, &params, dat, read_ecc);
>  }
>  
> -static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *dev)
> +static int jz4780_nand_attach_chip(struct nand_chip *chip)
>  {
> -	struct nand_chip *chip = &nand->chip;
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(chip->controller);
>  	int eccbytes;
> @@ -171,7 +170,8 @@ static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *de
>  	switch (chip->ecc.mode) {
>  	case NAND_ECC_HW:
>  		if (!nfc->bch) {
> -			dev_err(dev, "HW BCH selected, but BCH controller not found\n");
> +			dev_err(nfc->dev,
> +				"HW BCH selected, but BCH controller not found\n");
>  			return -ENODEV;
>  		}
>  
> @@ -180,15 +180,16 @@ static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *de
>  		chip->ecc.correct = jz4780_nand_ecc_correct;
>  		/* fall through */
>  	case NAND_ECC_SOFT:
> -		dev_info(dev, "using %s (strength %d, size %d, bytes %d)\n",
> -			(nfc->bch) ? "hardware BCH" : "software ECC",
> -			chip->ecc.strength, chip->ecc.size, chip->ecc.bytes);
> +		dev_info(nfc->dev, "using %s (strength %d, size %d, bytes %d)\n",
> +			 (nfc->bch) ? "hardware BCH" : "software ECC",
> +			 chip->ecc.strength, chip->ecc.size, chip->ecc.bytes);
>  		break;
>  	case NAND_ECC_NONE:
> -		dev_info(dev, "not using ECC\n");
> +		dev_info(nfc->dev, "not using ECC\n");
>  		break;
>  	default:
> -		dev_err(dev, "ECC mode %d not supported\n", chip->ecc.mode);
> +		dev_err(nfc->dev, "ECC mode %d not supported\n",
> +			chip->ecc.mode);
>  		return -EINVAL;
>  	}
>  
> @@ -200,7 +201,7 @@ static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *de
>  	eccbytes = mtd->writesize / chip->ecc.size * chip->ecc.bytes;
>  
>  	if (eccbytes > mtd->oobsize - 2) {
> -		dev_err(dev,
> +		dev_err(nfc->dev,
>  			"invalid ECC config: required %d ECC bytes, but only %d are available",
>  			eccbytes, mtd->oobsize - 2);
>  		return -EINVAL;
> @@ -211,6 +212,10 @@ static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *de
>  	return 0;
>  }
>  
> +static const struct nand_controller_ops jz4780_nand_controller_ops = {
> +	.attach_chip = jz4780_nand_attach_chip,
> +};
> +
>  static int jz4780_nand_init_chip(struct platform_device *pdev,
>  				struct jz4780_nand_controller *nfc,
>  				struct device_node *np,
> @@ -280,15 +285,8 @@ static int jz4780_nand_init_chip(struct platform_device *pdev,
>  	chip->controller = &nfc->controller;
>  	nand_set_flash_node(chip, np);
>  
> -	ret = nand_scan_ident(mtd, 1, NULL);
> -	if (ret)
> -		return ret;
> -
> -	ret = jz4780_nand_init_ecc(nand, dev);
> -	if (ret)
> -		return ret;
> -
> -	ret = nand_scan_tail(mtd);
> +	chip->controller->ops = &jz4780_nand_controller_ops;
> +	ret = nand_scan(mtd, 1);
>  	if (ret)
>  		return ret;
>  
