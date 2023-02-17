Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261E2C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMcnGa3U3EjcvxM880Qvd1d5nOYqaSAgka7dmP9myKc=; b=kuoghNVcJf8VFE1kg9Q6kbuJHE
	ArHmXvQxq9+iYcliCwpUk6G3FTQTsL33x446oiO6qZ4QFJBtScv/hj+M0dKeFlTcHZmWVrHshfuTe
	mW5Tmrm45uSP+1uO//ThuG1DKJ29Vywt4vUFJ7p4vQyrRJZFCYf/iXoGMnpM35Ahh6yt8z0T1dUPh
	JzYwfxzCa15xrSJApDzRAfztUf06vpQY5fTk4k+aSJOnn/fvLL2aBKPfQFgrE4CHyMl/eBUgA43w3
	1yV7CvV0gg3vgtMlYeIR9/6418chbyCXwaVv6r7kjWdEuRmlqJDqxSsQehOlLsstC1VJXNqjPOmBR
	+xOtkKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT52O-00FLLS-NS; Fri, 17 Feb 2023 18:00:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT52M-00FLL7-6w
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 18:00:47 +0000
X-UUID: fedf5a32aeec11eda08d4d6090ec5a5c-20230217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tMcnGa3U3EjcvxM880Qvd1d5nOYqaSAgka7dmP9myKc=;
	b=WEi/DBXKJrHh0AzL8dx9hhwjl49XJ3Uughqb7CVjBLXE14ZOydMNy891uCbnetVJLe4rfk+L1KraNR6FY78fWRfCsGWrlw7MrBpPkfyN0OrUSu7GenmZuGc07wH5lkeaR27OrAqVduhveRzTmr04buWXxc5U+RWP4Po36p+XAo0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:e222db68-6b34-420b-adc1-5e2a77167a90,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:9ac858f3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: fedf5a32aeec11eda08d4d6090ec5a5c-20230217
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 17977381; Fri, 17 Feb 2023 11:00:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 18 Feb 2023 01:50:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 18 Feb 2023 01:50:39 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: connac: refresh tx session timer for WED device
Date: Sat, 18 Feb 2023 01:50:38 +0800
Message-ID: <63513d0d570ddfda327714ff15bbf9de7b31c8ce.1676616450.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <7c3f72eac1c34921cd84a462e60d71e125862152.1676616450.git.ryder.lee@mediatek.com>
References: <7c3f72eac1c34921cd84a462e60d71e125862152.1676616450.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_100046_298195_90F075DA 
X-CRM114-Status: UNSURE (   9.87  )
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

There's no keep-alive packet being received by mac80211 stack when WED
is enabled, which leads to tx BA session timeout. This patch calls
ieee80211_refresh_tx_agg_session_timer() to refresh timer according
to tx status reporting.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index aed4ee95fb2e..8d316d3aab8f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -582,6 +582,17 @@ bool mt76_connac2_mac_fill_txs(struct mt76_dev *dev, struct mt76_wcid *wcid,
 			le32_get_bits(txs_data[6], MT_TXS6_MPDU_FAIL_CNT);
 		stats->tx_retries +=
 			le32_get_bits(txs_data[7], MT_TXS7_MPDU_RETRY_CNT);
+
+		if (wcid->sta) {
+			struct ieee80211_sta *sta;
+			u8 tid;
+
+			sta = container_of((void *)wcid, struct ieee80211_sta,
+					   drv_priv);
+			tid = FIELD_GET(MT_TXS0_TID, txs);
+
+			ieee80211_refresh_tx_agg_session_timer(sta, tid);
+		}
 	}
 
 	txrate = FIELD_GET(MT_TXS0_TX_RATE, txs);
-- 
2.18.0


