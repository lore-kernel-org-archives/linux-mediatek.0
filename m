From: Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] dt-bindings: mtd: mtk-nand: Update properties
 description
Date: Thu, 26 Apr 2018 22:09:21 +0200
Message-ID: <20180426220921.16ad89e5@bbrezillon>
References: <1524535867-32413-1-git-send-email-xiaolei.li@mediatek.com>
 <1524535867-32413-2-git-send-email-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1524535867-32413-2-git-send-email-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 24 Apr 2018 10:11:07 +0800
Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

> Update ecc step size, ecc strength, and parity bits supported on
> each MTK NAND controller.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Applied.

Thanks,

Boris

> ---
>  Documentation/devicetree/bindings/mtd/mtk-nand.txt | 24 +++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> index 1c88526..f20ab4a 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> @@ -50,14 +50,19 @@ Optional:
>  - nand-on-flash-bbt:	Store BBT on NAND Flash.
>  - nand-ecc-mode:	the NAND ecc mode (check driver for supported modes)
>  - nand-ecc-step-size:	Number of data bytes covered by a single ECC step.
> -			valid values: 512 and 1024.
> +			valid values:
> +			512 and 1024 on mt2701 and mt2712.
> +			512 only on mt7622.
>  			1024 is recommended for large page NANDs.
>  - nand-ecc-strength:	Number of bits to correct per ECC step.
> -			The valid values that the controller supports are: 4, 6,
> -			8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36, 40, 44,
> -			48, 52, 56, 60.
> +			The valid values that each controller supports:
> +			mt2701: 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28,
> +				32, 36, 40, 44, 48, 52, 56, 60.
> +			mt2712: 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28,
> +				32, 36, 40, 44, 48, 52, 56, 60, 68, 72, 80.
> +			mt7622: 4, 6, 8, 10, 12, 14, 16.
>  			The strength should be calculated as follows:
> -			E = (S - F) * 8 / 14
> +			E = (S - F) * 8 / B
>  			S = O / (P / Q)
>  				E :	nand-ecc-strength.
>  				S :	spare size per sector.
> @@ -66,6 +71,15 @@ Optional:
>  				O :	oob size.
>  				P :	page size.
>  				Q :	nand-ecc-step-size.
> +				B :	number of parity bits needed to correct
> +					1 bitflip.
> +					According to MTK NAND controller design,
> +					this number depends on max ecc step size
> +					that MTK NAND controller supports.
> +					If max ecc step size supported is 1024,
> +					then it should be always 14. And if max
> +					ecc step size is 512, then it should be
> +					always 13.
>  			If the result does not match any one of the listed
>  			choices above, please select the smaller valid value from
>  			the list.
