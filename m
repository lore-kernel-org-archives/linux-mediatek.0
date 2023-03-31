Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA17CC6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 13:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+V8XDimd3JYOxlNJ7W37Ml/SA3OuBbDfDmwz+VXaBA=; b=ify5jdFT856+K7HegOEmPM8ANs
	RiDEXcSvhyfbP0WJ/j7DNuyEil5Mf06R4EZYUrJPHCh2qqZwnEFcv9emSOzy6/JafUfJcwgeZyGXj
	6yXpZyQyvqFLeplwVYYxBjZypYaNSDIf4iL/xa5oktfLmiO7rqF4/qwrv59gUAXg/1hdAd8NRXJq4
	K0Qb6lvdUFVrYzaRXP2B8awQbkfJB9e04n+T61vvzFeNQnPj5XA6TzudcAZmuPje2Bh/XOcHP8JDN
	DHkyi8gJchDCFkYw1CfckWis07thtNugeV9u/5xwUfjKkmlZsKMjPalTnabE8JmDQPN1cIWr/Z2H3
	YOQoxv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEa0-007Uhl-2Z;
	Fri, 31 Mar 2023 13:14:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZv-007UfZ-2f
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 13:14:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DEF7262908;
	Fri, 31 Mar 2023 13:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A232C4339B;
	Fri, 31 Mar 2023 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680268442;
	bh=fWp4pnTJD6ujYu6baXkTpEw8R10yq2a2e3WshWOsoi0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O78v4MA3B5ozyLWWBY/eyfLNI8PD/9KVAWRL6xcOM3oULxFydgffux6ZeQ9XdprDx
	 WVpVfY/BVACj0pL9whFW+cBK1Fgzk1990UZy5rEToMpQfhL0ksno/8iOHPHAsVjOIB
	 azc5yCHyMuhIjJVpgCf8P18Mr4wMqCH0SFV8n7Pi9B6nqkAJ840+6nZ6294V1QQkc9
	 jUCYEP6l52FGREetP7OpAVIsh/6kYbaiz3heUahpay9vTt1FgtneRJMTzFtKdduHs7
	 UrbuSSSF98V+/NicwUizG4yAohcbMXCyac7+2o+g2Nn4Tb/IykZedsReT3YzU6q6LW
	 fz3v+Baegr9UQ==
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
Subject: [PATCH v2 net-next 09/10] dt-bindings: soc: mediatek: move dlm in a dedicated dts node
Date: Fri, 31 Mar 2023 15:12:45 +0200
Message-Id: <6c169516bad15826a292d66923e49e28c9a64146.1680268101.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680268101.git.lorenzo@kernel.org>
References: <cover.1680268101.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_061403_938414_5B1FAAFA 
X-CRM114-Status: GOOD (  14.30  )
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

Since the dlm memory region is not part of the MT7986 RAM SoC, move dlm in
a deidicated syscon node.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../arm/mediatek/mediatek,mt7622-wed.yaml     | 12 +++--
 .../soc/mediatek/mediatek,mt7986-wo-dlm.yaml  | 46 +++++++++++++++++++
 2 files changed, 54 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-dlm.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
index e63fb22447c6..e4707880eca7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
@@ -32,13 +32,11 @@ properties:
   memory-region:
     items:
       - description: firmware EMI region
-      - description: firmware DLM region
       - description: firmware CPU DATA region
 
   memory-region-names:
     items:
       - const: wo-emi
-      - const: wo-dlm
       - const: wo-data
 
   mediatek,wo-ccif:
@@ -53,6 +51,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: mediatek wed-wo ilm interface.
 
+  mediatek,wo-dlm:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: mediatek wed-wo dlm interface.
+
 allOf:
   - if:
       properties:
@@ -66,6 +68,7 @@ allOf:
         mediatek,wo-ccif: false
         mediatek,wo-cpuboot: false
         mediatek,wo-ilm: false
+        mediatek,wo-dlm: false
 
 required:
   - compatible
@@ -100,10 +103,11 @@ examples:
         reg = <0 0x15010000 0 0x1000>;
         interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
 
-        memory-region = <&wo_emi>, <&wo_dlm>, <&wo_data>;
-        memory-region-names = "wo-emi", "wo-dlm", "wo-data";
+        memory-region = <&wo_emi>, <&wo_data>;
+        memory-region-names = "wo-emi", "wo-data";
         mediatek,wo-ccif = <&wo_ccif0>;
         mediatek,wo-cpuboot = <&wo_cpuboot>;
         mediatek,wo-ilm = <&wo_ilm>;
+        mediatek,wo-dlm = <&wo_dlm>;
       };
     };
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-dlm.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-dlm.yaml
new file mode 100644
index 000000000000..2b9c6a8ef918
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-dlm.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt7986-wo-dlm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Wireless Ethernet Dispatch (WED) WO DLM firmware interface for MT7986
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+  - Felix Fietkau <nbd@nbd.name>
+
+description:
+  The MediaTek wo-dlm (Data Lifecycle Management) provides a configuration
+  interface for WED WO firmware rx rings, including firmware I/O descriptor
+  ring, feedback command ring. WED WO controller is used to perform offload
+  rx packet processing (e.g. 802.11 aggregation packet reordering or rx
+  header translation) on MT7986 soc.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt7986-wo-dlm
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
+      syscon@151e8000 {
+        compatible = "mediatek,mt7986-wo-dlm", "syscon";
+        reg = <0 0x151e8000 0 0x2000>;
+      };
+    };
-- 
2.39.2


