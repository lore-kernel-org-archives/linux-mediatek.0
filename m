Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78238C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eHFYLtHhWopRug6RgckDsf0Bhv5ZhjwFSHg44nk/bk=; b=uu1eVE2e4/VL7bOLHH4KH81Yxi
	e7wHtQ51PKxnP1oOlzZXTUy9/hhMrNHpp8bhAv2rQsZuUZ1Fp44O0R2QeeqI/UrilSL9tNfBk+bna
	dqBig7esr0781e7Vt6rcWNxSvjCEM64WzoyIdkxS0qG/bVhDaoTxMQzrG84IPafjpoxmvjtRDZM91
	VtxmXDqoiyQpiqccyRCj41/MZ8I5mdU4u6KIfiQsJRNIwFlWvrjydBCxvhly+mT97KddHUvV9ZllN
	OJtAK93Ghs0M4YoEfJZvxwK85snV7t6eAzjZCsZZZxAabvrAr2B+8aqJwSXoAyx7hS5E13tHR4RX/
	JLZ0QeuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZp-007Ucn-0p;
	Fri, 31 Mar 2023 13:13:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZk-007UZs-1M
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 13:13:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09091628C8;
	Fri, 31 Mar 2023 13:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D59C433EF;
	Fri, 31 Mar 2023 13:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680268431;
	bh=EPYHZ8tZ9OKv8lK5Q0XeiNsOLRPnw/R2yxzVXTgnTqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JGsugcbk1J4ACNuQHPhzp+WllX6tzk0z75JdIM31NXpukcJbSSyH7zwefpJqsdXcw
	 iikWnbjXwDqhe3+WIQS6SzcHl5e5v4dq+kF7cG12J0+qF6+hD/8ARyQ1c0UTexiYKq
	 Zp/xMXtRezNakgSeyeG3QKLNtgMDHEhj8X4qHnzOKoGUKEJ10xGeTbx7R6rmEHQata
	 hnv7sGqSTcSHZV73HOqlGF1O6XnZl1dv8ndlrM+DfU/4R7P2U1+p7Kl2LF2HMWwObz
	 RmoO7J4eT4K9iqtsDC8P9lNxqq7hT8W3b9otDOxLJHSSGKcBfBDhk/W29Crsh0HLVF
	 3tZL9fq1KU+5w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	kuba@kernel.org,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo.bianconi@redhat.com,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 06/10] dt-bindings: soc: mediatek: move ilm in a dedicated dts node
Date: Fri, 31 Mar 2023 15:12:42 +0200
Message-Id: <18109725ba14d2fe5c00e627b064b38b5c8f2223.1680268101.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680268101.git.lorenzo@kernel.org>
References: <cover.1680268101.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_061352_573489_51FF5BE3 
X-CRM114-Status: GOOD (  14.58  )
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

Since the ilm memory region is not part of the MT7986 RAM SoC, move ilm
in a deidicated syscon node.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../arm/mediatek/mediatek,mt7622-wed.yaml     | 14 +++---
 .../soc/mediatek/mediatek,mt7986-wo-ilm.yaml  | 45 +++++++++++++++++++
 2 files changed, 53 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ilm.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
index 7f6638d43854..e63fb22447c6 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
@@ -32,14 +32,12 @@ properties:
   memory-region:
     items:
       - description: firmware EMI region
-      - description: firmware ILM region
       - description: firmware DLM region
       - description: firmware CPU DATA region
 
   memory-region-names:
     items:
       - const: wo-emi
-      - const: wo-ilm
       - const: wo-dlm
       - const: wo-data
 
@@ -51,6 +49,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: mediatek wed-wo cpuboot controller interface.
 
+  mediatek,wo-ilm:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: mediatek wed-wo ilm interface.
+
 allOf:
   - if:
       properties:
@@ -63,6 +65,7 @@ allOf:
         memory-region: false
         mediatek,wo-ccif: false
         mediatek,wo-cpuboot: false
+        mediatek,wo-ilm: false
 
 required:
   - compatible
@@ -97,11 +100,10 @@ examples:
         reg = <0 0x15010000 0 0x1000>;
         interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
 
-        memory-region = <&wo_emi>, <&wo_ilm>, <&wo_dlm>,
-                        <&wo_data>;
-        memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
-                              "wo-data";
+        memory-region = <&wo_emi>, <&wo_dlm>, <&wo_data>;
+        memory-region-names = "wo-emi", "wo-dlm", "wo-data";
         mediatek,wo-ccif = <&wo_ccif0>;
         mediatek,wo-cpuboot = <&wo_cpuboot>;
+        mediatek,wo-ilm = <&wo_ilm>;
       };
     };
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ilm.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ilm.yaml
new file mode 100644
index 000000000000..2a3775cd941e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ilm.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt7986-wo-ilm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Wireless Ethernet Dispatch (WED) WO ILM firmware interface for MT7986
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+  - Felix Fietkau <nbd@nbd.name>
+
+description:
+  The MediaTek wo-ilm (Information Lifecycle Management) provides a configuration
+  interface for WiFi critical data used by WED WO firmware. WED WO controller is
+  used to perform offload rx packet processing (e.g. 802.11 aggregation packet
+  reordering or rx header translation) on MT7986 soc.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt7986-wo-ilm
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
+
+      syscon@151e0000 {
+        compatible = "mediatek,mt7986-wo-ilm", "syscon";
+        reg = <0 0x151e0000 0 0x8000>;
+      };
+    };
-- 
2.39.2


