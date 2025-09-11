Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD28CAC58E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 15:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydXwggZHxXaTCbCHF0na9t5QomnvBbOHMqSdcU5kNDY=; b=ohbx60PPiorgx3V3RMshbUn9PV
	iM1vWoncTJ8ahOzD48yOYggwhxLph69GndEU5BmXxzZIczFqhTJmMLmbjBrawhh56AxLjNRSc9h1E
	cH+7RyTQNh9QzWMPcb9a/bLbfPG/qkd5GpWmfsoWBvoOpxTxSL+YhMr5mjPquXA4dOY+cugaN7HFd
	iK11B1jyfgyA7AhbIQnBGtoZQj32JTVfdCrJMYiKlYb/TgnJ0/Ab20jntiQBuCCvh89Bst6lP9nqE
	6s9ol/AiApPtk+sMKDkrfxvTdPPEy2oW86RJbECuFx/femzxqQPy3LfkTFvdj0WARiXAVy2jxrq/A
	0kFuY/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiz5-00000003nJc-3SPx;
	Thu, 11 Sep 2025 15:13:15 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiz3-00000003nHa-0h6C;
	Thu, 11 Sep 2025 15:13:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757603548; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HZXjUsl6RCzKSQhCAC2rdvqx8z8T5LWBxS9w27VF5gt5auBn2/WHxKZtDAtQlFLP43HB/keDUUSnKdT+TH6O/EXtIgYBj3gF+FgKSMCF0Ka64ppHSuLkayKieyxJjmLETihyaSaSDVSyss88bxHSrkhmP/qA65atHX6stLn7YDs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603548; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ydXwggZHxXaTCbCHF0na9t5QomnvBbOHMqSdcU5kNDY=; 
	b=OfIQlL7xKrjlrI+erAadsb8Du1XGPLr2xSfu7/LadyHHF3HEtX3r7ATuBTC8gvyz7SlHZQHXDz8wkxvY+8aZ9HAAa3sU3Zbvan+ChtBhpzuqDsNVmmm7srQzf+zy+8hmQJCg6gBCZ7fx3Lk6dUPZGwQOcaFGFFJIbvHj5ZndMks=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603548;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ydXwggZHxXaTCbCHF0na9t5QomnvBbOHMqSdcU5kNDY=;
	b=RzqZktX4WzGLlLNI5eNhIzox8JmhnTi5T0hgu+8yDa5waZTB+8QmMjWd5zGeAyEr
	H6G3B4Ebi5xmARtVRwcWzR9Lir7p0xv/sJuxYQ3UZ4/ds/qDuWMRvf1iotBg15Q/3r7
	EWj1Xd5UcaORWijhghEAZAYGFbXWEvzSSF/2edc4=
Received: by mx.zohomail.com with SMTPS id 175760354633671.37448946947097;
	Thu, 11 Sep 2025 08:12:26 -0700 (PDT)
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
Subject: [PATCH v2 01/12] dt-bindings: media: Convert MediaTek mt8173-mdp bindings to DT schema
Date: Thu, 11 Sep 2025 12:09:50 -0300
Message-ID: <20250911151001.108744-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_081313_255674_58912F75 
X-CRM114-Status: GOOD (  14.42  )
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

Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
Path to a DT schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
 .../bindings/media/mediatek-mdp.txt           |  95 ----------
 2 files changed, 169 insertions(+), 95 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
new file mode 100644
index 0000000000000..8ca33a733c478
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8173 Media Data Path
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+description:
+  Media Data Path is used for scaling and color space conversion.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt8173-mdp-rdma
+          - mediatek,mt8173-mdp-rsz
+          - mediatek,mt8173-mdp-wdma
+          - mediatek,mt8173-mdp-wrot
+      - items:
+          - const: mediatek,mt8173-mdp-rdma
+          - const: mediatek,mt8173-mdp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  mediatek,vpu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to Mediatek Video Processor Unit for HW Codec encode/decode and
+      image processing.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-mdp-rdma
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Main clock
+            - description: Mutex clock
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Main clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8173-mdp-rdma
+              - mediatek,mt8173-mdp-wdma
+              - mediatek,mt8173-mdp-wrot
+    then:
+      required:
+        - iommus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-mdp
+    then:
+      required:
+        - mediatek,vpu
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mdp_rdma0: rdma@14001000 {
+            compatible = "mediatek,mt8173-mdp-rdma",
+                         "mediatek,mt8173-mdp";
+            reg = <0 0x14001000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+                     <&mmsys CLK_MM_MUTEX_32K>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_RDMA0>;
+            mediatek,vpu = <&vpu>;
+        };
+
+        mdp_rdma1: rdma@14002000 {
+            compatible = "mediatek,mt8173-mdp-rdma";
+            reg = <0 0x14002000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RDMA1>,
+                     <&mmsys CLK_MM_MUTEX_32K>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_RDMA1>;
+        };
+
+        mdp_rsz0: rsz@14003000 {
+            compatible = "mediatek,mt8173-mdp-rsz";
+            reg = <0 0x14003000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        };
+
+        mdp_rsz1: rsz@14004000 {
+            compatible = "mediatek,mt8173-mdp-rsz";
+            reg = <0 0x14004000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        };
+
+        mdp_rsz2: rsz@14005000 {
+            compatible = "mediatek,mt8173-mdp-rsz";
+            reg = <0 0x14005000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RSZ2>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        };
+
+        mdp_wdma0: wdma@14006000 {
+            compatible = "mediatek,mt8173-mdp-wdma";
+            reg = <0 0x14006000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_WDMA>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_WDMA>;
+        };
+
+        mdp_wrot0: wrot@14007000 {
+            compatible = "mediatek,mt8173-mdp-wrot";
+            reg = <0 0x14007000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_WROT0>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_WROT0>;
+        };
+
+        mdp_wrot1: wrot@14008000 {
+            compatible = "mediatek,mt8173-mdp-wrot";
+            reg = <0 0x14008000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_WROT1>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_WROT1>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
deleted file mode 100644
index 53ef26e2c8570..0000000000000
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ /dev/null
@@ -1,95 +0,0 @@
-* Mediatek Media Data Path
-
-Media Data Path is used for scaling and color space conversion.
-
-Required properties (controller node):
-- compatible: "mediatek,mt8173-mdp"
-- mediatek,vpu: the node of video processor unit, see
-  Documentation/devicetree/bindings/media/mediatek-vpu.txt for details.
-
-Required properties (all function blocks, child node):
-- compatible: Should be one of
-        "mediatek,mt8173-mdp-rdma"  - read DMA
-        "mediatek,mt8173-mdp-rsz"   - resizer
-        "mediatek,mt8173-mdp-wdma"  - write DMA
-        "mediatek,mt8173-mdp-wrot"  - write DMA with rotation
-- reg: Physical base address and length of the function block register space
-- clocks: device clocks, see
-  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- power-domains: a phandle to the power domain, see
-  Documentation/devicetree/bindings/power/power_domain.txt for details.
-
-Required properties (DMA function blocks, child node):
-- compatible: Should be one of
-        "mediatek,mt8173-mdp-rdma"
-        "mediatek,mt8173-mdp-wdma"
-        "mediatek,mt8173-mdp-wrot"
-- iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
-  for details.
-
-Example:
-	mdp_rdma0: rdma@14001000 {
-		compatible = "mediatek,mt8173-mdp-rdma";
-			     "mediatek,mt8173-mdp";
-		reg = <0 0x14001000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RDMA0>,
-			 <&mmsys CLK_MM_MUTEX_32K>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_RDMA0>;
-		mediatek,vpu = <&vpu>;
-	};
-
-	mdp_rdma1: rdma@14002000 {
-		compatible = "mediatek,mt8173-mdp-rdma";
-		reg = <0 0x14002000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RDMA1>,
-			 <&mmsys CLK_MM_MUTEX_32K>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_RDMA1>;
-	};
-
-	mdp_rsz0: rsz@14003000 {
-		compatible = "mediatek,mt8173-mdp-rsz";
-		reg = <0 0x14003000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RSZ0>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	};
-
-	mdp_rsz1: rsz@14004000 {
-		compatible = "mediatek,mt8173-mdp-rsz";
-		reg = <0 0x14004000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RSZ1>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	};
-
-	mdp_rsz2: rsz@14005000 {
-		compatible = "mediatek,mt8173-mdp-rsz";
-		reg = <0 0x14005000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RSZ2>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	};
-
-	mdp_wdma0: wdma@14006000 {
-		compatible = "mediatek,mt8173-mdp-wdma";
-		reg = <0 0x14006000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_WDMA>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_WDMA>;
-	};
-
-	mdp_wrot0: wrot@14007000 {
-		compatible = "mediatek,mt8173-mdp-wrot";
-		reg = <0 0x14007000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_WROT0>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_WROT0>;
-	};
-
-	mdp_wrot1: wrot@14008000 {
-		compatible = "mediatek,mt8173-mdp-wrot";
-		reg = <0 0x14008000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_WROT1>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_WROT1>;
-	};
-- 
2.50.1


