Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0D2C36011
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Mar 2025 09:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KHqToERv4Tac/mm0zbgftvUdTtlwe0Vgt811wXQWxJA=; b=BTkq2c8kJuOoMXJo/9BZ8tKldQ
	rxAhC3+scm3r3S5ytzlgH/1NrZhwcpUkgDqcnySaGNVUGV8j+yTcIk6nx2YZ+L+g6NLiaD6e4F69L
	nfTw4034FF8OH3M6eycAAgtuECAP/VQJcblkKCOKMYA1diS82UxOJReEDBrqFgsgidFwsqCxms9Ak
	4l/EtIZCy3NfDtoYxgjPK91Uddg7N5IuOILJvJOez7rRsJtPuvzCzKYWXOJATyiIQ3OiIxmxYcvc7
	KdjXFgLrBi9yD/lO0gy83R/NNqDAQRAU0Q9x+eu2JDS4DSeF47bsoLVuVB9apweV1jRQIueoPqKyZ
	Z3p9cY1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBHP-0000000HUWz-0JGb;
	Mon, 31 Mar 2025 09:18:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBHM-0000000HUVk-1xmQ
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Mar 2025 09:18:01 +0000
X-UUID: 07737e960e1111f0a1e849db4cc18d44-20250331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KHqToERv4Tac/mm0zbgftvUdTtlwe0Vgt811wXQWxJA=;
	b=lwgvSqGUYAexeXfi4lCm+52S1LIuLdxAYy8ULhA19qQS8NII+DW+kEvdyP5Q16hquezoJGx2rLeDMw8Bpk33lnvUaNEAL9qPjd9Iaw3Fyc2306VcA9Lcakd+aQ7A59sn+Qsv259NLYvVGnPCvj/nMqRMZlOmaHtQARxLYVIwqeY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c07c4ee5-021c-44ae-b1eb-044503355aa3,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:8412c54a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 07737e960e1111f0a1e849db4cc18d44-20250331
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <allan.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2088791256; Mon, 31 Mar 2025 02:17:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 31 Mar 2025 17:17:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 31 Mar 2025 17:17:52 +0800
From: Allan Wang <allan.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <mingyen.hsieh@mediatek.com>,
	<Sean.Wang@mediatek.com>, <Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allan Wang <allan.wang@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: add EHT preamble puncturing
Date: Mon, 31 Mar 2025 17:17:47 +0800
Message-ID: <20250331091747.2592021-1-allan.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_021800_517385_4D104E00 
X-CRM114-Status: GOOD (  11.91  )
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

Add mt7925 EHT preamble puncturing.

Signed-off-by: Allan Wang <allan.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 10 ++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 34 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 16 +++++++++
 4 files changed, 61 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 43237e518373..e57287a9e41d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1369,6 +1369,7 @@ enum {
 	UNI_BSS_INFO_OFFLOAD = 25,
 	UNI_BSS_INFO_MLD = 26,
 	UNI_BSS_INFO_PM_DISABLE = 27,
+	UNI_BSS_INFO_EHT = 30,
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index e79364ac129e..83f93f9e002c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1865,6 +1865,10 @@ mt7925_change_chanctx(struct ieee80211_hw *hw,
 			link_conf = mt792x_vif_to_bss_conf(vif, mconf->link_id);
 			mt7925_mcu_set_chctx(mvif->phy->mt76, &mconf->mt76,
 					     link_conf, ctx);
+
+			if (changed & IEEE80211_CHANCTX_CHANGE_PUNCTURING)
+				mt7925_mcu_set_eht_pp(mvif->phy->mt76, &mconf->mt76,
+						      link_conf, ctx);
 		}
 	}
 
@@ -1954,8 +1958,10 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_bss_conf *mconf;
+	struct ieee80211_bss_conf *link_conf;
 
 	mconf = mt792x_vif_to_link(mvif, info->link_id);
+	link_conf = mt792x_vif_to_bss_conf(vif, mconf->link_id);
 
 	mt792x_mutex_acquire(dev);
 
@@ -1997,6 +2003,10 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 		mvif->mlo_pm_state = MT792x_MLO_CHANGED_PS;
 	}
 
+	if (changed & IEEE80211_CHANCTX_CHANGE_PUNCTURING)
+		mt7925_mcu_set_eht_pp(mvif->phy->mt76, &mconf->mt76,
+				      link_conf, NULL);
+
 	mt792x_mutex_release(dev);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e61da76b2097..46f7e30232d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2298,6 +2298,40 @@ __mt7925_mcu_alloc_bss_req(struct mt76_dev *dev, struct mt76_vif_link *mvif, int
 	return skb;
 }
 
+static
+void mt7925_mcu_bss_eht_tlv(struct sk_buff *skb, struct mt76_phy *phy,
+			    struct ieee80211_bss_conf *link_conf,
+			    struct ieee80211_chanctx_conf *ctx)
+{
+	struct cfg80211_chan_def *chandef = ctx ? &ctx->def :
+						  &link_conf->chanreq.oper;
+
+	struct bss_eht_tlv *req;
+	struct tlv *tlv;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_EHT, sizeof(*req));
+	req = (struct bss_eht_tlv *)tlv;
+	req->is_eth_dscb_present = chandef->punctured ? 1 : 0;
+	req->eht_dis_sub_chan_bitmap = chandef->punctured;
+}
+
+int mt7925_mcu_set_eht_pp(struct mt76_phy *phy, struct mt76_vif_link *mvif,
+			  struct ieee80211_bss_conf *link_conf,
+			  struct ieee80211_chanctx_conf *ctx)
+{
+	struct sk_buff *skb;
+
+	skb = __mt7925_mcu_alloc_bss_req(phy->dev, mvif,
+					 MT7925_BSS_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	mt7925_mcu_bss_eht_tlv(skb, phy, link_conf, ctx);
+
+	return mt76_mcu_skb_send_msg(phy->dev, skb,
+				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
+}
+
 int mt7925_mcu_set_chctx(struct mt76_phy *phy, struct mt76_vif_link *mvif,
 			 struct ieee80211_bss_conf *link_conf,
 			 struct ieee80211_chanctx_conf *ctx)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 8ac43feb26d6..d55ea59bda7d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -372,6 +372,19 @@ struct bss_mld_tlv {
 	u8 __rsv[3];
 } __packed;
 
+struct bss_eht_tlv {
+	__le16 tag;
+	__le16 len;
+	u8  is_eht_op_present;
+	u8  is_eth_dscb_present;
+	u8  eht_ctrl;
+	u8  eht_ccfs0;
+	u8  eht_ccfs1;
+	u8  pad1;
+	__le16 eht_dis_sub_chan_bitmap;
+	u8  pad2[4];
+} __packed;
+
 struct sta_rec_ba_uni {
 	__le16 tag;
 	__le16 len;
@@ -642,6 +655,9 @@ int mt7925_mcu_set_radio_en(struct mt792x_phy *phy, bool enable);
 int mt7925_mcu_set_chctx(struct mt76_phy *phy, struct mt76_vif_link *mvif,
 			 struct ieee80211_bss_conf *link_conf,
 			 struct ieee80211_chanctx_conf *ctx);
+int mt7925_mcu_set_eht_pp(struct mt76_phy *phy, struct mt76_vif_link *mvif,
+			  struct ieee80211_bss_conf *link_conf,
+			  struct ieee80211_chanctx_conf *ctx);
 int mt7925_mcu_set_rate_txpower(struct mt76_phy *phy);
 int mt7925_mcu_update_arp_filter(struct mt76_dev *dev,
 				 struct ieee80211_bss_conf *link_conf);
-- 
2.45.2


