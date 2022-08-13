Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4652C25B0D
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Aug 2022 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpdp6LPTfqbARjTFaw3f1d8nBUsyfA5yRM28W5Ao7fw=; b=2GPQVsVmubFvrj4BC/XVndyhDD
	iheGrOAxJdnS1yeaRWLYonoK4D47gC9jtYt3b++SrirL292QHYwlootWc0umB1dnJ4y1yK1V0arKP
	H8U4t5rNS5QxnfyPd15gjNaIkVCVQzI/9ZjfPcVBr21ah9p30p4+w6VxhPIoKXenDDlbi5M8ZyvpH
	b8dLvxBlWfM8YR7Br5mHuN2zh7IsH0hMK/hyJ7nmqkYDOlpGCs9HU8feCKavmVseHpefO878yhPGo
	jP6CVA1OjY5tZ00c5gZqfOlwru7k6pFMEif1ptqfBq+fneiny8PXEWszhfc8RsI17jAT+1gjH6H2Y
	OifItUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMtKz-00FYg3-1e; Sat, 13 Aug 2022 15:46:09 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMtKC-00FY8q-LI; Sat, 13 Aug 2022 15:45:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660405495; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YSIdlbj16cLi6PYVwapQwT7cVnDO2PdOFTHRJOl9XivjSo+qzUXsTt8e1/vJUZ0sLXQykd3wLeonai6w6M/KWI26J8pItjqNmV8GflaDyymhqTMcDOcF9GomEhe5DqG0SLaXS5/wXi20Xi+u6voZQyY3n2PMXBJ9pCx6ZcKrkDY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660405495; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dpdp6LPTfqbARjTFaw3f1d8nBUsyfA5yRM28W5Ao7fw=; 
	b=Ec+7pH/6VDz5Oi6KG/QSbL8hd3v6KBDacn/wOQamW/K4Z2D4+yRKXwpaItB1nLXcZX4m7qfMluZutF2FedzJpkgIDpHQJ2UiBSqltYidfBNKO9LO5MV8tLvG0CEr+XxtTo/m5CW2ujP5pTfyZFsbSBejO1ceIhvIq3Ak4bVbJUU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660405495;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=dpdp6LPTfqbARjTFaw3f1d8nBUsyfA5yRM28W5Ao7fw=;
	b=P37c2sfMrdoBM2tTkitln9w4A06HhpzP0tOJ2aMvhPo4DGOq+1f75o9PhbXu394x
	XeB5pudBD3qZbY9Zm7VphBAiIkgS8HQ/pPKCpO0lQRHWRH6Y/9ifBIntRcLbBeMbosi
	LKK8a/kVvLupj/n/vtSMlkBhKk0AsPpHMukr59lc=
Received: from arinc9-PC.lan (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1660405493768160.00422022708858; Sat, 13 Aug 2022 08:44:53 -0700 (PDT)
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
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v2 3/7] dt-bindings: net: dsa: mediatek,mt7530: update examples
Date: Sat, 13 Aug 2022 18:44:11 +0300
Message-Id: <20220813154415.349091-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220813154415.349091-1-arinc.unal@arinc9.com>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_084520_904427_4580EF30 
X-CRM114-Status: GOOD (  12.89  )
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
- Define examples from platform to make the bindings clearer.
- Add interrupt controller to the examples. Include header file for
interrupt.
- Change reset line for MT7621 examples.
- Pretty formatting for the examples.
- Change switch reg to 0.
- Change port labels to fit the example, change port 4 label to wan.
- Change ethernet-ports to ports.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 663 +++++++++++++-----
 1 file changed, 502 insertions(+), 161 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 4c99266ce82a..cc87f48d4d07 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -210,144 +210,374 @@ allOf:
 unevaluatedProperties: false
 
 examples:
+  # Example 1: Standalone MT7530
   - |
     #include <dt-bindings/gpio/gpio.h>
-    mdio {
-        #address-cells = <1>;
-        #size-cells = <0>;
-        switch@0 {
-            compatible = "mediatek,mt7530";
-            reg = <0>;
-
-            core-supply = <&mt6323_vpa_reg>;
-            io-supply = <&mt6323_vemc3v3_reg>;
-            reset-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
-
-            ethernet-ports {
+
+    platform {
+        ethernet {
+            mdio {
                 #address-cells = <1>;
                 #size-cells = <0>;
-                port@0 {
+
+                switch@0 {
+                    compatible = "mediatek,mt7530";
                     reg = <0>;
-                    label = "lan0";
-                };
 
-                port@1 {
-                    reg = <1>;
-                    label = "lan1";
-                };
+                    reset-gpios = <&pio 33 0>;
 
-                port@2 {
-                    reg = <2>;
-                    label = "lan2";
-                };
+                    core-supply = <&mt6323_vpa_reg>;
+                    io-supply = <&mt6323_vemc3v3_reg>;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
 
-                port@3 {
-                    reg = <3>;
-                    label = "lan3";
+                        port@0 {
+                            reg = <0>;
+                            label = "lan1";
+                        };
+
+                        port@1 {
+                            reg = <1>;
+                            label = "lan2";
+                        };
+
+                        port@2 {
+                            reg = <2>;
+                            label = "lan3";
+                        };
+
+                        port@3 {
+                            reg = <3>;
+                            label = "lan4";
+                        };
+
+                        port@4 {
+                            reg = <4>;
+                            label = "wan";
+                        };
+
+                        port@6 {
+                            reg = <6>;
+                            label = "cpu";
+                            ethernet = <&gmac0>;
+                            phy-mode = "rgmii";
+
+                            fixed-link {
+                                speed = <1000>;
+                                full-duplex;
+                                pause;
+                            };
+                        };
+                    };
                 };
+            };
+        };
+    };
 
-                port@4 {
-                    reg = <4>;
-                    label = "wan";
+  # Example 2: MT7530 in MT7623AI SoC
+  - |
+    #include <dt-bindings/reset/mt2701-resets.h>
+
+    platform {
+        ethernet {
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                switch@0 {
+                    compatible = "mediatek,mt7530";
+                    reg = <0>;
+
+                    mediatek,mcm;
+                    resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
+                    reset-names = "mcm";
+
+                    core-supply = <&mt6323_vpa_reg>;
+                    io-supply = <&mt6323_vemc3v3_reg>;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                            reg = <0>;
+                            label = "lan1";
+                        };
+
+                        port@1 {
+                            reg = <1>;
+                            label = "lan2";
+                        };
+
+                        port@2 {
+                            reg = <2>;
+                            label = "lan3";
+                        };
+
+                        port@3 {
+                            reg = <3>;
+                            label = "lan4";
+                        };
+
+                        port@4 {
+                            reg = <4>;
+                            label = "wan";
+                        };
+
+                        port@6 {
+                            reg = <6>;
+                            label = "cpu";
+                            ethernet = <&gmac0>;
+                            phy-mode = "trgmii";
+
+                            fixed-link {
+                                speed = <1000>;
+                                full-duplex;
+                                pause;
+                            };
+                        };
+                    };
                 };
+            };
+        };
+    };
+
+  # Example 3: Standalone MT7531
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    platform {
+        ethernet {
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                switch@0 {
+                    compatible = "mediatek,mt7531";
+                    reg = <0>;
+
+                    reset-gpios = <&pio 54 0>;
+
+                    interrupt-controller;
+                    #interrupt-cells = <1>;
+                    interrupt-parent = <&pio>;
+                    interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                            reg = <0>;
+                            label = "lan1";
+                        };
+
+                        port@1 {
+                            reg = <1>;
+                            label = "lan2";
+                        };
+
+                        port@2 {
+                            reg = <2>;
+                            label = "lan3";
+                        };
+
+                        port@3 {
+                            reg = <3>;
+                            label = "lan4";
+                        };
 
-                port@6 {
-                    reg = <6>;
-                    label = "cpu";
-                    ethernet = <&gmac0>;
-                    phy-mode = "trgmii";
-                    fixed-link {
-                        speed = <1000>;
-                        full-duplex;
+                        port@4 {
+                            reg = <4>;
+                            label = "wan";
+                        };
+
+                        port@6 {
+                            reg = <6>;
+                            label = "cpu";
+                            ethernet = <&gmac0>;
+                            phy-mode = "2500base-x";
+
+                            fixed-link {
+                                speed = <2500>;
+                                full-duplex;
+                                pause;
+                            };
+                        };
                     };
                 };
             };
         };
     };
 
+  # Example 4: MT7530 in MT7621AT, MT7621DAT and MT7621ST SoCs
   - |
-    //Example 2: MT7621: Port 4 is WAN port: 2nd GMAC -> Port 5 -> PHY port 4.
-
-    ethernet {
-        #address-cells = <1>;
-        #size-cells = <0>;
-        gmac0: mac@0 {
-            compatible = "mediatek,eth-mac";
-            reg = <0>;
-            phy-mode = "rgmii";
-
-            fixed-link {
-                speed = <1000>;
-                full-duplex;
-                pause;
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/reset/mt7621-reset.h>
+
+    platform {
+        ethernet {
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                switch@0 {
+                    compatible = "mediatek,mt7621";
+                    reg = <0>;
+
+                    mediatek,mcm;
+                    resets = <&sysc MT7621_RST_MCM>;
+                    reset-names = "mcm";
+
+                    interrupt-controller;
+                    #interrupt-cells = <1>;
+                    interrupt-parent = <&gic>;
+                    interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                            reg = <0>;
+                            label = "lan1";
+                        };
+
+                        port@1 {
+                            reg = <1>;
+                            label = "lan2";
+                        };
+
+                        port@2 {
+                            reg = <2>;
+                            label = "lan3";
+                        };
+
+                        port@3 {
+                            reg = <3>;
+                            label = "lan4";
+                        };
+
+                        port@4 {
+                            reg = <4>;
+                            label = "wan";
+                        };
+
+                        port@6 {
+                            reg = <6>;
+                            label = "cpu";
+                            ethernet = <&gmac0>;
+                            phy-mode = "trgmii";
+
+                            fixed-link {
+                                speed = <1000>;
+                                full-duplex;
+                                pause;
+                            };
+                        };
+                    };
+                };
             };
         };
+    };
 
-        gmac1: mac@1 {
-            compatible = "mediatek,eth-mac";
-            reg = <1>;
-            phy-mode = "rgmii-txid";
-            phy-handle = <&phy4>;
+  # Example 5: MT7621: mux MT7530's phy4 to SoC's gmac1
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/reset/mt7621-reset.h>
+
+    platform {
+        pinctrl {
+            example5_rgmii2_pins: rgmii2-pins {
+                pinmux {
+                    groups = "rgmii2";
+                    function = "rgmii2";
+                };
+            };
         };
 
-        mdio: mdio-bus {
+        ethernet {
             #address-cells = <1>;
             #size-cells = <0>;
 
-            /* Internal phy */
-            phy4: ethernet-phy@4 {
-                reg = <4>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&example5_rgmii2_pins>;
+
+            mac@1 {
+                compatible = "mediatek,eth-mac";
+                reg = <1>;
+
+                phy-mode = "rgmii";
+                phy-handle = <&example5_ethphy4>;
             };
 
-            mt7530: switch@1f {
-                compatible = "mediatek,mt7621";
-                reg = <0x1f>;
-                mediatek,mcm;
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
 
-                resets = <&rstctrl 2>;
-                reset-names = "mcm";
+                /* MT7530's phy4 */
+                example5_ethphy4: ethernet-phy@4 {
+                    reg = <4>;
+                };
 
-                ethernet-ports {
-                    #address-cells = <1>;
-                    #size-cells = <0>;
+                switch@0 {
+                    compatible = "mediatek,mt7621";
+                    reg = <0>;
 
-                    port@0 {
-                        reg = <0>;
-                        label = "lan0";
-                    };
+                    mediatek,mcm;
+                    resets = <&sysc MT7621_RST_MCM>;
+                    reset-names = "mcm";
 
-                    port@1 {
-                        reg = <1>;
-                        label = "lan1";
-                    };
+                    interrupt-controller;
+                    #interrupt-cells = <1>;
+                    interrupt-parent = <&gic>;
+                    interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
-                    port@2 {
-                        reg = <2>;
-                        label = "lan2";
-                    };
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
 
-                    port@3 {
-                        reg = <3>;
-                        label = "lan3";
-                    };
+                        port@0 {
+                            reg = <0>;
+                            label = "lan1";
+                        };
 
-                    /* Commented out. Port 4 is handled by 2nd GMAC.
-                    port@4 {
-                        reg = <4>;
-                        label = "lan4";
-                    };
-                    */
+                        port@1 {
+                            reg = <1>;
+                            label = "lan2";
+                        };
 
-                    port@6 {
-                        reg = <6>;
-                        label = "cpu";
-                        ethernet = <&gmac0>;
-                        phy-mode = "rgmii";
+                        port@2 {
+                            reg = <2>;
+                            label = "lan3";
+                        };
 
-                        fixed-link {
-                            speed = <1000>;
-                            full-duplex;
-                            pause;
+                        port@3 {
+                            reg = <3>;
+                            label = "lan4";
+                        };
+
+                        /* Commented out, phy4 is muxed to gmac1.
+                        port@4 {
+                            reg = <4>;
+                            label = "wan";
+                        };
+                        */
+
+                        port@6 {
+                            reg = <6>;
+                            label = "cpu";
+                            ethernet = <&gmac0>;
+                            phy-mode = "trgmii";
+
+                            fixed-link {
+                                speed = <1000>;
+                                full-duplex;
+                                pause;
+                            };
                         };
                     };
                 };
@@ -355,87 +585,198 @@ examples:
         };
     };
 
+  # Example 6: MT7621: mux external phy to SoC's gmac1
   - |
-    //Example 3: MT7621: Port 5 is connected to external PHY: Port 5 -> external PHY.
-
-    ethernet {
-        #address-cells = <1>;
-        #size-cells = <0>;
-        gmac_0: mac@0 {
-            compatible = "mediatek,eth-mac";
-            reg = <0>;
-            phy-mode = "rgmii";
-
-            fixed-link {
-                speed = <1000>;
-                full-duplex;
-                pause;
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/reset/mt7621-reset.h>
+
+    platform {
+        pinctrl {
+            example6_rgmii2_pins: rgmii2-pins {
+                pinmux {
+                    groups = "rgmii2";
+                    function = "rgmii2";
+                };
             };
         };
 
-        mdio0: mdio-bus {
+        ethernet {
             #address-cells = <1>;
             #size-cells = <0>;
 
-            /* External phy */
-            ephy5: ethernet-phy@7 {
-                reg = <7>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&example6_rgmii2_pins>;
+
+            mac@1 {
+                compatible = "mediatek,eth-mac";
+                reg = <1>;
+
+                phy-mode = "rgmii";
+                phy-handle = <&example6_ethphy7>;
             };
 
-            switch@1f {
-                compatible = "mediatek,mt7621";
-                reg = <0x1f>;
-                mediatek,mcm;
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
 
-                resets = <&rstctrl 2>;
-                reset-names = "mcm";
+                /* External PHY */
+                example6_ethphy7: ethernet-phy@7 {
+                    reg = <7>;
+                    phy-mode = "rgmii";
+                };
 
-                ethernet-ports {
-                    #address-cells = <1>;
-                    #size-cells = <0>;
+                switch@0 {
+                    compatible = "mediatek,mt7621";
+                    reg = <0>;
 
-                    port@0 {
-                        reg = <0>;
-                        label = "lan0";
-                    };
+                    mediatek,mcm;
+                    resets = <&sysc MT7621_RST_MCM>;
+                    reset-names = "mcm";
 
-                    port@1 {
-                        reg = <1>;
-                        label = "lan1";
-                    };
+                    interrupt-controller;
+                    #interrupt-cells = <1>;
+                    interrupt-parent = <&gic>;
+                    interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
-                    port@2 {
-                        reg = <2>;
-                        label = "lan2";
-                    };
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
 
-                    port@3 {
-                        reg = <3>;
-                        label = "lan3";
-                    };
+                        port@0 {
+                            reg = <0>;
+                            label = "lan1";
+                        };
 
-                    port@4 {
-                        reg = <4>;
-                        label = "lan4";
-                    };
+                        port@1 {
+                            reg = <1>;
+                            label = "lan2";
+                        };
+
+                        port@2 {
+                            reg = <2>;
+                            label = "lan3";
+                        };
 
-                    port@5 {
-                        reg = <5>;
-                        label = "lan5";
-                        phy-mode = "rgmii";
-                        phy-handle = <&ephy5>;
+                        port@3 {
+                            reg = <3>;
+                            label = "lan4";
+                        };
+
+                        port@4 {
+                            reg = <4>;
+                            label = "wan";
+                        };
+
+                        port@6 {
+                            reg = <6>;
+                            label = "cpu";
+                            ethernet = <&gmac0>;
+                            phy-mode = "trgmii";
+
+                            fixed-link {
+                                speed = <1000>;
+                                full-duplex;
+                                pause;
+                            };
+                        };
                     };
+                };
+            };
+        };
+    };
+
+  # Example 7: MT7621: mux external phy to MT7530's port 5
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/reset/mt7621-reset.h>
+
+    platform {
+        pinctrl {
+            example7_rgmii2_pins: rgmii2-pins {
+                pinmux {
+                    groups = "rgmii2";
+                    function = "gpio";
+                };
+            };
+        };
+
+        ethernet {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&example7_rgmii2_pins>;
 
-                    cpu_port0: port@6 {
-                        reg = <6>;
-                        label = "cpu";
-                        ethernet = <&gmac_0>;
-                        phy-mode = "rgmii";
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                /* External PHY */
+                example7_ethphy7: ethernet-phy@7 {
+                    reg = <7>;
+                    phy-mode = "rgmii";
+                };
+
+                switch@0 {
+                    compatible = "mediatek,mt7621";
+                    reg = <0>;
+
+                    mediatek,mcm;
+                    resets = <&sysc MT7621_RST_MCM>;
+                    reset-names = "mcm";
+
+                    interrupt-controller;
+                    #interrupt-cells = <1>;
+                    interrupt-parent = <&gic>;
+                    interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                            reg = <0>;
+                            label = "lan1";
+                        };
+
+                        port@1 {
+                            reg = <1>;
+                            label = "lan2";
+                        };
+
+                        port@2 {
+                            reg = <2>;
+                            label = "lan3";
+                        };
+
+                        port@3 {
+                            reg = <3>;
+                            label = "lan4";
+                        };
+
+                        port@4 {
+                            reg = <4>;
+                            label = "wan";
+                        };
+
+                        port@5 {
+                            reg = <5>;
+                            label = "extphy";
+                            phy-mode = "rgmii-txid";
+                            phy-handle = <&example7_ethphy7>;
+                        };
 
-                        fixed-link {
-                            speed = <1000>;
-                            full-duplex;
-                            pause;
+                        port@6 {
+                            reg = <6>;
+                            label = "cpu";
+                            ethernet = <&gmac0>;
+                            phy-mode = "trgmii";
+
+                            fixed-link {
+                                speed = <1000>;
+                                full-duplex;
+                                pause;
+                            };
                         };
                     };
                 };
-- 
2.34.1


