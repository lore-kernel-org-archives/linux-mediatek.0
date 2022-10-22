Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5888C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 03:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BIXoU9wDrHq2lnlqdcGGlcZYQhKTdhujkyo9PoidRpc=; b=akKZsgTha0L+YF+W+Ixa1kcTjR
	/B6tXg8nJ+ltbPP770X5Ge5V62o7eNeeklMNkRQLn63rsGXWSw9SBrDSSFEGzbRYmJSFZQKRtXJoy
	BbjljVS5qNYULtDyggPWbXAG1W2Kp5CTY/Jz+dxYwoW6JMljo29VS3QUfVzyjueufV1RHlu0N6UYe
	aYItOrYryZ1SBcnQe7lSaGldqbPKpn1hrdI3TgKLmyhmDvshmtbqoQ3QCze+PV7PvoXmyVHuU0fpF
	lIuHkg8En4VTB3Du/U/lPOeIf+zoEdHI1giGwY8cMQW9MwSgYaY3nedzeqtfu78qtQf8qzdrCUIJR
	OnxVEuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om5Ob-00AyIg-1h; Sat, 22 Oct 2022 03:42:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om5OY-00AyGs-GV
	for linux-mediatek@lists.infradead.org; Sat, 22 Oct 2022 03:42:00 +0000
X-UUID: 9402eb26e779477eadc739e94c1d9310-20221021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BIXoU9wDrHq2lnlqdcGGlcZYQhKTdhujkyo9PoidRpc=;
	b=Q6J1ChtxeSsh2uLz7kDqik3CX/CsGu6w4f1bK82lO3jc2+c5sAifLjwJjrP7JURfRahjU8DuDCPLhU18Q+vcSVcWBetoSLNuZFQLHXpK8cmAJPy0eixDIx5mCEHh9nWvoxqPPWq45m6DEO5sWiHvj1ydeL5ywljzO/KIxRXfnvM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:2930371d-c40a-4b64-82ff-70a274990025,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:290c54c8-03ab-4171-989e-341ab5339257,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9402eb26e779477eadc739e94c1d9310-20221021
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 700635976; Fri, 21 Oct 2022 20:41:47 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 22 Oct 2022 11:21:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 22 Oct 2022 11:21:44 +0800
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
Subject: [PATCH] wifi: mt76: fix bandwidth 80MHz link fail in 6GHz band
Date: Sat, 22 Oct 2022 11:21:19 +0800
Message-ID: <7f10cced1976b40f0aeafc281ead0652a54ec718.1666408187.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_204158_586381_C889A27A 
X-CRM114-Status: GOOD (  12.98  )
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
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 38 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 11 ++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 011fc9729b38..cdfc0b0da823 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -744,6 +744,43 @@ mt76_connac_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 	he->pkt_ext = 2;
 }
 
+static void
+mt76_connac_mcu_sta_he_tlv_v2(struct sk_buff *skb, struct ieee80211_sta *sta)
+{
+	struct ieee80211_sta_he_cap *he_cap = &sta->deflink.he_cap;
+	struct ieee80211_he_cap_elem *elem = &he_cap->he_cap_elem;
+	struct sta_rec_he_v2 *he;
+	struct tlv *tlv;
+	int i;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_HE_V2, sizeof(*he));
+
+	he = (struct sta_rec_he_v2 *)tlv;
+	for (i = 0; i < ARRAY_SIZE(he->he_phy_cap); i++)
+		he->he_phy_cap[i] = cpu_to_le16(elem->phy_cap_info[i]);
+
+	for (i = 0; i < ARRAY_SIZE(he->he_mac_cap); i++)
+		he->he_mac_cap[i] = cpu_to_le16(elem->mac_cap_info[i]);
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
@@ -838,6 +875,7 @@ void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
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


