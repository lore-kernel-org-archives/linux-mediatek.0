From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Date: Mon, 18 Apr 2016 10:01:52 +0200
Message-ID: <20160418100152.6973d5ac@bbrezillon>
References: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1460393772-26910-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1460393772-26910-3-git-send-email-jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 11 Apr 2016 12:56:12 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> This patch adds support for mediatek's SDG1 NFC nand controller
> embedded in SoC 2701.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---

[...]

> +static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
> +				struct device_node *np)
> +{
> +	struct mtk_nfc_nand_chip *chip;
> +	struct nand_chip *nand;
> +	struct mtd_info *mtd;
> +	int nsels, len;
> +	u32 tmp;
> +	int ret;
> +	int i;
> +
> +	if (!of_get_property(np, "reg", &nsels))
> +		return -ENODEV;
> +
> +	nsels /= sizeof(u32);
> +	if (!nsels || nsels > MTK_NAND_MAX_NSELS) {
> +		dev_err(dev, "invalid reg property size %d\n", nsels);
> +		return -EINVAL;
> +	}
> +
> +	chip = devm_kzalloc(dev,
> +			sizeof(*chip) + nsels * sizeof(u8), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->nsels = nsels;
> +	for (i = 0; i < nsels; i++) {
> +		ret = of_property_read_u32_index(np, "reg", i, &tmp);
> +		if (ret) {
> +			dev_err(dev, "reg property failure : %d\n", ret);
> +			return ret;
> +		}
> +		chip->sels[i] = tmp;
> +	}
> +
> +	if (of_property_read_u32(np, "spare_per_sector",
> +						&chip->spare_per_sector)) {
> +		dev_err(dev, "missing spare_per_sector property in DT\n");
> +		return -ENODEV;
> +
> +	}
> +
> +	nand = &chip->nand;
> +	nand->controller = &nfc->controller;
> +
> +	nand_set_flash_node(nand, np);
> +	nand_set_controller_data(nand, nfc);
> +
> +	nand->options |= NAND_USE_BOUNCE_BUFFER | NAND_SUBPAGE_READ;
> +	nand->block_markbad = mtk_nfc_block_markbad;
> +	nand->dev_ready = mtk_nfc_dev_ready;
> +	nand->select_chip = mtk_nfc_select_chip;
> +	nand->write_byte = mtk_nfc_write_byte;
> +	nand->write_buf = mtk_nfc_write_buf;
> +	nand->read_byte = mtk_nfc_read_byte;
> +	nand->read_buf = mtk_nfc_read_buf;
> +	nand->cmd_ctrl = mtk_nfc_cmd_ctrl;
> +
> +	/* set default mode in case dt entry is missing */
> +	nand->ecc.mode = NAND_ECC_HW;
> +
> +	nand->ecc.write_subpage = mtk_nfc_write_subpage_hwecc;
> +	nand->ecc.write_page_raw = mtk_nfc_write_page_raw;
> +	nand->ecc.write_page = mtk_nfc_write_page_hwecc;
> +	nand->ecc.write_oob_raw = mtk_nfc_write_oob_raw;
> +	nand->ecc.write_oob = mtk_nfc_write_oob;
> +
> +	nand->ecc.read_subpage = mtk_nfc_read_subpage_hwecc;
> +	nand->ecc.read_page_raw = mtk_nfc_read_page_raw;
> +	nand->ecc.read_oob_raw = mtk_nfc_read_oob_raw;
> +	nand->ecc.read_page = mtk_nfc_read_page_hwecc;
> +	nand->ecc.read_oob = mtk_nfc_read_oob;
> +
> +	mtd = nand_to_mtd(nand);
> +	mtd->owner = THIS_MODULE;
> +	mtd->dev.parent = dev;
> +	mtd->name = MTK_NAME;
> +	mtd_set_ooblayout(mtd, &mtk_nfc_ooblayout_ops);
> +
> +	mtk_nfc_hw_init(nfc);
> +
> +	ret = nand_scan_ident(mtd, nsels, NULL);
> +	if (ret)
> +		return -ENODEV;
> +
> +	/* TODO: add NAND_ECC_SOFT */
> +	if (nand->ecc.mode != NAND_ECC_HW) {
> +		dev_err(dev, "driver only supports NAND_ECC_HW\n");
> +		return -ENODEV;
> +	}

You also don't check the ecc->strength and ecc->step_size values, and
I'd recommend doing the ECC initialization in a separate function.
Moreover, as already explained on IRC, you should not make the
nand-ecc-strength and nand-ecc-step-size properties mandatory. Usually
those information are exposed by the NAND chip itself, and are
available in chip->ecc_strength_ds and chip->ecc_step_size_ds.
nand-ecc-strength and nand-ecc-step-size are only here to override the
ECC config (a typical usage is to override those information to match
the configuration hardcoded in the bootloader).

Here is an example of how it could be done [1].

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/sunxi_nand.c#L1188


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
