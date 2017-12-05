From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] mtd: nand: mtk: update DT bindings
Date: Tue, 5 Dec 2017 14:44:20 +0100
Message-ID: <9172e2c4-5aee-12d0-222c-c0f11e112cd7@gmail.com>
References: <1512051045-24026-1-git-send-email-rogercc.lin@mediatek.com>
 <1512051045-24026-2-git-send-email-rogercc.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1512051045-24026-2-git-send-email-rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: RogerCC Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org



On 11/30/2017 03:10 PM, RogerCC Lin wrote:
> From: RogerCC Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Add MT7622 NAND Flash Controller dt bindings documentation.
> 
> Signed-off-by: RogerCC Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---

Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


>   Documentation/devicetree/bindings/mtd/mtk-nand.txt | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> index dbf9e05..0025bc4 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> @@ -12,8 +12,10 @@ tree nodes.
>   
>   The first part of NFC is NAND Controller Interface (NFI) HW.
>   Required NFI properties:
> -- compatible:			Should be one of "mediatek,mt2701-nfc",
> -				"mediatek,mt2712-nfc".
> +- compatible:			Should be one of
> +				"mediatek,mt2701-nfc",
> +				"mediatek,mt2712-nfc",
> +				"mediatek,mt7622-nfc".
>   - reg:				Base physical address and size of NFI.
>   - interrupts:			Interrupts of NFI.
>   - clocks:			NFI required clocks.
> @@ -142,7 +144,10 @@ Example:
>   ==============
>   
>   Required BCH properties:
> -- compatible:	Should be one of "mediatek,mt2701-ecc", "mediatek,mt2712-ecc".
> +- compatible:	Should be one of
> +		"mediatek,mt2701-ecc",
> +		"mediatek,mt2712-ecc",
> +		"mediatek,mt7622-ecc".
>   - reg:		Base physical address and size of ECC.
>   - interrupts:	Interrupts of ECC.
>   - clocks:	ECC required clocks.
> 
