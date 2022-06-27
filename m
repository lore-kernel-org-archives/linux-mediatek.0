Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B94C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 03:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYwcJQ4mrw88xOnLfk7VsgeFbg6SgKdxGqlkl53sdnQ=; b=kRyUHvpJZim/Kj2QnTQWWm3B2o
	YUIjIghOkceAGBkqu2M4sdP9nxnlMi5zllUZ0j94o47Gt5dBcf472NSC2a6uKKVsbkXWJfAHKi9kL
	IMO3JWCmXkkfdRGYFxrlB8I61qUGC/rTmIgqw7H4Mna5qtlLvaDtq+1aYUqGXo8T5ECvxq/Bq7F2W
	J7NUW7BeFNYjHuSBlB14+i4kafKnzApwYmqgbyIZgbfY5jQfUkOFL1OncRLF17nOPSnge8JtOKYz5
	zYLkkDCVn6uxvgs92d7uNH8+ujPFMkh5W61fRk3e3INipLdWbINqRubGEHOZ2HFq3IKU5G6jSMflB
	edPUu/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5eyx-00Er5K-UE; Mon, 27 Jun 2022 03:00:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ew9-00Ep4l-LD; Mon, 27 Jun 2022 02:57:23 +0000
X-UUID: 959343a516204cb2956d311f676954ec-20220626
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:288cfcb9-48e1-4867-8b6c-7b8eec3b611c,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
	TION:release,TS:20
X-CID-META: VersionHash:b14ad71,CLOUDID:4614192e-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 959343a516204cb2956d311f676954ec-20220626
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 785670069; Sun, 26 Jun 2022 19:57:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Jun 2022 19:56:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 27 Jun 2022 10:56:28 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jun 2022 10:56:27 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [V10,1/7] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
Date: Mon, 27 Jun 2022 10:56:19 +0800
Message-ID: <20220627025625.8956-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627025625.8956-1-irui.wang@mediatek.com>
References: <20220627025625.8956-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_195717_888403_22ACC43E 
X-CRM114-Status: GOOD (  15.44  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

Add mediatek,mt8195-jpgenc compatible to binding document.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 .../media/mediatek,mt8195-jpegenc.yaml        | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
new file mode 100644
index 000000000000..7737d2ba8b8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek JPEG Encoder Device Tree Bindings
+
+maintainers:
+  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
+
+description: |-
+  MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8195-jpgenc
+
+  mediatek,jpegenc-multi-core:
+    type: boolean
+    description: |
+      Indicates whether the jpeg encoder has multiple cores or not.
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 4
+    description: |
+      Points to the respective IOMMU block with master port as argument, see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+      Ports are according to the HW.
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+# Required child node:
+patternProperties:
+  "^jpgenc@[0-9a-f]+$":
+    type: object
+    description: |
+      The jpeg encoder hardware device node which should be added as subnodes to
+      the main jpeg node.
+
+    properties:
+      compatible:
+        const: mediatek,mt8195-jpgenc-hw
+
+      reg:
+        maxItems: 1
+
+      hw_id:
+        description: |
+          MT8195 encoding hardware id value. MT8195 has two encoding hardwares,
+          which is represented by this parameter.
+
+      iommus:
+        minItems: 1
+        maxItems: 32
+        description: |
+          List of the hardware port in respective IOMMU block for current Socs.
+          Refer to bindings/iommu/mediatek,iommu.yaml.
+
+      interrupts:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        items:
+          - const: jpgenc
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - hw_id
+      - iommus
+      - interrupts
+      - clocks
+      - clock-names
+      - power-domains
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - power-domains
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8195-memory-port.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/power/mt8195-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        jpgenc_master {
+                compatible = "mediatek,mt8195-jpgenc";
+                mediatek,jpegenc-multi-core;
+                power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
+                iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
+                <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
+                <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
+                <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges;
+
+                jpgenc@1a030000 {
+                        compatible = "mediatek,mt8195-jpgenc-hw";
+                        reg = <0 0x1a030000 0 0x10000>;
+                        hw_id = <0>;
+                        iommus = <&iommu_vdo M4U_PORT_L19_JPGENC_Y_RDMA>,
+                        <&iommu_vdo M4U_PORT_L19_JPGENC_C_RDMA>,
+                        <&iommu_vdo M4U_PORT_L19_JPGENC_Q_TABLE>,
+                        <&iommu_vdo M4U_PORT_L19_JPGENC_BSDMA>;
+                        interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
+                        clocks = <&vencsys CLK_VENC_JPGENC>;
+                        clock-names = "jpgenc";
+                        power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
+                };
+
+                jpgenc@1b030000 {
+                        compatible = "mediatek,mt8195-jpgenc-hw";
+                        reg = <0 0x1b030000 0 0x10000>;
+                        hw_id = <1>;
+                        iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
+                        <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
+                        <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
+                        <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
+                        interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
+                        clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGENC>;
+                        clock-names = "jpgenc";
+                        power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
+                };
+        };
+    };
-- 
2.18.0


