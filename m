From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] mtd: nand: mtk: deselect the chip that was selected in
 resume function
Date: Wed, 1 Nov 2017 11:00:21 +0100
Message-ID: <20171101110021.221fb256@bbrezillon>
References: <1509517197-60350-1-git-send-email-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1509517197-60350-1-git-send-email-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Xiaolei,

On Wed, 1 Nov 2017 14:19:57 +0800
<xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

> From: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> It is necessary to deselect the chip if it was selected before.
> But now we only select chips when resume nand driver.
> So, deselect the chip after doing nand reset.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/mtd/nand/mtk_nand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
> index d86a7d1..a8bf61a 100644
> --- a/drivers/mtd/nand/mtk_nand.c
> +++ b/drivers/mtd/nand/mtk_nand.c
> @@ -1557,6 +1557,7 @@ static int mtk_nfc_resume(struct device *dev)
>  		for (i = 0; i < chip->nsels; i++) {
>  			nand->select_chip(mtd, i);
>  			nand->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
> +			nand->select_chip(mtd, -1);

Can you use nand_reset() instead of open-coding this sequence?

Thanks,

Boris

>  		}
>  	}
>  
