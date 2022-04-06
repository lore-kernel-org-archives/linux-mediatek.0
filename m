Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DBCC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 03:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=meoGCtUN9aP5rn6kmHz7oRgKbhE3Lyo0VOKoE32T/xM=; b=CNtf5W1t28DcYE
	iUNLlhvq1z013/t9Mx5YZTdH7tPrlSEs67YSLpGgLDKXDOIJm0FkKGVbcPpnDPoZi7nVxr1E1qcgV
	XiC80j4CIy0/K/U14dkIV4pWd9wOr01swRtkGmT7Vnk1GS/iHA3jdk21IH9QcUi4bFo7Yu9vyxSqt
	CCVILdYm2Bcsbn621bmUu/pBfBNUOIqnqRr5BF0uv/w5ZDnFaFaszgUxxlQRJtRFsUDeuau7ByYhH
	Vk6EilMhHKoAY02m5NJQUhMKYjijZ2LVMjn/X9W+Ih4hbJxa5mC47UaL7LfPc9OTWJQ3lzyK0ZYJ9
	OOzhjnPWwJoVdA8U2Fdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbw4A-003XLt-Lb; Wed, 06 Apr 2022 03:10:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbw3z-003XJy-Bg; Wed, 06 Apr 2022 03:10:32 +0000
X-UUID: e2b5d81406f144c08970e200b6e661f9-20220405
X-UUID: e2b5d81406f144c08970e200b6e661f9-20220405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1293460756; Tue, 05 Apr 2022 20:10:27 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Apr 2022 20:00:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 6 Apr 2022 11:00:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 Apr 2022 11:00:13 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <p.zabel@pengutronix.de>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <jassisinghbrar@gmail.com>,
 <fparent@baylibre.com>, <yongqiang.niu@mediatek.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v10 2/4] dt-bindings: display: mediatek: change to use enum
 for mutex
Date: Wed, 6 Apr 2022 11:00:07 +0800
Message-ID: <20220406030009.2357-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220406030009.2357-1-rex-bc.chen@mediatek.com>
References: <20220406030009.2357-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_201031_427368_300C32B7 
X-CRM114-Status: UNSURE (   7.55  )
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

All single entry cases in mutex can be merged as a single enum.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,mutex.yaml      | 24 +++++++------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
index 00e6a1041a9b..b470fbb1b40a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
@@ -23,21 +23,15 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt2701-disp-mutex
-      - items:
-          - const: mediatek,mt2712-disp-mutex
-      - items:
-          - const: mediatek,mt8167-disp-mutex
-      - items:
-          - const: mediatek,mt8173-disp-mutex
-      - items:
-          - const: mediatek,mt8183-disp-mutex
-      - items:
-          - const: mediatek,mt8192-disp-mutex
-      - items:
-          - const: mediatek,mt8195-disp-mutex
+    enum:
+      - mediatek,mt2701-disp-mutex
+      - mediatek,mt2712-disp-mutex
+      - mediatek,mt8167-disp-mutex
+      - mediatek,mt8173-disp-mutex
+      - mediatek,mt8183-disp-mutex
+      - mediatek,mt8192-disp-mutex
+      - mediatek,mt8195-disp-mutex
+
   reg:
     maxItems: 1
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
