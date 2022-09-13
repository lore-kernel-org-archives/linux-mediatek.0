Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1826BECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 17:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZPJoKgEvdBbp/OYzBeIXJzfqiNyUOE3IzMdduDPyVs=; b=LoMlWjpQjbLfO8G+RkxkxtWnq2
	D+Jz3lqhRxJrWWf8BdQwbQ4eRwJvvWyTrqmv+1+jmI14PzB/ByLZ1o5mVcJhoSFC6ghtTCZIjh6dx
	bFlHe0/r5eee/hyWXVoyFR8HUtX5EY+3cn3b7QEyZCwra8W8hDLXbMI8x1EKEo/dia0yy3qf7Gigg
	e3NYCJMHhKkRsUohJhs52wMaeZKve3RzKWbVQ7N6HjLC/s5dJrYbpyuJY9ypZfZoY6dhtUiIyMk26
	Qa7+gcBrJnvGPuJfC38qCrXLeBCioNcf69X4Y3tyJ4OYs9YQf4DmTNuTRv2i8GhQh8Y6ek9hs3EMn
	9fUWCf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY9IG-00DilK-GM; Tue, 13 Sep 2022 17:01:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY9IC-00Diil-OA
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 17:01:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57F8361525;
	Tue, 13 Sep 2022 17:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67693C433C1;
	Tue, 13 Sep 2022 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663088507;
	bh=wm12Hio92i/8JMj155OBAKnvdcQb74N+qR/MF5Gc1mk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ouJBhf++du5YpbshAqH6/7+RJCt1Go7zOR6YVNJ2eLH2dhyRr04+gq4cu4/CJU55J
	 T31SFtA4rwz1+1583Nh0i81V/i17vGL87juasjb+YS4sQ/iIgJ0dfdGQC56FBgW9pT
	 9x8ivgf7jEUDYK/uO+QKQRGwWU9yHD6ZmoLr4oMPmRQ0FxW87ilVJUEntvAWPwApkA
	 Xsn4GJwGyQ/M5/BU1VprcfJsUZCKdNYOMijLnToE+G8M1P4Hl9wKtYcZsJ6JxxNHHj
	 2sRiz/PhJ4tWX9tTrcO3S42bib4wQ0xEMhWQjDoDVEhk3yCm8SV2Y0uU+lMoFPyOZc
	 VCByCkjhAcY+Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	daniel@makrotopia.org
Subject: [PATCH v2 net-next 02/11] dt-bindings: net: mediatek: add WED binding for MT7986 eth driver
Date: Tue, 13 Sep 2022 19:00:52 +0200
Message-Id: <2d05849aa9fdb5d14897adc51fcd93ace27f610d.1663087836.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1663087836.git.lorenzo@kernel.org>
References: <cover.1663087836.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_100148_916371_64627C96 
X-CRM114-Status: GOOD (  15.71  )
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

Document the binding for the Wireless Ethernet Dispatch core on the
MT7986 ethernet driver

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../arm/mediatek/mediatek,mt7622-wed.yaml     |  1 +
 .../mediatek/mediatek,mt7986-wed-pcie.yaml    | 43 +++++++++++++++++++
 .../devicetree/bindings/net/mediatek,net.yaml | 27 ++++++++----
 3 files changed, 62 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
index 787d6673f952..84fb0a146b6e 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
@@ -20,6 +20,7 @@ properties:
     items:
       - enum:
           - mediatek,mt7622-wed
+          - mediatek,mt7986-wed
       - const: syscon
 
   reg:
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml
new file mode 100644
index 000000000000..96221f51c1c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wed-pcie.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek PCIE WED Controller for MT7986
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+  - Felix Fietkau <nbd@nbd.name>
+
+description:
+  The mediatek WED PCIE provides a configuration interface for PCIE
+  controller on MT7986 soc.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt7986-wed-pcie
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      wed_pcie: wed-pcie@10003000 {
+        compatible = "mediatek,mt7986-wed-pcie",
+                     "syscon";
+        reg = <0 0x10003000 0 0x10>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index f5564ecddb62..7ef696204c5a 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -69,6 +69,15 @@ properties:
       A list of phandle to the syscon node that handles the SGMII setup which is required for
       those SoCs equipped with SGMII.
 
+  mediatek,wed:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 2
+    maxItems: 2
+    items:
+      maxItems: 1
+    description:
+      List of phandles to wireless ethernet dispatch nodes.
+
   dma-coherent: true
 
   mdio-bus:
@@ -112,6 +121,8 @@ allOf:
             Phandle to the syscon node that handles the ports slew rate and
             driver current.
 
+        mediatek,wed: false
+
   - if:
       properties:
         compatible:
@@ -144,15 +155,6 @@ allOf:
           minItems: 1
           maxItems: 1
 
-        mediatek,wed:
-          $ref: /schemas/types.yaml#/definitions/phandle-array
-          minItems: 2
-          maxItems: 2
-          items:
-            maxItems: 1
-          description:
-            List of phandles to wireless ethernet dispatch nodes.
-
         mediatek,pcie-mirror:
           $ref: /schemas/types.yaml#/definitions/phandle
           description:
@@ -202,6 +204,8 @@ allOf:
           minItems: 2
           maxItems: 2
 
+        mediatek,wed: false
+
   - if:
       properties:
         compatible:
@@ -238,6 +242,11 @@ allOf:
           minItems: 2
           maxItems: 2
 
+        mediatek,wed-pcie:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description:
+            Phandle to the mediatek wed-pcie controller.
+
 patternProperties:
   "^mac@[0-1]$":
     type: object
-- 
2.37.3


