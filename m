Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A62C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 06:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCKAq/De8/6kXlEfRl5b4lOFxXDYh241YijJMZUkoiA=; b=EwdhVKDJWAAtxA
	CdHZRfBq7gEXY8/aLE2NGa4gWUzp2nXe09k7I4Yv9mKPKR1qUtNghn4aHIy7ACXPEXWv0HauycxT0
	d/C+TjQ2FRQ4yElZGvnROmX4J9UpsjrQXKxmWlTXyc43W8XdUohaC4nr+J+90r7kBdACracDICAlg
	OBnYZxn/ftz/aj3vNqVeSFLfjoASMMZ2E1xHvAyyhSDlDlySvYqYeQP6ayLo+btihMZT14orGk7Xw
	g0FDlxJQLkGebBRL/tkaBB3PKMcEojw8LqCL31hffWFiDdfEHxJ/3QY0tVGoAPNl0f+aCCtX7CaJu
	D24D0X000E4C35X8nsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8G1z-007uJ1-MZ; Fri, 14 Jan 2022 06:25:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8G1u-007uGX-1A
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 06:25:44 +0000
X-UUID: 6014bbeaeef94811920300eedad0b23a-20220113
X-UUID: 6014bbeaeef94811920300eedad0b23a-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 522874373; Thu, 13 Jan 2022 23:24:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 22:24:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 14 Jan 2022 14:24:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 14:24:25 +0800
From: <guochun.mao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>, "Guochun
 Mao" <guochun.mao@mediatek.com>
Subject: [PATCH v1 1/4] dt-bindings: spi: add mt8186-nor compatible string
Date: Fri, 14 Jan 2022 14:24:05 +0800
Message-ID: <20220114062408.9077-2-guochun.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114062408.9077-1-guochun.mao@mediatek.com>
References: <20220114062408.9077-1-guochun.mao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_222542_123895_AD1B1E46 
X-CRM114-Status: UNSURE (   8.29  )
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

From: Guochun Mao <guochun.mao@mediatek.com>

Add MT8186 spi-nor controller support.
MT8186 needs a new clock name, axi_s, for spi nor axi slave bus clock.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
---
 .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index 4e4694e3d539..1a678751bcca 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt7622-nor
               - mediatek,mt7623-nor
               - mediatek,mt7629-nor
+              - mediatek,mt8186-nor
               - mediatek,mt8192-nor
               - mediatek,mt8195-nor
           - enum:
@@ -49,6 +50,8 @@ properties:
       - description: clock used for controller
       - description: clock used for nor dma bus. this depends on hardware
                      design, so this is optional.
+      - description: clock used for controller axi slave bus. this depens
+                     on hardwre design, so this is optional.
 
   clock-names:
     minItems: 2
@@ -56,6 +59,7 @@ properties:
       - const: spi
       - const: sf
       - const: axi
+      - const: axi_s
 
 required:
   - compatible
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
