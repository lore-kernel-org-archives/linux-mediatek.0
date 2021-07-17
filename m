Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD5BC636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:05:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2C9613C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE2C9613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MT9AdI/X5nGjBQWqQIK0BXHajydKnUoNNc1iSPb2RmU=; b=alNoURElOVQy3O
	gUwEnVYeECa/Eg3JyTGTggXZBAZ+JLnS+OdVnzMPfK0sGGjcxyUaJ3MVmIxjBVLlLSsoNwv/6hIo8
	HhKFh4KcgXILtv6eXGYN3uI8BdNBf0/Aa03HasQvIm3f2yR8nSeMeClm+eGe44NIvvhPIUHkOS7UA
	FYXCPS2Ed+gRPNG7oZTx8d+aUY+aP7EgVTHefnrwZTlNrPZ0HEcgAs0uwntITR6JYKCQJWZg14yoI
	0ERWoMaU2DSJr79CNL3aDmjNQ+40xnXNSUcsRTAALgVZABQ7cYwv21SC8oHdUvCuDX7h6VYAt0C/W
	qBElFQjcdwzw0oDBUSvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4gG8-006Gxx-PS; Sat, 17 Jul 2021 09:05:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4gFM-006Gmo-M2; Sat, 17 Jul 2021 09:04:34 +0000
X-UUID: 7d7e19c2b73349ae9e0b36f72122f3a7-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FvqcFKoi6SsROfRFoETHBmjLAUx3qIerDx4qAfS091Y=; 
 b=T5o+gu/d9CYtJfcdTTZQJruCgoMZlBzPK3iIfFL5kO3RwAo+Vt9Pt+0khAzs8NyXWoogZk4oc4BRquNRheswa/PuTuojsWAgoV9t7zEaH9FrqcaR+5DpjP43zmgTWYO5imjI5ln1hF4v0t33GPD+3Sr41AMaciFGmwTevvCk99g=;
X-UUID: 7d7e19c2b73349ae9e0b36f72122f3a7-20210717
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 924692588; Sat, 17 Jul 2021 02:04:26 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 02:04:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:24 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v1 01/10] dt-bindings: mediatek: add pseudo-ovl definition for
 mt8195
Date: Sat, 17 Jul 2021 17:03:59 +0800
Message-ID: <20210717090408.28283-2-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717090408.28283-1-nancy.lin@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_020432_825697_23D791B7 
X-CRM114-Status: GOOD (  16.62  )
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

1. Add pseudo-ovl definition file for mt8195 display.
2. Add mediatek,pseudo-ovl.yaml to decribe pseudo-ovl module in details.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 .../display/mediatek/mediatek,disp.yaml       |   5 +
 .../display/mediatek/mediatek,pseudo-ovl.yaml | 105 ++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,pseudo-ovl.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
index aac1796e3f6b..bb6d28572b48 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
@@ -230,6 +230,11 @@ properties:
       - items:
           - const: mediatek,mt8173-disp-od
 
+      # PSEUDO-OVL: see Documentation/devicetree/bindings/display/mediatek/mediatek,pseudo-ovl.yaml
+      # for details.
+      - items:
+          - const: mediatek,mt8195-disp-pseudo-ovl
+
   reg:
     description: Physical base address and length of the function block register space.
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,pseudo-ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,pseudo-ovl.yaml
new file mode 100644
index 000000000000..9059d96ce70e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,pseudo-ovl.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,pseudo-ovl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek pseudo ovl Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Nancy.Lin <nancy.lin@mediatek.com>
+
+description: |
+  The Mediatek pseudo ovl function block is composed of eight RDMA and
+  four MERGE devices. It's encapsulated as an overlay device, which supports
+  4 layers.
+
+properties:
+  compatible:
+    oneOf:
+      # pseudo ovl controller
+      - items:
+          - const: mediatek,mt8195-disp-pseudo-ovl
+      # RDMA: read DMA
+      - items:
+          - const: mediatek,mt8195-vdo1-rdma
+      # MERGE: merge streams from two RDMA sources
+      - items:
+          - const: mediatek,mt8195-vdo1-merge
+  reg:
+    maxItems: 1
+  interrupts:
+    maxItems: 1
+  iommus:
+    description: The compatible property is DMA function blocks.
+      Should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
+      details.
+    maxItems: 1
+  clocks:
+    maxItems: 2
+  clock-names:
+    maxItems: 2
+  power-domains:
+    maxItems: 1
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: The register of display function block to be set by gce.
+      There are 4 arguments in this property, gce node, subsys id, offset and
+      register size. The subsys id is defined in the gce header of each chips
+      include/include/dt-bindings/gce/<chip>-gce.h, mapping to the register of
+      display function block.
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const:
+              - mediatek,mt8195-vdo1-merge
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: merge clock
+            - description: merge async clock
+        clock-names:
+          items:
+            - const: merge
+            - const: merge_async
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    vdo1_rdma@1c104000 {
+            compatible = "mediatek,mt8195-vdo1-rdma",
+                         "mediatek,mt8195-disp-pseudo-ovl";
+            reg = <0 0x1c104000 0 0x1000>;
+            interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
+            clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
+            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+            iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
+            mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x4000 0x1000>;
+    };
+
+    disp_vpp_merge@1c10c000 {
+            compatible = "mediatek,mt8195-vdo1-merge";
+            reg = <0 0x1c10c000 0 0x1000>;
+            interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
+            clocks = <&vdosys1 CLK_VDO1_VPP_MERGE0>,
+                     <&vdosys1 CLK_VDO1_MERGE0_DL_ASYNC>;
+            clock-names = "merge","merge_async";
+            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+            mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0xc000 0x1000>;
+    };
+
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
