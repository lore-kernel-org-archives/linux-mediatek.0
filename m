From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2, 2/3] arm64: dts: mt8183: add emi node
Date: Tue, 18 Jun 2019 23:32:43 +0200
Message-ID: <768b95c9-b0d4-844e-906d-0d8d3bb4fe65@gmail.com>
References: <1558670066-22484-1-git-send-email-xixi.chen@mediatek.com>
 <1558670066-22484-3-git-send-email-xixi.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1558670066-22484-3-git-send-email-xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
To: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org



On 24/05/2019 05:54, Xi Chen wrote:
> Add emi dts node.
> 
> Signed-off-by: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 75c4881..2a176e9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -269,6 +269,17 @@
>  			clock-names = "spi", "wrap";
>  		};
>  
> +		emi@10219000 {
> +			compatible = "mediatek,mt8183-emi";
> +			reg = <0 0x10219000 0 0x1000>, /* CEN EMI */
> +				  <0 0x10226000 0 0x1000>, /* EMI MPU */
> +				  <0 0x1022d000 0 0x1000>, /* CHA EMI */
> +			      <0 0x10235000 0 0x1000>; /* CHB EMI */
> +			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_LOW>, /* MPU */
> +						 <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>, /* CGM */
> +						 <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>; /* ELM */

indentation seems borken here.

> +		};
> +
>  		uart0: serial@11002000 {
>  			compatible = "mediatek,mt8183-uart",
>  				     "mediatek,mt6577-uart";
> 
