Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EF1C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 19:34:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C30002070A
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 19:34:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xqn9qG7E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EUoGkRx4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C30002070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IQSXSjWL+q/vrEWuxsOly00EXWBIXRQxFQ3mVLozUCc=; b=Xqn9qG7Ew7ScTY
	o5fOg38mS+DmJkDuGGVSqE5FYT/8epVxZG/fWDvFAnCibwUNDY+K6aLPLitw3g2hStUB8rzcpahX8
	/Md9eHXSAJJeeG8e7XV8Dosv/nrGp3Og1W8ETdLT8k5i0SkhuOd8Zm9BsYJuZIaxU6QEFFckdXzK4
	a4dqzkrdHRUzrlnkAACi3tVKo8ew/fhBRuuZ8j1+lkpYNSTBoddWXRULRQJthJFQcIKmDVqmUQfxF
	qengOhF/NBWKZdG/NyPLYI7KpaH4YMdg8jP9G4tmAbfSZ7ADtoZfubU6OKm5EMgw0xC71F4mcp1YU
	54UmCiyepjhk7lGwQWng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZg5i-0001Ct-I5; Fri, 15 May 2020 19:33:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZg5d-0001CI-BO
 for linux-mediatek@lists.infradead.org; Fri, 15 May 2020 19:33:53 +0000
X-UUID: 74a1688e0cdd41508cb97ff5ceccb332-20200515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CME4YY1frgPQdT3pDkdrdyWqoLZQ9uQZzZZfXlQscn8=; 
 b=EUoGkRx4/6Bk0z2uZEsbVgb4QyJzDm4ZLoR0zF/G72G6MvECtAkUTEFaJ3bPeIsq5lIb7BRDyzSXvY3zP9bioiXwmKtppS/mpjrZTfNgiXbbGGMpcP76z6xBFCdPZeV7ZMovYiWatki8mychXmvWSUIrSLqgTZ3jKYYYfI7iNdg=;
X-UUID: 74a1688e0cdd41508cb97ff5ceccb332-20200515
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 662963247; Fri, 15 May 2020 11:33:32 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 May 2020 12:33:36 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 May 2020 03:33:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 16 May 2020 03:33:28 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7915: add spatial reuse support
Date: Sat, 16 May 2020 03:33:28 +0800
Message-ID: <f91515d63f3cab7bb6d766e7d6906a93067e903c.1589570744.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_123349_401127_343AF521 
X-CRM114-Status: GOOD (  10.11  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable or disable OBSS PD when the bss config changes or we
assoc to an AP that broadcasts the IE.

With this patch, we can get ~20% gain in OBSS OTA environment.

Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  7 +++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 25 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 ++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 98567374c2c9..e045dc234100 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -437,8 +437,10 @@ static void mt7915_bss_info_changed(struct ieee80211_hw *hw,
 		mt7915_mcu_add_sta(dev, vif, NULL, join);
 	}
 
-	if (changed & BSS_CHANGED_ASSOC)
+	if (changed & BSS_CHANGED_ASSOC) {
 		mt7915_mcu_add_bss_info(phy, vif, info->assoc);
+		mt7915_mcu_add_obss_spr(dev, vif, info->he_obss_pd.enable);
+	}
 
 	if (changed & BSS_CHANGED_ERP_SLOT) {
 		int slottime = info->use_short_slot ? 9 : 20;
@@ -458,6 +460,9 @@ static void mt7915_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & (BSS_CHANGED_QOS | BSS_CHANGED_BEACON_ENABLED))
 		mt7915_mcu_set_tx(dev, vif);
 
+	if (changed & BSS_CHANGED_HE_OBSS_PD)
+		mt7915_mcu_add_obss_spr(dev, vif, info->he_obss_pd.enable);
+
 	if (changed & (BSS_CHANGED_BEACON |
 		       BSS_CHANGED_BEACON_ENABLED))
 		mt7915_mcu_add_beacon(hw, vif, info->enable_beacon);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index f00ad2b66761..2260d656b4bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3159,3 +3159,28 @@ int mt7915_mcu_set_txbf_sounding(struct mt7915_dev *dev)
 	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_TXBF_ACTION,
 				   &req, sizeof(req), true);
 }
+
+int mt7915_mcu_add_obss_spr(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+			    bool enable)
+{
+#define MT_SPR_ENABLE		1
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct {
+		u8 action;
+		u8 arg_num;
+		u8 band_idx;
+		u8 status;
+		u8 drop_tx_idx;
+		u8 sta_idx;	/* 256 sta */
+		u8 rsv[2];
+		u32 val;
+	} __packed req = {
+		.action = MT_SPR_ENABLE,
+		.arg_num = 1,
+		.band_idx = mvif->band_idx,
+		.val = enable,
+	};
+
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_SET_SPR,
+				   &req, sizeof(req), true);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 34ace6e672d0..c241dd7c4c36 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -212,6 +212,7 @@ enum {
 	MCU_EXT_CMD_RATE_CTRL = 0x87,
 	MCU_EXT_CMD_FW_DBG_CTRL = 0x95,
 	MCU_EXT_CMD_SET_RDD_TH = 0x9d,
+	MCU_EXT_CMD_SET_SPR = 0xa8,
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 5392292a838e..85d74ecd0351 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -301,6 +301,8 @@ int mt7915_mcu_add_key(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		       enum set_key_cmd cmd);
 int mt7915_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			  int enable);
+int mt7915_mcu_add_obss_spr(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+                            bool enable);
 int mt7915_mcu_add_rate_ctrl(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			     struct ieee80211_sta *sta);
 int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
