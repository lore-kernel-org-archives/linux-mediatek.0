Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFB8ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fe5kXgrIZ2IAqtJZZy0J/San/kl1OX9abjcU8xs8rCs=; b=wrZmNb6gYrmCOqAEgzrZTjwilq
	7SPfhgMtWEMSDH8jecxKg1bX+BTPlCl4Lk1MnJ6pHppmHxR6hHhJj1K2UR11dDP1JdrSTOokNemKo
	9pkNnVkpX1+29o0WQyHQ5jNwlJTJ36H3B1MEDoomMCsm70QEbKH4UPY+NcjSd1KHouYts5fz3SQKt
	JImy2wxamDDWY0Q9o7zUxddi8IJ0vFVfq1Kll3x5FHlJmm3WCH1vtb/h+oMKw8nOV+KWSWByl2Bqu
	r/EmyRHm4JRu/cdzeDDmkG554qOXJx37N/5wS8teT0/Ic5zlhrDZO3uARk7jDG52+Je+sn7uD5MXg
	wLhbaNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omxcu-001jrf-F9; Mon, 24 Oct 2022 13:36:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omxcr-001jqI-PK
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 13:36:23 +0000
X-UUID: bcf9769e94bf4354997c6a1c483df5f7-20221024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fe5kXgrIZ2IAqtJZZy0J/San/kl1OX9abjcU8xs8rCs=;
	b=sIsFtw5mIpqMG35r1TEzCuXC1xdxxoLkVgfBTvKmnVUueppHvMyEv2x2iijRGtqziEPf7mpuwKD7+2Z9fnIPaudLNqqXO0Eqn6FYGT6x+gevqkrbIrGsDZDR6lmIZ6c/edkXyIVVu1TXJcvN8/JkM+Dg+xwUUYs+ZVcu4/nWFyU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:6df5a270-36da-487a-b38b-e90ab71b9b67,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:c1c07fe4-e572-4957-be22-d8f73f3158f9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: bcf9769e94bf4354997c6a1c483df5f7-20221024
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 489233850; Mon, 24 Oct 2022 06:36:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 24 Oct 2022 20:45:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 24 Oct 2022 20:45:32 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2] wifi: mt76: fix bandwidth 80MHz link fail in 6GHz band
Date: Mon, 24 Oct 2022 20:45:08 +0800
Message-ID: <85b5e8374fc9b86fb955060c1840f3b2a1d187e4.1666614616.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_063621_857729_BD3CA4C6 
X-CRM114-Status: GOOD (  11.79  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Due to information missing, the firmware may be fail on bandwidth
related settings in mt7921/mt7922. Add new cmd STA_REC_HE_V2 to apply
additional capabilities in 6GHz band.

Tested-by: Ben Greear <greearb@candelatech.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2: Fix le16/cpu type problem, reported by kernel test robot <lkp@intel.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 34 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 11 ++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 011fc9729b38..9bba18d24c71 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -744,6 +744,39 @@ mt76_connac_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 	he->pkt_ext = 2;
 }
 
+static void
+mt76_connac_mcu_sta_he_tlv_v2(struct sk_buff *skb, struct ieee80211_sta *sta)
+{
+	struct ieee80211_sta_he_cap *he_cap = &sta->deflink.he_cap;
+	struct ieee80211_he_cap_elem *elem = &he_cap->he_cap_elem;
+	struct sta_rec_he_v2 *he;
+	struct tlv *tlv;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_HE_V2, sizeof(*he));
+
+	he = (struct sta_rec_he_v2 *)tlv;
+	memcpy(he->he_phy_cap, elem->phy_cap_info, sizeof(he->he_phy_cap));
+	memcpy(he->he_mac_cap, elem->mac_cap_info, sizeof(he->he_mac_cap));
+
+	switch (sta->deflink.bandwidth) {
+	case IEEE80211_STA_RX_BW_160:
+		if (elem->phy_cap_info[0] &
+		    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G)
+			he->max_nss_mcs[CMD_HE_MCS_BW8080] =
+				he_cap->he_mcs_nss_supp.rx_mcs_80p80;
+
+		he->max_nss_mcs[CMD_HE_MCS_BW160] =
+				he_cap->he_mcs_nss_supp.rx_mcs_160;
+		fallthrough;
+	default:
+		he->max_nss_mcs[CMD_HE_MCS_BW80] =
+				he_cap->he_mcs_nss_supp.rx_mcs_80;
+		break;
+	}
+
+	he->pkt_ext = IEEE80211_HE_PHY_CAP9_NOMINAL_PKT_PADDING_16US;
+}
+
 static u8
 mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 			    enum nl80211_band band, struct ieee80211_sta *sta)
@@ -838,6 +871,7 @@ void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 	/* starec he */
 	if (sta->deflink.he_cap.has_he) {
 		mt76_connac_mcu_sta_he_tlv(skb, sta);
+		mt76_connac_mcu_sta_he_tlv_v2(skb, sta);
 		if (band == NL80211_BAND_6GHZ &&
 		    sta_state == MT76_STA_INFO_STATE_ASSOC) {
 			struct sta_rec_he_6g_capa *he_6g_capa;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index cf4ce3b1fc21..8166722d4717 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -354,6 +354,16 @@ struct sta_rec_he {
 	u8 rsv2[2];
 } __packed;
 
+struct sta_rec_he_v2 {
+	__le16 tag;
+	__le16 len;
+	u8 he_mac_cap[6];
+	u8 he_phy_cap[11];
+	u8 pkt_ext;
+	/* 0: BW80, 1: BW160, 2: BW8080 */
+	__le16 max_nss_mcs[CMD_HE_MCS_BW_NUM];
+} __packed;
+
 struct sta_rec_amsdu {
 	__le16 tag;
 	__le16 len;
@@ -779,6 +789,7 @@ enum {
 	STA_REC_BFEE,
 	STA_REC_PHY = 0x15,
 	STA_REC_HE_6G = 0x17,
+	STA_REC_HE_V2 = 0x19,
 	STA_REC_MAX_NUM
 };
 
-- 
2.18.0


