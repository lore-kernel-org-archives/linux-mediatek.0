Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DD1606A31A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 02:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EwHw8X+Q;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fFYxLP4u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pU84ryAqBxxtpx45yf2pYZAxb2k4EGwbTEnuyYGjFGo=; b=EwHw8X+Q72mnQ3wU6V7gZvwIMc
	99obdS99mgdLe+bfMKVJxy7qnQEdxNF5if7uS5FrZAOZuYZ+S4uYhaw7l7THUTZ1CV2TnPxQuMZau
	t6zh27ut25/v5t+N3E83q4F8vf9KyEV2V12rgAg5oYdhyx+Z5aFP/fvO2p6oplWuzjY6qQ3uq1btd
	CQK111JIR2DN5aRcE4fINgEpkkiaxyeqAb0nerkrDClG24WVDs8OvgJROtDE/xCyLTDmN2R1RvPm+
	cLsjxUsfL7LNpHpD/o0lmqNwrJGr4RK5+4HgiYCpQpEHDxWYflMNnGwKDKVTg76I4qVM/099GcbK1
	BI98nYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLt8K-0000000656w-3zVK;
	Wed, 28 Oct 2026 02:11:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLt8J-0000000655V-0zqL
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 02:11:20 +0000
X-UUID: d213aa62d27411f1acbe4559397dec65-20261027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pU84ryAqBxxtpx45yf2pYZAxb2k4EGwbTEnuyYGjFGo=;
	b=fFYxLP4u015j13agb72gXKhZs2+EU27QPpIgkYbrHDJ88VOKatVu5worFsioCT97HxM4PYCpDOYOHubrWmA0ujKAUKXJluDGJ1tLjF/RufQZGYAqSHqfI8YngPG5GGa5j4mElIb1SHkefVfFaFp701pjWlBrmMF+JlvKNYq1DNs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:7da3dc65-350a-4220-aa03-38d331dac452,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:042b0811-191d-4342-81c6-7ef97658e3d6,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d213aa62d27411f1acbe4559397dec65-20261027
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1869896031; Tue, 27 Oct 2026 19:11:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
Subject: [PATCH v1 2/2] wifi: mt76: free a partial rx A-MSDU when the phy is unregistered
Date: Wed, 28 Oct 2026 10:10:53 +0800
Message-ID: <20261028021053.2220951-3-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261028021053.2220951-1-eason.lai@mediatek.com>
References: <20261028021053.2220951-1-eason.lai@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_191119_283669_066CB2D5 
X-CRM114-Status: GOOD (  11.77  )
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

mt76_rx_release_burst() keeps the first subframes of an A-MSDU in
phy->rx_amsdu[q] until the last subframe arrives. If the phy or device
is unregistered in the meantime, nothing frees this skb and it leaks.

Free any parked A-MSDU after ieee80211_unregister_hw(), once rx has
stopped.

Fixes: cc4b3c139ad3 ("mt76: mt7915: enable hw rx-amsdu de-aggregation")
Signed-off-by: Eason Lai <eason.lai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 19a2e8a26c3e..fb8494ad8f8d 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -603,6 +603,19 @@ int mt76_register_phy(struct mt76_phy *phy, bool vht,
 }
 EXPORT_SYMBOL_GPL(mt76_register_phy);
 
+static void mt76_rx_amsdu_purge(struct mt76_phy *phy)
+{
+	int q;
+
+	for (q = 0; q < ARRAY_SIZE(phy->rx_amsdu); q++) {
+		spin_lock_bh(&phy->rx_amsdu[q].lock);
+		dev_kfree_skb(phy->rx_amsdu[q].head);
+		phy->rx_amsdu[q].head = NULL;
+		phy->rx_amsdu[q].tail = NULL;
+		spin_unlock_bh(&phy->rx_amsdu[q].lock);
+	}
+}
+
 void mt76_unregister_phy(struct mt76_phy *phy)
 {
 	struct mt76_dev *dev = phy->dev;
@@ -614,6 +627,7 @@ void mt76_unregister_phy(struct mt76_phy *phy)
 		mt76_led_cleanup(phy);
 	mt76_tx_status_check(dev, true);
 	ieee80211_unregister_hw(phy->hw);
+	mt76_rx_amsdu_purge(phy);
 	dev->phys[phy->band_idx] = NULL;
 }
 EXPORT_SYMBOL_GPL(mt76_unregister_phy);
@@ -811,6 +825,7 @@ EXPORT_SYMBOL_GPL(mt76_register_device);
 void mt76_unregister_device(struct mt76_dev *dev)
 {
 	struct ieee80211_hw *hw = dev->hw;
+	int i;
 
 	if (!test_bit(MT76_STATE_REGISTERED, &dev->phy.state))
 		return;
@@ -820,6 +835,13 @@ void mt76_unregister_device(struct mt76_dev *dev)
 	mt76_tx_status_check(dev, true);
 	mt76_wcid_cleanup(dev, &dev->global_wcid);
 	ieee80211_unregister_hw(hw);
+
+	/* radio phys sharing dev->hw (e.g. mt7996) are not unregistered
+	 * separately
+	 */
+	for (i = 0; i < ARRAY_SIZE(dev->phys); i++)
+		if (dev->phys[i])
+			mt76_rx_amsdu_purge(dev->phys[i]);
 }
 EXPORT_SYMBOL_GPL(mt76_unregister_device);
 
-- 
2.45.2


