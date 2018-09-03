From: Jasper Mattsson <jasu-YV3CXrm7SyhVsOwjNIwEKpm7MGRryh++@public.gmane.org>
Subject: Re: [PATCH 3/3] dts: mediatek: mt6797: Bind audio, mjc, and venc
 clocks to SCPSYS
Date: Mon, 3 Sep 2018 23:59:34 +0300
Message-ID: <20180903205934.GA11494@xn--njmtys-xxab.info>
References: <20180903200833.GA6792@xn--njmtys-xxab.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180903200833.GA6792-YV3CXrm7SyhVsOwjNIwEKpm7MGRryh++@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, Sep 03, 2018 at 11:08:33PM +0300, Jasper Mattsson wrote:

> Add newly supported SCPSYS clocks to mt6797.dtsi and devicetree bindings
> documentation.
> 
> Signed-off-by: Jasper Mattsson <jasu-tmnvWD0sGVAk+I/owrrOrA@public.gmane.org>
> ---
>  .../devicetree/bindings/soc/mediatek/scpsys.txt          | 2 +-
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi                 | 9 ++++++---
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> index d6fe16f09..07121f7a4 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> @@ -32,7 +32,7 @@ Required properties:
>                        enabled before enabling certain power domains.
>  	Required clocks for MT2701 or MT7623: "mm", "mfg", "ethif"
>  	Required clocks for MT2712: "mm", "mfg", "venc", "jpgdec", "audio", "vdec"
> -	Required clocks for MT6797: "mm", "mfg", "vdec"
> +	Required clocks for MT6797: "mm", "mfg", "vdec", "mjc", "audio", "vdec"

I accidentally put vdec instead of venc here, will fix it in v2. I
will wait for feedback though, since I don't want to spam the list with
a whole v2 because of this.

>  	Required clocks for MT7622: "hif_sel"
>  	Required clocks for MT7622A: "ethif"
>  	Required clocks for MT8173: "mm", "mfg", "venc", "venc_lt"
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> index 4beaa7110..9c05c4fa2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -133,10 +133,13 @@
>  		compatible = "mediatek,mt6797-scpsys";
>  		#power-domain-cells = <1>;
>  		reg = <0 0x10006000 0 0x1000>;
> -		clocks = <&topckgen CLK_TOP_MUX_MFG>,
> +		clocks = <&infrasys CLK_INFRA_AUDIO_26M>,
> +			 <&topckgen CLK_TOP_MUX_MFG>,
> +			 <&topckgen CLK_TOP_MUX_MJC>,
>  			 <&topckgen CLK_TOP_MUX_MM>,
> -			 <&topckgen CLK_TOP_MUX_VDEC>;
> -		clock-names = "mfg", "mm", "vdec";
> +			 <&topckgen CLK_TOP_MUX_VDEC>,
> +			 <&topckgen CLK_TOP_MUX_VENC>;
> +		clock-names = "audio", "mfg", "mjc", "mm", "vdec", "venc";
>  		infracfg = <&infrasys>;
>  	};
>  
> -- 
> 2.18.0
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
