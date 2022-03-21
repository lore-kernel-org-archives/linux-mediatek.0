Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52592C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 01:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZ92qNbVo2KJlaQVrYaJeP7EtsztPMJ2Xc1tmVN+u8g=; b=S9lcOsdM+sUxF9
	/H+1vdjBWh/3nBy5VRviU2+KM1k3VP6dSRgRH4TMnoaBLWoqOgHM9/2jim4n0NxeetgGeSxh3Q7cY
	jg02niRe+UX6ZrzLk6fAXg0ieDsU1bXObBT5H0IYE2BzxCsnp+iLIXBcdOJBFi9LdEuRtWlURpW6Y
	fpb7lb5MjwOCdc7J3Lbpmg5r1/UnGHcd7Mw2+BjQHCHmspk5/IEa6mcMx14iuPt2vuhtTuUPIcDYE
	ZEr8toEzuXb0sEUp+P8aiNkGvr+OHgvyj7s+ir7UvU3RvqtubXbtdL1aOfGMcYlRmRvh9JfBWtw5r
	RyYLqEwSJtS2HIoquAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nW71S-006Fj6-Nm; Mon, 21 Mar 2022 01:39:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW71G-006FdW-L3; Mon, 21 Mar 2022 01:39:39 +0000
X-UUID: 5a1f7afbaa88488592dde0d1a5cc6c48-20220320
X-UUID: 5a1f7afbaa88488592dde0d1a5cc6c48-20220320
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 733265167; Sun, 20 Mar 2022 18:39:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Mar 2022 18:39:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 21 Mar 2022 09:39:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Mar 2022 09:39:25 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Leilk Liu
 <leilk.liu@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH V6 2/3] dt-bindings: spi: support hclk
Date: Mon, 21 Mar 2022 09:39:21 +0800
Message-ID: <20220321013922.24067-3-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321013922.24067-1-leilk.liu@mediatek.com>
References: <20220321013922.24067-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_183938_702923_D827757B 
X-CRM114-Status: UNSURE (   9.63  )
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

this patch support hclk for AHB bus.

Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 7247a177466b..ecb4a5002cc1 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -53,16 +53,20 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: clock used for the parent clock
       - description: clock used for the muxes clock
       - description: clock used for the clock gate
+      - description: clock used for the AHB bus, this clock is optional
 
   clock-names:
+    minItems: 3
     items:
       - const: parent-clk
       - const: sel-clk
       - const: spi-clk
+      - const: hclk
 
   mediatek,pad-select:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
