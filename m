Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B0DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 02:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pLr5O0k8sQiscDjQmEcUPop0Fo3ciRL1m2NxOHR1qNg=; b=4rwRM3yN5GksT8
	5VJRn4+Y4owBJIMFnohXpFTeB2lybr00CMOygT6My+k6IjxXUMQjOMnjdiKYmdqKlKdHDuy3bbGG2
	G27XltZZP3FyozjFlPnuz2RWCPqSqpAlXASOLC2U2eJpmko7VRvI5IQrHwFt+hdsfGi5b8HtwBLOf
	+T0G013Oey2yf02DvShW7UsD5bZcn2uUc/t2VjbAhTzpno/hNZBbWg778CmijGX68Ybx5dPEF2QRX
	A5ZfuXrWkmNcDg81d4uUKBMK0wv3YTuLaKREbmb4HzTKqQg68KrSPzn19PpjRtuLXsxnnOXY7EMA6
	sg36sSTUhEXe78UkYPgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nepbc-003XCJ-3t; Thu, 14 Apr 2022 02:53:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nepbY-003XBD-IK; Thu, 14 Apr 2022 02:53:10 +0000
X-UUID: 34aa4b4ba56b4004aae26dd2bbc7f469-20220413
X-UUID: 34aa4b4ba56b4004aae26dd2bbc7f469-20220413
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1357665825; Wed, 13 Apr 2022 19:53:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 19:53:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Apr 2022 10:53:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Apr 2022 10:53:00 +0800
From: Nick Fan <Nick.Fan@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
Date: Thu, 14 Apr 2022 10:50:22 +0800
Message-ID: <20220414025023.11516-1-Nick.Fan@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_195308_664457_2BF844FA 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 Daniel Vetter <daniel@ffwll.ch>, wenst@chromium.org,
 Nick Fan <Nick.Fan@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add devicetree schema for Arm Mali Valhall GPU

Define a compatible string for the Mali Valhall GPU
for MediaTek's SoC platform.

Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
---
 .../bindings/gpu/arm,mali-valhall.yaml        | 201 ++++++++++++++++++
 1 file changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
new file mode 100644
index 000000000000..526384d1e3ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
@@ -0,0 +1,201 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/arm,mali-valhall.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali Valhall GPU
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  $nodename:
+    pattern: '^gpu@[a-f0-9]+$'
+
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-mali
+      - const: arm,mali-valhall
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Job interrupt
+      - description: MMU interrupt
+      - description: GPU interrupt
+
+  interrupt-names:
+    items:
+      - const: job
+      - const: mmu
+      - const: gpu
+
+  clocks:
+    minItems: 1
+
+  power-domains:
+    minItems: 1
+    maxItems: 5
+
+  mali-supply: true
+  sram-supply: true
+
+  operating-points-v2: true
+  opp-table: true
+
+  "#cooling-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8192-mali
+    then:
+      properties:
+        power-domains:
+          minItems: 5
+          maxItems: 5
+
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+            - const: core3
+            - const: core4
+
+      required:
+        - sram-supply
+        - power-domains
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@13000000 {
+        compatible = "mediatek,mt8192-mali", "arm,mali-valhall";
+        reg = <0x13000000 0x4000>;
+        interrupts =
+            <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
+            <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
+            <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>;
+        interrupt-names =
+            "gpu",
+            "mmu",
+            "job";
+
+        clocks = <&mfgcfg 0>;
+
+        power-domains =
+            <&spm 4>,
+            <&spm 5>,
+            <&spm 6>,
+            <&spm 7>,
+            <&spm 8>;
+
+        operating-points-v2 = <&gpu_opp_table>;
+        mali-supply = <&mt6315_7_vbuck1>;
+        sram-supply = <&mt6359_vsram_others_ldo_reg>;
+        gpu_opp_table: opp_table {
+            compatible = "operating-points-v2";
+            opp-shared;
+
+            opp-358000000 {
+                opp-hz = /bits/ 64 <358000000>;
+                opp-microvolt = <606250>, <750000>;
+            };
+
+            opp-399000000 {
+                opp-hz = /bits/ 64 <399000000>;
+                opp-microvolt = <618750>, <750000>;
+            };
+
+            opp-440000000 {
+                opp-hz = /bits/ 64 <440000000>;
+                opp-microvolt = <631250>, <750000>;
+            };
+
+            opp-482000000 {
+                opp-hz = /bits/ 64 <482000000>;
+                opp-microvolt = <643750>, <750000>;
+            };
+
+            opp-523000000 {
+                opp-hz = /bits/ 64 <523000000>;
+                opp-microvolt = <656250>, <750000>;
+            };
+
+            opp-564000000 {
+                opp-hz = /bits/ 64 <564000000>;
+                opp-microvolt = <668750>, <750000>;
+            };
+
+            opp-605000000 {
+                opp-hz = /bits/ 64 <605000000>;
+                opp-microvolt = <681250>, <750000>;
+            };
+
+            opp-647000000 {
+                opp-hz = /bits/ 64 <647000000>;
+                opp-microvolt = <693750>, <750000>;
+            };
+
+            opp-688000000 {
+                opp-hz = /bits/ 64 <688000000>;
+                opp-microvolt = <706250>, <750000>;
+            };
+
+            opp-724000000 {
+                opp-hz = /bits/ 64 <724000000>;
+                opp-microvolt = <725000>, <750000>;
+            };
+
+            opp-748000000 {
+                opp-hz = /bits/ 64 <748000000>;
+                opp-microvolt = <737500>, <750000>;
+            };
+
+            opp-772000000 {
+                opp-hz = /bits/ 64 <772000000>;
+                opp-microvolt = <750000>, <750000>;
+            };
+
+            opp-795000000 {
+                opp-hz = /bits/ 64 <795000000>;
+                opp-microvolt = <762500>, <762500>;
+            };
+
+            opp-819000000 {
+                opp-hz = /bits/ 64 <819000000>;
+                opp-microvolt = <775000>, <775000>;
+            };
+
+            opp-843000000 {
+                opp-hz = /bits/ 64 <843000000>;
+                opp-microvolt = <787500>, <787500>;
+            };
+
+            opp-866000000 {
+                opp-hz = /bits/ 64 <866000000>;
+                opp-microvolt = <800000>, <800000>;
+            };
+        };
+    };
+...
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
