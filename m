Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4339FC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:19:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFE5020872
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OlQiokMv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QsVV9tZc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFE5020872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKkAFLDbdv+Jr1xWpXH6pO2vE5UAH8+3gN3kh4Y1zH8=; b=OlQiokMvlIrKTL
	8nP/I4BG6d6QndXWGA/NVfZjd697T3isJckAqjEmFYm5agWXpLKqXxnQx6DE0jfH6c8+av8pMTo2Q
	zEmEH7IHXDoKEvXT86vvj1VAEz1zyswLrrfm3NvdUlUrDnKfxtW3pm99D8aubygECVBXfo01Y9bwp
	waDmvPcEnuksulTF5pGPR1TaBXc5DRRH1SYOZt8rtZJNJdsGyWME/lYLCVlHCf/iEbwKUerBVtt1a
	xNax/B5lul5GlDL9quwZELpvMbebFpI+G7EWmq9KlDXynEwMHFolmo1rEqIwY1Rn5ACGELIuz39qV
	QYzF2DXoY00PNsd3Xj/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiR34-0005jQ-KE; Mon, 08 Jun 2020 23:19:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQuL-0003pI-8G; Mon, 08 Jun 2020 23:10:23 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30931208B8;
 Mon,  8 Jun 2020 23:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657820;
 bh=wwX3oMSrctskPbGkvudSONYgRfHBUkGW7Urvxsugfos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QsVV9tZcHDRoGkUFwAUS3YCpoybfjeEge99/f7AnUG/ZrAkMd8t45OFEaUyMvy1dz
 4Af1PGKLppJ5LpRYphJ7ENVmgUTHWJqlc6PA8BamO7fDhk8oxyoPY9H7AnGBs570Vq
 sKUCBTuFB9uhdfxWy5dwG4QecFxhclyQ1q1zCcCo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 193/274] mt76: mt7663: fix DMA unmap length
Date: Mon,  8 Jun 2020 19:04:46 -0400
Message-Id: <20200608230607.3361041-193-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_161021_501665_F92E3B06 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Soul Huang <soul.huang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit 89829c9e65ab680f7e5a1658cb74bc6316ab036e ]

Fix DMA unmap length for mt7663e devices in mt7615_txp_skb_unmap_hw

Fixes: f40ac0f3d3c0 ("mt76: mt7615: introduce mt7663e support")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Soul Huang <soul.huang@mediatek.com>
Signed-off-by: Soul Huang <soul.huang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 20 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7615/mac.h   |  2 ++
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index b5249d08564c..f66b76ff2978 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -666,15 +666,18 @@ mt7615_txp_skb_unmap_fw(struct mt76_dev *dev, struct mt7615_fw_txp *txp)
 static void
 mt7615_txp_skb_unmap_hw(struct mt76_dev *dev, struct mt7615_hw_txp *txp)
 {
+	u32 last_mask;
 	int i;
 
+	last_mask = is_mt7663(dev) ? MT_TXD_LEN_LAST : MT_TXD_LEN_MSDU_LAST;
+
 	for (i = 0; i < ARRAY_SIZE(txp->ptr); i++) {
 		struct mt7615_txp_ptr *ptr = &txp->ptr[i];
 		bool last;
 		u16 len;
 
 		len = le16_to_cpu(ptr->len0);
-		last = len & MT_TXD_LEN_MSDU_LAST;
+		last = len & last_mask;
 		len &= MT_TXD_LEN_MASK;
 		dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf0), len,
 				 DMA_TO_DEVICE);
@@ -682,7 +685,7 @@ mt7615_txp_skb_unmap_hw(struct mt76_dev *dev, struct mt7615_hw_txp *txp)
 			break;
 
 		len = le16_to_cpu(ptr->len1);
-		last = len & MT_TXD_LEN_MSDU_LAST;
+		last = len & last_mask;
 		len &= MT_TXD_LEN_MASK;
 		dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf1), len,
 				 DMA_TO_DEVICE);
@@ -1098,21 +1101,26 @@ mt7615_write_hw_txp(struct mt7615_dev *dev, struct mt76_tx_info *tx_info,
 {
 	struct mt7615_hw_txp *txp = txp_ptr;
 	struct mt7615_txp_ptr *ptr = &txp->ptr[0];
-	int nbuf = tx_info->nbuf - 1;
-	int i;
+	int i, nbuf = tx_info->nbuf - 1;
+	u32 last_mask;
 
 	tx_info->buf[0].len = MT_TXD_SIZE + sizeof(*txp);
 	tx_info->nbuf = 1;
 
 	txp->msdu_id[0] = cpu_to_le16(id | MT_MSDU_ID_VALID);
 
+	if (is_mt7663(&dev->mt76))
+		last_mask = MT_TXD_LEN_LAST;
+	else
+		last_mask = MT_TXD_LEN_AMSDU_LAST |
+			    MT_TXD_LEN_MSDU_LAST;
+
 	for (i = 0; i < nbuf; i++) {
 		u16 len = tx_info->buf[i + 1].len & MT_TXD_LEN_MASK;
 		u32 addr = tx_info->buf[i + 1].addr;
 
 		if (i == nbuf - 1)
-			len |= MT_TXD_LEN_MSDU_LAST |
-			       MT_TXD_LEN_AMSDU_LAST;
+			len |= last_mask;
 
 		if (i & 1) {
 			ptr->buf1 = cpu_to_le32(addr);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index 53ac184ab2d6..d3da40df7f32 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -255,6 +255,8 @@ enum tx_phy_bandwidth {
 #define MT_TXD_LEN_MASK			GENMASK(11, 0)
 #define MT_TXD_LEN_MSDU_LAST		BIT(14)
 #define MT_TXD_LEN_AMSDU_LAST		BIT(15)
+/* mt7663 */
+#define MT_TXD_LEN_LAST			BIT(15)
 
 struct mt7615_txp_ptr {
 	__le32 buf0;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
