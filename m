Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78003C3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFxsFxy+p6qngLI5V1N0rpnbRifRrEnu5xypjg+jAnY=; b=sWQyl/2qZ6qrT5fmwOFjLwOzCf
	5a7FYPLUkY8kqLb5gnIytXhCPL2X9vbooNm5orhdcSPZ+WSqOwIlIGGi87Ju2Xtkj1Jt1RhNzAiuG
	etilGlZGY9XW+3kXIdbsgOOWs593jJmYabVwjPeeDizGtZoIMzob8wTHALwsoXOb6q9Wdt2rqnDBP
	ZhcZrRzeOeIBpuKkU9k0W38dyCblX1DkEvUoi6coElazpZS2t4M/970Ar9hv1OF3pGb//PG47sk+j
	UjpjsprgElUt/1jcw0oIEMjZqrYl0fziR0zlZm9hvW85t1gbaHpEN3l2zd3KS9FpU8WxSntyCFQi/
	BNgeHWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4BP-0000000DoLK-0Fbc;
	Wed, 17 Jul 2024 12:54:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4B3-0000000DoE2-21kA;
	Wed, 17 Jul 2024 12:54:39 +0000
X-UUID: b6e4e02c443b11ef955bff358274dad2-20240717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UFxsFxy+p6qngLI5V1N0rpnbRifRrEnu5xypjg+jAnY=;
	b=M0tywjZSuBR0O9usWCsnDdszsLPaNIsQmtKXDcyXk7/W1wx7xcrnrS6hvvPfPAD5B9xiiJDceJGY6dyacNdOF/mrFYENqwdfzxLksqz4A6bjh40daJuFNryy9qdIge4wqCK99uMyLqgRhw7dJiywF1TrQl8B7L7bZeBBrwXNlQU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:f5e019e7-2a27-4b5e-a6ec-cb651560b110,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:370b6945-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b6e4e02c443b11ef955bff358274dad2-20240717
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yelian.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 796156673; Wed, 17 Jul 2024 05:54:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 Jul 2024 05:54:30 -0700
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 Jul 2024 20:54:30 +0800
From: 20220614094956 created <yelian.wang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yelian Wang
	<yelian.wang@mediatek.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
	<hidenorik@chromium.org>
Subject: [PATCH 1/3] media: dt-bindings: add MT8188 AIE
Date: Wed, 17 Jul 2024 20:41:55 +0800
Message-ID: <20240717125426.32660-2-yelian.wang@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717125426.32660-1-yelian.wang@mediatek.com>
References: <20240717125426.32660-1-yelian.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_055437_557231_B5357B5B 
X-CRM114-Status: GOOD (  14.69  )
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

From: Yelian Wang <yelian.wang@mediatek.com>

Add YAML device tree binding for MT8188 AIE.

Signed-off-by: Yelian Wang <yelian.wang@mediatek.com>
---
 .../bindings/media/mediatek-aie.yaml          | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-aie.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek-aie.yaml b/Documentation/devicetree/bindings/media/mediatek-aie.yaml
new file mode 100644
index 000000000000..300aef43e02b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-aie.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek-aie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The AIE Unit of MediaTek Camera System
+
+maintainers:
+  - Yelian Wang <yelian.wang@mediatek.com>
+
+description:
+  MediaTek AIE is the ISP unit in MediaTek SoC.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8188-aie
+      - enum:
+          - mediatek,aie-hw3.1
+          - mediatek,aie-hw3.0
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Must contain the local arbiters in the current SoCs, see
+      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+      for details.
+
+  iommus:
+    maxItems: 4
+    description:
+      Points to the respective IOMMU block with master port as argument, see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+      Ports are according to the HW.
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+    minItems: 4
+
+  clock-names:
+    items:
+      - const: IMG_IPE
+      - const: IPE_FDVT
+      - const: IPE_SMI_LARB12
+      - const: IPE_TOP
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - iommus
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    aie: aie@15310000 {
+      compatible = "mediatek,mt8188-aie", "mediatek,aie-hw3.1";
+      reg = <0 0x15310000 0 0x1000>;
+      interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
+      mediatek,larb = <&larb12>;
+      iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
+      power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+      clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+               <&ipesys CLK_IPE_FDVT>,
+               <&ipesys CLK_IPE_SMI_LARB12>,
+               <&ipesys CLK_IPESYS_TOP>;
+      clock-names = "IMG_IPE",
+                    "IPE_FDVT",
+                    "IPE_SMI_LARB12",
+                    "IPE_TOP";
+    };
-- 
2.34.1


