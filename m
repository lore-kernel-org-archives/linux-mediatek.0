From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH RFC net-next 4/5] dt-bindings: net: dsa: mt7530: Add mediatek,ephy-handle to isolate ext. phy
Date: Mon, 24 Jun 2019 16:52:50 +0200
Message-ID: <20190624145251.4849-5-opensource@vdorst.com>
References: <20190624145251.4849-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190624145251.4849-1-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com
Cc: frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org

On some platforum the external phy can only interface to the port 5 of the
switch because the RGMII TX and RX lines are swapped. But it still can be
useful to use the internal phy of the switch to act as a WAN port which
connectes to the 2nd GMAC. This gives WAN port dedicated bandwidth to
the SOC. This increases the LAN and WAN routing.

By adding the optional property mediatek,ephy-handle, the external phy
is put in isolation mode when internal phy is connected to 2nd GMAC via
phy-handle property.

Signed-off-by: René van Dorst <opensource@vdorst.com>
---
 .../devicetree/bindings/net/dsa/mt7530.txt    | 116 +++++++++++++++++-
 1 file changed, 115 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index f3486780f2c2..1e79fba5a774 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -60,10 +60,20 @@ Depending on how the external PHY is wired:
 2. swapped: RGMII TX, RX are swapped; external phy interface with the switch as
    a ethernet port. But can't interface to the 2nd GMAC.
 
+Optional property:
+
+- mediatek,ephy-handle: Phandle of the external phy. In case you want to use
+			P0/4 as WAN port and have an external phy attached.
+			With this property the external phy is put in isolation
+			and powerdown mode in mode 2.
+
 Based on the DT the port 5 mode is configured.
 
 Driver tries to lookup the phy-handle of the 2nd GMAC of the master device.
-When phy-handle matches PHY of port 0 or 4 then port 5 set-up as mode 2.
+When phy-handle matches PHY of port 0 or 4 then port 5 set-up as mode 2 and when
+propertly "mediatek,ephy-handle" is valid it puts the externel phy in isolation
+mode.
+
 phy-mode must be set, see also example 2 below!
  * mt7621: phy-mode = "rgmii-txid";
  * mt7623: phy-mode = "rgmii";
@@ -309,3 +319,107 @@ Example 3: MT7621: Port 5 is connected to external PHY: Port 5 -> external PHY.
 		};
 	};
 };
+
+Example 4: MT7621: Port 4 is WAN port: 2nd GMAC -> P5 -> PHY P4
+		   with an external phy.
+
+&eth {
+	status = "okay";
+
+	gmac0: mac@0 {
+		compatible = "mediatek,eth-mac";
+		reg = <0>;
+		phy-mode = "rgmii";
+
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+			pause;
+		};
+	};
+
+	gmac1: mac@1 {
+		compatible = "mediatek,eth-mac";
+		reg = <1>;
+		phy-mode = "rgmii-txid";
+		phy-handle = <&phy4>;
+	};
+
+	mdio: mdio-bus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Internal phy 4 */
+		phy4: ethernet-phy@4 {
+			reg = <4>;
+		};
+
+		/* external phy addr 0x07 */
+		ephy5: ethernet-phy@7 {
+			reg = <7>;
+		};
+
+		mt7530: switch@1f {
+			compatible = "mediatek,mt7621";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1f>;
+			pinctrl-names = "default";
+			mediatek,mcm;
+
+			/* Put this external phy in power-down and isolation
+			 * when port 5 is used in PHY P0/P4 or DSA mode. Because
+			 * external phy and port 5 share same bus to 2nd GMAC.
+			 */
+			mediatek,ephy-handle = <&ephy5>;
+
+			resets = <&rstctrl 2>;
+			reset-names = "mcm";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					label = "lan0";
+				};
+
+				port@1 {
+					reg = <1>;
+					label = "lan1";
+				};
+
+				port@2 {
+					reg = <2>;
+					label = "lan2";
+				};
+
+				port@3 {
+					reg = <3>;
+					label = "lan3";
+				};
+
+/* Commented out. Port 4 is handled by 2nd GMAC.
+				port@4 {
+					reg = <4>;
+					label = "lan4";
+				};
+*/
+
+				cpu_port0: port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&gmac0>;
+					phy-mode = "rgmii";
+
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+						pause;
+					};
+				};
+			};
+		};
+	};
+};
-- 
2.20.1
