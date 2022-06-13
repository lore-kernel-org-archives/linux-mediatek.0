Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 03:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GixeVQwkfDTP9PtCcK+UEtkWjK2gCsMm9+a+AajFgLE=; b=sFTTPr0tB/iKHE
	tNTew7F6cl/lsu8sTgd0YGA3/mUwHuwGYybrhoafvUZJFroFecEo7dwGq6qUrrdLVaebKTA/Lz5OJ
	Unju2RfNMQ4WQFGC1Lu2zgFa3TozqZ6ugcu0ejugxRHQ86KGLRE68WmvbL33hwp3wM5cRnywhRvqh
	onxqyawM2/9cZDJLEY52SApLc09wRjom6j11cjWjonCMg4Bpl2R7q3Dz5zyheUJoB4IxTj8Y7Pvmg
	DpaMZtLcoqEzghJ46PDO239UuUMZ+SfLUOA9YIdR6TGOEVkyBUgn41eovf+6IUBU2Wp9RYoKwsNnX
	lloSY+vgLR/WQxqShkDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ans-0014eG-S6; Mon, 13 Jun 2022 03:31:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0amj-00146L-4u; Mon, 13 Jun 2022 03:30:40 +0000
X-UUID: 8422f0dde4cc43988e16fad3fd5bd663-20220612
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:729634b9-9467-4755-9af5-ec92773d289e,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
	TION:release,TS:20
X-CID-META: VersionHash:2a19b09,CLOUDID:e6a97837-84c0-4f9a-9fbd-acd4a0e9ad0f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 8422f0dde4cc43988e16fad3fd5bd663-20220612
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 838227626; Sun, 12 Jun 2022 20:30:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jun 2022 20:22:39 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 13 Jun 2022 11:22:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jun 2022 11:22:36 +0800
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
Subject: [V3,1/8] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec compatible
Date: Mon, 13 Jun 2022 11:22:25 +0800
Message-ID: <20220613032232.23187-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613032232.23187-1-irui.wang@mediatek.com>
References: <20220613032232.23187-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_203037_285090_C7901F3B 
X-CRM114-Status: GOOD (  15.03  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

Add mediatek,mt8195-jpgdec compatible to binding document.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 .../media/mediatek,mt8195-jpegdec.yaml        | 177 ++++++++++++++++++
 1 file changed, 177 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
new file mode 100644
index 000000000000..c967d7eb6a00
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -0,0 +1,177 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek JPEG Encoder Device Tree Bindings
+
+maintainers:
+  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
+
+description: |-
+  MediaTek JPEG Decoder is the JPEG decode hardware present in MediaTek SoCs
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8195-jpgdec
+
+  mediatek,jpegdec-multi-core:
+    type: boolean
+    description: |
+      Indicates whether the jpeg encoder has multiple cores or not.
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 6
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
+  "^jpgdec@[0-9a-f]+$":
+    type: object
+    description: |
+      The jpeg decoder hardware device node which should be added as subnodes to
+      the main jpeg node.
+
+    properties:
+      compatible:
+        const: mediatek,mt8195-jpgdec-hw
+
+      reg:
+        maxItems: 1
+
+      mediatek,hw-id:
+        minItems: 0
+        maxItems: 2
+        description: |
+          Current jpegdec hw id.
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
+          - const: jpgdec
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - mediatek,hw-id
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
+        jpgdec_master {
+                compatible = "mediatek,mt8195-jpgdec";
+                mediatek,jpegdec-multi-core;
+                power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
+                iommus = <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA0>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA0>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA1>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA1>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges;
+
+                jpgdec@1a040000 {
+                    compatible = "mediatek,mt8195-jpgdec-hw";
+                    reg = <0 0x1a040000 0 0x10000>;/* JPGDEC_C0 */
+                    mediatek,hw-id = <0>;
+                    iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+                    interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
+                    clocks = <&vencsys CLK_VENC_JPGDEC>;
+                    clock-names = "jpgdec";
+                    power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
+                };
+
+                jpgdec@1a050000 {
+                    compatible = "mediatek,mt8195-jpgdec-hw";
+                    reg = <0 0x1a050000 0 0x10000>;/* JPGDEC_C1 */
+                    mediatek,hw-id = <1>;
+                    iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                        <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+                    interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
+                    clocks = <&vencsys CLK_VENC_JPGDEC_C1>;
+                    clock-names = "jpgdec";
+                    power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
+                };
+
+                jpgdec@1b040000 {
+                    compatible = "mediatek,mt8195-jpgdec-hw";
+                    reg = <0 0x1b040000 0 0x10000>;/* JPGDEC_C2 */
+                    mediatek,hw-id = <2>;
+                    iommus = <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA0>,
+                        <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA0>,
+                        <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA1>,
+                        <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA1>,
+                        <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET1>,
+                        <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET0>;
+                    interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
+                    clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGDEC>;
+                    clock-names = "jpgdec";
+                    power-domains = <&spm MT8195_POWER_DOMAIN_VDEC2>;
+                };
+        };
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
