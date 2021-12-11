Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE08EC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Dec 2021 20:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yF/mLIYEqBva08PEg4SHuahpVK3p30r2I2/zRFHVZ9s=; b=iffnqCefkaBN0h
	nkcRiawX/kY/5sGV9Yph+ThTdj8aze9JUxoB8ZyOnC6RNbqEnkADME2+HFdTqv4gyBOfPrJYfAzUd
	3mitdI1hxifBBgHt/6luEqdtnkomiKkAHMzQm2bXDHKqEs/0dQ4jwwIV0RY1we7VopNqP5OOs/DSI
	wjTwYVMzH3qieLVmhiOBK6l0Tttp1o0usaXFxaEhUg9xv6pE1A//JoRsITBR7MxysTOW9RggQtnN0
	uJW131G/k+19jasU0P7UQ247zzEfBFI4mQ01CwF83jFYTil7IESypTCshiWlZKgCjODgBhRG6LnmP
	4e9DqwDu4gqmPi0A9JMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mw9Af-005XXa-7m; Sat, 11 Dec 2021 20:40:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mw9AS-005XTH-GN; Sat, 11 Dec 2021 20:40:29 +0000
X-UUID: 5bb8bd822412410bb47fe818eab0d89b-20211211
X-UUID: 5bb8bd822412410bb47fe818eab0d89b-20211211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 646101893; Sat, 11 Dec 2021 13:40:21 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 12:40:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Dec 2021 04:40:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 12 Dec 2021 04:40:17 +0800
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
Subject: [PATCH v6 2/4] dt-bindings: spi: add new clock name 'axi' for spi nor
Date: Sun, 12 Dec 2021 04:40:12 +0800
Message-ID: <20211211204014.8014-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20211211204014.8014-1-tinghan.shen@mediatek.com>
References: <20211211204014.8014-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211211_124028_575410_BC96D769 
X-CRM114-Status: UNSURE (   9.16  )
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
+                     design.
 
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
