Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1E7C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 10:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVuruGKExHh3HSXR06X4IT5K2QylDkjTAn3G6LSOgl0=; b=qUzOyoYiI+Tc/1BZOA1yXQpcHY
	ZZXrAd6jnYGEIccy1aABpb/MgPJTd+dgSLG9D6YlclnvMg564+STUUQPeVo1XUWDIvuY4Gk+BHJ0a
	opY/vbHJxLnw2oeac7KfwoBMKkGc1cjgbS7p6gsR9mA3ERv8DbaSAWlDw/JqLgrUdVdb+fwmv1qqY
	2SrhFBkrKsdz62gQ6+Quo9bbU3b4z/0JwdJbo5CUx/DhZmIzvHhSAvyZxWMiq/FXMokQw4b/Qr64J
	RLUEFnxlxhiH9lER8X3jOOD8fdiE2gVuNtci59OwZUP++tZIAAKJ1LBvXcvpmSLzFBcAQLrCWDnJ4
	2hooavFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUYN-0095Kg-0v;
	Thu, 02 Nov 2023 10:03:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUYL-0095Jc-0G
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Nov 2023 10:03:54 +0000
X-UUID: 1d207f22796711ee9b7791016c24628a-20231102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AVuruGKExHh3HSXR06X4IT5K2QylDkjTAn3G6LSOgl0=;
	b=L3TfnpJmrJ20WDBxfKaTXavvYP4LJaowcnY9OthgW99FIEEGbTngiz0d6OoBqnVU5C9pRAw7AxjzxkdONPrML3lUkHrY9BYxoHT/ffWxLzudjO9LoSOJOxOEPby5aeqLzQVJz+X5JdV+c+jqIURMB5ZADEY6ScL+RTjaPxuQdao=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:a751ac1a-db78-4dc2-8566-8d504c07b864,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:0858ef94-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 1d207f22796711ee9b7791016c24628a-20231102
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 944637017; Thu, 02 Nov 2023 03:03:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 2 Nov 2023 18:03:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 2 Nov 2023 18:03:44 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Allen Ye <allen.ye@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 3/8] wifi: mt76: use chainmask for power delta calculation
Date: Thu, 2 Nov 2023 18:02:57 +0800
Message-ID: <20231102100302.22160-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231102100302.22160-1-shayne.chen@mediatek.com>
References: <20231102100302.22160-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_030353_123140_F08740C8 
X-CRM114-Status: GOOD (  11.41  )
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

From: Allen Ye <allen.ye@mediatek.com>

The power gain value is related to total TX path, so change the
calculation to use per-phy chainmask.

Signed-off-by: Allen Ye <allen.ye@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c     | 2 +-
 drivers/net/wireless/mediatek/mt76/mac80211.c   | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 7725dd6763ef..53f5ef4120ca 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -379,7 +379,7 @@ s8 mt76_get_rate_power_limits(struct mt76_phy *phy,
 	if (!np)
 		return target_power;
 
-	txs_delta = mt76_get_txs_delta(np, hweight8(phy->antenna_mask));
+	txs_delta = mt76_get_txs_delta(np, hweight16(phy->chainmask));
 
 	val = mt76_get_of_array(np, "rates-cck", &len, ARRAY_SIZE(dest->cck));
 	mt76_apply_array_limit(dest->cck, ARRAY_SIZE(dest->cck), val,
diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 6ee7be6eaab8..c15074bb24c1 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1537,7 +1537,7 @@ int mt76_get_txpower(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		     int *dbm)
 {
 	struct mt76_phy *phy = hw->priv;
-	int n_chains = hweight8(phy->antenna_mask);
+	int n_chains = hweight16(phy->chainmask);
 	int delta = mt76_tx_power_nss_delta(n_chains);
 
 	*dbm = DIV_ROUND_UP(phy->txpower_cur + delta, 2);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 1592b5d6751a..b41ac4aaced7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -519,7 +519,7 @@ static inline s8
 mt7915_get_power_bound(struct mt7915_phy *phy, s8 txpower)
 {
 	struct mt76_phy *mphy = phy->mt76;
-	int n_chains = hweight8(mphy->antenna_mask);
+	int n_chains = hweight16(mphy->chainmask);
 
 	txpower = mt76_get_sar_power(mphy, mphy->chandef.chan, txpower * 2);
 	txpower -= mt76_tx_power_nss_delta(n_chains);
-- 
2.39.2


