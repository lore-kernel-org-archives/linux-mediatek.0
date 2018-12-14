From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 8/8] net: dsa: changes to dts
Date: Fri, 14 Dec 2018 17:48:47 +0100
Message-ID: <20181214164847.4851-9-frank-w@public-files.de>
References: <20181214164847.4851-1-frank-w@public-files.de>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181214164847.4851-1-frank-w@public-files.de>
Sender: netdev-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: linux-mediatek@lists.infradead.org

---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 2b760f90f38c..64f3da148dbb 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -143,6 +143,18 @@
 		};
 	};
 
+	gmac1: mac@1 {
+		compatible = "mediatek,eth-mac";
+		reg = <1>;
+		phy-mode = "trgmii";
+
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+			pause;
+		};
+	};
+
 	mdio: mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -161,29 +173,44 @@
 				port@0 {
 					reg = <0>;
 					label = "wan";
+					default_cpu = <&cpu_port1>;
 				};
 
 				port@1 {
 					reg = <1>;
 					label = "lan0";
+					default_cpu = <&cpu_port0>;
 				};
 
 				port@2 {
 					reg = <2>;
 					label = "lan1";
+					default_cpu = <&cpu_port0>;
 				};
 
 				port@3 {
 					reg = <3>;
 					label = "lan2";
+					default_cpu = <&cpu_port0>;
 				};
 
 				port@4 {
 					reg = <4>;
 					label = "lan3";
+					default_cpu = <&cpu_port0>;
 				};
 
-				port@6 {
+				cpu_port1: port@5 {
+					reg = <5>;
+					label = "cpu";
+					ethernet = <&gmac1>;
+					phy-mode = "trgmii";
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+					};
+				};
+				cpu_port0: port@6 {
 					reg = <6>;
 					label = "cpu";
 					ethernet = <&gmac0>;
-- 
2.17.1
