Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE019C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 08:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vdJy1l95XLqHYu66mcp6m0riULwwmtyLQ4yUquJjXJ4=; b=11EOTQG2hVHCxP
	j3NQ5/0gicR4Xqefb9dAFEzNpGE1dzB56Xy1fOvwgf37OrupzPmHRDAfzf6Zmnmdy/AK+gt4+P4ZH
	A+ZvWv805SfuOBziC02SVUEqkvM8suEoJN41jrlXbOUdV20ALV/7g4usQJCYerCdJRqSZA6y+MCJS
	HDidOpgQFwO4FPFeiK6V1TD0fii7zq6RvkjsPBmF8IZpWcyES5SEnLeOhhuK09F0c7TxIz/6R3Ojf
	2oCUq2tLIWce6xxmAdeXo2kiXxxsW1Gam4bJ6hSMLoauqWQM7B/nDV3yUyQJcFeAW461SZXijKzL9
	XhBlfsrG7QaD5l9kF/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myVEX-00DGe7-23; Sat, 18 Dec 2021 08:38:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myVET-00DGbt-KC; Sat, 18 Dec 2021 08:38:22 +0000
X-UUID: 5b55f1bb3a444a9dae13990c582273bf-20211218
X-UUID: 5b55f1bb3a444a9dae13990c582273bf-20211218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1697276667; Sat, 18 Dec 2021 01:38:18 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Dec 2021 00:28:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 18 Dec 2021 16:28:02 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 18 Dec 2021 16:28:01 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: phy: mediatek: tphy: support software
 efuse load
Date: Sat, 18 Dec 2021 16:27:58 +0800
Message-ID: <20211218082802.5256-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_003821_704380_1E5B8CD0 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

Add optional property nvmem-cells and nvmem-cell-names to support
software efuse load, this helps to fix the efuse bit shift issue
on mt8195 etc.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add acked-by Rob
---
 .../devicetree/bindings/phy/mediatek,tphy.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 9e6c0f43f1c6..05ee274b4b71 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -160,6 +160,24 @@ patternProperties:
                 - PHY_TYPE_PCIE
                 - PHY_TYPE_SATA
 
+      nvmem-cells:
+        items:
+          - description: internal R efuse for U2 PHY or U3/PCIe PHY
+          - description: rx_imp_sel efuse for U3/PCIe PHY
+          - description: tx_imp_sel efuse for U3/PCIe PHY
+        description: |
+          Phandles to nvmem cell that contains the efuse data;
+          Available only for U2 PHY or U3/PCIe PHY of version 2/3, these
+          three items should be provided at the same time for U3/PCIe PHY,
+          when use software to load efuse;
+          If unspecified, will use hardware auto-load efuse.
+
+      nvmem-cell-names:
+        items:
+          - const: intr
+          - const: rx_imp
+          - const: tx_imp
+
       # The following optional vendor properties are only for debug or HQA test
       mediatek,eye-src:
         description:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
