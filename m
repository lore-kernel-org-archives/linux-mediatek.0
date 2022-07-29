Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A92FC19F2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 06:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNHdCOxSm5KxZ6iBZFHJIVkAx/efavDyCm0Y7JZ3mDU=; b=bf6Yb45sa9FGvGj3kVoucbkNVc
	ZT+14iPbpaQ63ULjdHM5ntP6OnGDpEIWipJvNRm99khpkeg5DOPTyK5NjLdgZyfuMmh4O0h3/2ktT
	1xAh5aLwSEGzSOyD+JwpBHJgMrWQK+6PnvPVHqi2Q9hyISXYTR5JGb9VZII7Hqf8KiPmqK/PlWkVz
	SjlY6iMaGkNLdzZuicCjxaDosoZAaiTTaO9K4XgLt2y/VPWNCmsTs5ynqp9XQqAKMrzFnVCHbKpF3
	/60g/zfNyiuhWlPEPZOAMEWFA0vkcNggjuBloeYS4hzSV1mG2dhBvyJkZ4wrtqC3BlFMcMwfF/KFb
	wlrUttaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHJv0-002E5R-9g; Fri, 29 Jul 2022 06:56:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHJth-002DYY-V0; Fri, 29 Jul 2022 06:54:59 +0000
X-UUID: 1afe34a375034bde86321e687ac7f010-20220728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e441b4d0-e65c-461e-8d85-7548a63d778b,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:0f94e32,CLOUDID:efdfaad0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 1afe34a375034bde86321e687ac7f010-20220728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 435246902; Thu, 28 Jul 2022 23:54:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with ShadowRedundancy id 15.2.792.3;
 Fri, 29 Jul 2022 06:52:29 +0000
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 14:32:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Jul 2022 14:32:13 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, MandyJH
 Liu <mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 06/20] dt-bindings: power: mediatek: Add bindings for MediaTek SCPSYS
Date: Fri, 29 Jul 2022 14:31:54 +0800
Message-ID: <20220729063208.16799-7-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220729063208.16799-1-tinghan.shen@mediatek.com>
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_235458_017419_D2C49617 
X-CRM114-Status: GOOD (  15.55  )
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

The System Control Processor System (SCPSYS) has several power
management related tasks in the system. Add the bindings for it.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../bindings/mfd/mediatek,mt8195-scpsys.yaml  | 67 +++++++++++++++++++
 .../power/mediatek,power-controller.yaml      |  2 +-
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
new file mode 100644
index 0000000000000..600caeb99e020
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek System Control Processor System
+
+maintainers:
+  - MandyJH Liu <mandyjh.liu@mediatek.com>
+
+description:
+  MediaTek System Control Processor System (SCPSYS) has several
+  power management tasks. The tasks include MTCMOS power
+  domain control, thermal measurement, DVFS, etc.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8167-scpsys
+          - mediatek,mt8173-scpsys
+          - mediatek,mt8183-scpsys
+          - mediatek,mt8192-scpsys
+          - mediatek,mt8195-scpsys
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  power-controller:
+    $ref: /schemas/power/mediatek,power-controller.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/power/mt8195-power.h>
+
+    syscon@10006000 {
+      compatible = "mediatek,mt8195-scpsys", "syscon", "simple-mfd";
+      reg = <0x10006000 0x100>;
+
+      spm: power-controller {
+        compatible = "mediatek,mt8195-power-controller";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #power-domain-cells = <1>;
+
+        /* sample of power domain nodes */
+        power-domain@MT8195_POWER_DOMAIN_PCIE_PHY {
+                reg = <MT8195_POWER_DOMAIN_PCIE_PHY>;
+                #power-domain-cells = <0>;
+        };
+
+        power-domain@MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY {
+                reg = <MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
+                #power-domain-cells = <0>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 03b7f6aa591d4..605ec7ab5f633 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -135,7 +135,7 @@ examples:
         #size-cells = <2>;
 
         scpsys: syscon@10006000 {
-            compatible = "syscon", "simple-mfd";
+            compatible = "mediatek,mt8173-scpsys", "syscon", "simple-mfd";
             reg = <0 0x10006000 0 0x1000>;
 
             spm: power-controller {
-- 
2.18.0


