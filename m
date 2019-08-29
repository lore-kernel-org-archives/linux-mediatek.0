From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v7 13/13] arm64: dts: Add power controller device node
 of MT8183
Date: Thu, 29 Aug 2019 13:15:55 +0800
Message-ID: <1567055755.27361.3.camel@mtksdaap41>
References: <1566983506-26598-1-git-send-email-weiyi.lu@mediatek.com>
         <1566983506-26598-14-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566983506-26598-14-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Weiyi:

On Wed, 2019-08-28 at 17:11 +0800, Weiyi Lu wrote:
> Add power controller node and smi-common node for MT8183
> In scpsys node, it contains clocks and regmapping of
> infracfg and smi-common for bus protection.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 62 ++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c2749c4..66aaa07 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/mt8183-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/power/mt8183-power.h>
>  #include "mt8183-pinfunc.h"
>  
>  / {
> @@ -238,6 +239,62 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> +		scpsys: syscon@10006000 {
> +			compatible = "mediatek,mt8183-scpsys", "syscon";
> +			#power-domain-cells = <1>;
> +			reg = <0 0x10006000 0 0x1000>;
> +			clocks = <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
> +				 <&infracfg CLK_INFRA_AUDIO>,
> +				 <&infracfg CLK_INFRA_AUDIO_26M_BCLK>,
> +				 <&topckgen CLK_TOP_MUX_MFG>,
> +				 <&topckgen CLK_TOP_MUX_MM>,
> +				 <&topckgen CLK_TOP_MUX_CAM>,
> +				 <&topckgen CLK_TOP_MUX_IMG>,
> +				 <&topckgen CLK_TOP_MUX_IPU_IF>,
> +				 <&topckgen CLK_TOP_MUX_DSP>,
> +				 <&topckgen CLK_TOP_MUX_DSP1>,
> +				 <&topckgen CLK_TOP_MUX_DSP2>,
> +				 <&mmsys CLK_MM_SMI_COMMON>,
> +				 <&mmsys CLK_MM_SMI_LARB0>,
> +				 <&mmsys CLK_MM_SMI_LARB1>,
> +				 <&mmsys CLK_MM_GALS_COMM0>,
> +				 <&mmsys CLK_MM_GALS_COMM1>,
> +				 <&mmsys CLK_MM_GALS_CCU2MM>,
> +				 <&mmsys CLK_MM_GALS_IPU12MM>,
> +				 <&mmsys CLK_MM_GALS_IMG2MM>,
> +				 <&mmsys CLK_MM_GALS_CAM2MM>,
> +				 <&mmsys CLK_MM_GALS_IPU2MM>,

Just mention the discussion in [1], we need to confirm this is hardware
limitation or not.

[1] https://patchwork.kernel.org/patch/11005731/

Regards,
CK

> +				 <&imgsys CLK_IMG_LARB5>,
> +				 <&imgsys CLK_IMG_LARB2>,
> +				 <&camsys CLK_CAM_LARB6>,
> +				 <&camsys CLK_CAM_LARB3>,
> +				 <&camsys CLK_CAM_SENINF>,
> +				 <&camsys CLK_CAM_CAMSV0>,
> +				 <&camsys CLK_CAM_CAMSV1>,
> +				 <&camsys CLK_CAM_CAMSV2>,
> +				 <&camsys CLK_CAM_CCU>,
> +				 <&ipu_conn CLK_IPU_CONN_IPU>,
> +				 <&ipu_conn CLK_IPU_CONN_AHB>,
> +				 <&ipu_conn CLK_IPU_CONN_AXI>,
> +				 <&ipu_conn CLK_IPU_CONN_ISP>,
> +				 <&ipu_conn CLK_IPU_CONN_CAM_ADL>,
> +				 <&ipu_conn CLK_IPU_CONN_IMG_ADL>;
> +			clock-names = "audio", "audio1", "audio2",
> +				      "mfg", "mm", "cam",
> +				      "isp", "vpu", "vpu1",
> +				      "vpu2", "vpu3", "mm-0",
> +				      "mm-1", "mm-2", "mm-3",
> +				      "mm-4", "mm-5", "mm-6",
> +				      "mm-7", "mm-8", "mm-9",
> +				      "isp-0", "isp-1", "cam-0",
> +				      "cam-1", "cam-2", "cam-3",
> +				      "cam-4", "cam-5", "cam-6",
> +				      "vpu-0", "vpu-1", "vpu-2",
> +				      "vpu-3", "vpu-4", "vpu-5";
> +			infracfg = <&infracfg>;
> +			smi_comm = <&smi_common>;
> +		};
> +
>  		apmixedsys: syscon@1000c000 {
>  			compatible = "mediatek,mt8183-apmixedsys", "syscon";
>  			reg = <0 0x1000c000 0 0x1000>;
> @@ -396,6 +453,11 @@
>  			#clock-cells = <1>;
>  		};
>  
> +		smi_common: smi@14019000 {
> +			compatible = "mediatek,mt8183-smi-common", "syscon";
> +			reg = <0 0x14019000 0 0x1000>;
> +		};
> +
>  		imgsys: syscon@15020000 {
>  			compatible = "mediatek,mt8183-imgsys", "syscon";
>  			reg = <0 0x15020000 0 0x1000>;
