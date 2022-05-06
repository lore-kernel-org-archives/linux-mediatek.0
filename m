Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657D7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 12:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9b8/h9cKWXiJ5JToV7s0n/gxX4AdHZoo2FGSXClFYq8=; b=jsgIdH2RfxuBoX
	G+fR2On1SVX3SHUT0cG9Hkh8JwKyOA8FxFPGRhZGSqMu9Ei3HXH5b8chsrNAEPyRaHhfSFap6t5LO
	u2XBD2zKrbcEmkikOLkhLE5EG0HEMkG44Ux0029B855bjewaTXSyx4Ijo6NObu1qle5SBBbLfDWXL
	D74Y5fSVtMRy00VpCeqE8ZluKA5Fdn6AgLzwNKLVIHLQA56fE5NiT2VpYjGoKe4rZ1Zyph0byzi7X
	dzDykTTGo7thbL3u8xwT0Q5++0ofmkTA2DGUEvhF+o7aqA02wTCk/7ukB02N5RF/nwPB+HPLtxmW9
	NCRPGwM6qol6imzRSD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmx79-003B8y-RG; Fri, 06 May 2022 12:31:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmx76-003B71-Ep
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 12:31:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA3F761FE8;
 Fri,  6 May 2022 12:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1751C385A9;
 Fri,  6 May 2022 12:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651840275;
 bh=cGAFybVkMIst2DZG3oqmyjOUtTwnEDPxUWqWn9pglWk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EUjoUFRiU6b2W30F5Eh8X2f+4Ebe1S6dbtZCzR0pwb/SCF4dNJVO+8ac2V9w+ElC3
 d0/3RWUDsPyAM4LqSyD4RoVy9ucNuxBVzasJw2hueSX4coat/3ybEN05YhGd0NpNT5
 7D8F2iUhWvl+H7eJ7IMPXjqkkS8/kiZEcSatJ4GMKkmOgoi1dkyEZ5GiWDeSdZuq2Z
 FL7APqbGu5gZzOjzzr1vHG+ZmNmcWfdt7GI7hMPkDPWDAsoH5regQZFQkripYAp8Jm
 SZUeoY8ci5/ymdLKkR6TdeTWSKhskAkHuON03EmIkjNz5s9ustFWjFqg1X1JGIAGSe
 YsCMgBHonIWqA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
Subject: [PATCH net-next 02/14] dt-bindings: net: mediatek,
 net: add mt7986-eth binding
Date: Fri,  6 May 2022 14:30:19 +0200
Message-Id: <ce9e2975645e81758558201337f50c6693143fd8.1651839494.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651839494.git.lorenzo@kernel.org>
References: <cover.1651839494.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_053116_638982_B637BA87 
X-CRM114-Status: GOOD (  10.32  )
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

Introduce dts bindings for mt7986 soc in mediatek,net.yaml.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/mediatek,net.yaml | 133 +++++++++++++++++-
 1 file changed, 131 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 43cc4024ef98..da1294083eeb 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -21,6 +21,7 @@ properties:
       - mediatek,mt7623-eth
       - mediatek,mt7622-eth
       - mediatek,mt7629-eth
+      - mediatek,mt7986-eth
       - ralink,rt5350-eth
 
   reg:
@@ -28,7 +29,7 @@ properties:
 
   interrupts:
     minItems: 3
-    maxItems: 3
+    maxItems: 4
 
   power-domains:
     maxItems: 1
@@ -189,6 +190,43 @@ allOf:
           minItems: 2
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7986-eth
+    then:
+      properties:
+        clocks:
+          minItems: 15
+          maxItems: 15
+
+        clock-names:
+          items:
+            - const: fe
+            - const: gp2
+            - const: gp1
+            - const: wocpu1
+            - const: wocpu0
+            - const: sgmii_tx250m
+            - const: sgmii_rx250m
+            - const: sgmii_cdr_ref
+            - const: sgmii_cdr_fb
+            - const: sgmii2_tx250m
+            - const: sgmii2_rx250m
+            - const: sgmii2_cdr_ref
+            - const: sgmii2_cdr_fb
+            - const: netsys0
+            - const: netsys1
+
+        mediatek,sgmiisys:
+          minItems: 2
+          maxItems: 2
+
+        assigned-clocks: true
+
+        assigned-clock-parents: true
+
 patternProperties:
   "^mac@[0-1]$":
     type: object
@@ -219,7 +257,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - power-domains
   - mediatek,ethsys
 
 unevaluatedProperties: false
@@ -295,3 +332,95 @@ examples:
         };
       };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt7622-clk.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      eth: ethernet@15100000 {
+        #define CLK_ETH_FE_EN            0
+        #define CLK_ETH_WOCPU1_EN        3
+        #define CLK_ETH_WOCPU0_EN        4
+        #define CLK_TOP_NETSYS_SEL      43
+        #define CLK_TOP_NETSYS_500M_SEL 44
+        #define CLK_TOP_NETSYS_2X_SEL   46
+        #define CLK_TOP_SGM_325M_SEL    47
+        #define CLK_APMIXED_NET2PLL      1
+        #define CLK_APMIXED_SGMPLL       3
+
+        compatible = "mediatek,mt7986-eth";
+        reg = <0 0x15100000 0 0x80000>;
+        interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ethsys CLK_ETH_FE_EN>,
+                 <&ethsys CLK_ETH_GP2_EN>,
+                 <&ethsys CLK_ETH_GP1_EN>,
+                 <&ethsys CLK_ETH_WOCPU1_EN>,
+                 <&ethsys CLK_ETH_WOCPU0_EN>,
+                 <&sgmiisys0 CLK_SGMII_TX250M_EN>,
+                 <&sgmiisys0 CLK_SGMII_RX250M_EN>,
+                 <&sgmiisys0 CLK_SGMII_CDR_REF>,
+                 <&sgmiisys0 CLK_SGMII_CDR_FB>,
+                 <&sgmiisys1 CLK_SGMII_TX250M_EN>,
+                 <&sgmiisys1 CLK_SGMII_RX250M_EN>,
+                 <&sgmiisys1 CLK_SGMII_CDR_REF>,
+                 <&sgmiisys1 CLK_SGMII_CDR_FB>,
+                 <&topckgen CLK_TOP_NETSYS_SEL>,
+                 <&topckgen CLK_TOP_NETSYS_SEL>;
+        clock-names = "fe", "gp2", "gp1", "wocpu1", "wocpu0",
+                      "sgmii_tx250m", "sgmii_rx250m",
+                      "sgmii_cdr_ref", "sgmii_cdr_fb",
+                      "sgmii2_tx250m", "sgmii2_rx250m",
+                      "sgmii2_cdr_ref", "sgmii2_cdr_fb",
+                      "netsys0", "netsys1";
+        mediatek,ethsys = <&ethsys>;
+        mediatek,sgmiisys = <&sgmiisys0>, <&sgmiisys1>;
+        assigned-clocks = <&topckgen CLK_TOP_NETSYS_2X_SEL>,
+                          <&topckgen CLK_TOP_SGM_325M_SEL>;
+        assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>,
+                                 <&apmixedsys CLK_APMIXED_SGMPLL>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mdio: mdio-bus {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          phy5: ethernet-phy@0 {
+            compatible = "ethernet-phy-id67c9.de0a";
+            phy-mode = "2500base-x";
+            reset-gpios = <&pio 6 1>;
+            reset-deassert-us = <20000>;
+            reg = <5>;
+          };
+
+          phy6: ethernet-phy@1 {
+            compatible = "ethernet-phy-id67c9.de0a";
+            phy-mode = "2500base-x";
+            reg = <6>;
+          };
+        };
+
+        mac0: mac@0 {
+          compatible = "mediatek,eth-mac";
+          phy-mode = "2500base-x";
+          phy-handle = <&phy5>;
+          reg = <0>;
+        };
+
+        mac1: mac@1 {
+          compatible = "mediatek,eth-mac";
+          phy-mode = "2500base-x";
+          phy-handle = <&phy6>;
+          reg = <1>;
+        };
+      };
+    };
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
