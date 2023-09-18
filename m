Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F810CD13D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGz69cTUUuZ7Ard8U7ivT+Cbm9rfBuAcmZs6VTy882s=; b=HrRX9imCUmIr7K/QurCTEVZxQC
	ChiP8j4PIvn2NBtwNOYnjj/v5B/KRD6wMuA3nsy3NrWag3wXm1RR+GTUOaFlwomRTioR46Pe0kUnm
	XU7eIlA3sneWw+vTIH9lX5niOYoUEeE9J1v2QOKKpAup4XAClXaGA3BQEpYrEKVzCdZ0qKUObFOed
	3boxdN4fyaYJrjt2wJVQb1KCHkXCf2vRxgCF8R9rzMURwO4vubEVqIMYzYhBfLXj6VKL8mJocaFJ3
	L5a9CW0hUCQe24k92KEg1KavPNolaaT2QoMvTAknF2+qZRg5m+XEwiyGG5vYua0g4FdaDoyrRXdJ8
	C4+ocLvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWD-00F7zi-1e;
	Mon, 18 Sep 2023 10:30:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWA-00F7wL-35
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 974B7B80D7B;
	Mon, 18 Sep 2023 10:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5519C433C9;
	Mon, 18 Sep 2023 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695033013;
	bh=0pqkmD5Iozwr7NTEc4EXc7d5bZlZew621GqsG8gHbbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VUvUn1lpSzJcCShODbw2zqIEdZbMUCuCo4juC+OiK1uk6IWBDFRwUoO+lDBkt/W0G
	 kVlWzLmlOP6+OUYD6uY7jmW+tdiLR7sNFBe7cF8CacSJKVESnAL2gtkjXTJtnyBJm6
	 4D37bxG+O61SKxKEdS4E6HWEhn8zEh2abV474c5RPbDoiuePgdEe/dq+9nD7ob/CkI
	 moVEPDwvHW4h85uJV7m4eDXg+frRIvard5zFM7X48bn9bq2PKquAn994tHpHISa0yL
	 cpS9k1CdIjm6rK9kmE4rW4D8XAhXRc31/Og9fKjzDja2yXP25godpBJoI/3Ho/nwlQ
	 nqKWxJaRjqmsQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	horms@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 05/17] net: ethernet: mtk_wed: rename mtk_rxbm_desc in mtk_wed_bm_desc
Date: Mon, 18 Sep 2023 12:29:07 +0200
Message-ID: <522cdd80a8ead8a28fd83da759979b810c5e9bff.1695032291.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033015_271886_D2C8425E 
X-CRM114-Status: GOOD (  12.87  )
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

Rename mtk_rxbm_desc structure in mtk_wed_bm_desc since it will be used
even on tx side by MT7988 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c          | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c | 2 +-
 include/linux/soc/mediatek/mtk_wed.h             | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 750326b298dc..f166d4f0b793 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -422,7 +422,7 @@ mtk_wed_free_tx_buffer(struct mtk_wed_device *dev)
 static int
 mtk_wed_rx_buffer_alloc(struct mtk_wed_device *dev)
 {
-	struct mtk_rxbm_desc *desc;
+	struct mtk_wed_bm_desc *desc;
 	dma_addr_t desc_phys;
 
 	dev->rx_buf_ring.size = dev->wlan.rx_nbuf;
@@ -442,7 +442,7 @@ mtk_wed_rx_buffer_alloc(struct mtk_wed_device *dev)
 static void
 mtk_wed_free_rx_buffer(struct mtk_wed_device *dev)
 {
-	struct mtk_rxbm_desc *desc = dev->rx_buf_ring.desc;
+	struct mtk_wed_bm_desc *desc = dev->rx_buf_ring.desc;
 
 	if (!desc)
 		return;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index fc7ace638ce8..e7d8e03f826f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -591,7 +591,7 @@ static void mt7915_mmio_wed_release_rx_buf(struct mtk_wed_device *wed)
 
 static u32 mt7915_mmio_wed_init_rx_buf(struct mtk_wed_device *wed, int size)
 {
-	struct mtk_rxbm_desc *desc = wed->rx_buf_ring.desc;
+	struct mtk_wed_bm_desc *desc = wed->rx_buf_ring.desc;
 	struct mt76_txwi_cache *t = NULL;
 	struct mt7915_dev *dev;
 	struct mt76_queue *q;
diff --git a/include/linux/soc/mediatek/mtk_wed.h b/include/linux/soc/mediatek/mtk_wed.h
index b2b28180dff7..c6512c216b27 100644
--- a/include/linux/soc/mediatek/mtk_wed.h
+++ b/include/linux/soc/mediatek/mtk_wed.h
@@ -45,7 +45,7 @@ enum mtk_wed_wo_cmd {
 	MTK_WED_WO_CMD_WED_END
 };
 
-struct mtk_rxbm_desc {
+struct mtk_wed_bm_desc {
 	__le32 buf0;
 	__le32 token;
 } __packed __aligned(4);
@@ -104,7 +104,7 @@ struct mtk_wed_device {
 
 	struct {
 		int size;
-		struct mtk_rxbm_desc *desc;
+		struct mtk_wed_bm_desc *desc;
 		dma_addr_t desc_phys;
 	} rx_buf_ring;
 
-- 
2.41.0


