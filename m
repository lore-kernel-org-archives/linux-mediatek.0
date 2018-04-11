From: Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 8/8] mtd: rawnand: mtk: Use generic helpers to calculate
 ecc size and strength
Date: Wed, 11 Apr 2018 21:05:42 +0200
Message-ID: <20180411210542.5a9f0641@bbrezillon>
References: <1523418118-57686-1-git-send-email-xiaolei.li@mediatek.com>
 <1523418118-57686-9-git-send-email-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1523418118-57686-9-git-send-email-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: richard-/L3Ra7n9ekc@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, 11 Apr 2018 11:41:58 +0800
Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

> An optional DT properity named nand-ecc-maximize is used to choose whether
> maximize ecc strength or just match ecc strength required.
> 
> But MTK nand driver always maximize ecc strength now.
> 
> This patch uses generic helpers to calculate ecc size and strength
> automatically according to nand-ecc-maximize setting.
> 
> Please remember to enable nand-ecc-maximize DT setting if want to be
> compatible with older Bootloader base on this patch.

You're breaking backward compat here. Not sure this is a good idea, but
if that's what you want I'd like a few more acks to confirm mediatek
maintainers are okay with that.

And please add a patch updating the DT bindinds doc accordingly.

> 
> Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/mtd/nand/raw/mtk_ecc.c  |  25 -------
>  drivers/mtd/nand/raw/mtk_ecc.h  |   2 -
>  drivers/mtd/nand/raw/mtk_nand.c | 152 ++++++++++++++++++++++++----------------
>  3 files changed, 93 insertions(+), 86 deletions(-)
> 

> +
> +static int mtk_nfc_ecc_caps_init(struct device *dev, struct mtk_nfc *nfc)
> +{
> +	struct nand_ecc_caps *ecccaps;
> +	struct nand_ecc_step_info *stepinfos;
> +	int i, nsector = nfc->caps->num_sector_size;
> +
> +	ecccaps = devm_kzalloc(dev, sizeof(*ecccaps), GFP_KERNEL);
> +	if (!ecccaps)
> +		return -ENOMEM;
> +
> +	stepinfos = devm_kzalloc(dev, sizeof(*stepinfos) * nsector, GFP_KERNEL);
> +	if (!stepinfos)
> +		return -ENOMEM;
> +
> +	nfc->ecccaps = ecccaps;
> +
> +	ecccaps->stepinfos = stepinfos;
> +	ecccaps->nstepinfos = nsector;
> +	ecccaps->calc_ecc_bytes = mtk_nfc_calc_ecc_bytes;
> +
> +	for (i = 0; i < nsector; i++) {
> +		stepinfos->stepsize = nfc->caps->sector_size[i];
> +		stepinfos->strengths = mtk_ecc_get_strength(nfc->ecc);
> +		stepinfos->nstrengths = mtk_ecc_get_strength_num(nfc->ecc);
> +		stepinfos++;
> +	}

You seem to re-create generic tables from mtk's internal
representation. Why don't you directly store a static const version of
nand_ecc_caps in you caps struct. And maybe you can also get rid of the
mtk specific representation in favor of the generic one.

>  
>  	return 0;
>  }
> @@ -1329,6 +1356,8 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
>  	/* set default mode in case dt entry is missing */
>  	nand->ecc.mode = NAND_ECC_HW;
>  
> +	nand->ecc.priv = (void *)nfc->ecc;
> +
>  	nand->ecc.write_subpage = mtk_nfc_write_subpage_hwecc;
>  	nand->ecc.write_page_raw = mtk_nfc_write_page_raw;
>  	nand->ecc.write_page = mtk_nfc_write_page_hwecc;
> @@ -1366,7 +1395,8 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
>  		return -EINVAL;
>  	}
>  
> -	ret = mtk_nfc_set_spare_per_sector(&chip->spare_per_sector, mtd);
> +	ret = mtk_nfc_set_spare_per_sector(nand->ecc.size,
> +					   &chip->spare_per_sector, mtd);
>  	if (ret)
>  		return ret;
>  
> @@ -1539,6 +1569,10 @@ static int mtk_nfc_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, nfc);
>  
> +	ret = mtk_nfc_ecc_caps_init(dev, nfc);
> +	if (ret)
> +		goto clk_disable;
> +
>  	ret = mtk_nfc_nand_chips_init(dev, nfc);
>  	if (ret) {
>  		dev_err(dev, "failed to init nand chips\n");
