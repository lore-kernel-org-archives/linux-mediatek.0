Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B00C71135
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Jun 2025 15:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMCo+VFbKtuUjRwVkhv/z0zUgSXTtEAWBF4/x1hCKa8=; b=WaQIu+iJm8qpP/
	FLfTNsm6lg4qej5ZVi++a+TLmzWOdNaNind/SEQD0vdYQlamP1EkXVA5L6Ue8Bn+N5ICykJuAeP10
	q+z625Z3pISbtp9xdJguA/luShlf1rvFpSJBLxmU+2VZt79/4u5harZXWcnS5vBEQseC5uCJfRYtH
	h9FQh8JuV9cLkuhCoDT6gGeXAp6rSY58gKCyPVQwiyJBffHt092N/1S1mqGU7LFcIRfqjR8ZB10c4
	Ub09u5CHZYj9ojn6sqkCAsj8jIhr4TaphLmEb3t93NJeT7Wf7DwvE8pfE7v6f3Mny5M8/ENcHawoV
	aMWtsAkOuqdd3yBXNSiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQp2f-00000002auh-0I3m;
	Sun, 15 Jun 2025 15:13:05 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQotj-00000002aDt-0uLw;
	Sun, 15 Jun 2025 15:03:53 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 693CA3FF6D;
	Sun, 15 Jun 2025 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1749999829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMCo+VFbKtuUjRwVkhv/z0zUgSXTtEAWBF4/x1hCKa8=;
	b=U6K+sQPA5/Dakm2sC94GpFCh+jFoVm5cqODuYLmxyarK2SX5IitN5I997cJETNty7qAZBB
	y7bO8ywAeRW2z2TI+hiVhu3mqDPAZFlTn3p3KZ/ODOXwUaJdA1Mtox/0z+Z/uaa5hNTUbN
	v2/z7RhKKDPOLvjmt2N5ouJXXUsxF7o=
Received: from frank-u24.. (fttx-pool-217.61.157.124.bambit.de [217.61.157.124])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 2E55C122704;
	Sun, 15 Jun 2025 15:03:49 +0000 (UTC)
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
Subject: [net-next v3 3/3] net: ethernet: mtk_eth_soc: change code to skip first IRQ completely
Date: Sun, 15 Jun 2025 17:03:18 +0200
Message-ID: <20250615150333.166202-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250615150333.166202-1-linux@fw-web.de>
References: <20250615150333.166202-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_080351_396441_C4F84A49 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

On SoCs without MTK_SHARED_INT capability (mt7621 + mt7628) the first
IRQ (eth->irq[0]) was read but never used. Skip reading it now too.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 11 ++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 9aec67c9c6d7..4d7de282b940 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3346,10 +3346,15 @@ static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
 		return 0;
 
 	for (i = 0; i < MTK_ETH_IRQ_MAX; i++) {
-		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
-			eth->irq[i] = eth->irq[MTK_ETH_IRQ_SHARED];
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
+			if (i == 0)
+				eth->irq[MTK_ETH_IRQ_SHARED] = platform_get_irq(pdev, i);
+			else
+				eth->irq[i] = eth->irq[MTK_ETH_IRQ_SHARED];
+		} else if (i < 2)  //skip the 1st and 4th IRQ on !MTK_SHARED_INT
+			eth->irq[i] = platform_get_irq(pdev, i + 1);
 		else
-			eth->irq[i] = platform_get_irq(pdev, i);
+			continue;
 
 		if (eth->irq[i] < 0) {
 			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 6b1208d05f79..ff2ae3c80179 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -643,8 +643,8 @@
 #define MTK_MAC_FSM(x)		(0x1010C + ((x) * 0x100))
 
 #define MTK_ETH_IRQ_SHARED	0
-#define MTK_ETH_IRQ_TX		1
-#define MTK_ETH_IRQ_RX		2
+#define MTK_ETH_IRQ_TX		0
+#define MTK_ETH_IRQ_RX		1
 #define MTK_ETH_IRQ_MAX		3
 
 struct mtk_rx_dma {
-- 
2.43.0


