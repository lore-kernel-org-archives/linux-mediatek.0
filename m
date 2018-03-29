From: Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] mtd: nand: Fix some function description
 mismatches in core.c
Date: Thu, 29 Mar 2018 19:54:52 +0200
Message-ID: <20180329195452.582f4910@bbrezillon>
References: <1522287299-12620-1-git-send-email-xiaolei.li@mediatek.com>
 <1522287299-12620-3-git-send-email-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1522287299-12620-3-git-send-email-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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

On Thu, 29 Mar 2018 09:34:59 +0800
Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

> In core.c, some function descriptions do not match function
> definitions. Just fix these mismatches.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Applied.

Thanks,

Boris

> ---
>  drivers/mtd/nand/core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
> index f237a68..d0cd6f8 100644
> --- a/drivers/mtd/nand/core.c
> +++ b/drivers/mtd/nand/core.c
> @@ -51,7 +51,7 @@ bool nanddev_isbad(struct nand_device *nand, const struct nand_pos *pos)
>  /**
>   * nanddev_markbad() - Mark a block as bad
>   * @nand: NAND device
> - * @block: block to mark bad
> + * @pos: position of the block to mark bad
>   *
>   * Mark a block bad. This function is updating the BBT if available and
>   * calls the low-level markbad hook (nand->ops->markbad()).
> @@ -117,9 +117,9 @@ bool nanddev_isreserved(struct nand_device *nand, const struct nand_pos *pos)
>  /**
>   * nanddev_erase() - Erase a NAND portion
>   * @nand: NAND device
> - * @block: eraseblock to erase
> + * @pos: position of the block to erase
>   *
> - * Erases @block if it's not bad.
> + * Erases the block if it's not bad.
>   *
>   * Return: 0 in case of success, a negative error code otherwise.
>   */
> @@ -179,11 +179,11 @@ int nanddev_mtd_erase(struct mtd_info *mtd, struct erase_info *einfo)
>  /**
>   * nanddev_init() - Initialize a NAND device
>   * @nand: NAND device
> - * @memorg: NAND memory organization descriptor
>   * @ops: NAND device operations
> + * @owner: NAND device owner
>   *
> - * Initializes a NAND device object. Consistency checks are done on @memorg and
> - * @ops. Also takes care of initializing the BBT.
> + * Initializes a NAND device object. Consistency checks are done on @ops and
> + * @nand->memorg. Also takes care of initializing the BBT.
>   *
>   * Return: 0 in case of success, a negative error code otherwise.
>   */



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
