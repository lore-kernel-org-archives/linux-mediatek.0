Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D510AC77B60
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Apr 2023 21:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBn3QEzegzb0p42nF9E4XKquKjHmcytH4/jiephNRUc=; b=SZLMwQU6lyQRKjSfs/XgDtznth
	K+QMVbunMi6a1tt0QS4h2Rmi3DNGWOaHflrN0th1QoWym1WUygluDiz7XPkQyUXljkkI5SKxmznob
	coXdPgzTr4CaLUeW89naY2Za5KqLJkjJziRYehFZQ4uDI+NwI1I71XzD4mVUhYICgfTwUHmfY+y4F
	tiq2eRhi5Dh1ghVeuUCMmVJhV0C5L2iw2K43Q1mfEvM99r8kZDtGNK53bA0FXlpbDt7YpCQO0XGbe
	rONycTkTy+HWgBqO4YFQvlDDu09SolziiwD2qqQ9zuahmcFUtUBR5TqCSAjJxGoMOZ8cXCGhWXzRc
	oZxH3mAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqhQW-00En6q-1m;
	Sun, 23 Apr 2023 21:39:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqhQT-00En5a-0W
	for linux-mediatek@lists.infradead.org;
	Sun, 23 Apr 2023 21:39:18 +0000
X-UUID: 487dca88e21f11ed8687db9d93187ff1-20230423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BBn3QEzegzb0p42nF9E4XKquKjHmcytH4/jiephNRUc=;
	b=MrZHj8NRSFQ2rbnk46R1PKjS6CbsOfPXOQs9znxkKD/FAZ4oaROM8xY8YqLaKlVRkPXghwh+Qsbsn0OVywSIArcbNfWZ5400JiitIv6qZGC7+1YP5OfCvNY4UQd7hj5IOaP1+vqrVpgOV3ETZaFit+Oxzgnk65unCaYPRgHEGHw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:aa8916b0-00ca-466b-9a80-72b676f442c5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:aa8916b0-00ca-466b-9a80-72b676f442c5,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:6ddff684-cd9c-45f5-8134-710979e3df0e,B
	ulkID:230424053912QFIKJV3N,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 487dca88e21f11ed8687db9d93187ff1-20230423
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 870550809; Sun, 23 Apr 2023 14:39:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 24 Apr 2023 05:39:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 24 Apr 2023 05:39:08 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: connac: fix stats->tx_bytes calculation
Date: Mon, 24 Apr 2023 05:39:06 +0800
Message-ID: <b3cd45596943cf5a06b2e08e2fe732ab0b51311b.1682285873.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <16fa938373e3b145cb07a2c98d2428fea2abadba.1682285873.git.ryder.lee@mediatek.com>
References: <16fa938373e3b145cb07a2c98d2428fea2abadba.1682285873.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_143917_210049_431D7A8B 
X-CRM114-Status: UNSURE (   9.63  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The stats->tx_bytes shall subtract retry byte from tx byte.

Fixes: 43eaa3689507 (wifi: mt76: add PPDU based TxS support for WED device)
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac2_mac.h | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac2_mac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac2_mac.h
index a5ec0f631385..fabf637bdf7f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac2_mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac2_mac.h
@@ -173,7 +173,7 @@ enum {
 #define MT_TXS5_MPDU_TX_CNT		GENMASK(31, 23)
 
 #define MT_TXS6_MPDU_FAIL_CNT		GENMASK(31, 23)
-
+#define MT_TXS7_MPDU_RETRY_BYTE		GENMASK(22, 0)
 #define MT_TXS7_MPDU_RETRY_CNT		GENMASK(31, 23)
 
 /* RXD DW0 */
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index ee0fbfcd07d6..d39a3cc5e381 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -608,7 +608,8 @@ bool mt76_connac2_mac_fill_txs(struct mt76_dev *dev, struct mt76_wcid *wcid,
 	/* PPDU based reporting */
 	if (FIELD_GET(MT_TXS0_TXS_FORMAT, txs) > 1) {
 		stats->tx_bytes +=
-			le32_get_bits(txs_data[5], MT_TXS5_MPDU_TX_BYTE);
+			le32_get_bits(txs_data[5], MT_TXS5_MPDU_TX_BYTE) -
+			le32_get_bits(txs_data[7], MT_TXS7_MPDU_RETRY_BYTE);
 		stats->tx_packets +=
 			le32_get_bits(txs_data[5], MT_TXS5_MPDU_TX_CNT);
 		stats->tx_failed +=
-- 
2.18.0


