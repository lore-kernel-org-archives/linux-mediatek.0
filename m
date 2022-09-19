Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D945C6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NPUxU08XbWMn6vRPeOfejtrutRYvUjqorYXwFTI7384=; b=g4xQn2k8eA6RjLYfLZLw2AbasX
	/bTldPTVvQ4S8a9jfgMivlAWRPQzjaiV9kNMWy3YER5+mwhSrlFzNyQsWG75bsywNesjx9IW7FRGO
	RFH/04G046PnTyLBWXzGXxMTfffbq5vm8fyrnKAR5uoElR8d2kxV0FMAcKo99C0GWx5MK169dQmht
	aRNc+p9O3sDZFgnl4vmBv/OB2b2lM50rH65A/g2WOKIVJiEJfTOAgWsQ5a6YAmlGFJt/TKIw01lvX
	jatwA0cmBba3aUQXHDDh6GtqB44CSziYCbiER92WPsguFzlJ454JssrPRtLtgRKfbO0YBMDF+pghG
	g3ub8ynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaBv3-009rtR-Uv; Mon, 19 Sep 2022 08:14:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaBup-009rfi-28; Mon, 19 Sep 2022 08:14:09 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 014D26601AAA;
	Mon, 19 Sep 2022 09:14:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663575245;
	bh=FlE2q42xksiG1lAKxhBiXSO5wbdVHlDFDRFE/WJ7fW8=;
	h=From:To:Cc:Subject:Date:From;
	b=OTdTNd8zholm61yWT9HJMFa2xDGOUXxVua2OR72+fMFiSKMlNyT8yoClIMHAt/+7x
	 iT0xl8119/lVDy2HCiAGqNsjA6gd9GMvDU6Trya1EYVCW8WYDM/HwKTO/4JVCFgyGZ
	 IPi8/dXH3qgTMn14qYfZadJrqnshnF8Xf1J874d51LjudVvcrn7qLtDKeSFl1gVZ7G
	 s5+1saexqLJmeUEBjvmAn7WWsh6rrdRyCESsQH8sYo1qedq4u/1uC3CnMFPsSImpp/
	 4uEOP6DGBDB2NHl24h0ZN9Twi+/HRrvUc0UmqeAp/4X3gLGJH6/9OrR/qx/xcO5UgT
	 lqFKVluKkiBAg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: jassisinghbrar@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	houlong.wei@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3] dt-bindings: mailbox: Convert mtk-gce to DT schema
Date: Mon, 19 Sep 2022 10:13:33 +0200
Message-Id: <20220919081333.15678-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_011407_408801_17E22E97 
X-CRM114-Status: GOOD (  24.72  )
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

Convert the mtk-gce mailbox binding to DT schema format.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Changes in v3:
 - Removed '|' from description
 - Removed mbox client examples
 - Squashed patch dt-bindings: arm: mediatek:
   mmsys: Reference to mediatek,gce-mailbox.yaml

Changes in v2:
 - Changed mtk-gce.txt references to new yaml file


A previous attempt for this was made at [1], but it was changing
the way of getting clocks (by name for all).
Keeping clock-names not required for the multi-gce case makes this
binding simpler, hence I chose to abandon the change at [1] and go
for this one instead.

Any Reviewed-by or Acked-by tag was dropped, as this conversion was
completely redone from scratch and differs from [1] for the
aforementioned reasons.

[1]: https://lore.kernel.org/all/20220524151512.247435-1-angelogioacchino.delregno@collabora.com/

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  3 +-
 .../mailbox/mediatek,gce-mailbox.yaml         | 80 ++++++++++++++++++
 .../devicetree/bindings/mailbox/mtk-gce.txt   | 82 -------------------
 3 files changed, 82 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 6ad023eec193..85e6f4f621fc 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -52,7 +52,8 @@ properties:
     description:
       Using mailbox to communicate with GCE, it should have this
       property and list of phandle, mailbox specifiers. See
-      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
+      Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+      for details.
     $ref: /schemas/types.yaml#/definitions/phandle-array
 
   mediatek,gce-client-reg:
diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
new file mode 100644
index 000000000000..fff8fd2e984a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Global Command Engine Mailbox
+
+maintainers:
+  - Houlong Wei <houlong.wei@mediatek.com>
+
+description:
+  The Global Command Engine (GCE) is used to help read/write registers with
+  critical time limitation, such as updating display configuration during the
+  vblank. The GCE can be used to implement the Command Queue (CMDQ) driver.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6779-gce
+      - mediatek,mt8173-gce
+      - mediatek,mt8183-gce
+      - mediatek,mt8186-gce
+      - mediatek,mt8192-gce
+      - mediatek,mt8195-gce
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell describes the Thread ID of the GCE,
+      the second cell describes the priority of the GCE thread
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Global Command Engine clock
+
+  clock-names:
+    items:
+      - const: gce
+
+required:
+  - compatible
+  - "#mbox-cells"
+  - reg
+  - interrupts
+  - clocks
+
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          const: mediatek,mt8195-gce
+then:
+  required:
+    - clock-names
+
+additionalProperties: false
+
+examples:
+  # Example for a device client and for a MediaTek mutex client
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gce: mailbox@12120000 {
+        compatible = "mediatek,mt8173-gce";
+        reg = <0x10816000 0x1000>;
+        interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
+        #mbox-cells = <2>;
+        clocks = <&infracfg CLK_INFRA_GCE>;
+        clock-names = "gce";
+    };
diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
deleted file mode 100644
index c2aeba63bd47..000000000000
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ /dev/null
@@ -1,82 +0,0 @@
-MediaTek GCE
-===============
-
-The Global Command Engine (GCE) is used to help read/write registers with
-critical time limitation, such as updating display configuration during the
-vblank. The GCE can be used to implement the Command Queue (CMDQ) driver.
-
-CMDQ driver uses mailbox framework for communication. Please refer to
-mailbox.txt for generic information about mailbox device-tree bindings.
-
-Required properties:
-- compatible: can be "mediatek,mt8173-gce", "mediatek,mt8183-gce",
-  "mediatek,mt8186-gce", "mediatek,mt8192-gce", "mediatek,mt8195-gce" or
-  "mediatek,mt6779-gce".
-- reg: Address range of the GCE unit
-- interrupts: The interrupt signal from the GCE block
-- clock: Clocks according to the common clock binding
-- clock-names: Must be "gce" to stand for GCE clock
-- #mbox-cells: Should be 2.
-	<&phandle channel priority>
-	phandle: Label name of a gce node.
-	channel: Channel of mailbox. Be equal to the thread id of GCE.
-	priority: Priority of GCE thread.
-
-Required properties for a client device:
-- mboxes: Client use mailbox to communicate with GCE, it should have this
-  property and list of phandle, mailbox specifiers.
-Optional properties for a client device:
-- mediatek,gce-client-reg: Specify the sub-system id which is corresponding
-  to the register address, it should have this property and list of phandle,
-  sub-system specifiers.
-  <&phandle subsys_number start_offset size>
-  phandle: Label name of a gce node.
-  subsys_number: specify the sub-system id which is corresponding
-                 to the register address.
-  start_offset: the start offset of register address that GCE can access.
-  size: the total size of register address that GCE can access.
-
-Optional properties for a client mutex node:
-- mediatek,gce-events: GCE events used by clients. The event numbers are
-  defined in 'dt-bindings/gce/<chip>-gce.h'.
-
-Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h',
-'dt-bindings/gce/mt8183-gce.h', 'dt-bindings/gce/mt8186-gce.h'
-'dt-bindings/gce/mt8192-gce.h', 'dt-bindings/gce/mt8195-gce.h' or
-'dt-bindings/gce/mt6779-gce.h'.
-Such as sub-system ids, thread priority, event ids.
-
-Example:
-
-	gce: gce@10212000 {
-		compatible = "mediatek,mt8173-gce";
-		reg = <0 0x10212000 0 0x1000>;
-		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&infracfg CLK_INFRA_GCE>;
-		clock-names = "gce";
-		#mbox-cells = <2>;
-	};
-
-Example for a client device:
-
-	mmsys: clock-controller@14000000 {
-		compatible = "mediatek,mt8173-mmsys";
-		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST>,
-			 <&gce 1 CMDQ_THR_PRIO_LOWEST>;
-		mutex-event-eof = <CMDQ_EVENT_MUTEX0_STREAM_EOF
-				CMDQ_EVENT_MUTEX1_STREAM_EOF>;
-		mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>,
-					  <&gce SUBSYS_1401XXXX 0x2000 0x100>;
-		...
-	};
-
-Example for a client mutex node:
-	mutex: mutex@14020000 {
-		compatible = "mediatek,mt8173-disp-mutex";
-		reg = <0 0x14020000 0 0x1000>;
-		interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		clocks = <&mmsys CLK_MM_MUTEX_32K>;
-		mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
-				      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
-	};
-- 
2.37.2


