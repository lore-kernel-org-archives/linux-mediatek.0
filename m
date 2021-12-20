Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888EAC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKtCZdOaMfHs3v4AKhO7LqZqPqDhtuuT3Gp48aZmGJk=; b=0pKpHzY8pcldt2
	Cu13wDZq35y4aT4tIchbjz6K2iYT4yYw+pXLvEYFvb8AtLHJ+kZkhyNUw15xMFFMgXpLFFwgK6ogQ
	Pq2M33+ANx3dDmnNUU0OSsGphK28JOn1owXpl86MP3lrsrHqQ8oZZ3EEfuLAQSJ6383PU23xWlH+j
	zKZSntMGZx8g9nfbDvtunlCmNavNLrf2NAr/hs9BxrlNZ6lWd1qLV4VwXqUa2tYDbCgEL3mepzhXV
	0c9K080G0DzNaiuiXZve8suNf7LWrFryuS9dONXBP9txVZ4sF1vmWftYuDeGbdSJrq+hcaWFRUzOA
	ri7CVpO/EaxmwjWIVNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzHdJ-002DyO-Qh; Mon, 20 Dec 2021 12:19:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzHct-002Dqo-8r; Mon, 20 Dec 2021 12:18:49 +0000
X-UUID: 14dac8c6869e47cba2a9924827818293-20211220
X-UUID: 14dac8c6869e47cba2a9924827818293-20211220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 173230363; Mon, 20 Dec 2021 05:18:40 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Dec 2021 04:18:39 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 20 Dec 2021 20:18:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 20 Dec 2021 20:18:37 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
 <matthias.bgg@gmail.com>, <broonie@kernel.org>
CC: <bgolaszewski@baylibre.com>, <sean.wang@mediatek.com>,
 <bayi.cheng@mediatek.com>, <gch981213@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>
Subject: [PATCH v7 2/4] dt-bindings: spi: spi-mtk-nor: add new clock name
 'axi' for spi nor
Date: Mon, 20 Dec 2021 20:18:23 +0800
Message-ID: <20211220121825.6446-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20211220121825.6446-1-tinghan.shen@mediatek.com>
References: <20211220121825.6446-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_041847_335851_774F73D8 
X-CRM114-Status: UNSURE (   8.85  )
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

Some mtk spi nor has dedicated dma(s) inside. Add a new clock name, axi,
for spi nor dma bus clock.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index 7393f30535df..478afebfec9c 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -43,14 +43,19 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: clock used for spi bus
       - description: clock used for controller
+      - description: clock used for nor dma bus. this depends on hardware
+                     design, so this is optional.
 
   clock-names:
+    minItems: 2
     items:
       - const: spi
       - const: sf
+      - const: axi
 
 required:
   - compatible
@@ -84,4 +89,3 @@ examples:
         };
       };
     };
-
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
