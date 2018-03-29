From: Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] mtd: Fix some function description mismatches in
 mtdcore.c
Date: Thu, 29 Mar 2018 22:24:09 +0200
Message-ID: <20180329222409.325df4d0@bbrezillon>
References: <1522287299-12620-1-git-send-email-xiaolei.li@mediatek.com>
 <1522287299-12620-2-git-send-email-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1522287299-12620-2-git-send-email-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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

On Thu, 29 Mar 2018 09:34:58 +0800
Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

> In mtdcore.c, some function descriptions do not match function
> definitions. Just fix these mismatches.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Applied.

Thanks,

Boris

> ---
>  drivers/mtd/mtdcore.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 28553c8..413ea9b 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -419,7 +419,7 @@ int mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
>  EXPORT_SYMBOL_GPL(mtd_wunit_to_pairing_info);
>  
>  /**
> - * mtd_wunit_to_pairing_info - get wunit from pairing information
> + * mtd_pairing_info_to_wunit - get wunit from pairing information
>   * @mtd: pointer to new MTD device info structure
>   * @info: pairing information struct
>   *
> @@ -1525,9 +1525,9 @@ int mtd_ooblayout_get_databytes(struct mtd_info *mtd, u8 *databuf,
>  EXPORT_SYMBOL_GPL(mtd_ooblayout_get_databytes);
>  
>  /**
> - * mtd_ooblayout_get_eccbytes - set data bytes into the oob buffer
> + * mtd_ooblayout_set_databytes - set data bytes into the oob buffer
>   * @mtd: mtd info structure
> - * @eccbuf: source buffer to get data bytes from
> + * @databuf: source buffer to get data bytes from
>   * @oobbuf: OOB buffer
>   * @start: first ECC byte to set
>   * @nbytes: number of ECC bytes to set
> @@ -1559,7 +1559,7 @@ int mtd_ooblayout_count_freebytes(struct mtd_info *mtd)
>  EXPORT_SYMBOL_GPL(mtd_ooblayout_count_freebytes);
>  
>  /**
> - * mtd_ooblayout_count_freebytes - count the number of ECC bytes in OOB
> + * mtd_ooblayout_count_eccbytes - count the number of ECC bytes in OOB
>   * @mtd: mtd info structure
>   *
>   * Works like mtd_ooblayout_count_bytes(), except it count ECC bytes.



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
