Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24637CE8D5D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 08:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a6TusFy2ir91gPNlwrF+20GciCGq3HpbhHGPX9zl1lg=; b=RrZT4Gm3zVUqh8dnNv/6IgI3V/
	mw4G7lNcvCxX81RULUXXhd7GG+BY+F8k9CDcfY3+cWl8iny3D7i0bwJfMJyImEZq6Y09gOMvUIDAk
	GbuSvhnSzlgCUiKuSkUuN0YA//fsh7zUgY9cR8TmsuyVQR3NjSD3maVyxvmotLJV0cgxhGrNJnoWW
	352Weh3ekbht0j+poH8mFlVHemTExfdVBlrXHe/ixvfTr0q5xm6IsPKT9eoT9mEeNGfEOLuVFMCPi
	PGphndLr2qPh/0iuG0UHm+xZcFV+tpcFiUKxLc3QR2qV7fIK6KPA1FBsn5TwwuM5a/wcKRbVSv0Ov
	Dp7B24Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srCLt-00000009lEn-21j1;
	Thu, 19 Sep 2024 08:17:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srCLq-00000009lDw-0wWQ
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Sep 2024 08:17:23 +0000
X-UUID: 959dabdc765f11efba0aef63c0775dbf-20240919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=a6TusFy2ir91gPNlwrF+20GciCGq3HpbhHGPX9zl1lg=;
	b=uPRdmkOKdYGlQQceGVXt70X5GG5o/kQIVJ+5KAOXBJ3ELed9K7CumuPO8u0qmd6JEmJx0wVCWf/JmUO6EfHS3eo5GVnGqyr+IG+1QEJ/qk06b9Sge5YCFLUkS8iOHzp4jKpOfZlybT4lUW/jQiO0R/7c/VtLKZdTz8EGIVqkOJc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a95b2342-18dd-479c-8eb8-71be0baf8f8d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:eb02ec17-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 959dabdc765f11efba0aef63c0775dbf-20240919
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1549618417; Thu, 19 Sep 2024 01:17:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Sep 2024 16:17:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Sep 2024 16:17:15 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Hao Zhang
	<hao.zhang.mediatek@gmail.com>, "allan . wang" <allan.wang@mediatek.com>,
	Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt792x: add P2P_DEVICE support
Date: Thu, 19 Sep 2024 16:17:13 +0800
Message-ID: <20240919081713.23787-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_011722_621062_7169CC1D 
X-CRM114-Status: GOOD (  11.75  )
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

From: Hao Zhang <hao.zhang.mediatek@gmail.com>

Regist the NL80211_IFTYPE_P2P_DEVICE to support p2p device
for mt792x chips

Signed-off-by: Hao Zhang <hao.zhang.mediatek@gmail.com>
Signed-off-by: allan.wang <allan.wang@mediatek.com>
Signed-off-by: Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 3 +++
 drivers/net/wireless/mediatek/mt76/mt792x_core.c     | 9 +++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 864246f94088..77f3e92d581a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1202,6 +1202,9 @@ int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 	case NL80211_IFTYPE_STATION:
 		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_INFRA_STA);
 		break;
+	case NL80211_IFTYPE_P2P_DEVICE:
+		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_P2P_GO);
+		break;
 	case NL80211_IFTYPE_ADHOC:
 		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 78fe37c2e07b..042aa8d1b6e7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -38,6 +38,10 @@ static const struct ieee80211_iface_limit if_limits_chanctx[] = {
 		.max = 1,
 		.types = BIT(NL80211_IFTYPE_AP) |
 			 BIT(NL80211_IFTYPE_P2P_GO)
+	},
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_P2P_DEVICE)
 	}
 };
 
@@ -45,7 +49,7 @@ static const struct ieee80211_iface_combination if_comb_chanctx[] = {
 	{
 		.limits = if_limits_chanctx,
 		.n_limits = ARRAY_SIZE(if_limits_chanctx),
-		.max_interfaces = 2,
+		.max_interfaces = 3,
 		.num_different_channels = 2,
 		.beacon_int_infra_match = false,
 	}
@@ -614,7 +618,8 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
 				 BIT(NL80211_IFTYPE_AP) |
 				 BIT(NL80211_IFTYPE_P2P_CLIENT) |
-				 BIT(NL80211_IFTYPE_P2P_GO);
+				 BIT(NL80211_IFTYPE_P2P_GO) |
+				 BIT(NL80211_IFTYPE_P2P_DEVICE);
 	wiphy->max_remain_on_channel_duration = 5000;
 	wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
 	wiphy->max_scan_ssids = 4;
-- 
2.45.2


