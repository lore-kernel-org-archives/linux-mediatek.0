Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D1EC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 03:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R695219Wd4kGuWj0TRGlztnKlAYxGRy5SeEHcLiIi+s=; b=RCS/QqJuRh71GfzXuzn2FcO+bD
	q4TvqHSpnkwgctICOhbt9c/f9QWhDDfC6qL9vmdhIb2utDclpHRV2Jj9cDaDHVKTGMKWLMd1mUrmj
	qUThFgOCeVf/iKgxQFQ3bZpUtu9m7f69ooFYYSZFjiP70lPpFfDKYLd1pZHtXTiJHAXx4xmuqrBIS
	wsxxiDb0VMh9bynxbnoIKkt3AYHBduagRMIlMhj66tqC/7vSr0DJgG2CB4Qittfy9jxl43Fp2/tKb
	T84O0X/jhhu3UlM2Vs0Bx3skqk9IbOYBnOFKPbvypAgcmtinOaR/smgAv1KNERhHYeDIQkFZ/Jk6A
	E+GJPEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0aW2-004LgT-EO; Thu, 01 Dec 2022 03:45:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0aVu-004LbF-38
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 03:45:32 +0000
X-UUID: f54704e14d3b4404978c51d0de57cafc-20221130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=R695219Wd4kGuWj0TRGlztnKlAYxGRy5SeEHcLiIi+s=;
	b=jO5un83w6WnS2JVk0zrI/ysycYzjdHvX8xh4YXoAaJCIVGLtct+j7B2UvJC9Pn86OPR3UEbz1DGCNuOyZc8Vbm0wdT4b9o74sZQZqL1wXHazIxq9EjSpWy72rQ/sneq3N885IAAvUNDyFoRbM8g9X9ag+bmWFszotukd+abo0X4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:4dd2af3c-f90e-44e7-ad04-0e03fb7a5dba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:dd54d01e-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f54704e14d3b4404978c51d0de57cafc-20221130
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 646640307; Wed, 30 Nov 2022 20:45:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Dec 2022 11:44:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Dec 2022 11:44:47 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 3/5] wifi: mt76: mt7996: enable use_cts_prot support
Date: Thu, 1 Dec 2022 11:44:42 +0800
Message-ID: <0ec617fd8907e6b32060e7c1aefaca42f2c8a0cd.1669861863.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <d1c11adff6b57c9104bb16df19f62700e2505473.1669861862.git.ryder.lee@mediatek.com>
References: <d1c11adff6b57c9104bb16df19f62700e2505473.1669861862.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_194530_268206_64269F2D 
X-CRM114-Status: UNSURE (   9.41  )
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

This adds selectable RTC/CTS enablement for each interface.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 13 +++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  3 +++
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index c9c9b82352eb..554f9bcb69e2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -218,6 +218,19 @@ static void mt7996_mac_sta_poll(struct mt7996_dev *dev)
 	rcu_read_unlock();
 }
 
+void mt7996_mac_enable_rtscts(struct mt7996_dev *dev,
+			      struct ieee80211_vif *vif, bool enable)
+{
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	u32 addr;
+
+	addr = mt7996_mac_wtbl_lmac_addr(dev, mvif->sta.wcid.idx, 5);
+	if (enable)
+		mt76_set(dev, addr, BIT(5));
+	else
+		mt76_clear(dev, addr, BIT(5));
+}
+
 static void
 mt7996_mac_decode_he_radiotap_ru(struct mt76_rx_status *status,
 				 struct ieee80211_radiotap_he *he,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 21dea3fa7dc1..d43530a9786b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -523,6 +523,9 @@ static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 		mt7996_mcu_add_obss_spr(dev, vif, info->he_obss_pd.enable);
 	}
 
+	if (changed & BSS_CHANGED_ERP_CTS_PROT)
+		mt7996_mac_enable_rtscts(dev, vif, info->use_cts_prot);
+
 	if (changed & BSS_CHANGED_ERP_SLOT) {
 		int slottime = info->use_short_slot ? 9 : 20;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 167f615f099e..00c58878524e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -464,6 +464,8 @@ bool mt7996_mac_wtbl_update(struct mt7996_dev *dev, int idx, u32 mask);
 void mt7996_mac_reset_counters(struct mt7996_phy *phy);
 void mt7996_mac_cca_stats_reset(struct mt7996_phy *phy);
 void mt7996_mac_enable_nf(struct mt7996_dev *dev, u8 band);
+void mt7996_mac_enable_rtscts(struct mt7996_dev *dev,
+			      struct ieee80211_vif *vif, bool enable);
 void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid, int pid,
 			   struct ieee80211_key_conf *key, u32 changed);
-- 
2.18.0


