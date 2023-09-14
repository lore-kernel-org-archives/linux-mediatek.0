Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458C2EEAA4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 14:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKiMtHp7MR6m3ksr69jc6vj5HbQoEJHz/XrTv5cNpl0=; b=Nz8VdOD+HziQiU34Y+OW3IpuNc
	4bcDw7YBJE76U6OvvJJBmK7h/+MH5hnDMsT+529g3OShkAlAQkDsdbtbAiIbAP042z5FjqFbcrIn0
	jtRjyC9tI6EQnOQX7ur1mRKjted8Qrw8V+YUEF1W7h4wJljaFD/r1URGxp0sGkT5vKTzl7S8+vRrN
	djKoMSO9T/0dSWUHKlKVz0rNw3mNbtM9hpXQd4k2qMRPsiUpGInPCqjNHC6M/vNvtB+xl5hU0tWvM
	SVPuIrmQ/shIwKuVT1bNMQjSpZAbMPqcafUqCNx65HV/o4Sp6Yjzx6CrednYLOBXGB/e22RjxLNrx
	ITr/tuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnVJ-008ejz-16;
	Thu, 14 Sep 2023 14:39:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnVF-008eho-2G
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Sep 2023 14:39:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 17726CE2635;
	Thu, 14 Sep 2023 14:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B07C433CB;
	Thu, 14 Sep 2023 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694702370;
	bh=gXQWsZnC/K4vRGdHADEZFnyLphroni4lZ4MEK3xmE5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jve63uts2x9V6DGU+PaObUFChZrUIEcUeedN7mWPYgE/CmoxOVMSvF7mlmd9K7w9r
	 uvl6ocICuXB0+0MsIu/jCrqEoNHs/Nao3vM9ChHyAQV6fy1IA2STzKKkHxRY3KcI/k
	 1BwLEbwykYLxHVu3UnC3kUJ5vL5CcBnOfSI5Fr/ceuVX/Iks8ZIOZjp+6raBmzSfRr
	 MVCxzi9iKBzhr7sVAqM1UKr19rfd1HHj3AwtXZa7jW9IRpmS5kgU3Aw8Pq92GeXBDw
	 gYYiQj+a8X0Ayf+HwohIdJtELi8lLflkuw3LDUnDL+2kCr594pcIvAbaPD16GsIoUK
	 TMidQUInwI4ug==
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
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next 06/15] net: ethernet: mtk_wed: rename mtk_rxbm_desc in mtk_wed_bm_desc
Date: Thu, 14 Sep 2023 16:38:11 +0200
Message-ID: <1b05e610e5c8582ddaa0c5f71e6e6e6016d50cb9.1694701767.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694701767.git.lorenzo@kernel.org>
References: <cover.1694701767.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_073934_079101_1C0F7759 
X-CRM114-Status: GOOD (  12.57  )
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
index 100546c63e5a..8880b018ffca 100644
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


