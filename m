From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: Add bindings for the MediaTek
 MT6323 PMIC
Date: Mon, 11 Jan 2016 11:27:50 +0800
Message-ID: <1452482870.29993.11.camel@mtksdaap41>
References: <1452442729-27154-1-git-send-email-blogic@openwrt.org>
 <1452442729-27154-2-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1452442729-27154-2-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Sun, 2016-01-10 at 17:18 +0100, John Crispin wrote:
> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

I think you should add device tree binding document maintainer to review
dt-bindings patch.Your other series like 6323 regulator, 7623 pinctrl,
pcie binding patches should add too.

Eddie

> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 15043e6..98573da 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -1,6 +1,6 @@
> -MediaTek MT6397 Multifunction Device Driver
> +MediaTek MT6397/MT6323 Multifunction Device Driver
>  
> -MT6397 is a multifunction device with the following sub modules:
> +MT6397/MT6323 is a multifunction device with the following sub modules:
>  - Regulator
>  - RTC
>  - Audio codec
> @@ -8,14 +8,14 @@ MT6397 is a multifunction device with the following sub modules:
>  - Clock
>  
>  It is interfaced to host controller using SPI interface by a proprietary hardware
> -called PMIC wrapper or pwrap. MT6397 MFD is a child device of pwrap.
> +called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
>  See the following for pwarp node definitions:
>  Documentation/devicetree/bindings/soc/pwrap.txt
>  
>  This document describes the binding for MFD device and its sub module.
>  
>  Required properties:
> -compatible: "mediatek,mt6397"
> +compatible: "mediatek,mt6397" or "mediatek,mt6323"
>  
>  Optional subnodes:
>  
> @@ -24,7 +24,7 @@ Optional subnodes:
>  		- compatible: "mediatek,mt6397-rtc"
>  - regulators
>  	Required properties:
> -		- compatible: "mediatek,mt6397-regulator"
> +		- compatible: "mediatek,mt6397-regulator" or "mediatek,mt6397-regulator"
>  	see Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
>  - codec
>  	Required properties:
