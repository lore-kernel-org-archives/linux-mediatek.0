Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB14AC46467
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6j/sv8+MlIcU1bbu9IPkm15J+ov9E8TV/CSRC0BZc1w=; b=Prcq32K4UHoZmYMV50uUvZPPJE
	fEo8AUDIlgZhGk0cqASHFz6AJJwBu1tJ2OxAd9MRNwZfu3Ta9uSF2boqjzipX2oJAlTXfVuRHy/Jp
	TRMp1p0LE/YYdUfl3Eu2lb2wkTQ1EEoxURFD6OiSyOowrNCpM66ME8ZH4txCTkGFcXrZKfwYmsUwW
	rmimBXZK6rdZ7QAdGBZ9oXVjnKrZU4WQFO8n+3w/yHcrBMvJffuMeZJqhIA1bR6NeHhi0maGG51ON
	4b/9HEQX9ctIudAKkocoMn9vPqdMNGgVNCLCMsiIlCHKsuTv97LZ4+5bOYlE7hQ85oyPReFa1tOZ4
	gmaPrD1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyE4R-009f7o-Sr; Thu, 24 Nov 2022 15:23:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyE4O-009f4P-7a
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 15:23:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DB199B8284C;
	Thu, 24 Nov 2022 15:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52604C433D7;
	Thu, 24 Nov 2022 15:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669303397;
	bh=VAxlfHGPNx1lu1vw5SdguG4crB3iyMWNPr0oYTvjPQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eq8GKZZaTnUAiAvF2ZyRCNi8hLYPNAUlwYdWetzzZJyM9onEur3rzUeEC+o37PwBq
	 ACCZI5NEXtEECc+D2MpAnxyljkyjIULordLLKNnwZivlstsVjd2eIINGEMqxle3v2w
	 Cm09125I4C/sRMl4hgZdwgLjc/s+4vufIOjB6nNgZ7Nt0N/U2f0VAVD5ecuugXE3wq
	 4LRQcxga9DHvAjPppTa0tgmKYw0x0+ajj8myyW3W7GprDJWAGj8cgjRVFCCUHLm1DI
	 GQyoqMq0mbJ80j03NMWso/Tjl3vZ32pH0LsnmAUzr6uV/YdP2kgnNJzhUIneR/cl6C
	 2ZOPIPCZaO0ZQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	lorenzo.bianconi@redhat.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 net-next 3/5] net: ethernet: mtk_wed: update mtk_wed_stop
Date: Thu, 24 Nov 2022 16:22:53 +0100
Message-Id: <6c8a6d7e203c5d8f414c9fefa5a9d3faabee1933.1669303154.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1669303154.git.lorenzo@kernel.org>
References: <cover.1669303154.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_072320_587928_F3B00D57 
X-CRM114-Status: GOOD (  11.23  )
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

Update mtk_wed_stop routine and rename old mtk_wed_stop() to
mtk_wed_deinit(). This is a preliminary patch to add Wireless Ethernet
Dispatcher reset support.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 32 ++++++++++++++++++-------
 include/linux/soc/mediatek/mtk_wed.h    |  4 ++++
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 0fb51fb31407..f43652e72728 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -539,14 +539,8 @@ mtk_wed_dma_disable(struct mtk_wed_device *dev)
 static void
 mtk_wed_stop(struct mtk_wed_device *dev)
 {
-	mtk_wed_dma_disable(dev);
 	mtk_wed_set_ext_int(dev, false);
 
-	wed_clr(dev, MTK_WED_CTRL,
-		MTK_WED_CTRL_WDMA_INT_AGENT_EN |
-		MTK_WED_CTRL_WPDMA_INT_AGENT_EN |
-		MTK_WED_CTRL_WED_TX_BM_EN |
-		MTK_WED_CTRL_WED_TX_FREE_AGENT_EN);
 	wed_w32(dev, MTK_WED_WPDMA_INT_TRIGGER, 0);
 	wed_w32(dev, MTK_WED_WDMA_INT_TRIGGER, 0);
 	wdma_w32(dev, MTK_WDMA_INT_MASK, 0);
@@ -558,7 +552,27 @@ mtk_wed_stop(struct mtk_wed_device *dev)
 
 	wed_w32(dev, MTK_WED_EXT_INT_MASK1, 0);
 	wed_w32(dev, MTK_WED_EXT_INT_MASK2, 0);
-	wed_clr(dev, MTK_WED_CTRL, MTK_WED_CTRL_WED_RX_BM_EN);
+}
+
+static void
+mtk_wed_deinit(struct mtk_wed_device *dev)
+{
+	mtk_wed_stop(dev);
+	mtk_wed_dma_disable(dev);
+
+	wed_clr(dev, MTK_WED_CTRL,
+		MTK_WED_CTRL_WDMA_INT_AGENT_EN |
+		MTK_WED_CTRL_WPDMA_INT_AGENT_EN |
+		MTK_WED_CTRL_WED_TX_BM_EN |
+		MTK_WED_CTRL_WED_TX_FREE_AGENT_EN);
+
+	if (dev->hw->version == 1)
+		return;
+
+	wed_clr(dev, MTK_WED_CTRL,
+		MTK_WED_CTRL_RX_ROUTE_QM_EN |
+		MTK_WED_CTRL_WED_RX_BM_EN |
+		MTK_WED_CTRL_RX_RRO_QM_EN);
 }
 
 static void
@@ -568,7 +582,7 @@ mtk_wed_detach(struct mtk_wed_device *dev)
 
 	mutex_lock(&hw_lock);
 
-	mtk_wed_stop(dev);
+	mtk_wed_deinit(dev);
 
 	mtk_wdma_rx_reset(dev);
 	mtk_wed_reset(dev, MTK_WED_RESET_WED);
@@ -670,7 +684,7 @@ mtk_wed_hw_init_early(struct mtk_wed_device *dev)
 {
 	u32 mask, set;
 
-	mtk_wed_stop(dev);
+	mtk_wed_deinit(dev);
 	mtk_wed_reset(dev, MTK_WED_RESET_WED);
 	mtk_wed_set_wpdma(dev);
 
diff --git a/include/linux/soc/mediatek/mtk_wed.h b/include/linux/soc/mediatek/mtk_wed.h
index 8294978f4bca..0bbba50cf929 100644
--- a/include/linux/soc/mediatek/mtk_wed.h
+++ b/include/linux/soc/mediatek/mtk_wed.h
@@ -231,6 +231,8 @@ mtk_wed_get_rx_capa(struct mtk_wed_device *dev)
 	(_dev)->ops->ppe_check(_dev, _skb, _reason, _hash)
 #define mtk_wed_device_update_msg(_dev, _id, _msg, _len) \
 	(_dev)->ops->msg_update(_dev, _id, _msg, _len)
+#define mtk_wed_device_stop(_dev) (_dev)->ops->stop(_dev)
+#define mtk_wed_device_dma_reset(_dev) (_dev)->ops->reset_dma(_dev)
 #else
 static inline bool mtk_wed_device_active(struct mtk_wed_device *dev)
 {
@@ -247,6 +249,8 @@ static inline bool mtk_wed_device_active(struct mtk_wed_device *dev)
 #define mtk_wed_device_rx_ring_setup(_dev, _ring, _regs) -ENODEV
 #define mtk_wed_device_ppe_check(_dev, _skb, _reason, _hash)  do {} while (0)
 #define mtk_wed_device_update_msg(_dev, _id, _msg, _len) -ENODEV
+#define mtk_wed_device_stop(_dev) do {} while (0)
+#define mtk_wed_device_dma_reset(_dev) do {} while (0)
 #endif
 
 #endif
-- 
2.38.1


