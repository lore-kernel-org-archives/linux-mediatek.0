From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [POC 14/16] arm64: dts: mt8173: add CPU OPP tables
Date: Wed, 15 Nov 2017 16:24:21 +0100
Message-ID: <1510759463-30201-15-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1510759463-30201-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1510759463-30201-1-git-send-email-ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mbrugger-IBi9RG/b67k@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Adds CPU OPP tables for use with the generic cpufreq driver.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 90 ++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index b99a273..f454efa33 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -51,6 +51,80 @@
 		mdp_wrot1 = &mdp_wrot1;
 	};
 
+	cluster0_opp: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp@507000000 {
+			opp-hz = /bits/ 64 <507000000>;
+			opp-microvolt = <859000>;
+		};
+		opp@702000000 {
+			opp-hz = /bits/ 64 <702000000>;
+			opp-microvolt = <908000>;
+		};
+		opp@1001000000 {
+			opp-hz = /bits/ 64 <1001000000>;
+			opp-microvolt = <983000>;
+		};
+		opp@1105000000 {
+			opp-hz = /bits/ 64 <1105000000>;
+			opp-microvolt = <1009000>;
+		};
+		opp@1209000000 {
+			opp-hz = /bits/ 64 <1209000000>;
+			opp-microvolt = <1034000>;
+		};
+		opp@1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <1057000>;
+		};
+		opp@1508000000 {
+			opp-hz = /bits/ 64 <1508000000>;
+			opp-microvolt = <1109000>;
+		};
+		opp@1703000000 {
+			opp-hz = /bits/ 64 <1703000000>;
+			opp-microvolt = <1125000>;
+		};
+	};
+
+	cluster1_opp: opp_table1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp@507000000 {
+			opp-hz = /bits/ 64 <507000000>;
+			opp-microvolt = <828000>;
+		};
+		opp@702000000 {
+			opp-hz = /bits/ 64 <702000000>;
+			opp-microvolt = <867000>;
+		};
+		opp@1001000000 {
+			opp-hz = /bits/ 64 <1001000000>;
+			opp-microvolt = <927000>;
+		};
+		opp@1209000000 {
+			opp-hz = /bits/ 64 <1209000000>;
+			opp-microvolt = <968000>;
+		};
+		opp@1404000000 {
+			opp-hz = /bits/ 64 <1404000000>;
+			opp-microvolt = <1007000>;
+		};
+		opp@1612000000 {
+			opp-hz = /bits/ 64 <1612000000>;
+			opp-microvolt = <1049000>;
+		};
+		opp@1807000000 {
+			opp-hz = /bits/ 64 <1807000000>;
+			opp-microvolt = <1089000>;
+		};
+		opp@2106000000 {
+			opp-hz = /bits/ 64 <2106000000>;
+			opp-microvolt = <1125000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -81,6 +155,10 @@
 			reg = <0x000>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			operating-points-v2 = <&cluster0_opp>;
+			#cooling-cells = <2>;
+			#cooling-min-level = <0>;
+			#cooling-max-level = <7>;
 		};
 
 		cpu1: cpu@1 {
@@ -89,6 +167,10 @@
 			reg = <0x001>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			operating-points-v2 = <&cluster0_opp>;
+			#cooling-cells = <2>;
+			#cooling-min-level = <0>;
+			#cooling-max-level = <7>;
 		};
 
 		cpu2: cpu@100 {
@@ -97,6 +179,10 @@
 			reg = <0x100>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			operating-points-v2 = <&cluster1_opp>;
+			#cooling-cells = <2>;
+			#cooling-min-level = <0>;
+			#cooling-max-level = <7>;
 		};
 
 		cpu3: cpu@101 {
@@ -105,6 +191,10 @@
 			reg = <0x101>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
+			operating-points-v2 = <&cluster1_opp>;
+			#cooling-cells = <2>;
+			#cooling-min-level = <0>;
+			#cooling-max-level = <7>;
 		};
 
 		idle-states {
-- 
2.7.4
