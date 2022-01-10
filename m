Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBBFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJ+UoZTrCLxORWyWNxiRs5G0MetDbeAk/+Oc29kE4Sc=; b=gWTNZshXw+BmWX
	f4pNd9QwJX5NDVHVaxpxM+cy32H96C1D+Z/9WzHCHu3gKnhqftCOL7y4TtvBOBzOVxSabFAigSqP3
	mRrYMCwUcokuCSdKo+nnoIsdB3JkOhrNZQgUaURKRjDbNnaDungNUdXPn03nrdQkomJxosas+0J73
	O4yPlaq8H96Rzm5OAlKkUYYb2k4jecvA/7Dr3u+XF/ke2WjC0OKF93B/lNp/+Nf8QkgZSXrpaCzUa
	ceHEn+FO5D1VwZrAsdiIu7b7QYtynSbQzl4jskGnIgwr3zB5zuXqmKI0HFW7l0OzmvBgPZAQZ6+m6
	38xzK7VSQwKWXzZHFrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qR8-00A4R6-Ba; Mon, 10 Jan 2022 08:53:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qKK-00A0uh-K2; Mon, 10 Jan 2022 08:46:54 +0000
X-UUID: d6c26343d9054f31a8e5f0222e898dac-20220110
X-UUID: d6c26343d9054f31a8e5f0222e898dac-20220110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2016770362; Mon, 10 Jan 2022 01:46:48 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 00:46:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 10 Jan 2022 16:46:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Jan 2022 16:46:46 +0800
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
Subject: [PATCH v11 01/22] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Date: Mon, 10 Jan 2022 16:46:24 +0800
Message-ID: <20220110084645.31191-2-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220110084645.31191-1-nancy.lin@mediatek.com>
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_004652_710542_5AFA02CB 
X-CRM114-Status: GOOD (  15.12  )
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

Add vdosys1 RDMA definition.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 .../arm/mediatek/mediatek,mdp-rdma.yaml       | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-rdma.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-rdma.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-rdma.yaml
new file mode 100644
index 000000000000..d70b81ec1914
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-rdma.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mdp-rdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MDP RDMA
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  The mediatek MDP RDMA stands for Read Direct Memory Access.
+  It provides real time data to the back-end panel driver, such as DSI,
+  DPI and DP_INTF.
+  It contains one line buffer to store the sufficient pixel data.
+  RDMA device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8195-vdo1-rdma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: RDMA Clock
+
+  iommus:
+    description:
+      This property should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - clocks
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+
+    vdo1_rdma0: vdo1_rdma@1c104000 {
+        compatible = "mediatek,mt8195-vdo1-rdma";
+        reg = <0 0x1c104000 0 0x1000>;
+        interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+        iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
+        mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000 0x1000>;
+    };
+
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
