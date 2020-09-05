Return-Path: <SRS0=aCep=CO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859B2C43461
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 08:22:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1338E2074D
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 08:22:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lnfAt8kp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Xlc0k3O+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1338E2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fl2a2MopYrYFZ+uL+xTPwbAuO7AVXg53RGKRkKGzZ9A=; b=lnfAt8kph4MMZwtGgHxk4drNt
	IbJfVGuc7GbZw5FfdJ40C9T+g5Snbf5ftcpT4joF1AiOo8dmE+H/EU+3HUpdjNSOEPBkCRKaf3/Iy
	TKB1XwJVNj0z5M74dfhV9B3+rlx7RhCasG/5Nsd0sGTk7qK6rcV9zA1jDm8uP0ZcY7FXV5Zl3ilTL
	06Y9YnY4WDjUJSYaz9bBXLnljrDaCgASqSh829qnHMge5i9oFbrKQ/HhFYoN+GHcLeS7JJfN/acDl
	hGaXf6kZ/yW4apcOlzk7x+xM7S8n36jaoJ5VbH/OX2DqkyjVPFYgYaPei9gayZVZ6/Y2VtZYCsL+y
	gD+CS/6Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kETSg-0001wW-JX; Sat, 05 Sep 2020 08:22:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kETSP-0001pI-VT; Sat, 05 Sep 2020 08:21:59 +0000
X-UUID: 92a6ffc67dee415b96fc129de464f7ae-20200905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YgbhxdRSKSgUmadwuBOtslkD8OH4/8zNd1m9CMScLVc=; 
 b=Xlc0k3O+8GT6yfNy9V99A9YAVLRWC3xK3Zvp+2An7rfVG25VsNZ80dANAHfeiCcbRUFQFLxOFc3GDA75SNMypyvnMhvVeSMvwXfcCJEy5/vfbGcNsw7eW323J9NVQyYKIIkBItoh4RudMmcL6h7D0yLi9iAaMj5oRet+A4B5IdI=;
X-UUID: 92a6ffc67dee415b96fc129de464f7ae-20200905
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1664799763; Sat, 05 Sep 2020 00:21:52 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Sep 2020 01:12:03 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Sep 2020 16:11:47 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 5 Sep 2020 16:11:41 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 02/23] dt-bindings: memory: mediatek: Convert SMI to DT
 schema
Date: Sat, 5 Sep 2020 16:08:59 +0800
Message-ID: <20200905080920.13396-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200905080920.13396-1-yong.wu@mediatek.com>
References: <20200905080920.13396-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_042158_259316_828B1437 
X-CRM114-Status: GOOD (  19.68  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz
 Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert MediaTek SMI to DT schema.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 .../mediatek,smi-common.txt                   | 49 ----------
 .../mediatek,smi-common.yaml                  | 96 +++++++++++++++++++
 .../memory-controllers/mediatek,smi-larb.txt  | 49 ----------
 .../memory-controllers/mediatek,smi-larb.yaml | 85 ++++++++++++++++
 4 files changed, 181 insertions(+), 98 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
deleted file mode 100644
index b64573680b42..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-SMI (Smart Multimedia Interface) Common
-
-The hardware block diagram please check bindings/iommu/mediatek,iommu.txt
-
-Mediatek SMI have two generations of HW architecture, here is the list
-which generation the SoCs use:
-generation 1: mt2701 and mt7623.
-generation 2: mt2712, mt6779, mt8173 and mt8183.
-
-There's slight differences between the two SMI, for generation 2, the
-register which control the iommu port is at each larb's register base. But
-for generation 1, the register is at smi ao base(smi always on register
-base). Besides that, the smi async clock should be prepared and enabled for
-SMI generation 1 to transform the smi clock into emi clock domain, but that is
-not needed for SMI generation 2.
-
-Required properties:
-- compatible : must be one of :
-	"mediatek,mt2701-smi-common"
-	"mediatek,mt2712-smi-common"
-	"mediatek,mt6779-smi-common"
-	"mediatek,mt7623-smi-common", "mediatek,mt2701-smi-common"
-	"mediatek,mt8173-smi-common"
-	"mediatek,mt8183-smi-common"
-- reg : the register and size of the SMI block.
-- power-domains : a phandle to the power domain of this local arbiter.
-- clocks : Must contain an entry for each entry in clock-names.
-- clock-names : must contain 3 entries for generation 1 smi HW and 2 entries
-  for generation 2 smi HW as follows:
-  - "apb" : Advanced Peripheral Bus clock, It's the clock for setting
-	    the register.
-  - "smi" : It's the clock for transfer data and command.
-	    They may be the same if both source clocks are the same.
-  - "async" : asynchronous clock, it help transform the smi clock into the emi
-	      clock domain, this clock is only needed by generation 1 smi HW.
-  and these 2 option clocks for generation 2 smi HW:
-  - "gals0": the path0 clock of GALS(Global Async Local Sync).
-  - "gals1": the path1 clock of GALS(Global Async Local Sync).
-  Here is the list which has this GALS: mt6779 and mt8183.
-
-Example:
-	smi_common: smi@14022000 {
-		compatible = "mediatek,mt8173-smi-common";
-		reg = <0 0x14022000 0 0x1000>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		clocks = <&mmsys CLK_MM_SMI_COMMON>,
-			 <&mmsys CLK_MM_SMI_COMMON>;
-		clock-names = "apb", "smi";
-	};
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
new file mode 100644
index 000000000000..781d7b7617d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SMI (Smart Multimedia Interface) Common
+
+maintainers:
+  - Yong Wu <yong.wu@mediatek.com>
+
+description: |+
+  The hardware block diagram please check bindings/iommu/mediatek,iommu.yaml
+
+  MediaTek SMI have two generations of HW architecture, here is the list
+  which generation the SoCs use:
+  generation 1: mt2701 and mt7623.
+  generation 2: mt2712, mt6779, mt8173 and mt8183.
+
+  There's slight differences between the two SMI, for generation 2, the
+  register which control the iommu port is at each larb's register base. But
+  for generation 1, the register is at smi ao base(smi always on register
+  base). Besides that, the smi async clock should be prepared and enabled for
+  SMI generation 1 to transform the smi clock into emi clock domain, but that is
+  not needed for SMI generation 2.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-smi-common
+      - mediatek,mt2712-smi-common
+      - mediatek,mt6779-smi-common
+      - mediatek,mt7623-smi-common, mediatek,mt2701-smi-common
+      - mediatek,mt8173-smi-common
+      - mediatek,mt8183-smi-common
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: |
+      apb and smi are mandatory. the async is only for generation 1 smi HW.
+      gals(global async local sync) also is optional, here is the list which
+      require gals: mt6779 and mt8183.
+    minItems: 2
+    maxItems: 4
+    items:
+      - description: apb is Advanced Peripheral Bus clock, It's the clock for
+          setting the register.
+      - description: smi is the clock for transfer data and command.
+      - description: async is asynchronous clock, it help transform the smi clock
+          into the emi clock domain.
+      - description: gals0 is the path0 clock of gals.
+      - description: gals1 is the path1 clock of gals.
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: apb
+          - const: smi
+      - items:
+          - const: apb
+          - const: smi
+          - const: async
+      - items:
+          - const: apb
+          - const: smi
+          - const: gals0
+          - const: gals1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    smi_common: smi@14022000 {
+            compatible = "mediatek,mt8173-smi-common";
+            reg = <0x14022000 0x1000>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_SMI_COMMON>,
+                     <&mmsys CLK_MM_SMI_COMMON>;
+            clock-names = "apb", "smi";
+    };
+
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
deleted file mode 100644
index 8f19dfe7d80e..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-SMI (Smart Multimedia Interface) Local Arbiter
-
-The hardware block diagram please check bindings/iommu/mediatek,iommu.txt
-
-Required properties:
-- compatible : must be one of :
-		"mediatek,mt2701-smi-larb"
-		"mediatek,mt2712-smi-larb"
-		"mediatek,mt6779-smi-larb"
-		"mediatek,mt7623-smi-larb", "mediatek,mt2701-smi-larb"
-		"mediatek,mt8173-smi-larb"
-		"mediatek,mt8183-smi-larb"
-- reg : the register and size of this local arbiter.
-- mediatek,smi : a phandle to the smi_common node.
-- power-domains : a phandle to the power domain of this local arbiter.
-- clocks : Must contain an entry for each entry in clock-names.
-- clock-names: must contain 2 entries, as follows:
-  - "apb" : Advanced Peripheral Bus clock, It's the clock for setting
-	    the register.
-  - "smi" : It's the clock for transfer data and command.
-  and this optional clock name:
-  - "gals": the clock for GALS(Global Async Local Sync).
-  Here is the list which has this GALS: mt8183.
-
-Required property for mt2701, mt2712, mt6779 and mt7623:
-- mediatek,larb-id :the hardware id of this larb.
-
-Example:
-	larb1: larb@16010000 {
-		compatible = "mediatek,mt8173-smi-larb";
-		reg = <0 0x16010000 0 0x1000>;
-		mediatek,smi = <&smi_common>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
-		clocks = <&vdecsys CLK_VDEC_CKEN>,
-			 <&vdecsys CLK_VDEC_LARB_CKEN>;
-		clock-names = "apb", "smi";
-	};
-
-Example for mt2701:
-	larb0: larb@14010000 {
-		compatible = "mediatek,mt2701-smi-larb";
-		reg = <0 0x14010000 0 0x1000>;
-		mediatek,smi = <&smi_common>;
-		mediatek,larb-id = <0>;
-		clocks = <&mmsys CLK_MM_SMI_LARB0>,
-			 <&mmsys CLK_MM_SMI_LARB0>;
-		clock-names = "apb", "smi";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
-	};
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
new file mode 100644
index 000000000000..e8919f280c84
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SMI (Smart Multimedia Interface) Local Arbiter
+
+maintainers:
+  - Yong Wu <yong.wu@mediatek.com>
+
+description: |+
+  The hardware block diagram please check bindings/iommu/mediatek,iommu.yaml
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-smi-larb
+      - mediatek,mt2712-smi-larb
+      - mediatek,mt6779-smi-larb
+      - mediatek,mt7623-smi-larb, mediatek,mt2701-smi-larb
+      - mediatek,mt8173-smi-larb
+      - mediatek,mt8183-smi-larb
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: |
+      apb and smi are mandatory. gals(global async local sync) is optional,
+      here is the list which require gals: mt8183.
+    minItems: 2
+    maxItems: 3
+    items:
+       - description: apb is Advanced Peripheral Bus clock, It's the clock for
+           setting the register.
+       - description: smi is the clock for transfer data and command.
+       - description: the clock for gals.
+
+  clock-names:
+    oneOf:
+      - items:
+         - const: apb
+         - const: smi
+      - items:
+         - const: apb
+         - const: smi
+         - const: gals
+
+  power-domains:
+    maxItems: 1
+
+  mediatek,smi:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: a phandle to the smi_common node.
+
+  mediatek,larb-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: the hardware id of this larb.
+      Required property for mt2701, mt2712, mt6779 and mt7623.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    larb1: larb@16010000 {
+      compatible = "mediatek,mt8173-smi-larb";
+      reg = <0x16010000 0x1000>;
+      mediatek,smi = <&smi_common>;
+      power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
+      clocks = <&vdecsys CLK_VDEC_CKEN>,
+               <&vdecsys CLK_VDEC_LARB_CKEN>;
+      clock-names = "apb", "smi";
+    };
+
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
