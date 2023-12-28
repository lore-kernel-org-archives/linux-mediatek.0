Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE54C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3j0KPmuxFNfOwXFU0PgQ0LymDMyyddd8H3gb0gqj4w=; b=PM76FfOvsbSwO8Ircu9YuRciJV
	S50RRACRmGuu4jhZWUaqVaq7YlOV0VdKueEzH9GO7PBa0CkLRTpPkptCzHKxCK0avikS0bHz+0NPs
	/LF5vMxLrBcEuLR/6b1GF6YO1ow5VtDitTonsGf34KPQc0CsDp9Os2fdbPlG2qp6aXNFqWp20Xvml
	6Cjxa4jz2GrOOIuSx6yvFWmRh+MEm5MX4K8ugzoEqDgyPbmbRKmXPAwQanKXtr17jpQ24DSQcLPBr
	NX6w3vO7k4z0X7Xz/ITwOYw6/wxAyJydifyQL3A1ry7ojr/Yf/KxnvaR4zQCc7CVKqj18K0C2dnaO
	vbxWNIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rImNy-00GSou-28;
	Thu, 28 Dec 2023 09:09:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rImNv-00GSoW-2V
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Dec 2023 09:09:01 +0000
X-UUID: ba0fa8d8a56011eeafd70d0b34820190-20231228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Y3j0KPmuxFNfOwXFU0PgQ0LymDMyyddd8H3gb0gqj4w=;
	b=gbnBU90H+CfQv8T/Z0133mrPpc0J+cSPacYdayAxBJ5tSJmNsxVBvk4muMigI6OpxEx9Hnl+PkX2bLh9L3JeOaZkNBmsOqvsKPZ4x+k7e4JIdzfXAKXorfqmH5colrVTklPJRsGzCI/HxjCxGqqBlEi7gGBweuNgy8cSx/W6PMA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:fd4152a3-2d62-428f-b726-0aaec08b21e7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:6c7fa98d-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ba0fa8d8a56011eeafd70d0b34820190-20231228
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1398429481; Thu, 28 Dec 2023 02:08:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Dec 2023 17:07:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Dec 2023 17:07:52 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 09/10] wifi: mt76: mt7925: add support to set ifs time by mcu command
Date: Thu, 28 Dec 2023 17:07:48 +0800
Message-ID: <20231228090749.15191-10-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231228090749.15191-1-mingyen.hsieh@mediatek.com>
References: <20231228090749.15191-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_010859_841887_F6EEB51E 
X-CRM114-Status: GOOD (  12.33  )
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

There's a race between driver and fw on some tx/rx control registers
when setting ifs, which will cause accidental hw queue pause problems.
Avoid this by setting ifs time with bss_info mcu command.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 33 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 19 +++++++++++
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 96c3302fdc53..c7f611977078 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -711,7 +711,7 @@ static void mt7925_bss_info_changed(struct ieee80211_hw *hw,
 
 		if (slottime != phy->slottime) {
 			phy->slottime = slottime;
-			mt792x_mac_set_timeing(phy);
+			mt7925_mcu_set_timing(phy, vif);
 		}
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 932ecf38672c..e1dd89a7a79c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2244,6 +2244,38 @@ mt7925_mcu_bss_color_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 		vif->bss_conf.he_bss_color.color : 0;
 }
 
+static void
+mt7925_mcu_bss_ifs_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_phy *phy = mvif->phy;
+	struct bss_ifs_time_tlv *ifs_time;
+	struct tlv *tlv;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_IFS_TIME, sizeof(*ifs_time));
+	ifs_time = (struct bss_ifs_time_tlv *)tlv;
+	ifs_time->slot_valid = true;
+	ifs_time->slot_time = cpu_to_le16(phy->slottime);
+}
+
+int mt7925_mcu_set_timing(struct mt792x_phy *phy,
+			  struct ieee80211_vif *vif)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_dev *dev = phy->dev;
+	struct sk_buff *skb;
+
+	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mvif->mt76,
+					 MT7925_BSS_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	mt7925_mcu_bss_ifs_tlv(skb, vif);
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
+}
+
 int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    struct ieee80211_chanctx_conf *ctx,
 			    struct ieee80211_vif *vif,
@@ -2268,6 +2300,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, vif, sta);
 	mt7925_mcu_bss_qos_tlv(skb, vif);
 	mt7925_mcu_bss_mld_tlv(skb, vif, sta);
+	mt7925_mcu_bss_ifs_tlv(skb, vif);
 
 	if (vif->bss_conf.he_support) {
 		mt7925_mcu_bss_he_tlv(skb, vif, phy);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 9fce054e5065..2cf39276118e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -440,6 +440,22 @@ struct sta_rec_mld {
 	} __packed link[2];
 } __packed;
 
+struct bss_ifs_time_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 slot_valid;
+	u8 sifs_valid;
+	u8 rifs_valid;
+	u8 eifs_valid;
+	__le16 slot_time;
+	__le16 sifs_time;
+	__le16 rifs_time;
+	__le16 eifs_time;
+	u8 eifs_cck_valid;
+	u8 rsv;
+	__le16 eifs_cck_time;
+} __packed;
+
 #define MT7925_STA_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +		\
 					 sizeof(struct sta_rec_basic) +		\
 					 sizeof(struct sta_rec_bf) +		\
@@ -467,6 +483,7 @@ struct sta_rec_mld {
 					 sizeof(struct bss_mld_tlv) +			\
 					 sizeof(struct bss_info_uni_he) +		\
 					 sizeof(struct bss_info_uni_bss_color) +	\
+					 sizeof(struct bss_ifs_time_tlv) +		\
 					 sizeof(struct tlv))
 
 #define MT_CONNAC3_SKU_POWER_LIMIT      449
@@ -564,6 +581,8 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta,
 			    int enable);
+int mt7925_mcu_set_timing(struct mt792x_phy *phy,
+			  struct ieee80211_vif *vif);
 int mt7925_mcu_set_deep_sleep(struct mt792x_dev *dev, bool enable);
 int mt7925_mcu_set_channel_domain(struct mt76_phy *phy);
 int mt7925_mcu_set_radio_en(struct mt792x_phy *phy, bool enable);
-- 
2.18.0


