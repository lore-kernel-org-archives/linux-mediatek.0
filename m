Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3687FC3A59D
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 18:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bTt7hizJyfvWGQJP/P7+mRnGHo6VOZ6Frg2xyehIcU=; b=gaNWGe9/B0kWw9JuFnopbFr1Dm
	BIjlqdS50iMinJOAn0TwLqtWSMunTLjzlvi+cyx0+8kZNRqCMX8fmuOzj4ahu0l943ljFAzuEVZ5A
	gmLTZAlfbPkiz0EqBQlco8JVGZyNBbD4xRpeql/TBkax0mNyGHdYq+SbH9M+w3SPMZgu+WgkcYbW+
	vNy94In8vbE/vFklq1BAxDmuBlgEcqG6vRSiR/ZHr567Ggk8zMttKnG42x/H+av4J4tcfoaCPUmPy
	n4P1wtvK4xOVGKf6BEKaifv191oCIipmkH7/Sp/8BYGQt/mzSGhdm/lu9cocB5BZxT5BO09x6gyx4
	0dhVBF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omfi7-00FxHz-21; Sun, 23 Oct 2022 18:28:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omfi3-00FxFK-3e
	for linux-mediatek@lists.infradead.org; Sun, 23 Oct 2022 18:28:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC8A560F3C;
	Sun, 23 Oct 2022 18:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC012C433D6;
	Sun, 23 Oct 2022 18:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666549710;
	bh=Q4D3w9hEgRnJRRAMW3VIsJXptlZu77eBg5sq/w6iMvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B7ukeoSlmsOF7zWWKcoPv73eSN33J0OpaizytgTVlrOHJC5Pa3DnZVYh/ITvuVOqX
	 HjrddJkaVg38g/g0eareZYyBsGd4NY1SmIYUjshL2K7hsdFxjgPH0tfGYYQy75Fng1
	 WApBwzK5O5qdgc7u5HoPjZbcus9MzpYdqHSujr9zX9XM6ZiN5z8BreRiwBaiEv4KJ/
	 ABZ1riQbOpBnS91W8k2559rKlW8pnwZGcOV5RnzW9ShMMJnCO/vA5byufLFTRG6hXP
	 Fl2rn3o1ZN8kFo66sNjslgL5UCEldrLV/ZKAscc0eFWAFBAfrZbAk4jA2gDPWxghPg
	 FpYnkIWOkUduQ==
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
Subject: [PATCH v2 net-next 2/6] dt-bindings: net: mediatek: add WED RX binding for MT7986 eth driver
Date: Sun, 23 Oct 2022 20:28:06 +0200
Message-Id: <337ef332ca50e6a40f3fdceeb7262d91165c6323.1666549145.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1666549145.git.lorenzo@kernel.org>
References: <cover.1666549145.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_112831_272066_5BCFA9D9 
X-CRM114-Status: GOOD (  15.32  )
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
 .../arm/mediatek/mediatek,mt7622-wed.yaml     | 91 +++++++++++++++++++
 .../arm/mediatek/mediatek,mt7986-wo-boot.yaml | 46 ++++++++++
 .../arm/mediatek/mediatek,mt7986-wo-ccif.yaml | 49 ++++++++++
 .../arm/mediatek/mediatek,mt7986-wo-dlm.yaml  | 50 ++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
index 84fb0a146b6e..8e2905004790 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
@@ -29,6 +29,41 @@ properties:
   interrupts:
     maxItems: 1
 
+  memory-region:
+    minItems: 3
+    maxItems: 3
+    description:
+      phandles to nodes describing reserved memory used by mt7986-wed firmware
+      (see bindings/reserved-memory/reserved-memory.txt)
+
+  mediatek,wo-ccif:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the mediatek wed-wo controller.
+
+  mediatek,wo-boot:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the mediatek wed-wo boot interface.
+
+  mediatek,wo-dlm:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the mediatek wed-wo rx hw ring.
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7986-wed
+    then:
+      properties:
+        mediatek,wo-boot: true
+        mediatek,wo-ccif: true
+        mediatek,wo-dlm: true
+        memory-region: true
+
 required:
   - compatible
   - reg
@@ -49,3 +84,59 @@ examples:
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
+      reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        wo_emi: wo-emi@4fd00000 {
+          reg = <0 0x4fd00000 0 0x40000>;
+          no-map;
+        };
+
+        wo_data: wo-data@4fd80000 {
+          reg = <0 0x4fd80000 0 0x240000>;
+          no-map;
+        };
+
+        wo_ilm: wo-ilm@151e0000 {
+          reg = <0 0x151e0000 0 0x8000>;
+          no-map;
+        };
+      };
+
+      wo_boot: wo-boot@15194000 {
+        compatible = "mediatek,mt7986-wo-boot","syscon";
+        reg = <0 0x15194000 0 0x1000>;
+      };
+
+      wo_ccif0: wo-ccif@151a5000 {
+        compatible = "mediatek,mt7986-wo-ccif","syscon";
+        reg = <0 0x151a5000 0 0x1000>;
+        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
+      };
+
+      wo_dlm0: wo-dlm@151e8000 {
+        compatible = "mediatek,mt7986-wo-dlm";
+        reg = <0 0x151e8000 0 0x2000>;
+        resets = <&ethsysrst 0>;
+        reset-names = "wocpu_rst";
+      };
+
+      wed1: wed@1020a000 {
+        compatible = "mediatek,mt7986-wed","syscon";
+        reg = <0 0x15010000 0 0x1000>;
+        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+
+        memory-region = <&wo_emi>, <&wo_data>, <&wo_ilm>;
+        mediatek,wo-ccif = <&wo_ccif0>;
+        mediatek,wo-boot = <&wo_boot>;
+        mediatek,wo-dlm = <&wo_dlm0>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
new file mode 100644
index 000000000000..ce9c971e6604
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-boot.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title:
+  MediaTek Wireless Ethernet Dispatch WO boot controller interface for MT7986
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+  - Felix Fietkau <nbd@nbd.name>
+
+description:
+  The mediatek wo-boot provides a configuration interface for WED WO
+  boot controller on MT7986 soc.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt7986-wo-boot
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
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      wo_boot: wo-boot@15194000 {
+        compatible = "mediatek,mt7986-wo-boot","syscon";
+        reg = <0 0x15194000 0 0x1000>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
new file mode 100644
index 000000000000..48cb27bcc4cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-ccif.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Wireless Ethernet Dispatch WO Controller for MT7986
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+  - Felix Fietkau <nbd@nbd.name>
+
+description:
+  The mediatek wo-ccif provides a configuration interface for WED WO
+  controller on MT7986 soc.
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
+      wo_ccif0: wo-ccif@151a5000 {
+        compatible = "mediatek,mt7986-wo-ccif","syscon";
+        reg = <0 0x151a5000 0 0x1000>;
+        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
new file mode 100644
index 000000000000..db9252598a42
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-dlm.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Wireless Ethernet Dispatch WO hw rx ring interface for MT7986
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+  - Felix Fietkau <nbd@nbd.name>
+
+description:
+  The mediatek wo-dlm provides a configuration interface for WED WO
+  rx ring on MT7986 soc.
+
+properties:
+  compatible:
+    const: mediatek,mt7986-wo-dlm
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      wo_dlm0: wo-dlm@151e8000 {
+        compatible = "mediatek,mt7986-wo-dlm";
+        reg = <0 0x151e8000 0 0x2000>;
+        resets = <&ethsysrst 0>;
+        reset-names = "wocpu_rst";
+      };
+    };
-- 
2.37.3


