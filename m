From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] mtd: nand: mediatek: update DT bindings
Date: Thu, 11 May 2017 10:08:49 +0200
Message-ID: <fdf9d691-347d-83e0-d4e4-734be5fbecd3@gmail.com>
References: <1494487532-36594-1-git-send-email-xiaolei.li@mediatek.com>
 <1494487532-36594-2-git-send-email-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1494487532-36594-2-git-send-email-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
To: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org



On 11/05/17 09:25, Xiaolei Li wrote:
> Add MT2712 NAND Flash Controller dt bindings documentation.
> 
> Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/mtd/mtk-nand.txt | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> index 069c192..6482650 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> @@ -12,7 +12,9 @@ tree nodes.
>   
>   The first part of NFC is NAND Controller Interface (NFI) HW.
>   Required NFI properties:
> -- compatible:			Should be "mediatek,mtxxxx-nfc".
> +- compatible:			Should be "mediatek,mt{SoC name}-nfc".
> +				So far, the supported are
> +				"mediatek,mt2701-nfc", "mediatek,mt2712-nfc".

Better would be:
Should be one of "mediatek,mt2701-nfc", "mediatek,mt2712-nfc".

>   - reg:				Base physical address and size of NFI.
>   - interrupts:			Interrupts of NFI.
>   - clocks:			NFI required clocks.
> @@ -141,7 +143,8 @@ Example:
>   ==============
>   
>   Required BCH properties:
> -- compatible:	Should be "mediatek,mtxxxx-ecc".
> +- compatible:	Should be "mediatek,mt{SoC name}-ecc". So far, the supported
> +		are "mediatek,mt2701-ecc", "mediatek,mt2712-ecc".

Same here.

>   - reg:		Base physical address and size of ECC.
>   - interrupts:	Interrupts of ECC.
>   - clocks:	ECC required clocks.
> -- 
> 1.9.1
> 
> ************* Email Confidentiality Notice
>   ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
>   
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank
>   you!
> 

Please fix your mail setup to not send this footer.

Regards,
Matthias
