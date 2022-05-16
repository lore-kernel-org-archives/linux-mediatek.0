Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C7EC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2qBbVujyzkuqunYFb1GYYRCeB0zJnsh3Yy6tWY43pE=; b=JYO6rVXNRvsTqA
	VUzI5kR4cNeoBVF0L3mKLuK8dSN2CyLmtNgUAZDxv/a6Rksap0P6ddZSt2J7OMV1XJVGr/QyY/Icy
	42yF00NjgQTP0p5pHoIh7X5b1uaLM4US+O0aU0LrTOsBSwN0zbJ2Xmtjt8yeLjYEzumGVRz0v7xlV
	dfoRzAEcvxyijkBP+fMHrs8mhH9F1YCUYIeDKNweOO7VA2Gu5vWBMk+f3PMftrs9jMnqppbuwQC62
	pRgFU7mzQfgYfHQnUmA5HVK52g7KRFbzt7rqswcgSPqrjUIbh7pzyNy2NWes33eWDpztinl+H/otv
	RXrmTWYjOSRG69LwquGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdGw-008rhO-5S; Mon, 16 May 2022 16:08:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdG7-008rBw-TR
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 16:07:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D2A060FFA;
 Mon, 16 May 2022 16:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1524FC3411A;
 Mon, 16 May 2022 16:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652717265;
 bh=aSYMxoghmBGi6PfPfKaZsOsTEC8kXQeaqa+ZGO11hk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ahRiq8qzeZmvXj2gpcyNfY6uxf8QpCXe5OUzQac4DziIFYOwhGI5U8rvF0Qm0JKaH
 ZnbgP+VtopvVLZ3z7tlItBnq5hI2NpgDBpH+QdT6LW1SH7Tkz3CHENfkKWUFAnUtpV
 JSaE2Z5YIRDm4UJVqhJZtAddLvBWssWoTDjlF3KGbSpD31QyVar2repVofv/TzA9If
 M+0hLSdCypvI4wg0K/mQtsSsN/jTclJuYdKIhz6VYyFw45eEqZCu0DFgCLYdVB6zac
 ah7x8kepn7jhM+bn00CP+/74Kzf4cB0Pq2zvt2pPbtcsXa2uMMPkHvKQbKC3dpHpg9
 WwEK5X0qJI1Xg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v2 net-next 02/15] dt-bindings: net: mediatek,
 net: add mt7986-eth binding
Date: Mon, 16 May 2022 18:06:29 +0200
Message-Id: <aa934c3185c9e04893d9c285ed655495a049fa4f.1652716741.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090748_107212_9A4D9FF4 
X-CRM114-Status: GOOD (  10.82  )
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
 .../devicetree/bindings/net/mediatek,net.yaml | 141 +++++++++++++++++-
 1 file changed, 139 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 43cc4024ef98..699164dd1295 100644
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
@@ -88,6 +89,9 @@ allOf:
               - mediatek,mt7623-eth
     then:
       properties:
+        interrupts:
+          maxItems: 3
+
         clocks:
           minItems: 4
           maxItems: 4
@@ -112,6 +116,9 @@ allOf:
             const: mediatek,mt7622-eth
     then:
       properties:
+        interrupts:
+          maxItems: 3
+
         clocks:
           minItems: 11
           maxItems: 11
@@ -155,6 +162,9 @@ allOf:
             const: mediatek,mt7629-eth
     then:
       properties:
+        interrupts:
+          maxItems: 3
+
         clocks:
           minItems: 17
           maxItems: 17
@@ -189,6 +199,42 @@ allOf:
           minItems: 2
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7986-eth
+    then:
+      properties:
+        interrupts:
+          minItems: 4
+
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
 patternProperties:
   "^mac@[0-1]$":
     type: object
@@ -219,7 +265,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - power-domains
   - mediatek,ethsys
 
 unevaluatedProperties: false
@@ -295,3 +340,95 @@ examples:
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
+        #define CLK_ETH_FE_EN               0
+        #define CLK_ETH_WOCPU1_EN           3
+        #define CLK_ETH_WOCPU0_EN           4
+        #define CLK_TOP_NETSYS_SEL          43
+        #define CLK_TOP_NETSYS_500M_SEL     44
+        #define CLK_TOP_NETSYS_2X_SEL       46
+        #define CLK_TOP_SGM_325M_SEL        47
+        #define CLK_APMIXED_NET2PLL         1
+        #define CLK_APMIXED_SGMPLL          3
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
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
