Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DC9C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 09:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTfybJEMslKoi7seQWjW6t18PTQ1cJVcbsA0TFCgfr8=; b=uIrk8kQV2xqpM1i6Bp4WErp79n
	cX8xuhn6LHXSgDMMkf7EywMGTfNvOq4J4EiX5Ka51S2PiyQewarAAmAelm8S2Mwk9J1lWK4lswEpq
	FgyN2ZnHVTil0idPxyxggrlbz9a8xWRZeWStrUyWzygELx2v6GKcZPSRLUnnoH9F/ZX6kDyLSiGKv
	wvPKoVJCrpz5DpLDILg2mY1ThKENK7WFQiUXvmLd7ffWf6JH0UfFyaZngqfTQFbN5oYlUBXQ5VlGx
	w07JeOMp8sD7D5Tgdyp96dsMB49vWXRGu72Zs1ELTfxiBTV4V2p5LmexsMOeK9hPIug+AbSWUhisg
	NqdCc+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWZF-00Gwea-2L; Thu, 03 Nov 2022 09:31:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWWm-00Gve2-9O
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 09:28:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 719B361DDB;
	Thu,  3 Nov 2022 09:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522ADC433D6;
	Thu,  3 Nov 2022 09:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667467726;
	bh=YX7U3anovdIFjTZlE83co/YJA3BUSpixBizJml4wk/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=efUrnmL6qEU0ko1OiftWOQbE73jR5FFJraYYyIT3eIZd5zD4WM/h4/mD2capY+mDr
	 WiYS3jn5sjRHayQh2gTZZZIjsHBTkSpczRtr+PevlFkpBw1f7Id10NwHrdBs7xTR8F
	 vek7Y4q1zZHQNdQVPnqbbeiIXRn6QxRRO9cYfyN0VcxF2MGEiSCpeif3+DTEsnbsOQ
	 Rj9eTOwtdQQNsYJD1IpNmcMMlmVdSudQVZjQIqaCzCs2OUcfMdph6U5f0tNawelxLV
	 TfY1KPkBgvu999qemGcAre5FP8YP/OkgGxkD8OphB3MDJZjekmKGuCxvlmAIlmvaQn
	 KLW4wxCf8I40g==
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
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 net-next 2/8] dt-bindings: net: mediatek: add WED RX binding for MT7986 eth driver
Date: Thu,  3 Nov 2022 10:28:01 +0100
Message-Id: <2d92c3e282c6a788e54370604f966fc7a5b479bf.1667466887.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1667466887.git.lorenzo@kernel.org>
References: <cover.1667466887.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_022848_439021_9D441F4D 
X-CRM114-Status: GOOD (  16.44  )
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
 .../arm/mediatek/mediatek,mt7622-wed.yaml     | 62 ++++++++++++++++++-
 .../arm/mediatek/mediatek,mt7986-wo-boot.yaml | 47 ++++++++++++++
 .../arm/mediatek/mediatek,mt7986-wo-ccif.yaml | 50 +++++++++++++++
 .../arm/mediatek/mediatek,mt7986-wo-dlm.yaml  | 50 +++++++++++++++
 4 files changed, 206 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
index 84fb0a146b6e..9e34c5d15cec 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek Wireless Ethernet Dispatch Controller for MT7622
 
@@ -29,6 +29,50 @@ properties:
   interrupts:
     maxItems: 1
 
+  memory-region:
+    items:
+      - description:
+          Phandle for the node used to run firmware EMI region
+      - description:
+          Phandle for the node used to run firmware ILM region
+      - description:
+          Phandle for the node used to run firmware CPU DATA region
+
+  memory-region-names:
+    items:
+      - const: wo-emi
+      - const: wo-ilm
+      - const: wo-data
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
+            const: mediatek,mt7622-wed
+    then:
+      properties:
+        memory-region-names: false
+        memory-region: false
+        mediatek,wo-boot: false
+        mediatek,wo-ccif: false
+        mediatek,wo-dlm: false
+
 required:
   - compatible
   - reg
@@ -44,8 +88,20 @@ examples:
       #address-cells = <2>;
       #size-cells = <2>;
       wed0: wed@1020a000 {
-        compatible = "mediatek,mt7622-wed","syscon";
+        compatible = "mediatek,mt7622-wed", "syscon";
         reg = <0 0x1020a000 0 0x1000>;
         interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_LOW>;
       };
+
+      wed1: wed@15010000 {
+        compatible = "mediatek,mt7986-wed", "syscon";
+        reg = <0 0x15010000 0 0x1000>;
+        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+
+        memory-region = <&wo_emi>, <&wo_data>, <&wo_ilm>;
+        memory-region-names = "wo-emi", "wo-ilm", "wo-data";
+        mediatek,wo-ccif = <&wo_ccif0>;
+        mediatek,wo-boot = <&wo_boot>;
+        mediatek,wo-dlm = <&wo_dlm0>;
+      };
     };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
new file mode 100644
index 000000000000..6c3c514c48ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-boot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
+
+      wo_boot: syscon@15194000 {
+        compatible = "mediatek,mt7986-wo-boot", "syscon";
+        reg = <0 0x15194000 0 0x1000>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
new file mode 100644
index 000000000000..6357a206587a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-ccif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Wireless Ethernet Dispatch WO controller interface for MT7986
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
+
+      wo_ccif0: syscon@151a5000 {
+        compatible = "mediatek,mt7986-wo-ccif", "syscon";
+        reg = <0 0x151a5000 0 0x1000>;
+        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
new file mode 100644
index 000000000000..a499956d9e07
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-dlm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
2.38.1


