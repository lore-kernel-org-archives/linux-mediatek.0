Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E47C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:18:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4ECB20872
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eFRjH/RL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Asbo2Fzn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4ECB20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ss2g8ehK9NGb+l5VNhJXx4jc8F8BWzV6oJ4clceTQDY=; b=eFRjH/RLRXJa/v
	AUNaVyfkoOWq5gXg9entL/9o1Ws4xX7acGAo0Lr5sto55VRX6DH3P0JDrMP2lA4lW/DAB+j9EfvFa
	dwqkjg46aQloj479kLdgOc8qsR8DUmih7Kl3hIWLXRnU42Dg+MCRCNDwk5RFVw+1JcjiT3vORh7eR
	NG83p3BUQfuwuGgliNu7m6WOSKHZradsJEVV7nc5v/MLtGbt7TJz3N3a8m8IdsUAgT+UptKqGXwMf
	uLoJgT0S+7dyN/ZnDeObj0kdUP8fK+lJ2j+o5qps4MRJKnbERZvDl0nwGfLPaKW5q9H27ondY2zWS
	2DblsmJXijoFgCw/T2fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiR2P-00059a-OZ; Mon, 08 Jun 2020 23:18:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQuK-0003dW-3k; Mon, 08 Jun 2020 23:10:22 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0025208C3;
 Mon,  8 Jun 2020 23:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657818;
 bh=LyC5reHuKcgTb4gEK4bP1Zn7mJplEn+GKnZZgfiDpzE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Asbo2Fzn8Mre5hoz7G/Z3TEAoHGWSaE9E9PY6abCvhbKFyUvdQ5cUdR9xNDM6EtVf
 bVRwYunLu4FvZRLYaApRoT/OcOPVcXgDWpkaziDiTU7jwcX3ck2qhWKRSsBUxnuCMh
 IApkGDOwR23ac9wbCH7iZxPDCWCX/PO2+qqRXRZc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 192/274] mt76: mt7622: fix DMA unmap length
Date: Mon,  8 Jun 2020 19:04:45 -0400
Message-Id: <20200608230607.3361041-192-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_161020_209796_1C7698E8 
X-CRM114-Status: GOOD (  10.02  )
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
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit c0f8055b3986f9c9f990268b578173259769ba1c ]

Fix DMA unmap length estimation in mt7615_txp_skb_unmap_hw for mt7622
chipset

Fixes: 6aa4ed7927f1 ("mt76: mt7615: implement DMA support for MT7622")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.h | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 656231786d55..b5249d08564c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -675,7 +675,7 @@ mt7615_txp_skb_unmap_hw(struct mt76_dev *dev, struct mt7615_hw_txp *txp)
 
 		len = le16_to_cpu(ptr->len0);
 		last = len & MT_TXD_LEN_MSDU_LAST;
-		len &= ~MT_TXD_LEN_MSDU_LAST;
+		len &= MT_TXD_LEN_MASK;
 		dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf0), len,
 				 DMA_TO_DEVICE);
 		if (last)
@@ -683,7 +683,7 @@ mt7615_txp_skb_unmap_hw(struct mt76_dev *dev, struct mt7615_hw_txp *txp)
 
 		len = le16_to_cpu(ptr->len1);
 		last = len & MT_TXD_LEN_MSDU_LAST;
-		len &= ~MT_TXD_LEN_MSDU_LAST;
+		len &= MT_TXD_LEN_MASK;
 		dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf1), len,
 				 DMA_TO_DEVICE);
 		if (last)
@@ -1107,8 +1107,8 @@ mt7615_write_hw_txp(struct mt7615_dev *dev, struct mt76_tx_info *tx_info,
 	txp->msdu_id[0] = cpu_to_le16(id | MT_MSDU_ID_VALID);
 
 	for (i = 0; i < nbuf; i++) {
+		u16 len = tx_info->buf[i + 1].len & MT_TXD_LEN_MASK;
 		u32 addr = tx_info->buf[i + 1].addr;
-		u16 len = tx_info->buf[i + 1].len;
 
 		if (i == nbuf - 1)
 			len |= MT_TXD_LEN_MSDU_LAST |
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index e0b89257db90..53ac184ab2d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -252,6 +252,7 @@ enum tx_phy_bandwidth {
 
 #define MT_MSDU_ID_VALID		BIT(15)
 
+#define MT_TXD_LEN_MASK			GENMASK(11, 0)
 #define MT_TXD_LEN_MSDU_LAST		BIT(14)
 #define MT_TXD_LEN_AMSDU_LAST		BIT(15)
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
