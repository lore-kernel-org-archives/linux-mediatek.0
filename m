Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CAFCAC587
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wttN825obVRDY+218WZP0Gddgh8r79xjMuher+/aCXo=; b=eFaBDd0dOWA74d+81lYoLcBdc1
	2yOGx6nerM/qA6NqYpdW2kJkpggEPo4Ac1vMIpnATx3B1vJZpevJrO2HQiQz1KDdl6YeSyzRo7uQV
	UfLhcZ6HkRYrYGhqveY4x5HeiaveR2daeo+LPJEbuf6ad1h7tqxwKEWKo4v3bm9rxPgA+dixVYRoE
	Fnv6sH654o8Ck1fX3XJyF5M/5ubnkn1lIDR15qELj8TWmHIFaD8dk8aoR5Xh6uWbhsiPMvLw1+zRD
	6Jv5gj9bo2zLxbvUzl98czhsV4TehhW/HULtT8T7ZyMa1rzCO7u9c0b6LVyKz3qYT6LzAU1M5AJcq
	SPFArf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwizG-00000003nQp-06rF;
	Thu, 11 Sep 2025 15:13:26 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwizE-00000003nPc-0jPB;
	Thu, 11 Sep 2025 15:13:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757603562; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Sk8xiL21oMFfmPf8BFpYOcwdsmVz43m+6vORj5aRkJ/5w/3kNpY2g97ZOaA8A4xhr+fx28boLz378h6EXrmqnYeydEwVUpMtmqSiVlb9nr9ziUU16u4APQnpM/JsBevvyRb6+NgSX6hmWAzHFb2gy65/okhj/05r5ISeMB28WyI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603562; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wttN825obVRDY+218WZP0Gddgh8r79xjMuher+/aCXo=; 
	b=QrtsjRvu+E91QxAhifEmz7VjYzPO3OgslSBOgfhMOFbglbDp1iYSQfeEpFfciftQjkgiqak3XuqAxAVh3W/U9aQ9u1GCXIZys5AInrvQL4FAwDor6VKdSm0ttavjmbtmq+PGAQTRWKUAOmLUCpRwUI96USDGldQZuCEYBq4FaCk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603562;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wttN825obVRDY+218WZP0Gddgh8r79xjMuher+/aCXo=;
	b=bzw7cccg9BscPjDXn0C3Q11CjLDHw1a3dxoJx4+dvaKyco0kbRgws6Lzf/iOjBiL
	BBc2H9w1qyEDm++UA5SlR/3TQyPNwgLtcoV3QpuUFykRWJW/ZYsdP77gnrD8PYecg/p
	fsNnn9tXa7l5mDtYiIatOnd6u5B5qFxogWIjneq8=
Received: by mx.zohomail.com with SMTPS id 1757603561608572.0058830992018;
	Thu, 11 Sep 2025 08:12:41 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	heiko@sntech.de,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	marcel@holtmann.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 02/12] dt-bindings: media: Convert MediaTek mt8173-vpu bindings to DT schema
Date: Thu, 11 Sep 2025 12:09:51 -0300
Message-ID: <20250911151001.108744-3-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_081324_262401_23D38F9A 
X-CRM114-Status: GOOD (  14.33  )
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

Convert the existing text-based DT bindings for Mediatek MT8173 Video
Processor Unit to a DT schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/media/mediatek,mt8173-vpu.yaml   | 74 +++++++++++++++++++
 .../bindings/media/mediatek-vpu.txt           | 31 --------
 2 files changed, 74 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
new file mode 100644
index 0000000000000..8a47761f1e6b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8173-vpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8173 Video Processor Unit
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+description:
+  Video Processor Unit is a HW video controller. It controls HW Codec including
+  H.264/VP8/VP9 Decode, H.264/VP8 Encode and Image Processor (scale/rotate/color
+  convert).
+
+properties:
+  compatible:
+    const: mediatek,mt8173-vpu
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: tcm
+      - const: cfg_reg
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: main
+
+  memory-region:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        vpu: vpu@10020000 {
+            compatible = "mediatek,mt8173-vpu";
+            reg = <0 0x10020000 0 0x30000>,
+                  <0 0x10050000 0 0x100>;
+            reg-names = "tcm", "cfg_reg";
+            interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&topckgen CLK_TOP_SCP_SEL>;
+            clock-names = "main";
+            memory-region = <&vpu_dma_reserved>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/mediatek-vpu.txt b/Documentation/devicetree/bindings/media/mediatek-vpu.txt
deleted file mode 100644
index 2a5bac37f9a22..0000000000000
--- a/Documentation/devicetree/bindings/media/mediatek-vpu.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-* Mediatek Video Processor Unit
-
-Video Processor Unit is a HW video controller. It controls HW Codec including
-H.264/VP8/VP9 Decode, H.264/VP8 Encode and Image Processor (scale/rotate/color convert).
-
-Required properties:
-  - compatible: "mediatek,mt8173-vpu"
-  - reg: Must contain an entry for each entry in reg-names.
-  - reg-names: Must include the following entries:
-    "tcm": tcm base
-    "cfg_reg": Main configuration registers base
-  - interrupts: interrupt number to the cpu.
-  - clocks : clock name from clock manager
-  - clock-names: must be main. It is the main clock of VPU
-
-Optional properties:
-  - memory-region: phandle to a node describing memory (see
-    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
-    to be used for VPU extended memory; if not present, VPU may be located
-    anywhere in the memory
-
-Example:
-	vpu: vpu@10020000 {
-		compatible = "mediatek,mt8173-vpu";
-		reg = <0 0x10020000 0 0x30000>,
-		      <0 0x10050000 0 0x100>;
-		reg-names = "tcm", "cfg_reg";
-		interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&topckgen TOP_SCP_SEL>;
-		clock-names = "main";
-	};
-- 
2.50.1


