Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEACEC7115A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TJe0GtibYNSR3TlB4zrDfpZgRHLE4jCl9Gxezu9Oew=; b=APymZgvScmilAL
	LL4I8APszSk/Fx12zDv6whH/bMZ7Pwtr1K8q78GTLnLE+qrqxjBZ4WWGlGc1vkHXbJn+Z02sn5Z/2
	+3/Sc31EFQ0gWnNui5NAAOH0TvSuqQkZuKlkdxzWMw8uy49cNytIkPtQPfjoDPDNGHcRs5hYQH6CF
	JC/tIBIknsRqo826IE5i/bxW1HuGI6JTKXBkA6jgg2MakP/EjwSUz2xDyLx5whSF+gIIt3mOD1b0O
	rF+L4YMW9yyTxpisc2glGu6EQbTcOqMJU82k3ZE0Kkvt+Ojt97eP+NeFSTvT+XJCyrtuGHLE46vJU
	mgCwA2LtESs2d1vfsEHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHWG-0000000DYvQ-2HPd;
	Thu, 19 Jun 2025 15:49:40 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFCz-0000000D9N3-0PNN;
	Thu, 19 Jun 2025 13:21:40 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 3150D603E2;
	Thu, 19 Jun 2025 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750339295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TJe0GtibYNSR3TlB4zrDfpZgRHLE4jCl9Gxezu9Oew=;
	b=xHaiROarPd6WYyhOgV1oAn9fe8HfGC0vZhhuiQ/bfA7DQDhjGGFRwlqnVTke8GSfNuMX9B
	ZaQvX+xp5uV5Ppcm8mfNOetNsDVtMnxNioem29dwd44C/MAWGmE1WqHEV6klYiU9rbGmok
	ipPGXglbjHy43h98B3ne2it90Q/IOjI=
Received: from frank-u24.. (fttx-pool-80.245.76.73.bambit.de [80.245.76.73])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id E95351226B5;
	Thu, 19 Jun 2025 13:21:34 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [net-next v6 3/4] net: ethernet: mtk_eth_soc: skip first IRQ if not used
Date: Thu, 19 Jun 2025 15:21:23 +0200
Message-ID: <20250619132125.78368-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619132125.78368-1-linux@fw-web.de>
References: <20250619132125.78368-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_062137_309029_79C98E6E 
X-CRM114-Status: GOOD (  17.21  )
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
Cc: netdev@vger.kernel.org, arinc.unal@arinc9.com, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

On SoCs with dedicated RX and TX interrupts (all except MT7621 and
MT7628) platform_get_irq() is called for the first IRQ (eth->irq[0])
but it is never used.
Skip the first IRQ and reduce the IRQ-count to 2.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Simon Horman <horms@kernel.org>
---
v6:
- changed commit description a bit
- use MTK_FE_IRQ_SHARED instead of 0
v5:
- change commit title and description
v4:
- drop >2 condition as max is already 2 and drop the else continue
- update comment to explain which IRQs are taken in legacy way
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 ++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index efffdd7e131e..67ba8927be46 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3353,10 +3353,14 @@ static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
 	 * the second is for TX, and the third is for RX.
 	 */
 	for (i = 0; i < MTK_FE_IRQ_NUM; i++) {
-		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
-			eth->irq[i] = eth->irq[MTK_FE_IRQ_SHARED];
-		else
-			eth->irq[i] = platform_get_irq(pdev, i);
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
+			if (i == MTK_FE_IRQ_SHARED)
+				eth->irq[MTK_FE_IRQ_SHARED] = platform_get_irq(pdev, i);
+			else
+				eth->irq[i] = eth->irq[MTK_FE_IRQ_SHARED];
+		} else {
+			eth->irq[i] = platform_get_irq(pdev, i + 1);
+		}
 
 		if (eth->irq[i] < 0) {
 			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 8cdf1317dff5..9261c0e13b59 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -643,8 +643,8 @@
 #define MTK_MAC_FSM(x)		(0x1010C + ((x) * 0x100))
 
 #define MTK_FE_IRQ_SHARED	0
-#define MTK_FE_IRQ_TX		1
-#define MTK_FE_IRQ_RX		2
+#define MTK_FE_IRQ_TX		0
+#define MTK_FE_IRQ_RX		1
 #define MTK_FE_IRQ_NUM		(MTK_FE_IRQ_RX + 1)
 
 struct mtk_rx_dma {
-- 
2.43.0


