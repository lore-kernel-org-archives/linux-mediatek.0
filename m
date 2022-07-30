Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E0DC04A68
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jul 2022 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXvWyurd3uJplbjX+1DkMin3Y9BckKMWylNYP/VVkbY=; b=X6MyKV7mwARPCkE120jdHtYeNn
	sh8sdenQSDs9au74xPcPSnztt19h8eaPNqMRx8A27/BGsfpCX8EZi2cx619+V7qwNGHfCCf+gFWWU
	KHDd3pYq3tWScigLah1o6dqkNianO3diG7h17pbDFane0w6eeAFbAZW+en9Gq88wxC3pncixYT6X5
	C3Oa/K5RktJidOewR4u4t1A4MBqPIGXWvX4IsMElWfWARc4VlVV+cOjmPgARTgelqUqPjNNIIEnM6
	AQieL/9G1kaJTblYAaskHwDOdlkva8nHpilIOXLoCFqHDiU+MmkftSdrOGQMMppUSOUo5nsj/oXGV
	931Klblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHnRr-001Ufx-6C; Sat, 30 Jul 2022 14:28:11 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHnRB-001UJ3-Ig; Sat, 30 Jul 2022 14:27:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1659191224; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MRsrRjr6Kk6xz2MeqqBvc9zWbLISxss+HXQCuPJgIEVGEppVlGJnyMCLaCXr4zuZ0AhbtbX1lBKF8lqNd94IudrFGUGG2B7K8BbOyWxUJKdbBpt2zvpRT+7URgde3xzFo5gyW3OwVCxTMFBW8O6IfnbJUeMCvixWj++NsneQOJc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1659191224; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=QXvWyurd3uJplbjX+1DkMin3Y9BckKMWylNYP/VVkbY=; 
	b=NJ6rMyNJZZqQsR2R5xbK+uVbTk+DfELz8pASYHSyJtam6/A+4MLBRBpuWIqOHqtKQMoCtgqC7LBXaowTdiSEdw+26ELZNKmKMcwp+h1W4XWWB9V5hE3G2w7+MiUNN3QcLh0xu0V4/InvDQ0WO+td2dojBdeRPVga4SdtIt3eqDk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659191224;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=QXvWyurd3uJplbjX+1DkMin3Y9BckKMWylNYP/VVkbY=;
	b=fXkGWG0XGl+VKtwpwRStDdEdG8DEumn2nBpyO5k9emm8feLocXOt6RzFJgAx3qiV
	TS5sj4CaM2bs7CcYWlFx0P6ybnqfygQDRddsdl8rYZ1pggaOCSgC/RJ56Jms59uwxNo
	fpYcyxW6ZjUtbEaFybLhYVWFtAaCdVgvn2UQdQeg=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1659191222946466.51244697668903; Sat, 30 Jul 2022 07:27:02 -0700 (PDT)
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
Subject: [PATCH 2/4] dt-bindings: net: dsa: mediatek,mt7530: update examples
Date: Sat, 30 Jul 2022 17:26:25 +0300
Message-Id: <20220730142627.29028-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220730142627.29028-1-arinc.unal@arinc9.com>
References: <20220730142627.29028-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_072729_718330_5653485A 
X-CRM114-Status: GOOD (  13.62  )
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
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 661 +++++++++++++-----
 1 file changed, 500 insertions(+), 161 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 541984a7d2d4..479e292cb2af 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -186,144 +186,374 @@ allOf:
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
@@ -331,87 +561,196 @@ examples:
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
+                ethernet-phy@7 {
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
+                ethernet-phy@7 {
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


