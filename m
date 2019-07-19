From: Ulrich Hecht <uli-qwV78thtvt0@public.gmane.org>
Subject: [PATCH] arm64: dts: mt8173: Add capacity-dmips-mhz attributes
Date: Fri, 19 Jul 2019 11:50:16 +0200
Message-ID: <1563529816-3992-1-git-send-email-uli@fpond.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
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
Cc: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ulrich Hecht <uli-qwV78thtvt0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Dhrystone benchmark on Acer Chromebook R13 CB5-312T:
A72: 15698587 dps @ 1807 MHz
A53:  7598784 dps @ 1703 MHz

Signed-off-by: Ulrich Hecht <uli-qwV78thtvt0@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 15f1842..0b590fa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -161,6 +161,7 @@
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
+			capacity-dmips-mhz = <526>;
 		};
 
 		cpu1: cpu@1 {
@@ -174,6 +175,7 @@
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
+			capacity-dmips-mhz = <526>;
 		};
 
 		cpu2: cpu@100 {
@@ -187,6 +189,7 @@
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <1024>;
 		};
 
 		cpu3: cpu@101 {
@@ -200,6 +203,7 @@
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <1024>;
 		};
 
 		idle-states {
-- 
2.7.4
