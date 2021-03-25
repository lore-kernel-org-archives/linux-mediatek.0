Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81603C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 08:09:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC31D61A16
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 08:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC31D61A16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kTuKJKLCohtM9xnbfQGdOku9hNdZuDoxVekoAat/YfQ=; b=K/5BT4VzAtEnm+yOg94OvUlgi
	5eqAa6fQvwUVksZ1jsi2zHHLvXRZ2xiEyIluqZxCjc5k9PzlLQXwEJbtZiC6sp1MhwQJ6ccCtIjRV
	TSyArnkEafGYuVW16XVy4LvBDojf8BW0AOj3lkwc6KYi+KixBqG7lKyfrmpEDFZSCubnOSO1BnnfB
	efot8L6iaHdNdj44zh9SwTSzSDV+CxNJj05nHbbHXJpLHDyHBRBiki3vnwUoKUFfl5acR1xaY/3z1
	XcE4QEAIBRZABVJWIuC4DvdqhRV4wi/QZZxZazg4Q6rC8KjarieMsL8H+FlYtMjTmpvHGx7NBdVmR
	MM8YbqKEw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPL3I-000uOu-9b; Thu, 25 Mar 2021 08:09:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPL2K-000u9r-Uf
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 08:08:30 +0000
X-UUID: c984683d0ffc429a8e050ac9b98c4ad2-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FGdFnwTq+7tHbLCTjANbcoATzFR33gjP0c2u4O+7Q1I=; 
 b=MvKxQX0DcmgmwEZbVcQAskpmfv2yNLvSDSj/oxpDHyff08qUtg5ObM8JDpUmqKdg9M6L4Sl3PZzVVQ5LSlxw+2LYviAoopuzkj/mTNnDiEbBp9Q0svLqL5gRuA1DsJUsd234Sutt5XfzwdJeDHDpC5s2XyWFB9HvKoYibeTXLV0=;
X-UUID: c984683d0ffc429a8e050ac9b98c4ad2-20210325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 388560209; Thu, 25 Mar 2021 00:08:08 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 01:06:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 16:06:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Mar 2021 16:06:08 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/5] mt76: mt7615: cleanup mcu tx queue in mt7615_dma_reset()
Date: Thu, 25 Mar 2021 16:06:02 +0800
Message-ID: <8157df1026bb9ea20fd39ce58b8abef9a1cedd37.1616657048.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20744fae1cbe0dcc098b3112b0a5ccb0b6254587.1616657048.git.ryder.lee@mediatek.com>
References: <20744fae1cbe0dcc098b3112b0a5ccb0b6254587.1616657048.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_080824_109610_B0CF911C 
X-CRM114-Status: UNSURE (   9.77  )
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

With this patch, mt7615_mac_reset_work() can recover system back.

Fixes: e637763b606b ("mt76: move mcu queues to mt76_dev q_mcu array")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 59aa8f84645b..17aa3e4d67ca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2018,15 +2018,17 @@ void mt7615_dma_reset(struct mt7615_dev *dev)
 	mt76_clear(dev, MT_WPDMA_GLO_CFG,
 		   MT_WPDMA_GLO_CFG_RX_DMA_EN | MT_WPDMA_GLO_CFG_TX_DMA_EN |
 		   MT_WPDMA_GLO_CFG_TX_WRITEBACK_DONE);
+
 	usleep_range(1000, 2000);
 
-	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WM], true);
 	for (i = 0; i < __MT_TXQ_MAX; i++)
 		mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[i], true);
 
-	mt76_for_each_q_rx(&dev->mt76, i) {
+	for (i = 0; i < __MT_MCUQ_MAX; i++)
+		mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[i], true);
+
+	mt76_for_each_q_rx(&dev->mt76, i)
 		mt76_queue_rx_reset(dev, i);
-	}
 
 	mt76_set(dev, MT_WPDMA_GLO_CFG,
 		 MT_WPDMA_GLO_CFG_RX_DMA_EN | MT_WPDMA_GLO_CFG_TX_DMA_EN |
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
