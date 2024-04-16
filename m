Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E48C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 08:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/VyoMxOp0tW/NwNVczKS098fiaFyK3/sT1s9b3x3XYI=; b=upRFmmIKWpY+5DihIB0YeSJaor
	9TmbV611d2UsGjxWHEECoio5e2/gd3jhEuR5mYkSxXpZBz/nLd8vPQm0MijKgQS2nGupUoy48LuI+
	PP5Hn/NK58N8CorIen1UWlhvy0k+w6LINfuhC/r9vbOaiEWs0l/NlI/sjb1hH0d6eSHIkU+MiDlue
	3g919bdcpH/CtpwhGCEFg+47xcdzbvny1hUUupxpRlSEsgL0l4jO7SchrG/bgkEg6ns8YzjTxAWj2
	pafmDSCCmDmB6+vgBf5hrCWy+svUhdc2PBhBoCn30jC372jjrLA4jsZ1REiGOnkj9oTMLW5ceiqI3
	+V75HJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwe6m-0000000BR8O-00c5;
	Tue, 16 Apr 2024 08:24:04 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwe6j-0000000BR4w-3sWB;
	Tue, 16 Apr 2024 08:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/VyoMxOp0tW/NwNVczKS098fiaFyK3/sT1s9b3x3XYI=; b=r4letyF+3ZYFtek1hQzgsvF+Q1
	TZPJwWvDX4IWFreyQeiWVVfAAuLqXHAEKxzdzbXzDSwN/vys6h/EiWXZY3ICQpv+Z6Y4UYMvzxm/5
	byKiVtR9YhXAgPR5YO4HKIvW6HqX45HlL8pvsMY1pS3RD3wuiEu8Y8kf3/4D878UnBak=;
Received: from p54ae9c93.dip0.t-ipconnect.de ([84.174.156.147] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1rwe6F-001ifE-0A;
	Tue, 16 Apr 2024 10:23:31 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: ethernet: mtk_eth_soc: fix WED + wifi reset
Date: Tue, 16 Apr 2024 10:23:29 +0200
Message-ID: <20240416082330.82564-1-nbd@nbd.name>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_012402_023170_A4E76F0D 
X-CRM114-Status: GOOD (  10.14  )
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

The WLAN + WED reset sequence relies on being able to receive interrupts from
the card, in order to synchronize individual steps with the firmware.
When WED is stopped, leave interrupts running and rely on the driver turning
off unwanted ones.
WED DMA also needs to be disabled before resetting.

Fixes: f78cd9c783e0 ("net: ethernet: mtk_wed: update mtk_wed_stop")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index c895e265ae0e..61334a71058c 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1074,13 +1074,13 @@ mtk_wed_dma_disable(struct mtk_wed_device *dev)
 static void
 mtk_wed_stop(struct mtk_wed_device *dev)
 {
+	mtk_wed_dma_disable(dev);
 	mtk_wed_set_ext_int(dev, false);
 
 	wed_w32(dev, MTK_WED_WPDMA_INT_TRIGGER, 0);
 	wed_w32(dev, MTK_WED_WDMA_INT_TRIGGER, 0);
 	wdma_w32(dev, MTK_WDMA_INT_MASK, 0);
 	wdma_w32(dev, MTK_WDMA_INT_GRP2, 0);
-	wed_w32(dev, MTK_WED_WPDMA_INT_MASK, 0);
 
 	if (!mtk_wed_get_rx_capa(dev))
 		return;
@@ -1093,7 +1093,6 @@ static void
 mtk_wed_deinit(struct mtk_wed_device *dev)
 {
 	mtk_wed_stop(dev);
-	mtk_wed_dma_disable(dev);
 
 	wed_clr(dev, MTK_WED_CTRL,
 		MTK_WED_CTRL_WDMA_INT_AGENT_EN |
@@ -2605,9 +2604,6 @@ mtk_wed_irq_get(struct mtk_wed_device *dev, u32 mask)
 static void
 mtk_wed_irq_set_mask(struct mtk_wed_device *dev, u32 mask)
 {
-	if (!dev->running)
-		return;
-
 	mtk_wed_set_ext_int(dev, !!mask);
 	wed_w32(dev, MTK_WED_INT_MASK, mask);
 }
-- 
2.44.0


