Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9058C32796
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 10:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Em4aWyP+H0aOZOwwP3TtFIFI2zM+sD/PYWPFnpgJUE=; b=sOW4ByLrfcRDLozeYWqE7I2tCj
	UHP0b07zemVG3M/6YjUNuggwKjqXSPZtOgkgi90HRK+i1nBwW66YHDEF/VZFzBwy7B6E1gwXZUIgx
	oo0p0yfJtmpg5kYe175ErMYk3CV2F3ahzGHrlUtiHTUY/JdMThkMjYbqA2A79gcJ0dJV5akhA7pPX
	CUcdRJ8vthSP3aeRASAu2//JlxbRL7zynwtf1F86M1r+Twu13RhxJen5fLbSejIvJaiTJhEyrOP9v
	0NR4eBVZnmHK/b/jKXArdkX9hsaGHLjpFL8MAhYcwH74iVetg+hPwfLNFm0v7oYH8yITCNllLBrv5
	IjBQo8bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQntg-00CBLq-MN; Wed, 24 Aug 2022 10:46:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQnru-00CAGV-OY; Wed, 24 Aug 2022 10:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/Em4aWyP+H0aOZOwwP3TtFIFI2zM+sD/PYWPFnpgJUE=; b=VFUT6yw2HcviWX4F67a3BWjXXX
	8tE8MbWNbfmij1jSeCZ37rdepZk/gpyG4GFYI0qpqgjVnK9GAnusi4ZftHVOqFQMu5YpCeiAOqnwR
	A8ej1sHf71kwt6J9dcFy1GAM0BzFjLFqwlL2Z4Jhy/31y88a4lOjAM0gaE4YujEKVxTDAEitwAt4U
	6tx+F2SgpSJErU00S4IVanziXOVZLryPzxuuQ/2Ur6nisXBBiAicMQ3nZugeQv7CgwIj45uJvLwk/
	KxGGckDM2stP2A/7kYHwGgWnTPmBYmtfuJclj/xcHNC2129wcCRYQYWJUcgW1V8uRbBvJQktTWCHW
	6cTUR76A==;
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQnro-005hWz-9T; Wed, 24 Aug 2022 10:44:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661337823; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bs4zuVL8YraRAjZvgWkHjzgO0vAGolKXqNMj697AtcLdG+lUER1x2dGYvrcFSRBQkgtFIVvE/xHzES+K8VxX0NxYEOeuibcZWXG2BxlFd2lUaBS2vncQy19SKuXcDd4TykdFP4WaSVX5wYrVqYzCbWOj0T7v4wCNR2vZr13JA8w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661337823; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/Em4aWyP+H0aOZOwwP3TtFIFI2zM+sD/PYWPFnpgJUE=; 
	b=hKXP6IA0ozv9PwHKZzKKonOXuDsW/uNzKvakfxa0dVlfKoTq8p4/HI0p7Kio24OeVvDAdl4SXuOhTtc1Z5P9Zo66FFCqw7Ss46OncXVlyRTTJpg7NfEpbxitwyr1zL7oM69TBmmKPvbSQHUdhBC1NTIcyqvE1qQMwVtiiPZNJQY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661337823;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=/Em4aWyP+H0aOZOwwP3TtFIFI2zM+sD/PYWPFnpgJUE=;
	b=UcrDZxIMsoVqI++q4PaTxkikPvL1by+BscDbk6EddMH1/wXUhWivB5h+6dGavoXv
	a5INMepelTPRjBhC0vhO2I/57sikQn59nBHAb0S6IJ68TLFQM+PXh2Rt3690vhmKqI4
	kaueUSPQdcatMnnKDM+jymJogDM/DdbbAfNXNkac=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1661337820871354.9652774527401; Wed, 24 Aug 2022 03:43:40 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	Sander Vanheule <sander@svanheule.net>,
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 4/7] dt-bindings: net: dsa: mediatek,mt7530: update examples
Date: Wed, 24 Aug 2022 13:40:37 +0300
Message-Id: <20220824104040.17527-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824104040.17527-1-arinc.unal@arinc9.com>
References: <20220824104040.17527-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_114413_112178_6F6ED2A0 
X-CRM114-Status: GOOD (  13.80  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Update the examples on the binding.

- Add examples which include a wide variation of configurations.
- Make example comments YAML comment instead of DT binding comment.
- Add interrupt controller to the examples. Include header file for
interrupt.
- Change reset line for MT7621 examples.
- Pretty formatting for the examples.
- Change switch reg to 0.
- Change port labels to fit the example, change port 4 label to wan.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 402 +++++++++++++++---
 1 file changed, 347 insertions(+), 55 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 13f54d402e06..8dfc307e6e1b 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -203,42 +203,111 @@ allOf:
 unevaluatedProperties: false
 
 examples:
+  # Example 1: Standalone MT7530
   - |
     #include <dt-bindings/gpio/gpio.h>
+
     mdio {
         #address-cells = <1>;
         #size-cells = <0>;
+
         switch@0 {
             compatible = "mediatek,mt7530";
             reg = <0>;
 
+            reset-gpios = <&pio 33 0>;
+
             core-supply = <&mt6323_vpa_reg>;
             io-supply = <&mt6323_vemc3v3_reg>;
-            reset-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
 
             ethernet-ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
+
                 port@0 {
                     reg = <0>;
-                    label = "lan0";
+                    label = "lan1";
                 };
 
                 port@1 {
                     reg = <1>;
-                    label = "lan1";
+                    label = "lan2";
                 };
 
                 port@2 {
                     reg = <2>;
-                    label = "lan2";
+                    label = "lan3";
                 };
 
                 port@3 {
                     reg = <3>;
+                    label = "lan4";
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
+                    phy-mode = "rgmii";
+
+                    fixed-link {
+                        speed = <1000>;
+                        full-duplex;
+                        pause;
+                    };
+                };
+            };
+        };
+    };
+
+  # Example 2: MT7530 in MT7623AI SoC
+  - |
+    #include <dt-bindings/reset/mt2701-resets.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        switch@0 {
+            compatible = "mediatek,mt7530";
+            reg = <0>;
+
+            mediatek,mcm;
+            resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
+            reset-names = "mcm";
+
+            core-supply = <&mt6323_vpa_reg>;
+            io-supply = <&mt6323_vemc3v3_reg>;
+
+            ethernet-ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    label = "lan1";
+                };
+
+                port@1 {
+                    reg = <1>;
+                    label = "lan2";
+                };
+
+                port@2 {
+                    reg = <2>;
                     label = "lan3";
                 };
 
+                port@3 {
+                    reg = <3>;
+                    label = "lan4";
+                };
+
                 port@4 {
                     reg = <4>;
                     label = "wan";
@@ -249,85 +318,219 @@ examples:
                     label = "cpu";
                     ethernet = <&gmac0>;
                     phy-mode = "trgmii";
+
                     fixed-link {
                         speed = <1000>;
                         full-duplex;
+                        pause;
                     };
                 };
             };
         };
     };
 
+  # Example 3: Standalone MT7531
   - |
-    //Example 2: MT7621: Port 4 is WAN port: 2nd GMAC -> Port 5 -> PHY port 4.
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
 
-    ethernet {
+    mdio {
         #address-cells = <1>;
         #size-cells = <0>;
-        gmac0: mac@0 {
-            compatible = "mediatek,eth-mac";
+
+        switch@0 {
+            compatible = "mediatek,mt7531";
             reg = <0>;
-            phy-mode = "rgmii";
 
-            fixed-link {
-                speed = <1000>;
-                full-duplex;
-                pause;
+            reset-gpios = <&pio 54 0>;
+
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            interrupt-parent = <&pio>;
+            interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
+
+            ethernet-ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    label = "lan1";
+                };
+
+                port@1 {
+                    reg = <1>;
+                    label = "lan2";
+                };
+
+                port@2 {
+                    reg = <2>;
+                    label = "lan3";
+                };
+
+                port@3 {
+                    reg = <3>;
+                    label = "lan4";
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
+                    phy-mode = "2500base-x";
+
+                    fixed-link {
+                        speed = <2500>;
+                        full-duplex;
+                        pause;
+                    };
+                };
             };
         };
+    };
+
+  # Example 4: MT7530 in MT7621AT, MT7621DAT and MT7621ST SoCs
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/reset/mt7621-reset.h>
 
-        gmac1: mac@1 {
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        switch@0 {
+            compatible = "mediatek,mt7621";
+            reg = <0>;
+
+            mediatek,mcm;
+            resets = <&sysc MT7621_RST_MCM>;
+            reset-names = "mcm";
+
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            interrupt-parent = <&gic>;
+            interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
+
+            ethernet-ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    label = "lan1";
+                };
+
+                port@1 {
+                    reg = <1>;
+                    label = "lan2";
+                };
+
+                port@2 {
+                    reg = <2>;
+                    label = "lan3";
+                };
+
+                port@3 {
+                    reg = <3>;
+                    label = "lan4";
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
+
+                    fixed-link {
+                        speed = <1000>;
+                        full-duplex;
+                        pause;
+                    };
+                };
+            };
+        };
+    };
+
+  # Example 5: MT7621: mux MT7530's phy4 to SoC's gmac1
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/reset/mt7621-reset.h>
+
+    ethernet {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&rgmii2_pins>;
+
+        mac@1 {
             compatible = "mediatek,eth-mac";
             reg = <1>;
-            phy-mode = "rgmii-txid";
-            phy-handle = <&phy4>;
+
+            phy-mode = "rgmii";
+            phy-handle = <&example5_ethphy4>;
         };
 
-        mdio: mdio-bus {
+        mdio {
             #address-cells = <1>;
             #size-cells = <0>;
 
-            /* Internal phy */
-            phy4: ethernet-phy@4 {
+            /* MT7530's phy4 */
+            example5_ethphy4: ethernet-phy@4 {
                 reg = <4>;
             };
 
-            mt7530: switch@1f {
+            switch@0 {
                 compatible = "mediatek,mt7621";
-                reg = <0x1f>;
-                mediatek,mcm;
+                reg = <0>;
 
-                resets = <&rstctrl 2>;
+                mediatek,mcm;
+                resets = <&sysc MT7621_RST_MCM>;
                 reset-names = "mcm";
 
+                interrupt-controller;
+                #interrupt-cells = <1>;
+                interrupt-parent = <&gic>;
+                interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
+
                 ethernet-ports {
                     #address-cells = <1>;
                     #size-cells = <0>;
 
                     port@0 {
                         reg = <0>;
-                        label = "lan0";
+                        label = "lan1";
                     };
 
                     port@1 {
                         reg = <1>;
-                        label = "lan1";
+                        label = "lan2";
                     };
 
                     port@2 {
                         reg = <2>;
-                        label = "lan2";
+                        label = "lan3";
                     };
 
                     port@3 {
                         reg = <3>;
-                        label = "lan3";
+                        label = "lan4";
                     };
 
-                    /* Commented out. Port 4 is handled by 2nd GMAC.
+                    /* Commented out, phy4 is muxed to gmac1.
                     port@4 {
                         reg = <4>;
-                        label = "lan4";
+                        label = "wan";
                     };
                     */
 
@@ -335,7 +538,7 @@ examples:
                         reg = <6>;
                         label = "cpu";
                         ethernet = <&gmac0>;
-                        phy-mode = "rgmii";
+                        phy-mode = "trgmii";
 
                         fixed-link {
                             speed = <1000>;
@@ -348,82 +551,171 @@ examples:
         };
     };
 
+  # Example 6: MT7621: mux external phy to SoC's gmac1
   - |
-    //Example 3: MT7621: Port 5 is connected to external PHY: Port 5 -> external PHY.
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/reset/mt7621-reset.h>
 
     ethernet {
         #address-cells = <1>;
         #size-cells = <0>;
-        gmac_0: mac@0 {
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&rgmii2_pins>;
+
+        mac@1 {
             compatible = "mediatek,eth-mac";
-            reg = <0>;
+            reg = <1>;
+
             phy-mode = "rgmii";
+            phy-handle = <&example6_ethphy7>;
+        };
+
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* External PHY */
+            example6_ethphy7: ethernet-phy@7 {
+                reg = <7>;
+                phy-mode = "rgmii";
+            };
+
+            switch@0 {
+                compatible = "mediatek,mt7621";
+                reg = <0>;
+
+                mediatek,mcm;
+                resets = <&sysc MT7621_RST_MCM>;
+                reset-names = "mcm";
+
+                interrupt-controller;
+                #interrupt-cells = <1>;
+                interrupt-parent = <&gic>;
+                interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
+
+                ethernet-ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                    };
+
+                    port@2 {
+                        reg = <2>;
+                        label = "lan3";
+                    };
+
+                    port@3 {
+                        reg = <3>;
+                        label = "lan4";
+                    };
+
+                    port@4 {
+                        reg = <4>;
+                        label = "wan";
+                    };
 
-            fixed-link {
-                speed = <1000>;
-                full-duplex;
-                pause;
+                    port@6 {
+                        reg = <6>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "trgmii";
+
+                        fixed-link {
+                            speed = <1000>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
             };
         };
+    };
 
-        mdio0: mdio-bus {
+  # Example 7: MT7621: mux external phy to MT7530's port 5
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/reset/mt7621-reset.h>
+
+    ethernet {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&rgmii2_pins>;
+
+        mdio {
             #address-cells = <1>;
             #size-cells = <0>;
 
-            /* External phy */
-            ephy5: ethernet-phy@7 {
+            /* External PHY */
+            example7_ethphy7: ethernet-phy@7 {
                 reg = <7>;
+                phy-mode = "rgmii";
             };
 
-            switch@1f {
+            switch@0 {
                 compatible = "mediatek,mt7621";
-                reg = <0x1f>;
-                mediatek,mcm;
+                reg = <0>;
 
-                resets = <&rstctrl 2>;
+                mediatek,mcm;
+                resets = <&sysc MT7621_RST_MCM>;
                 reset-names = "mcm";
 
+                interrupt-controller;
+                #interrupt-cells = <1>;
+                interrupt-parent = <&gic>;
+                interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
+
                 ethernet-ports {
                     #address-cells = <1>;
                     #size-cells = <0>;
 
                     port@0 {
                         reg = <0>;
-                        label = "lan0";
+                        label = "lan1";
                     };
 
                     port@1 {
                         reg = <1>;
-                        label = "lan1";
+                        label = "lan2";
                     };
 
                     port@2 {
                         reg = <2>;
-                        label = "lan2";
+                        label = "lan3";
                     };
 
                     port@3 {
                         reg = <3>;
-                        label = "lan3";
+                        label = "lan4";
                     };
 
                     port@4 {
                         reg = <4>;
-                        label = "lan4";
+                        label = "wan";
                     };
 
                     port@5 {
                         reg = <5>;
-                        label = "lan5";
-                        phy-mode = "rgmii";
-                        phy-handle = <&ephy5>;
+                        label = "extphy";
+                        phy-mode = "rgmii-txid";
+                        phy-handle = <&example7_ethphy7>;
                     };
 
-                    cpu_port0: port@6 {
+                    port@6 {
                         reg = <6>;
                         label = "cpu";
-                        ethernet = <&gmac_0>;
-                        phy-mode = "rgmii";
+                        ethernet = <&gmac0>;
+                        phy-mode = "trgmii";
 
                         fixed-link {
                             speed = <1000>;
-- 
2.34.1


