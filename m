Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7FBC38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 00:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S60QWh2u+ENNyc/oOBO8S02pSM05EoJivJ9ovxNPLIw=; b=Fr3xe9kZuI5I8s9RDR6zu6JzUx
	1HawuxN1mHocfJR42bTrn5tzndFn0+Yt8LspteuxTAWhfnds3Szykcphj0APdAU8M8XRcb/4G6VeL
	LCNRbPai6VrAuSqwqZO6Jz/Z2d3d6HmAecdVS1lkq2BuWKrfV7TJg6k5SmaFNjEE9muiNxmp5qZz7
	SnhcPSpJr+GKotB8HfPfZSXex2KRKNtQReQtMon4ubeYzppoQw/YaXnNTeJ30Q8QTWEq7J/TNpRSm
	Y0Er6jIj3slKh190t5vxg7TguJvEhqlCav5pZ3YrfjXnSGzRpHA3wXiaNUFpXtViz7+S9OIcPYit4
	6BFRNR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on7qg-003RTY-QE; Tue, 25 Oct 2022 00:31:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on7qd-003RRT-Bc
	for linux-mediatek@lists.infradead.org; Tue, 25 Oct 2022 00:31:16 +0000
X-UUID: 92c0a6778bff4d5c8a90589416160a56-20221024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=S60QWh2u+ENNyc/oOBO8S02pSM05EoJivJ9ovxNPLIw=;
	b=LqimzUeMGIU4VpifX/QzUXOkXD9eeqgpHDoViIj8sJjtUu19H10TCfU0Uryft7+tw29lEGmmFjoLiDWn07cwkhfyDG3KAVHkTDB9I4p4nJP3cnyrF/zvXVTGu3/cCTuCuqd6DqxPb5Il+XDAXSYS5aYQoEpMsRuypoAdYPViz10=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:2af38787-ab96-4181-a0ba-8c8e7493ae95,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:d092f56c-89d3-4bfa-baad-dc632a24bca3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 92c0a6778bff4d5c8a90589416160a56-20221024
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1314556219; Mon, 24 Oct 2022 17:31:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 25 Oct 2022 08:31:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 25 Oct 2022 08:31:02 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: mt7915: enable use_cts_prot support
Date: Tue, 25 Oct 2022 08:31:00 +0800
Message-ID: <f13c8c4ae61eb1374ca65e92b03e908c21073917.1666657715.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_173115_417944_D66EF911 
X-CRM114-Status: UNSURE (   9.81  )
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
Change-Id: I5eb7851b513d4140d879676154e2abe769969c01
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c    | 13 +++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7915/main.c   |  3 +++
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 1ce2b91353e7..8b637dfe81fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -232,6 +232,19 @@ static void mt7915_mac_sta_poll(struct mt7915_dev *dev)
 	rcu_read_unlock();
 }
 
+void mt7915_mac_enable_rtscts(struct mt7915_dev *dev,
+			      struct ieee80211_vif *vif, bool enable)
+{
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	u32 addr;
+
+	addr = mt7915_mac_wtbl_lmac_addr(dev, mvif->sta.wcid.idx, 5);
+	if (enable)
+		mt76_set(dev, addr, BIT(5));
+	else
+		mt76_clear(dev, addr, BIT(5));
+}
+
 static int
 mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index ac320182c2ce..1eb50811f4b0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -598,6 +598,9 @@ static void mt7915_bss_info_changed(struct ieee80211_hw *hw,
 		mt7915_mcu_add_obss_spr(dev, vif, info->he_obss_pd.enable);
 	}
 
+	if (changed & BSS_CHANGED_ERP_CTS_PROT)
+		mt7915_mac_enable_rtscts(dev, vif, info->use_cts_prot);
+
 	if (changed & BSS_CHANGED_ERP_SLOT) {
 		int slottime = info->use_short_slot ? 9 : 20;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index b0b57ee1e00f..ff5b01b279b8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -554,6 +554,8 @@ bool mt7915_mac_wtbl_update(struct mt7915_dev *dev, int idx, u32 mask);
 void mt7915_mac_reset_counters(struct mt7915_phy *phy);
 void mt7915_mac_cca_stats_reset(struct mt7915_phy *phy);
 void mt7915_mac_enable_nf(struct mt7915_dev *dev, bool ext_phy);
+void mt7915_mac_enable_rtscts(struct mt7915_dev *dev,
+			      struct ieee80211_vif *vif, bool enable);
 void mt7915_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid, int pid,
 			   struct ieee80211_key_conf *key,
-- 
2.36.1


