Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4969606A31D
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 02:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H8bdvqwt;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=AqaxOENW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OdKNt7dMkvQOwgSe6sGW36ar7xpC3kTsYB0qDQnVyDQ=; b=H8bdvqwteU5corxwlP5aytxnr6
	MpiA8+Rt4xnLASZHJx7ScbRzPLI50/CkZdSspfFTGEwbj+FDuufBBI9u8wTWFet2iT7lC5YS6DM1o
	9ZZbbPFcxbOE90tnbfv5FpeS6ClCOiiki96ecY7QJMv9msNq7tTHfY6bphO9M6lBjxDxNXgdDuLFM
	zSe+BwoUxYlQbAcDohYOi+4skl3Dtocx23zY2E2EvxTB85B2ZqBLvJDaj2cmYXh1s0srixNRY1Ou3
	CUJLLh3kxhO3+sywgErIm6ywB5divEe0sxUN2kWKyc1w7WGKrazKMGEZc6UcVln00Gt/qi2qGXvFX
	29oqya9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLt85-0000000650g-1xHD;
	Wed, 28 Oct 2026 02:11:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLt82-000000064zt-3i5m
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 02:11:03 +0000
X-UUID: d1f96e2cd27411f1afed4741b24580c9-20261027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OdKNt7dMkvQOwgSe6sGW36ar7xpC3kTsYB0qDQnVyDQ=;
	b=AqaxOENWSLsX2xhl6VdtthLp6upyVyBYYvk9qF5vi3rcUkwMntQpwUSCF5p+CcJLPABXHCEIOQLkVl8Fk1UgpklsmMzxnrvAkZXkMQwzEq8QMESPWl8YnQTCPsuBiJ2IngMF2hTILjC5fTsCClQYZRhwChSgyFHY/hPgN2APNb0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:a197e74e-a317-4a4f-ab50-e369b6a63930,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:562a0811-191d-4342-81c6-7ef97658e3d6,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d1f96e2cd27411f1afed4741b24580c9-20261027
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1672101413; Tue, 27 Oct 2026 19:11:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 28 Oct 2026 10:10:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 28 Oct 2026 10:10:58 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<lucid_duck@justthetip.ca>, <eason.lai@mediatek.com>,
	<stable@vger.kernel.org>
Subject: [PATCH v1 1/2] wifi: mt76: flush a partial rx A-MSDU when its station is removed
Date: Wed, 28 Oct 2026 10:10:52 +0800
Message-ID: <20261028021053.2220951-2-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261028021053.2220951-1-eason.lai@mediatek.com>
References: <20261028021053.2220951-1-eason.lai@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_191102_926784_9370AA5E 
X-CRM114-Status: GOOD (  15.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt76_rx_release_burst() keeps the first subframe of an A-MSDU in
phy->rx_amsdu[q] until the last subframe arrives, which can take several
polls. mt76_rx_status.wcid in that skb is only valid inside the RCU
section it was filled in.

If the station is removed meanwhile, the wcid is freed together with the
sta, and mt76_rx_convert() and mt76_check_ccmp_pn() use a dangling
pointer once the A-MSDU is released. Neither mt76_rx_aggr_stop() nor
__mt76_sta_remove() looks at rx_amsdu.

Drop a parked A-MSDU that references the wcid in mt76_wcid_cleanup(),
which every driver calls on station removal, and protect rx_amsdu with a
new per-queue lock.

Fixes: cc4b3c139ad3 ("mt76: mt7915: enable hw rx-amsdu de-aggregation")
Signed-off-by: Eason Lai <eason.lai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 43 +++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 2 files changed, 44 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index c9762082f473..19a2e8a26c3e 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -428,9 +428,12 @@ mt76_phy_init(struct mt76_phy *phy, struct ieee80211_hw *hw)
 {
 	struct mt76_dev *dev = phy->dev;
 	struct wiphy *wiphy = hw->wiphy;
+	int i;
 
 	INIT_LIST_HEAD(&phy->tx_list);
 	spin_lock_init(&phy->tx_lock);
+	for (i = 0; i < ARRAY_SIZE(phy->rx_amsdu); i++)
+		spin_lock_init(&phy->rx_amsdu[i].lock);
 	INIT_DELAYED_WORK(&phy->roc_work, mt76_roc_complete_work);
 	INIT_DELAYED_WORK(&phy->scan_work, mt76_scan_work);
 
@@ -974,10 +977,48 @@ void mt76_rx(struct mt76_dev *dev, enum mt76_rxq_id q, struct sk_buff *skb)
 	}
 #endif
 
+	spin_lock(&phy->rx_amsdu[q].lock);
 	mt76_rx_release_burst(phy, q, skb);
+	spin_unlock(&phy->rx_amsdu[q].lock);
 }
 EXPORT_SYMBOL_GPL(mt76_rx);
 
+/* Drop a partially received A-MSDU that still references the wcid of a
+ * station which is being removed.
+ */
+static void mt76_rx_amsdu_flush_wcid(struct mt76_dev *dev,
+				     struct mt76_wcid *wcid)
+{
+	int i, q;
+
+	for (i = 0; i < ARRAY_SIZE(dev->phys); i++) {
+		struct mt76_phy *phy = dev->phys[i];
+
+		if (!phy)
+			continue;
+
+		for (q = 0; q < ARRAY_SIZE(phy->rx_amsdu); q++) {
+			struct sk_buff *skb;
+			struct mt76_rx_status *status;
+
+			spin_lock_bh(&phy->rx_amsdu[q].lock);
+			skb = phy->rx_amsdu[q].head;
+			if (skb) {
+				status = (struct mt76_rx_status *)skb->cb;
+				if (status->wcid == wcid) {
+					phy->rx_amsdu[q].head = NULL;
+					phy->rx_amsdu[q].tail = NULL;
+				} else {
+					skb = NULL;
+				}
+			}
+			spin_unlock_bh(&phy->rx_amsdu[q].lock);
+
+			dev_kfree_skb(skb);
+		}
+	}
+}
+
 bool mt76_has_tx_pending(struct mt76_phy *phy)
 {
 	struct mt76_queue *q;
@@ -1760,6 +1801,8 @@ void mt76_wcid_cleanup(struct mt76_dev *dev, struct mt76_wcid *wcid)
 	struct sk_buff_head list;
 	struct sk_buff *skb;
 
+	mt76_rx_amsdu_flush_wcid(dev, wcid);
+
 	mt76_tx_status_lock(dev, &list);
 	mt76_tx_status_skb_get(dev, wcid, -1, &list);
 	idr_destroy(&wcid->pktid);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 9e851dea71d9..a4db4a2aaffa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -913,6 +913,7 @@ struct mt76_phy {
 	u8 mac_work_count;
 
 	struct {
+		spinlock_t lock;
 		struct sk_buff *head;
 		struct sk_buff **tail;
 		u16 seqno;
-- 
2.45.2


