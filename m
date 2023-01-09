Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40757C677F1
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 16:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdPMItW0J1+1WKgUkqkf4uAqNSmGg8Y3wMzxtnCbEDs=; b=HwqsFo3f2iMy9RbC4eOwv4FdpE
	ZB5mPIczZ3BnuzrolYNCRDx79f0ezGvRdFRsDTSj4pxdwsj2GA8i7rz7PrPbGqiby/jXAPv4ccKvQ
	Osg/nkMWGXEhJdiF/36EohO4qeH10Jh9QrgePHphdlYvmtsPsddKv0AEEPMfADb/rdRqg/nP/aVs7
	jMMBEK/b0XWN9pdzOxL6SGveHEJARY3BMuo4iiXqZszAwrQOqWun2cftqP8MvymJs7eICIcFaLceQ
	EcOC4SHKTtdDHzh1YmqgSKBtlCQ/miAOKSRD5k+hAos7aHrn661WQrZOlHac6yPkSxP4yVB447RFZ
	NngByf9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvTv-002jkI-4J; Mon, 09 Jan 2023 16:58:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvTr-002jhD-1m
	for linux-mediatek@bombadil.infradead.org; Mon, 09 Jan 2023 16:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DdPMItW0J1+1WKgUkqkf4uAqNSmGg8Y3wMzxtnCbEDs=; b=TxMZQJjMqb1hMJPIyLjx49GIHh
	801O9E4Aa4U14X2HwrWzPUwZNeAavxrfgNwtElTpPVjBQmezjR96SQO0oi/0cZpBWEU1t75WxDRqc
	mCkXmP8zmJ5Vd69dFWnp/FlLwjCrb6v93tKLm4IckCr0qbS6enwIiYsBXpx52mvr5IlORsnHz34jH
	KVaGXpKGglZx7UVULs/2jj0c9ItAQkJqH1/qdHAt9FQzx4sBUsQBStYYQ9z17rIhQeaiDb7b0f5xr
	WscooJ0C7nMa0BvXFH5WkSdIubqIqaGGS9jAEymr4DqV5Bg6YilXLxhjHL39kfKiydp0nkOKhcLuT
	nkTudOzA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEvTa-002ml5-07
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Jan 2023 16:58:26 +0000
X-UUID: 14de214c49ad494c947a6e3ab442c870-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DdPMItW0J1+1WKgUkqkf4uAqNSmGg8Y3wMzxtnCbEDs=;
	b=LXHe7aXLiaaG38qgiZNzqJg//PcV9KhuF/OoQUzLMHH1YACtK2sNGzrr58tVI4LVDByCxgzocAmy5zQYYGWkTNmWR4EoGZ2tyGQ3CVqfA98gKZfZJyU5oSEd1i1215TKZpulV9JbBvQ3enVR6Pv/wNiUCn6yinOJl8Kyx7LzBos=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:5bba0845-7559-47bf-b235-cabfa933c0bc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:5bba0845-7559-47bf-b235-cabfa933c0bc,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:52edbb8b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:2301100058119F6URA1U,BulkQuantity:0,Recheck:0,SF:28|17|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-BVR: 0
X-UUID: 14de214c49ad494c947a6e3ab442c870-20230109
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1469012381; Mon, 09 Jan 2023 09:58:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 00:58:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 00:58:06 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>
Subject: [PATCH 11/13] wifi: mt76: mt7996: add support for EHT rate report
Date: Tue, 10 Jan 2023 00:57:29 +0800
Message-ID: <20230109165731.682-12-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109165731.682-1-shayne.chen@mediatek.com>
References: <20230109165731.682-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_165822_565967_B85A4498 
X-CRM114-Status: GOOD (  12.04  )
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

Currenly only EHT TX rate report is supported. EHT RX rate is temporally
reported with HE rate.

Co-developed-by: MeiChia Chiu <meichia.chiu@mediatek.com>
Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7996/debugfs.c   |  8 ++---
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 34 ++++++++++++++++++-
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
index 3d4fbbbcc206..9c5e9ac1c335 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
@@ -791,10 +791,10 @@ static ssize_t mt7996_sta_fixed_rate_set(struct file *file,
 	else
 		buf[count] = '\0';
 
-	/* mode - cck: 0, ofdm: 1, ht: 2, gf: 3, vht: 4, he_su: 8, he_er: 9
-	 * bw - bw20: 0, bw40: 1, bw80: 2, bw160: 3
-	 * nss - vht: 1~4, he: 1~4, others: ignore
-	 * mcs - cck: 0~4, ofdm: 0~7, ht: 0~32, vht: 0~9, he_su: 0~11, he_er: 0~2
+	/* mode - cck: 0, ofdm: 1, ht: 2, gf: 3, vht: 4, he_su: 8, he_er: 9 EHT: 15
+	 * bw - bw20: 0, bw40: 1, bw80: 2, bw160: 3, BW320: 4
+	 * nss - vht: 1~4, he: 1~4, eht: 1~4, others: ignore
+	 * mcs - cck: 0~4, ofdm: 0~7, ht: 0~32, vht: 0~9, he_su: 0~11, he_er: 0~2, eht: 0~13
 	 * gi - (ht/vht) lgi: 0, sgi: 1; (he) 0.8us: 0, 1.6us: 1, 3.2us: 2
 	 * preamble - short: 1, long: 0
 	 * ldpc - off: 0, on: 1
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 31e6c48985d3..8f664c10f93b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -189,6 +189,9 @@ static void mt7996_mac_sta_poll(struct mt7996_dev *dev)
 		rate = &msta->wcid.rate;
 
 		switch (rate->bw) {
+		case RATE_INFO_BW_320:
+			bw = IEEE80211_STA_RX_BW_320;
+			break;
 		case RATE_INFO_BW_160:
 			bw = IEEE80211_STA_RX_BW_160;
 			break;
@@ -205,7 +208,11 @@ static void mt7996_mac_sta_poll(struct mt7996_dev *dev)
 
 		addr = mt7996_mac_wtbl_lmac_addr(dev, idx, 6);
 		val = mt76_rr(dev, addr);
-		if (rate->flags & RATE_INFO_FLAGS_HE_MCS) {
+		if (rate->flags & RATE_INFO_FLAGS_EHT_MCS) {
+			addr = mt7996_mac_wtbl_lmac_addr(dev, idx, 5);
+			val = mt76_rr(dev, addr);
+			rate->eht_gi = FIELD_GET(GENMASK(25, 24), val);
+		} else if (rate->flags & RATE_INFO_FLAGS_HE_MCS) {
 			u8 offs = 24 + 2 * bw;
 
 			rate->he_gi = (val & (0x3 << offs)) >> offs;
@@ -560,6 +567,15 @@ mt7996_mac_fill_rx_rate(struct mt7996_dev *dev,
 
 		status->he_dcm = dcm;
 		break;
+	case MT_PHY_TYPE_EHT_SU:
+	case MT_PHY_TYPE_EHT_TRIG:
+	case MT_PHY_TYPE_EHT_MU:
+		/* TODO: currently report rx rate with HE rate */
+		status->nss = nss;
+		status->encoding = RX_ENC_HE;
+		bw = min_t(int, bw, IEEE80211_STA_RX_BW_160);
+		i = min_t(int, i & 0xf, 11);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -584,6 +600,9 @@ mt7996_mac_fill_rx_rate(struct mt7996_dev *dev,
 	case IEEE80211_STA_RX_BW_160:
 		status->bw = RATE_INFO_BW_160;
 		break;
+	case IEEE80211_STA_RX_BW_320:
+		status->bw = RATE_INFO_BW_320;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1434,6 +1453,15 @@ mt7996_mac_add_txs_skb(struct mt7996_dev *dev, struct mt76_wcid *wcid, int pid,
 		rate.he_dcm = FIELD_GET(MT_TX_RATE_DCM, txrate);
 		rate.flags = RATE_INFO_FLAGS_HE_MCS;
 		break;
+	case MT_PHY_TYPE_EHT_SU:
+	case MT_PHY_TYPE_EHT_TRIG:
+	case MT_PHY_TYPE_EHT_MU:
+		if (rate.mcs > 13)
+			goto out;
+
+		rate.eht_gi = wcid->rate.eht_gi;
+		rate.flags = RATE_INFO_FLAGS_EHT_MCS;
+		break;
 	default:
 		goto out;
 	}
@@ -1441,6 +1469,10 @@ mt7996_mac_add_txs_skb(struct mt7996_dev *dev, struct mt76_wcid *wcid, int pid,
 	stats->tx_mode[mode]++;
 
 	switch (FIELD_GET(MT_TXS0_BW, txs)) {
+	case IEEE80211_STA_RX_BW_320:
+		rate.bw = RATE_INFO_BW_320;
+		stats->tx_bw[4]++;
+		break;
 	case IEEE80211_STA_RX_BW_160:
 		rate.bw = RATE_INFO_BW_160;
 		stats->tx_bw[3]++;
-- 
2.25.1


