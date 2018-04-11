From: Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/8] mtd: rawnand: mtk: Add DT property mtk,fdm-ecc-size
Date: Wed, 11 Apr 2018 21:13:08 +0200
Message-ID: <20180411211308.436d19c0@bbrezillon>
References: <1523418118-57686-1-git-send-email-xiaolei.li@mediatek.com>
 <1523418118-57686-4-git-send-email-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1523418118-57686-4-git-send-email-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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

On Wed, 11 Apr 2018 11:41:53 +0800
Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

> For some MTK NAND chips, BootROM may access more than one byte
> ECC protected FDM data, but now we fix ECC protected FDM byte as 1.
> This will make some chips be failed to boot up.
> 
> With this DT property setting, different MTK NAND chips with the same
> NAND controller IP can work well.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/mtk-nand.txt |  6 ++++++
>  drivers/mtd/nand/raw/mtk_nand.c                    | 25 ++++++++++++++++------
>  2 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> index ef786568..a8e4136 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> @@ -47,6 +47,12 @@ Children nodes properties:
>  - reg:			Chip Select Signal, default 0.
>  			Set as reg = <0>, <1> when need 2 CS.
>  Optional:
> +- mtk,fdm-ecc-size:	Integer representing ECC protected FDM bytes.
> +			Should be in the range [1,8], if not present 1.
> +			On some MTK NAND chips, BootROM may access more than
> +			one byte ECC protected FDM data. Different MTK chips
> +			with the same NAND controller IP will work well with
> +			this properity setting.

Is this something that changes on a per-SoC basis, or can a specific
SoC have a different behavior depending on the version of the BootROM
it embeds (that would be quite tricky to deal with since that would
mean having different dts if you start using newer revisions of the same
SoC).

If it's on a per-SoC basis, I'd recommend defining new compatibles
instead of adding this property.
