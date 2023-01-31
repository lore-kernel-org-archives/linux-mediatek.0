Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7F3C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 09:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hujgxv3dju9uJu1PuoEEmecY0FaFk78aEsFqKQ3slGw=; b=1raXXVyDuAjU7Vgf284IdSG37d
	ux1j9f9X2NfnBKT9Io8wvlqjVoWno6GMJZoASZvBqOfypt5AG4+f6anrgYRdEpWXAldBtfw0agFDh
	fECmVgJc6tCynRGwX9Ti0BqyFiSTZo2iiUrx/jpXFfj4PdK6o3hNKPfPKVsjCnik/o/+f8nnSmku7
	3PCRIyp17XvQ/v0tgc8zXQinaXwCaaunXfIPs+QRcPzFp67+wSCXT0NTk1y+RyYEvGwPFfGTLFbYP
	CFNiGvAivli+ZyzuPjiEXhGsmaSen+WtEBqrKVsDvAuVYeIP5gbb+XDbeDReMXCdA8XcUxgEmuh6Z
	dd4VuYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMn5N-0073bi-RM; Tue, 31 Jan 2023 09:37:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMn58-0073Uk-HK
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 09:37:42 +0000
X-UUID: e3fe9a52a14a11edbbe3f76fe852e059-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hujgxv3dju9uJu1PuoEEmecY0FaFk78aEsFqKQ3slGw=;
	b=bT00wIHxks/uPhKBB15d12Re7tRMmfx/FmEQnItNy3ykn5VQIQBIzo4R+Abiiqym/PvO5d1SyOG3wxO6jeECtW2etMLJBNGjMkadaYMx7eKnb2Biqe4Al3oRvGzlzzoVFKU0iScHdDraIYB8Cp26dOvvjMMO7eeGYdObmWgY/uw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:4e8f5c24-7225-4b84-993c-2d8baa1afa2e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.18,REQID:4e8f5c24-7225-4b84-993c-2d8baa1afa2e,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:3ca2d6b,CLOUDID:036cda55-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230131173633R07UG1JY,BulkQuantity:3,Recheck:0,SF:29|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: e3fe9a52a14a11edbbe3f76fe852e059-20230131
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 294797915; Tue, 31 Jan 2023 02:37:34 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 31 Jan 2023 17:36:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 17:36:30 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>
Subject: [PATCH v2 11/13] wifi: mt76: mt7996: add support for EHT rate report
Date: Tue, 31 Jan 2023 17:36:09 +0800
Message-ID: <20230131093611.30914-12-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230131093611.30914-1-shayne.chen@mediatek.com>
References: <20230131093611.30914-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_013738_667596_2C01EEA4 
X-CRM114-Status: GOOD (  12.60  )
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
index bdc54ff74311..edea96f60f1e 100644
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


