Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D78EC282EC
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Mar 2025 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abBZBbHSvhhu4hHLFKPdPw4jefnWaOmy4oNAIAImzV8=; b=et+USgbggZsmr1SaV2qKH2/4MR
	xyhjuAS7X2AJXPaNMx7IcKnkA90e3Cmt23Y/AnLt86q/PeeK6mAxnyrYH6+VMD/7wnyL941S+zxrJ
	wyCL2Wzbh2IZzmXxmV5pSdEN+VqA/uIN+fbEDWbTy0iQDUoce2K2hX0uy+3IIje8OYGW37K+mERE+
	RVp000YggZm39r4LPRmlNItlaHbsOsfQxIZmMFyYlfroTV5UOVMg3cREJqXhJcoReX2Rd/Vqg0dCj
	kiDFLL3qx2m/V7D99w8TFMGPAGyXfUEiVnmKlHq2gMjsTY+lFb+lIYqm+DeKE2ocYU3hyHt/eVC93
	JES4LcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8G3-00000002JZR-11PX;
	Mon, 17 Mar 2025 11:03:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8G0-00000002JXd-3saa;
	Mon, 17 Mar 2025 11:03:46 +0000
X-UUID: 7c54435a031f11f0a1e849db4cc18d44-20250317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=abBZBbHSvhhu4hHLFKPdPw4jefnWaOmy4oNAIAImzV8=;
	b=CXX9xCC9DlWGXhh/uZpUPuc4qTQT4Ge7o9ev2PsBHQ9h0PW39HstmOsIlDfpMbvz5VErcYnyFWmbyPlpwHChVUSWzb+5wJ5rtLdGwIv3micTk5ZP6SiPukI6n02I+WGnaZ6Aa1ytJfFhm4YFI1zyci15gdITUyEDjb2BWWIGRqc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:695530c4-8026-4eb2-8d82-ff4b1e698a67,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:b5f870c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 7c54435a031f11f0a1e849db4cc18d44-20250317
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jjian.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 402345816; Mon, 17 Mar 2025 04:03:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 17 Mar 2025 19:03:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 17 Mar 2025 19:03:37 +0800
From: Jjian Zhou <jjian.zhou@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>, Jjian Zhou <jjian.zhou@mediatek.com>
Subject: [PATCH RFC v3 3/3] dt-bindings: mailbox: mtk,mt8196-vcp-mbox: add mtk vcp-mbox document
Date: Mon, 17 Mar 2025 19:03:25 +0800
Message-ID: <20250317110331.2776-4-jjian.zhou@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250317110331.2776-1-jjian.zhou@mediatek.com>
References: <20250317110331.2776-1-jjian.zhou@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_040344_970992_A82F5D02 
X-CRM114-Status: GOOD (  12.95  )
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

This patch adds document for mediatek vcp mbox.

Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>
---
 .../bindings/mailbox/mtk,mt8196-vcp-mbox.yaml | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,mt8196-vcp-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mtk,mt8196-vcp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,mt8196-vcp-mbox.yaml
new file mode 100644
index 000000000000..bd1b024e22f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mtk,mt8196-vcp-mbox.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mtk,mt8196-vcp-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Video Companion Processor (VCP) mailbox
+
+maintainers:
+  - Jjian Zhou <Jjian.Zhou@mediatek.com>
+
+description:
+  The MTK VCP mailbox enables the SoC to communicate with the VCP by passing
+  messages through 64 32-bit wide registers. It has 32 interrupt vectors in
+  either direction for signalling purposes.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8196-vcp-mbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mailbox@31b80000 {
+        compatible = "mediatek,mt8196-vcp-mbox";
+        reg = <0x31b80000 0x1000>;
+        interrupts = <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>;
+        #mbox-cells = <0>;
+    };
-- 
2.45.2


