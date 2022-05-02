Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF32EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 15:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AspKt1CJ2mlmEcxjoGM6+5FEyNn1iw40T2xEB+HkrqQ=; b=LJWgqPzQ6V7CLa
	Vo+0a4zTfe7wvUR/HNIkLoTaN209THiW6Ab8FpmBgtarILO2kAPCK7zkDbLBSpp77WW46HqjiU+Ub
	oKz9HRWsqre9VCXXiUWJaC+Pn67iFIUpTcfKRqNcp+2/OMb34H8c6UJdHNdHeCXI8K2WTMsKnXNxM
	wiQI8df8uCo714z4QtOp4fh0BnTnJtcO4Z+xjuNxGrcm5R1sy5eERU3LXnARraOioKXhsHBkBoNoI
	e3eqPnLlGl6/oXcNfKJbdb5kajOtwM+SeiZisNq25deNOeI3+VkqeW0asUAT+c6rIU2476v7dV02D
	oGPLIcMzMmjPDnVILxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlY34-001Wn3-UC; Mon, 02 May 2022 15:33:18 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlY2m-001Wbl-BR; Mon, 02 May 2022 15:33:05 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
 by mxout4.routing.net (Postfix) with ESMTP id 1695610078B;
 Mon,  2 May 2022 15:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1651505568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TgAc/UUbfQ8mxCRcdxLjsv4nGWXuTAstKGWqAmyatnM=;
 b=fpMQCUGZaRsyekhfUCnpEHMjvAGqB5xw1rMyNzPX8E5OAdH1do2UdVzQucs2GFJQiOPkXP
 FCerDy28stsw9Ma4zreaGZvTV508bRuzdb6k4CLOIKTLatXHJKDt9/Lg7gZGH2gRgEIGsV
 yK6c3ZMEDZHXlMkrnDKD0PvpZsa8PdY=
Received: from localhost.localdomain (fttx-pool-217.61.151.222.bambit.de
 [217.61.151.222])
 by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 9837840095;
 Mon,  2 May 2022 15:32:46 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [RFC v1] dt-bindings: net: dsa: convert binding for mediatek switches
Date: Mon,  2 May 2022 17:32:38 +0200
Message-Id: <20220502153238.85090-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: 05490e6d-1df6-4067-9b6a-10b81f040ebb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_083300_730632_7104C370 
X-CRM114-Status: GOOD (  26.23  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Convert txt binding to yaml binding for Mediatek switches.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/net/dsa/mediatek.yaml | 435 ++++++++++++++++++
 .../devicetree/bindings/net/dsa/mt7530.txt    | 327 -------------
 2 files changed, 435 insertions(+), 327 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/mediatek.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/dsa/mt7530.txt

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek.yaml
new file mode 100644
index 000000000000..c1724809d34e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek.yaml
@@ -0,0 +1,435 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/mediatek.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT7530 Ethernet switch
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+  - Landen Chao <Landen.Chao@mediatek.com>
+  - DENG Qingfang <dqfext@gmail.com>
+
+description: |
+  Port 5 of mt7530 and mt7621 switch is muxed between:
+  1. GMAC5: GMAC5 can interface with another external MAC or PHY.
+  2. PHY of port 0 or port 4: PHY interfaces with an external MAC like 2nd GMAC
+     of the SOC. Used in many setups where port 0/4 becomes the WAN port.
+     Note: On a MT7621 SOC with integrated switch: 2nd GMAC can only connected to
+       GMAC5 when the gpios for RGMII2 (GPIO 22-33) are not used and not
+       connected to external component!
+
+  Port 5 modes/configurations:
+  1. Port 5 is disabled and isolated: An external phy can interface to the 2nd
+     GMAC of the SOC.
+     In the case of a build-in MT7530 switch, port 5 shares the RGMII bus with 2nd
+     GMAC and an optional external phy. Mind the GPIO/pinctl settings of the SOC!
+  2. Port 5 is muxed to PHY of port 0/4: Port 0/4 interfaces with 2nd GMAC.
+     It is a simple MAC to PHY interface, port 5 needs to be setup for xMII mode
+     and RGMII delay.
+  3. Port 5 is muxed to GMAC5 and can interface to an external phy.
+     Port 5 becomes an extra switch port.
+     Only works on platform where external phy TX<->RX lines are swapped.
+     Like in the Ubiquiti ER-X-SFP.
+  4. Port 5 is muxed to GMAC5 and interfaces with the 2nd GAMC as 2nd CPU port.
+     Currently a 2nd CPU port is not supported by DSA code.
+
+  Depending on how the external PHY is wired:
+  1. normal: The PHY can only connect to 2nd GMAC but not to the switch
+  2. swapped: RGMII TX, RX are swapped; external phy interface with the switch as
+     a ethernet port. But can't interface to the 2nd GMAC.
+
+    Based on the DT the port 5 mode is configured.
+
+  Driver tries to lookup the phy-handle of the 2nd GMAC of the master device.
+  When phy-handle matches PHY of port 0 or 4 then port 5 set-up as mode 2.
+  phy-mode must be set, see also example 2 below!
+  * mt7621: phy-mode = "rgmii-txid";
+  * mt7623: phy-mode = "rgmii";
+
+  CPU-Ports need a phy-mode property:
+    Allowed values on mt7530 and mt7621:
+      - "rgmii"
+      - "trgmii"
+    On mt7531:
+      - "1000base-x"
+      - "2500base-x"
+      - "sgmii"
+
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7530
+      - mediatek,mt7531
+      - mediatek,mt7621
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  core-supply:
+    description: |
+      Phandle to the regulator node necessary for the core power.
+
+  "#gpio-cells":
+    description: |
+      Must be 2 if gpio-controller is defined.
+    const: 2
+
+  gpio-controller:
+    type: boolean
+    description: |
+      Boolean; if defined, MT7530's LED controller will run on
+      GPIO mode.
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupt-controller:
+    type: boolean
+    description: |
+      Boolean; Enables the internal interrupt controller.
+
+  interrupts:
+    description: |
+      Parent interrupt for the interrupt controller.
+    maxItems: 1
+
+  io-supply:
+    description: |
+      Phandle to the regulator node necessary for the I/O power.
+      See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
+      for details for the regulator setup on these boards.
+
+  mediatek,mcm:
+    type: boolean
+    description: |
+      Boolean; if defined, indicates that either MT7530 is the part
+      on multi-chip module belong to MT7623A has or the remotely standalone
+      chip as the function MT7623N reference board provided for.
+
+  reset-gpios:
+    description: |
+      Should be a gpio specifier for a reset line.
+    maxItems: 1
+
+  reset-names:
+    description: |
+      Should be set to "mcm".
+    const: mcm
+
+  resets:
+    description: |
+      Phandle pointing to the system reset controller with
+      line index for the ethsys.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: "dsa.yaml#"
+  - if:
+      required:
+        - mediatek,mcm
+    then:
+      required:
+        - resets
+        - reset-names
+    else:
+      required:
+        - reset-gpios
+
+  - if:
+      required:
+        - interrupt-controller
+    then:
+      required:
+        - "#interrupt-cells"
+        - interrupts
+
+  - if:
+      properties:
+        compatible:
+          items:
+            - const: mediatek,mt7530
+    then:
+      required:
+        - core-supply
+        - io-supply
+
+
+patternProperties:
+  "^ports$":
+    type: object
+
+    patternProperties:
+      "^port@[0-9]+$":
+        type: object
+        description: Ethernet switch ports
+
+        $ref: dsa-port.yaml#
+
+        properties:
+          reg:
+            description: |
+              Port address described must be 6 for CPU port and from 0 to 5 for user ports.
+
+        unevaluatedProperties: false
+
+        allOf:
+          - if:
+              properties:
+                label:
+                  items:
+                    - const: cpu
+            then:
+              required:
+                - reg
+                - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        switch@0 {
+            compatible = "mediatek,mt7530";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+
+            core-supply = <&mt6323_vpa_reg>;
+            io-supply = <&mt6323_vemc3v3_reg>;
+            reset-gpios = <&pio 33 0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    label = "lan0";
+                };
+
+                port@1 {
+                    reg = <1>;
+                    label = "lan1";
+                };
+
+                port@2 {
+                    reg = <2>;
+                    label = "lan2";
+                };
+
+                port@3 {
+                    reg = <3>;
+                    label = "lan3";
+                };
+
+                port@4 {
+                    reg = <4>;
+                    label = "wan";
+                };
+
+                port@6 {
+                    reg = <6>;
+                    label = "cpu";
+                    ethernet = <&gmac0>;
+                    phy-mode = "trgmii";
+                    fixed-link {
+                        speed = <1000>;
+                        full-duplex;
+                    };
+                };
+            };
+        };
+    };
+
+  - |
+    //Example 2: MT7621: Port 4 is WAN port: 2nd GMAC -> Port 5 -> PHY port 4.
+
+    eth {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gmac0: mac@0 {
+            compatible = "mediatek,eth-mac";
+            reg = <0>;
+            phy-mode = "rgmii";
+
+            fixed-link {
+                speed = <1000>;
+                full-duplex;
+                pause;
+            };
+        };
+
+        gmac1: mac@1 {
+            compatible = "mediatek,eth-mac";
+            reg = <1>;
+            phy-mode = "rgmii-txid";
+            phy-handle = <&phy4>;
+        };
+
+        mdio: mdio-bus {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* Internal phy */
+            phy4: ethernet-phy@4 {
+                reg = <4>;
+            };
+
+            mt7530: switch@1f {
+                compatible = "mediatek,mt7621";
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x1f>;
+                mediatek,mcm;
+
+                resets = <&rstctrl 2>;
+                reset-names = "mcm";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan0";
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan1";
+                    };
+
+                    port@2 {
+                        reg = <2>;
+                        label = "lan2";
+                    };
+
+                    port@3 {
+                        reg = <3>;
+                        label = "lan3";
+                    };
+
+        /* Commented out. Port 4 is handled by 2nd GMAC.
+                    port@4 {
+                        reg = <4>;
+                        label = "lan4";
+                    };
+        */
+
+                    port@6 {
+                        reg = <6>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "rgmii";
+
+                        fixed-link {
+                            speed = <1000>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+        };
+    };
+
+  - |
+    //Example 3: MT7621: Port 5 is connected to external PHY: Port 5 -> external PHY.
+
+    eth {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gmac_0: mac@0 {
+            compatible = "mediatek,eth-mac";
+            reg = <0>;
+            phy-mode = "rgmii";
+
+            fixed-link {
+                speed = <1000>;
+                full-duplex;
+                pause;
+            };
+        };
+
+        mdio0: mdio-bus {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* External phy */
+            ephy5: ethernet-phy@7 {
+                reg = <7>;
+            };
+
+            switch@1f {
+                compatible = "mediatek,mt7621";
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x1f>;
+                mediatek,mcm;
+
+                resets = <&rstctrl 2>;
+                reset-names = "mcm";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan0";
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan1";
+                    };
+
+                    port@2 {
+                        reg = <2>;
+                        label = "lan2";
+                    };
+
+                    port@3 {
+                        reg = <3>;
+                        label = "lan3";
+                    };
+
+                    port@4 {
+                        reg = <4>;
+                        label = "lan4";
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "lan5";
+                        phy-mode = "rgmii";
+                        phy-handle = <&ephy5>;
+                    };
+
+                    cpu_port0: port@6 {
+                        reg = <6>;
+                        label = "cpu";
+                        ethernet = <&gmac_0>;
+                        phy-mode = "rgmii";
+
+                        fixed-link {
+                            speed = <1000>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
deleted file mode 100644
index 18247ebfc487..000000000000
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ /dev/null
@@ -1,327 +0,0 @@
-Mediatek MT7530 Ethernet switch
-================================
-
-Required properties:
-
-- compatible: may be compatible = "mediatek,mt7530"
-	or compatible = "mediatek,mt7621"
-	or compatible = "mediatek,mt7531"
-- #address-cells: Must be 1.
-- #size-cells: Must be 0.
-- mediatek,mcm: Boolean; if defined, indicates that either MT7530 is the part
-	on multi-chip module belong to MT7623A has or the remotely standalone
-	chip as the function MT7623N reference board provided for.
-
-If compatible mediatek,mt7530 is set then the following properties are required
-
-- core-supply: Phandle to the regulator node necessary for the core power.
-- io-supply: Phandle to the regulator node necessary for the I/O power.
-	See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
-	for details for the regulator setup on these boards.
-
-If the property mediatek,mcm isn't defined, following property is required
-
-- reset-gpios: Should be a gpio specifier for a reset line.
-
-Else, following properties are required
-
-- resets : Phandle pointing to the system reset controller with
-	line index for the ethsys.
-- reset-names : Should be set to "mcm".
-
-Required properties for the child nodes within ports container:
-
-- reg: Port address described must be 6 for CPU port and from 0 to 5 for
-	user ports.
-- phy-mode: String, the following values are acceptable for port labeled
-	"cpu":
-	If compatible mediatek,mt7530 or mediatek,mt7621 is set,
-	must be either "trgmii" or "rgmii"
-	If compatible mediatek,mt7531 is set,
-	must be either "sgmii", "1000base-x" or "2500base-x"
-
-Port 5 of mt7530 and mt7621 switch is muxed between:
-1. GMAC5: GMAC5 can interface with another external MAC or PHY.
-2. PHY of port 0 or port 4: PHY interfaces with an external MAC like 2nd GMAC
-   of the SOC. Used in many setups where port 0/4 becomes the WAN port.
-   Note: On a MT7621 SOC with integrated switch: 2nd GMAC can only connected to
-	 GMAC5 when the gpios for RGMII2 (GPIO 22-33) are not used and not
-	 connected to external component!
-
-Port 5 modes/configurations:
-1. Port 5 is disabled and isolated: An external phy can interface to the 2nd
-   GMAC of the SOC.
-   In the case of a build-in MT7530 switch, port 5 shares the RGMII bus with 2nd
-   GMAC and an optional external phy. Mind the GPIO/pinctl settings of the SOC!
-2. Port 5 is muxed to PHY of port 0/4: Port 0/4 interfaces with 2nd GMAC.
-   It is a simple MAC to PHY interface, port 5 needs to be setup for xMII mode
-   and RGMII delay.
-3. Port 5 is muxed to GMAC5 and can interface to an external phy.
-   Port 5 becomes an extra switch port.
-   Only works on platform where external phy TX<->RX lines are swapped.
-   Like in the Ubiquiti ER-X-SFP.
-4. Port 5 is muxed to GMAC5 and interfaces with the 2nd GAMC as 2nd CPU port.
-   Currently a 2nd CPU port is not supported by DSA code.
-
-Depending on how the external PHY is wired:
-1. normal: The PHY can only connect to 2nd GMAC but not to the switch
-2. swapped: RGMII TX, RX are swapped; external phy interface with the switch as
-   a ethernet port. But can't interface to the 2nd GMAC.
-
-Based on the DT the port 5 mode is configured.
-
-Driver tries to lookup the phy-handle of the 2nd GMAC of the master device.
-When phy-handle matches PHY of port 0 or 4 then port 5 set-up as mode 2.
-phy-mode must be set, see also example 2 below!
- * mt7621: phy-mode = "rgmii-txid";
- * mt7623: phy-mode = "rgmii";
-
-Optional properties:
-
-- gpio-controller: Boolean; if defined, MT7530's LED controller will run on
-	GPIO mode.
-- #gpio-cells: Must be 2 if gpio-controller is defined.
-- interrupt-controller: Boolean; Enables the internal interrupt controller.
-
-If interrupt-controller is defined, the following properties are required.
-
-- #interrupt-cells: Must be 1.
-- interrupts: Parent interrupt for the interrupt controller.
-
-See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
-required, optional properties and how the integrated switch subnodes must
-be specified.
-
-Example:
-
-	&mdio0 {
-		switch@0 {
-			compatible = "mediatek,mt7530";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-
-			core-supply = <&mt6323_vpa_reg>;
-			io-supply = <&mt6323_vemc3v3_reg>;
-			reset-gpios = <&pio 33 0>;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <0>;
-				port@0 {
-					reg = <0>;
-					label = "lan0";
-				};
-
-				port@1 {
-					reg = <1>;
-					label = "lan1";
-				};
-
-				port@2 {
-					reg = <2>;
-					label = "lan2";
-				};
-
-				port@3 {
-					reg = <3>;
-					label = "lan3";
-				};
-
-				port@4 {
-					reg = <4>;
-					label = "wan";
-				};
-
-				port@6 {
-					reg = <6>;
-					label = "cpu";
-					ethernet = <&gmac0>;
-					phy-mode = "trgmii";
-					fixed-link {
-						speed = <1000>;
-						full-duplex;
-					};
-				};
-			};
-		};
-	};
-
-Example 2: MT7621: Port 4 is WAN port: 2nd GMAC -> Port 5 -> PHY port 4.
-
-&eth {
-	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "rgmii";
-
-		fixed-link {
-			speed = <1000>;
-			full-duplex;
-			pause;
-		};
-	};
-
-	gmac1: mac@1 {
-		compatible = "mediatek,eth-mac";
-		reg = <1>;
-		phy-mode = "rgmii-txid";
-		phy-handle = <&phy4>;
-	};
-
-	mdio: mdio-bus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		/* Internal phy */
-		phy4: ethernet-phy@4 {
-			reg = <4>;
-		};
-
-		mt7530: switch@1f {
-			compatible = "mediatek,mt7621";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0x1f>;
-			pinctrl-names = "default";
-			mediatek,mcm;
-
-			resets = <&rstctrl 2>;
-			reset-names = "mcm";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					label = "lan0";
-				};
-
-				port@1 {
-					reg = <1>;
-					label = "lan1";
-				};
-
-				port@2 {
-					reg = <2>;
-					label = "lan2";
-				};
-
-				port@3 {
-					reg = <3>;
-					label = "lan3";
-				};
-
-/* Commented out. Port 4 is handled by 2nd GMAC.
-				port@4 {
-					reg = <4>;
-					label = "lan4";
-				};
-*/
-
-				cpu_port0: port@6 {
-					reg = <6>;
-					label = "cpu";
-					ethernet = <&gmac0>;
-					phy-mode = "rgmii";
-
-					fixed-link {
-						speed = <1000>;
-						full-duplex;
-						pause;
-					};
-				};
-			};
-		};
-	};
-};
-
-Example 3: MT7621: Port 5 is connected to external PHY: Port 5 -> external PHY.
-
-&eth {
-	gmac0: mac@0 {
-		compatible = "mediatek,eth-mac";
-		reg = <0>;
-		phy-mode = "rgmii";
-
-		fixed-link {
-			speed = <1000>;
-			full-duplex;
-			pause;
-		};
-	};
-
-	mdio: mdio-bus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		/* External phy */
-		ephy5: ethernet-phy@7 {
-			reg = <7>;
-		};
-
-		mt7530: switch@1f {
-			compatible = "mediatek,mt7621";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0x1f>;
-			pinctrl-names = "default";
-			mediatek,mcm;
-
-			resets = <&rstctrl 2>;
-			reset-names = "mcm";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					label = "lan0";
-				};
-
-				port@1 {
-					reg = <1>;
-					label = "lan1";
-				};
-
-				port@2 {
-					reg = <2>;
-					label = "lan2";
-				};
-
-				port@3 {
-					reg = <3>;
-					label = "lan3";
-				};
-
-				port@4 {
-					reg = <4>;
-					label = "lan4";
-				};
-
-				port@5 {
-					reg = <5>;
-					label = "lan5";
-					phy-mode = "rgmii";
-					phy-handle = <&ephy5>;
-				};
-
-				cpu_port0: port@6 {
-					reg = <6>;
-					label = "cpu";
-					ethernet = <&gmac0>;
-					phy-mode = "rgmii";
-
-					fixed-link {
-						speed = <1000>;
-						full-duplex;
-						pause;
-					};
-				};
-			};
-		};
-	};
-};
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
