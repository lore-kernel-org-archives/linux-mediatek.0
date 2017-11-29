From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] mtd: nand: mtk: Support different MTK NAND flash
 controller IP
Date: Wed, 29 Nov 2017 11:04:41 +0100
Message-ID: <20171129110441.3c6f1e3a@bbrezillon>
References: <1511947486-7707-1-git-send-email-rogercc.lin@mediatek.com>
 <1511947486-7707-3-git-send-email-rogercc.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1511947486-7707-3-git-send-email-rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: RogerCC Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

On Wed, 29 Nov 2017 17:24:45 +0800
RogerCC Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:


> diff --git a/drivers/mtd/nand/mtk_ecc.h b/drivers/mtd/nand/mtk_ecc.h
> index d245c14..764adb6 100644
> --- a/drivers/mtd/nand/mtk_ecc.h
> +++ b/drivers/mtd/nand/mtk_ecc.h
> @@ -14,8 +14,6 @@
>  
>  #include <linux/types.h>
>  
> -#define ECC_PARITY_BITS		(14)
> -
>  enum mtk_ecc_mode {ECC_DMA_MODE = 0, ECC_NFI_MODE = 1};
>  enum mtk_ecc_operation {ECC_ENCODE, ECC_DECODE};
>  
> @@ -37,6 +35,29 @@ struct mtk_ecc_config {
>  	u32 len;
>  };
>  
> +struct mtk_ecc_caps {
> +	u32 err_mask;
> +	const u8 *ecc_strength;
> +	const u32 *ecc_regs;
> +	u8 num_ecc_strength;
> +	u8 ecc_mode_shift;
> +	u8 parity_bits;
> +	int pg_irq_sel;
> +};
> +
> +struct mtk_ecc {
> +	struct device *dev;
> +	const struct mtk_ecc_caps *caps;
> +	void __iomem *regs;
> +	struct clk *clk;
> +
> +	struct completion done;
> +	struct mutex lock;
> +	u32 sectors;
> +
> +	u8 *eccdata;
> +};

Can you please keep these information private and instead provide a
helper to query the parity bits info, something like:

unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc);

Regards,

Boris
