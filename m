From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] Include mt8183-reset.h and add reset-cells in
 infracfg in dtsi file.
Date: Thu, 22 Aug 2019 16:33:25 +0200
Message-ID: <24e4a0a9-065e-410d-7c3f-403ec859ae07@gmail.com>
References: <20190725080957.17333-1-yong.liang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190725080957.17333-1-yong.liang@mediatek.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yong Liang <yong.liang@mediatek.com>, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org, weiyi.lu@mediatek.com, jamesjj.liao@mediatek.com, jasu@njomotys.info, owen.chen@mediatek.com, chunhui.dai@mediatek.com, erin.lo@mediatek.com, eddie.huang@mediatek.com
Cc: linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org



On 25/07/2019 10:09, Yong Liang wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 

Missing commit message.
Subject could be shorter, something like:
arm64: dts: add reset-cells for infracfg

> Change-Id: I46e0aca76a206ac86ee0477d9dbd67e1e924b118

Please delete Change-Id it's not meaning full for upstream work.

> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 08274bfcebd8..2589e9461c6e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/mt8183-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/reset-controller/mt8183-resets.h>
>  
>  / {
>  	compatible = "mediatek,mt8183";
> @@ -194,6 +195,7 @@
>  			compatible = "mediatek,mt8183-infracfg", "syscon";
>  			reg = <0 0x10001000 0 0x1000>;
>  			#clock-cells = <1>;
> +			#reset-cells = <1>;
>  		};
>  
>  		apmixedsys: syscon@1000c000 {
> 
