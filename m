Return-Path: <SRS0=2GrF=5Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5B3C2D0EA
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 08:59:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C872075E
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 08:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JB4k2u50";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwJxbMFK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C872075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEDtv/53W2B5A0FRkPbrFxxLTVBG4CUJmMG8feCZIkY=; b=JB4k2u50FZQbQi
	/FiERlXrdbofvIKx6mcMF363CHri/AAQ/YDppKwiN4Hpam0zlqJWhQEyPO8BWu6+XrZn1B9XuT36E
	YqhhkZnghCEggPSxrd+EJHSv07cBn/BUWoIMl4uFh12QFGoXaRxvhyon7PHg7LibjN7cxMhWOxHah
	SGMOLuGrHapMWWwFdDMDvH2fechWMyajiPz92AYb/lbij0uB7F98QjKdMsGjc3OBiaFJi61QYErp4
	nB3qZsJDxwexGCkVm1pPJoCIYS4+e2AflJb0Tr68vGmhW0VVk2eXaIRLRiF7E4fxi6fyK+wyAo3Ku
	zjxutrAYjypiW8FAIKrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMSpu-0000EV-QD; Thu, 09 Apr 2020 08:46:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMSps-0000Cs-00
 for linux-mediatek@lists.infradead.org; Thu, 09 Apr 2020 08:46:57 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2DE8922202;
 Thu,  9 Apr 2020 08:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586422015;
 bh=BWcm7JB/lPeWS8begBxm6Gv9BP5cm/j+Y7kTfEgg8A0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OwJxbMFK4EGhNY93BWbnVQm7lz2RPllyBBjY9ERFNRdNnvIkoBHrHe1Xu/tQpUEoh
 5NvH3UIMDFe7nH5eGgfInEtsPmu6WVTWj9EMR3isIZNmiGIb82T2XOldUlrgRdkeRX
 Lvxut5KwWniOlDdlAwVsJn1M8hJIdMyPkjKLtA/g=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 2/2] mt76: mt7663: fix DMA unmap length
Date: Thu,  9 Apr 2020 10:46:39 +0200
Message-Id: <20f6c8304fb911d31780ad2b1d8fa768b7b1eda2.1586421673.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586421673.git.lorenzo@kernel.org>
References: <cover.1586421673.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_014656_073696_64833343 
X-CRM114-Status: GOOD (  10.91  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ryder.lee@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 soul.huang@mediatek.com, lorenzo.bianconi@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix DMA unmap length for mt7663e devices in mt7615_txp_skb_unmap_hw

Fixes: f40ac0f3d3c0 ("mt76: mt7615: introduce mt7663e support")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Soul Huang <soul.huang@mediatek.com>
Signed-off-by: Soul Huang <soul.huang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 17 +++++++++++++----
 drivers/net/wireless/mediatek/mt76/mt7615/mac.h |  2 ++
 .../net/wireless/mediatek/mt76/mt7615/pci_mac.c | 15 ++++++++++++---
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index e7db7f17c37b..11d161d278e4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -654,24 +654,33 @@ mt7615_txp_skb_unmap_fw(struct mt76_dev *dev, struct mt7615_fw_txp *txp)
 static void
 mt7615_txp_skb_unmap_hw(struct mt76_dev *dev, struct mt7615_hw_txp *txp)
 {
+	u32 last_mask, len_mask;
 	int i;
 
+	if (is_mt7663(dev)) {
+		last_mask = MT_TXD_LEN_AMSDU_LAST;
+		len_mask = MT7663_TXD_LEN_MASK;
+	} else {
+		last_mask = MT_TXD_LAST_MASK;
+		len_mask = MT_TXD_LEN_MASK;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(txp->ptr); i++) {
 		struct mt7615_txp_ptr *ptr = &txp->ptr[i];
 		bool last;
 		u16 len;
 
 		len = le16_to_cpu(ptr->len0);
-		last = len & MT_TXD_LAST_MASK;
-		len &= ~MT_TXD_LAST_MASK;
+		last = len & last_mask;
+		len &= len_mask;
 		dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf0), len,
 				 DMA_TO_DEVICE);
 		if (last)
 			break;
 
 		len = le16_to_cpu(ptr->len1);
-		last = len & MT_TXD_LAST_MASK;
-		len &= ~MT_TXD_LAST_MASK;
+		last = len & last_mask;
+		len &= len_mask;
 		dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf1), len,
 				 DMA_TO_DEVICE);
 		if (last)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index d9b2fdfb4c8b..2b08abb82b73 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -256,8 +256,10 @@ enum tx_phy_bandwidth {
 
 #define MT_MSDU_ID_VALID		BIT(15)
 
+#define MT7663_TXD_LEN_MASK		GENMASK(11, 0)
 #define MT_TXD_LEN_MSDU_LAST		BIT(14)
 #define MT_TXD_LEN_AMSDU_LAST		BIT(15)
+#define MT_TXD_LEN_MASK			GENMASK(13, 0)
 #define MT_TXD_LAST_MASK		GENMASK(15, 14)
 
 struct mt7615_txp_ptr {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
index 6dfd03a8869b..f2db396bfae3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
@@ -54,20 +54,29 @@ mt7615_write_hw_txp(struct mt7615_dev *dev, struct mt76_tx_info *tx_info,
 {
 	struct mt7615_hw_txp *txp = txp_ptr;
 	struct mt7615_txp_ptr *ptr = &txp->ptr[0];
-	int nbuf = tx_info->nbuf - 1;
-	int i;
+	int i, nbuf = tx_info->nbuf - 1;
+	u32 last_mask, len_mask;
 
 	tx_info->buf[0].len = MT_TXD_SIZE + sizeof(*txp);
 	tx_info->nbuf = 1;
 
+	if (is_mt7663(&dev->mt76)) {
+		last_mask = MT_TXD_LEN_AMSDU_LAST;
+		len_mask = MT7663_TXD_LEN_MASK;
+	} else {
+		last_mask = MT_TXD_LAST_MASK;
+		len_mask = MT_TXD_LEN_MASK;
+	}
+
 	txp->msdu_id[0] = cpu_to_le16(id | MT_MSDU_ID_VALID);
 
 	for (i = 0; i < nbuf; i++) {
 		u32 addr = tx_info->buf[i + 1].addr;
 		u16 len = tx_info->buf[i + 1].len;
 
+		len &= len_mask;
 		if (i == nbuf - 1)
-			len |= MT_TXD_LAST_MASK;
+			len |= last_mask;
 
 		if (i & 1) {
 			ptr->buf1 = cpu_to_le32(addr);
-- 
2.25.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
