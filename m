Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BB5C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 09:28:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A02361106
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 09:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A02361106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sg3uJSac2g8dKeL4RpZMYjDA9lul/rV2NJJaBVvsvM8=; b=ss5A8DFYGy+TRE
	jfAGJflena03izCe+gSIYzFdTs/pj3ZtMP5ZcoJgGTBtOsG9GzuHgAz4mrsG0Ap2MzouZLIAG3JYz
	ei+5+yhXS54LSJUeOeOO/njhWqTUtWD/Gbs0XPQmwL/GLY+UYwtrTnptYNTYQtXT/QRBay4WKGJJT
	vHwFiU9Nu98yheuniILCmr4J90OjdXjH2n5U51PXdbmsrQMuHQUCXU2HcSryhg72dwnk2w0vWmRzi
	V34XVn8QQkSnG+K9J5HxCduvrBTfcfbIcNFzLa7eYJQensgfIYGZyBF28jDiCZEq015xjusH4BwBa
	WcblUsFpIXcYasoI9UyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3bBj-00Ctoa-40; Wed, 14 Jul 2021 09:28:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3bBf-00CtnW-Pw
 for linux-mediatek@lists.infradead.org; Wed, 14 Jul 2021 09:28:17 +0000
X-UUID: 0d26507cb3fb485cb02ffcd5740aa99e-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jzWPnCT8qMv0oNmAA9ajS8V4e4j0t8+cZ1ecefIuY/g=; 
 b=Tamdjo+gLSKW1EdZ1yZEJyFAxq4wyR3Pfoix7DBi26Th/j1qHEyGE+7q0av9AQJ641WVmbXPAY6fX2bK26CMI8l4TiFauPJ7/57cpgp9L9/7fouQGL2IDShtRgbtl3ouqyG2IQJBosR+ZOcIh+fFGEpCaB+jM6KFGb8jBeUyF4Y=;
X-UUID: 0d26507cb3fb485cb02ffcd5740aa99e-20210714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 395971954; Wed, 14 Jul 2021 02:28:12 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 02:18:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 17:18:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Jul 2021 17:18:52 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/4] mt76: mt7915: cleanup -Wunused-but-set-variable
Date: Wed, 14 Jul 2021 17:18:49 +0800
Message-ID: <35bffb8d7f4fd01c576e826aaca723c75454e550.1626253920.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <50730853fe09fb75418484770a0c95c23b44deb5.1626253920.git.ryder.lee@mediatek.com>
References: <50730853fe09fb75418484770a0c95c23b44deb5.1626253920.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_022815_925581_CA2943DF 
X-CRM114-Status: GOOD (  10.31  )
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

Cleanup -Wunused-but-set-variable everywhere in driver.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 2462704094b0..70ec8ca94fcc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1162,7 +1162,6 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
 	count = FIELD_GET(MT_TX_FREE_MSDU_CNT, le16_to_cpu(free->ctrl));
 	for (i = 0; i < count; i++) {
 		u32 msdu, info = le32_to_cpu(free->info[i]);
-		u8 stat;
 
 		/*
 		 * 1'b1: new wcid pair.
@@ -1170,7 +1169,6 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
 		 */
 		if (info & MT_TX_FREE_PAIR) {
 			struct mt7915_sta *msta;
-			struct mt7915_phy *phy;
 			struct mt76_wcid *wcid;
 			u16 idx;
 
@@ -1182,7 +1180,6 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
 				continue;
 
 			msta = container_of(wcid, struct mt7915_sta, wcid);
-			phy = msta->vif->phy;
 			spin_lock_bh(&dev->sta_poll_lock);
 			if (list_empty(&msta->stats_list))
 				list_add_tail(&msta->stats_list, &phy->stats_list);
@@ -1193,8 +1190,6 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
 		}
 
 		msdu = FIELD_GET(MT_TX_FREE_MSDU_ID, info);
-		stat = FIELD_GET(MT_TX_FREE_STATUS, info);
-
 		txwi = mt76_token_release(mdev, msdu, &wake);
 		if (!txwi)
 			continue;
@@ -1333,15 +1328,11 @@ void mt7915_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 
 void mt7915_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_entry *e)
 {
-	struct mt7915_dev *dev;
-
 	if (!e->txwi) {
 		dev_kfree_skb_any(e->skb);
 		return;
 	}
 
-	dev = container_of(mdev, struct mt7915_dev, mt76);
-
 	/* error path */
 	if (e->skb == DMA_DUMMY_DATA) {
 		struct mt76_txwi_cache *t;
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
