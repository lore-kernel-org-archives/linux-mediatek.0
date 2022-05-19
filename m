Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85565C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O/3oUkmmfMDR5H3MQGajQeyMBS08NsNUcEytG3EqF7o=; b=caYmQpcodr61G+
	aeaicUEDtnhqZqDMvNdTzeTfq3Yd+vFa42f/OID6C9zyx402h70p0fEhHR8f0DHfekxbjDWv90czD
	6YK8RqLjK8B3kbsYQ3qPr0cXYs5fZ07/+fDClLO9oeUx6SbIVMitJCKxChw57aSwJAUlzJVSelYeC
	S2b02/63MysSpqeAUNAi+oK+Q9qPMgkGFY7hNKIWPSdH6ugSYY3MVbLdhdIBEAsR8oYeWsjudNFfy
	VuiJ35n92L04dxGfTFjBkIxElxLiPV6kqBjnhonhDtnBeOsg//SOB7Rl2mLwSkUjiUHZo2b4v7KEs
	CmZY36BlJ5YKBET1S1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrdEk-006FiZ-8w; Thu, 19 May 2022 10:18:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrdEX-006Fex-Ro; Thu, 19 May 2022 10:18:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DF3511F45A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652955492;
 bh=elCw2GMrP8XUYjnKjTriaCAevspHDdoKTgv83FjGUQU=;
 h=From:To:Cc:Subject:Date:From;
 b=nAMtX5wELFg2hOQVO1y45d6Jnkm2Xjzqzw8l7ncUlQmQzG2Z9r4PZE8CyUZJ054Dn
 mKhxljLL5HVBu4OQCCj5dYlsTPL8o6Kxt31hQvZTi5xf5hRutyOSv6X4seoX3kKoMc
 nYa0Gt0zSDykj76rSHcB8QdkIYrGxsjQxE5swhZ0YH9LOuE9GOChIVowhKKiVGvNLC
 njiS7HoQiodiUIlaY2e99UZ5o5gpGrN7IayPYU8ZfnShMHgb5ZO12JPKOC/QC4k+mO
 OS3rz1wd4UfNqcPN9VIRG+R7GxXtz43D5t+SrrkI3CIDroP4r1ag0P4biKVG+/xJDW
 8U6TDDJhKBV/w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: jassisinghbrar@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, houlong.wei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: mailbox: mtk-gce: Convert txt to json-schema
Date: Thu, 19 May 2022 12:18:06 +0200
Message-Id: <20220519101806.18097-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_031818_190978_8AC7555E 
X-CRM114-Status: GOOD (  19.88  )
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

Convert the mtk-gce documentation from freeform text format to a
json-schema.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mailbox/mediatek,gce-mbox.yaml   | 114 ++++++++++++++++++
 .../devicetree/bindings/mailbox/mtk-gce.txt   |  82 -------------
 2 files changed, 114 insertions(+), 82 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml
new file mode 100644
index 000000000000..750391b4038c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,gce-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Global Command Engine (GCE) mailbox
+
+maintainers:
+  - Houlong Wei <houlong.wei@mediatek.com>
+
+description: |
+  The Global Command Engine (GCE) is used to help read/write registers
+  with critical time limitation, such as updating display configuration
+  during the vblank.
+  The GCE can be used to implement the Command Queue (CMDQ) driver.
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
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: gce
+
+  '#mbox-cells':
+    description: |
+      The first cell describes the mailbox channel, which is the GCE Thread ID;
+      The second cell describes the priority of the GCE thread.
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - '#mbox-cells'
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8195-gce
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: gce0
+            - const: gce1
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        gce: mailbox@10212000 {
+            compatible = "mediatek,mt8173-gce";
+            reg = <0 0x10212000 0 0x1000>;
+            interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&infracfg CLK_INFRA_GCE>;
+            clock-names = "gce";
+            #mbox-cells = <2>;
+        };
+
+        /* Client device using a GCE Thread */
+        mmsys: syscon@14000000 {
+            compatible = "mediatek,mt8173-mmsys", "syscon";
+            reg = <0 0x14000000 0 0x1000>;
+            mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
+                     <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        };
+
+        /* Client device listening to specific GCE Events */
+        mutex: mutex@14020000 {
+            compatible = "mediatek,mt8173-disp-mutex";
+            reg = <0 0x14020000 0 0x1000>;
+            interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm 1>;
+            clocks = <&mmsys CLK_MM_MUTEX_32K>;
+            mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
+                                  <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+        };
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
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
