From: Yong Liang <yong.liang@mediatek.com>
Subject: [PATCH v2 1/2] arm64: dts: mt8183: Add reset-cells in infracfg
Date: Fri, 26 Apr 2019 15:10:17 +0800
Message-ID: <1556262618-14281-1-git-send-email-yong.liang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org, weiyi.lu@mediatek.com, jamesjj.liao@mediatek.com, jasu@njomotys.info, owen.chen@mediatek.com, chunhui.dai@mediatek.com, erin.lo@mediatek.com, eddie.huang@mediatek.com
Cc: "yong.liang" <yong.liang@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: "yong.liang" <yong.liang@mediatek.com>

Include mt8183-resets.h and add reset-cells in infracfg
in dtsi file.

Signed-off-by: yong.liang <yong.liang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 08274bf..2589e94 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8183-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset-controller/mt8183-resets.h>
 
 / {
 	compatible = "mediatek,mt8183";
@@ -194,6 +195,7 @@
 			compatible = "mediatek,mt8183-infracfg", "syscon";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		apmixedsys: syscon@1000c000 {
-- 
1.7.9.5
