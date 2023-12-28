Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7541EC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 09:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcXnCe2GxhdKsTo3t99vWikpDZzl4UTFFwX5mWnPJyI=; b=nLHFy7exCjoIwVmD5ZsorAhws8
	3ZkUrnMTSt8oc+WCv5Y22/2puRBpaL75xP/BGEpOXtXqCrs0QmztnBtmEsyGG4+sTvoJf0oXKMayl
	Vh2W267ZTVTtWZCFM/BXqTd5QNYgsdcymE/ENwpz1fm1N+Sd9U6Q2hptkUJg5SLjq+QMFCrkrXUTC
	SGahQDQBAnvxwotw3IAeeXBTc7JKJ8WBrUJF6z38ippAlwYmSJ+ixcuH5cKsP2i+QabPuaH8u2gUG
	tjSjEEtUeAROKr1jSCmUyHyrH6cdVfTo4hCRkiJdxyWAeP0NjFRZ1Nv2CYsi9SRFGX30W2lJHopEa
	HmArliTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rImNR-00GShj-1U;
	Thu, 28 Dec 2023 09:08:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rImNO-00GShN-2V
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Dec 2023 09:08:28 +0000
X-UUID: a7f6d608a56011eeafd70d0b34820190-20231228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kcXnCe2GxhdKsTo3t99vWikpDZzl4UTFFwX5mWnPJyI=;
	b=AcTbwKycF9LfENTcdkOzE3799hqPc4YwdVNcAfJffPaUciqiPQDvDr3vhZg8VSvWSnV35Qf3BZI+smsUYmL2o+4CAkKtAdG+DOYX2xLdc8Gy/jc9JFtrhA6TADRf1Mm7tbCUHLwLpXf+Vq5kKvyuE4eiLUWhHKB/GpNT5x+MAfg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:5362bd68-dff4-41dc-92fe-0331917de935,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:a7964282-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a7f6d608a56011eeafd70d0b34820190-20231228
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1689670936; Thu, 28 Dec 2023 02:08:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Dec 2023 17:07:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Dec 2023 17:07:51 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, rong.yan <rong.yan@mediatek.com>, "Ming
 Yen Hsieh" <mingyen.hsieh@mediatek.com>
Subject: [PATCH 02/10] wifi: mt76: mt7925: fix SAP no beacon issue in 5Ghz and 6Ghz band
Date: Thu, 28 Dec 2023 17:07:41 +0800
Message-ID: <20231228090749.15191-3-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231228090749.15191-1-mingyen.hsieh@mediatek.com>
References: <20231228090749.15191-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.252400-8.000000
X-TMASE-MatchedRID: 4YoTATPIqSyz4qmxBSXJhZyBsp6+TmyGWjWsWQUWzVoFi3R9x/2qQgvQ
	UzpmNOPwN+23Pcx1Dm5+dfwnt/TnE8637+A5hpnFkDpLRKO9xhRYN1akkye0qLVhTD1Udgq8PJI
	EzMAuYxaTZwIgzmiejcpjK4dbPxs8HxPMjOKY7A8LbigRnpKlKTpcQTtiHDgW1vTNtV9+GseF5j
	MPxiSy3NxfLX5S1toTfCeU+nlQdBWbZtrN0+RWmQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.252400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A1AED0E5514F3B5CEC45E4AA7B1E3297B179BB30C9C112E36CAF9A2B74231F372000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_010826_822552_2CDF6FD4 
X-CRM114-Status: UNSURE (   9.60  )
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

From: "rong.yan" <rong.yan@mediatek.com>

Driver should configure basic rate and phy mode for SAP mode.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: rong.yan <rong.yan@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h    |  3 +++
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c     | 13 ++++++++++---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.h     |  3 ++-
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index ae6d0179727d..db96ddbeb9e7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -935,6 +935,9 @@ enum {
 	PHY_TYPE_INDEX_NUM
 };
 
+#define HR_DSSS_ERP_BASIC_RATE			GENMASK(3, 0)
+#define OFDM_BASIC_RATE				(BIT(6) | BIT(8) | BIT(10))
+
 #define PHY_TYPE_BIT_HR_DSSS			BIT(PHY_TYPE_HR_DSSS_INDEX)
 #define PHY_TYPE_BIT_ERP			BIT(PHY_TYPE_ERP_INDEX)
 #define PHY_TYPE_BIT_OFDM			BIT(PHY_TYPE_OFDM_INDEX)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 1fc9ecb96bc4..9a8db9b1a4f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2047,9 +2047,9 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 	struct cfg80211_chan_def *chandef = ctx ? &ctx->def : &phy->chandef;
 	enum nl80211_band band = chandef->chan->band;
 	struct mt76_connac_bss_basic_tlv *basic_req;
-	u8 idx, basic_phy;
 	struct tlv *tlv;
 	int conn_type;
+	u8 idx;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_BASIC, sizeof(*basic_req));
 	basic_req = (struct mt76_connac_bss_basic_tlv *)tlv;
@@ -2060,8 +2060,10 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 
 	basic_req->phymode_ext = mt7925_get_phy_mode_ext(phy, vif, band, sta);
 
-	basic_phy = mt76_connac_get_phy_mode_v2(phy, vif, band, sta);
-	basic_req->nonht_basic_phy = cpu_to_le16(basic_phy);
+	if (band == NL80211_BAND_2GHZ)
+		basic_req->nonht_basic_phy = cpu_to_le16(PHY_TYPE_ERP_INDEX);
+	else
+		basic_req->nonht_basic_phy = cpu_to_le16(PHY_TYPE_OFDM_INDEX);
 
 	memcpy(basic_req->bssid, vif->bss_conf.bssid, ETH_ALEN);
 	basic_req->phymode = mt76_connac_get_phy_mode(phy, vif, band, sta);
@@ -2165,6 +2167,11 @@ mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 
 	bmc = (struct bss_rate_tlv *)tlv;
 
+	if (band == NL80211_BAND_2GHZ)
+		bmc->basic_rate = cpu_to_le16(HR_DSSS_ERP_BASIC_RATE);
+	else
+		bmc->basic_rate = cpu_to_le16(OFDM_BASIC_RATE);
+
 	bmc->short_preamble = (band == NL80211_BAND_2GHZ);
 	bmc->bc_fixed_rate = idx;
 	bmc->mc_fixed_rate = idx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 3c41e21303b1..0218fd2a0eb0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -334,7 +334,8 @@ struct bss_req_hdr {
 struct bss_rate_tlv {
 	__le16 tag;
 	__le16 len;
-	u8 __rsv1[4];
+	u8 __rsv1[2];
+	__le16 basic_rate;
 	__le16 bc_trans;
 	__le16 mc_trans;
 	u8 short_preamble;
-- 
2.18.0


