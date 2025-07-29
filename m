Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A5AC87FC9
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jul 2025 08:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Y5w5r6aryaXhlJ7UqlVhhct1/3KeD8bUu52PUC3sHI=; b=1SS/QF7XHwZe+c/Fm1eFZnIQCH
	cqYl7JQvnTEiTo5cA0M3Kb4Fx7JIY55RReTRT7uFcSLXGm3q5FyzN89AYjvOrWjiZxaVt8hg/i10r
	F45fyUWuOK+d0o1bQ0lK7xDctapuU9vw4WnuXspmBO11R29h5tZx7oRytP5y+9Ayhso4sYkB9+1Eq
	KpI54Ph41/lUXRbIF76kZ8sSG+s+Vkqv/n3Fo2jDHe3pghSZis70BthMJBCKovYLzcPYwhF4wSmst
	FaXDUlzEROjr8CG98RqCK9J5HaLhx1xDZTt1+f1cEScvzGSp81NlPjv8k34blfF5AXyyAY2UqVB9O
	aj2beuDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggAf-0000000GJXQ-26T8;
	Tue, 29 Jul 2025 08:58:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugg1o-0000000GINf-3J6A
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Jul 2025 08:49:45 +0000
X-UUID: f604e2486c5811f09eb0dd999d3936bf-20250729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2Y5w5r6aryaXhlJ7UqlVhhct1/3KeD8bUu52PUC3sHI=;
	b=C8iio1i5iCZJahVyZQb8OtltZa4jCpzqp6PJ9BWVYen6NrP0EljmtirFa/tBzYP83s+MNPmce2AH/D/m5ZDGnwt3EqLOcD/DOURAB2DmCH2tW7ZS6JGObtwiVQeiuSwKM+ofJKZnndEuGIF2kWJ/lOFD97AIqAbhIRbPdWQ+GFU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:b8abecb5-3333-4d46-9a9a-6dbb007cd305,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:a913629a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f604e2486c5811f09eb0dd999d3936bf-20250729
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 814877668; Tue, 29 Jul 2025 01:49:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 29 Jul 2025 16:49:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 29 Jul 2025 16:49:35 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: add MBSSID support
Date: Tue, 29 Jul 2025 16:49:32 +0800
Message-ID: <20250729084932.264155-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_014944_849309_544FD242 
X-CRM114-Status: GOOD (  12.50  )
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

Enable MBSSID support for MT7925 by setting the
appropriate capability to the firmware.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 23 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  7 +++++-
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index d79efc8aa919..eed8d5ffaab0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -244,6 +244,7 @@ int mt7925_init_mlo_caps(struct mt792x_phy *phy)
 {
 	struct wiphy *wiphy = phy->mt76->hw->wiphy;
 	static const u8 ext_capa_sta[] = {
+		[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 		[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 	};
 	static struct wiphy_iftype_ext_capab ext_capab[] = {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 4fe67ef62cd7..7c7b6f066d53 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2879,6 +2879,25 @@ mt7925_mcu_bss_qos_tlv(struct sk_buff *skb, struct ieee80211_bss_conf *link_conf
 	qos->qos = link_conf->qos;
 }
 
+static void
+mt7925_mcu_bss_mbssid_tlv(struct sk_buff *skb, struct ieee80211_bss_conf *link_conf,
+			  bool enable)
+{
+	struct bss_info_uni_mbssid *mbssid;
+	struct tlv *tlv;
+
+	if (!enable && !link_conf->bssid_indicator)
+		return;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_11V_MBSSID,
+				      sizeof(*mbssid));
+
+	mbssid = (struct bss_info_uni_mbssid *)tlv;
+	mbssid->max_indicator = link_conf->bssid_indicator;
+	mbssid->mbss_idx = link_conf->bssid_index;
+	mbssid->tx_bss_omac_idx = 0;
+}
+
 static void
 mt7925_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_bss_conf *link_conf,
 		      struct mt792x_phy *phy)
@@ -3045,8 +3064,10 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 		mt7925_mcu_bss_color_tlv(skb, link_conf, enable);
 	}
 
-	if (enable)
+	if (enable) {
 		mt7925_mcu_bss_rlm_tlv(skb, phy->mt76, link_conf, ctx);
+		mt7925_mcu_bss_mbssid_tlv(skb, link_conf, enable);
+	}
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 81ab7b20aa64..eb4099021fcb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -697,8 +697,13 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
 	ieee80211_hw_set(hw, CONNECTION_MONITOR);
 	ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
-	if (is_mt7921(&dev->mt76))
+
+	if (is_mt7921(&dev->mt76)) {
 		ieee80211_hw_set(hw, CHANCTX_STA_CSA);
+	} else {
+		ieee80211_hw_set(hw, SUPPORTS_MULTI_BSSID);
+		ieee80211_hw_set(hw, SUPPORTS_ONLY_HE_MULTI_BSSID);
+	}
 
 	if (dev->pm.enable)
 		ieee80211_hw_set(hw, CONNECTION_MONITOR);
-- 
2.34.1


