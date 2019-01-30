From: gerg@kernel.org
Subject: [PATCHv4 3/3] dt-bindings: net: dsa: add new MT7530 binding to support MT7621
Date: Wed, 30 Jan 2019 11:24:06 +1000
Message-ID: <20190130012406.28271-4-gerg@kernel.org>
References: <20190130012406.28271-1-gerg@kernel.org>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190130012406.28271-1-gerg@kernel.org>
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com, linux-mediatek@lists.infradead.org, bjorn@mork.no, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, netdev@vger.kernel.org
Cc: rene@vdorst.com, john@phrozen.org, neil@brown.name, Greg Ungerer <gerg@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

From: Greg Ungerer <gerg@kernel.org>

Add devicetree binding to support the compatible mt7530 switch as used
in the MediaTek MT7621 SoC.

Signed-off-by: Greg Ungerer <gerg@kernel.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

v1: initial patch
v2: use separate devicetree binding
v3: change text according to feedback, rebase onto 5.0-rc3
v4: rebase onto 5.0-rc4

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index aa3527f71fdc..47aa205ee0bd 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -3,12 +3,16 @@ Mediatek MT7530 Ethernet switch
 
 Required properties:
 
-- compatible: Must be compatible = "mediatek,mt7530";
+- compatible: may be compatible = "mediatek,mt7530"
+	or compatible = "mediatek,mt7621"
 - #address-cells: Must be 1.
 - #size-cells: Must be 0.
 - mediatek,mcm: Boolean; if defined, indicates that either MT7530 is the part
 	on multi-chip module belong to MT7623A has or the remotely standalone
 	chip as the function MT7623N reference board provided for.
+
+If compatible mediatek,mt7530 is set then the following properties are required
+
 - core-supply: Phandle to the regulator node necessary for the core power.
 - io-supply: Phandle to the regulator node necessary for the I/O power.
 	See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
-- 
2.17.1
