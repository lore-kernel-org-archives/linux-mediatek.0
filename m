Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981D7C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Nov 2022 22:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zy1Np0fkxcU5ebcdJguMFGwQ/nY4xrZRlGJk5ZkGmE=; b=W1pP+aVSVOe9DUaygMsis5Kime
	mEx0yImWR4LLyqForgukpnHjR6BFHryrMw1lwP4n8IIbb6NZNmgiKHZM4zjuynsLG9U5EpJhVT4M1
	vubAF8xCCtoSksaiD3Y5jGO2AnJcxiqT+RoZyRnc3Vo02Ya7JlHRNBCphuDLHMRD3aSsnItadKZM4
	VjGkpH4e8Y/Ww8rq+P09h4q4AnRiv/n1dwJB2nwBFoNQ4lz/RMbtnJLf9/MeJZNvwLgPQgGOXHSBr
	h3NrBLcm4RdFMIQ9s0HnMXZPGETwcVYaCUV9cz6QDHe+H/BoyXJrTIu2rMJO9e87U/L4k8m99u4j4
	wML47dDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orRmR-007K4A-F9; Sat, 05 Nov 2022 22:36:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orRmO-007K2J-6c
	for linux-mediatek@lists.infradead.org; Sat, 05 Nov 2022 22:36:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 9D26ECE0938;
	Sat,  5 Nov 2022 22:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD83DC433C1;
	Sat,  5 Nov 2022 22:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667687799;
	bh=QXo92UodigoaahYMtZ7d8ZkkAXxLuiAV7AtXoqloCAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A7YQ9GBmu4xLBJUf4LdBFzW29epeAm/oOmjyEHLDIbDAAEQwKD8UQjDdh0mkrQVIi
	 v7OU8BjTdOjdHTFL7qiRjvV0QUIRpZYMA/sWLFHY79Bc5YA1rt442WbDqrHhvXXF7G
	 o0DlyWB0ymiaTR1HpZ8c/IakGAa2T2GZzGyYqIx3hdtqOWUCqu+KIHe2KOeUVDgH+/
	 eNjG4U2PqWEOKeccSAImGJ1mPLsKTbjsTYeOCTL9cIwAI8H5wE+4NVB8yo5YQHIWSX
	 IaCeq/Dz1O7GCO39jJ1aJYGgLnb9LFyZjv+Lu+r8HLQYA0xjkBEDwjic5+XrBe/I7t
	 lP6z17iqORUmQ==
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
	robh+dt@kernel.org,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v4 net-next 2/8] dt-bindings: net: mediatek: add WED RX binding for MT7986 eth driver
Date: Sat,  5 Nov 2022 23:36:17 +0100
Message-Id: <2192d3974d30b1d0b8f4277c42cdb02f6feffbb9.1667687249.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1667687249.git.lorenzo@kernel.org>
References: <cover.1667687249.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_153644_612415_70BA5074 
X-CRM114-Status: GOOD (  13.08  )
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

Document the binding for the RX Wireless Ethernet Dispatch core on the
MT7986 ethernet driver used to offload traffic received by WLAN NIC and
forwarded to LAN/WAN one.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../arm/mediatek/mediatek,mt7622-wed.yaml     | 52 +++++++++++++++++++
 .../soc/mediatek/mediatek,mt7986-wo-ccif.yaml | 51 ++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
index 84fb0a146b6e..5c223cb063d4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
@@ -29,6 +29,38 @@ properties:
   interrupts:
     maxItems: 1
 
+  memory-region:
+    items:
+      - description: firmware EMI region
+      - description: firmware ILM region
+      - description: firmware DLM region
+      - description: firmware CPU DATA region
+      - description: firmware BOOT region
+
+  memory-region-names:
+    items:
+      - const: wo-emi
+      - const: wo-ilm
+      - const: wo-dlm
+      - const: wo-data
+      - const: wo-boot
+
+  mediatek,wo-ccif:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: mediatek wed-wo controller interface.
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7622-wed
+    then:
+      properties:
+        memory-region-names: false
+        memory-region: false
+        mediatek,wo-ccif: false
+
 required:
   - compatible
   - reg
@@ -49,3 +81,23 @@ examples:
         interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_LOW>;
       };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      wed@15010000 {
+        compatible = "mediatek,mt7986-wed", "syscon";
+        reg = <0 0x15010000 0 0x1000>;
+        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+
+        memory-region = <&wo_emi>, <&wo_ilm>, <&wo_dlm>,
+                        <&wo_data>, <&wo_boot>;
+        memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
+                              "wo-data", "wo-boot";
+        mediatek,wo-ccif = <&wo_ccif0>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml
new file mode 100644
index 000000000000..8e6ba2ec8a43
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt7986-wo-ccif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Wireless Ethernet Dispatch (WED) WO controller interface for MT7986
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+  - Felix Fietkau <nbd@nbd.name>
+
+description:
+  The MediaTek wo-ccif provides a configuration interface for WED WO
+  controller used to perfrom offload rx packet processing (e.g. 802.11
+  aggregation packet reordering or rx header translation) on MT7986 soc.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt7986-wo-ccif
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      syscon@151a5000 {
+        compatible = "mediatek,mt7986-wo-ccif", "syscon";
+        reg = <0 0x151a5000 0 0x1000>;
+        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+      };
+    };
-- 
2.38.1


