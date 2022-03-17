Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D8EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 08:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t6sxj8ZKFkl3wFtpGYw1bKIHBTa24M4tsNDOUgi4kQc=; b=jAqoQa71e8rtAu
	SdvTt3BVlB5pXQnkm8Yd/96fiGgpx8L3ZmkMCgKC/53V7Gzp/1aD7rg0oI3qG2dDLnQJzBJX8EBvp
	H3xQfCfeOzGsn4v9ITTawnUUJaicAE66qeikv8zgsFUkTlqpwy8WpDq35dIN1KbJyhpD4BLq4tiLz
	TdongjtibZMIWpQaFj9dfoLgZaIdsfnmLCd5Qg9UJpgQPlYmm7p8XDaEggEkME6ohH541AOt9gFu9
	cZLJkNyn3Q6avkGlzFXVsTzEU8zU/zNDr6qcwHE+76XakRObqCGnwWDtdh2YFpDseshH2FBu+Y3v2
	HAFDJMQN/huZv0L8V2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUlOj-00FIVI-BY; Thu, 17 Mar 2022 08:22:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUlOg-00FIU7-JI
 for linux-mediatek@lists.infradead.org; Thu, 17 Mar 2022 08:22:16 +0000
X-UUID: c4767da84d8341aa9316772fbe5bd34c-20220317
X-UUID: c4767da84d8341aa9316772fbe5bd34c-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <evelyn.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1495630206; Thu, 17 Mar 2022 01:22:05 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 01:22:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Mar 2022 16:21:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Mar 2022 16:21:57 +0800
From: Evelyn Tsai <evelyn.tsai@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>
Subject: [PATCH v2] mt76: fix MBSS index condition in DBDC mode
Date: Thu, 17 Mar 2022 16:21:50 +0800
Message-ID: <20220317082150.20280-1-evelyn.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_012214_687505_7A104AB0 
X-CRM114-Status: GOOD (  14.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT7915_MAX_INTERFACES is per-band declaration in MT7915/MT7986/MT7916.
Enlarge vif_mask to 64 bits wide, including the bit operation.

Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Bo Jiao <bo.jiao@mediatek.com>
---
v2: fix bitops for u64 and update commit message

This patch is based on https://patchwork.kernel.org/project/linux-wireless/patch/20220309140249.10285-1-evelyn.tsai@mediatek.com/
---
 drivers/net/wireless/mediatek/mt76/mt76.h         | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7603/main.c  | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c  | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt76x02_util.c | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c  | 8 ++++----
 drivers/net/wireless/mediatek/mt76/mt7921/main.c  | 6 +++---
 6 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 882fb5d2517f..71bcee3a8d59 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -727,7 +727,7 @@ struct mt76_dev {
 	u32 wcid_mask[DIV_ROUND_UP(MT76_N_WCIDS, 32)];
 	u32 wcid_phy_mask[DIV_ROUND_UP(MT76_N_WCIDS, 32)];
 
-	u32 vif_mask;
+	u64 vif_mask;
 
 	struct mt76_wcid global_wcid;
 	struct mt76_wcid __rcu *wcid[MT76_N_WCIDS];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/main.c b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
index 83c5eec5b163..86ddab140207 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
@@ -44,7 +44,7 @@ mt7603_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 
 	mutex_lock(&dev->mt76.mutex);
 
-	mvif->idx = ffs(~dev->mt76.vif_mask) - 1;
+	mvif->idx = __ffs64(~dev->mt76.vif_mask);
 	if (mvif->idx >= MT7603_MAX_INTERFACES) {
 		ret = -ENOSPC;
 		goto out;
@@ -65,7 +65,7 @@ mt7603_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	}
 
 	idx = MT7603_WTBL_RESERVED - 1 - mvif->idx;
-	dev->mt76.vif_mask |= BIT(mvif->idx);
+	dev->mt76.vif_mask |= BIT_ULL(mvif->idx);
 	INIT_LIST_HEAD(&mvif->sta.poll_list);
 	mvif->sta.wcid.idx = idx;
 	mvif->sta.wcid.hw_key_idx = -1;
@@ -106,7 +106,7 @@ mt7603_remove_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	spin_unlock_bh(&dev->sta_poll_lock);
 
 	mutex_lock(&dev->mt76.mutex);
-	dev->mt76.vif_mask &= ~BIT(mvif->idx);
+	dev->mt76.vif_mask &= ~BIT_ULL(mvif->idx);
 	mutex_unlock(&dev->mt76.mutex);
 
 	mt76_packet_id_flush(&dev->mt76, &mvif->sta.wcid);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index d79cbdbd5a05..1fd88a0f03a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -194,7 +194,7 @@ static int mt7615_add_interface(struct ieee80211_hw *hw,
 	    is_zero_ether_addr(vif->addr))
 		phy->monitor_vif = vif;
 
-	mvif->mt76.idx = ffs(~dev->mt76.vif_mask) - 1;
+	mvif->mt76.idx = __ffs64(~dev->mt76.vif_mask);
 	if (mvif->mt76.idx >= MT7615_MAX_INTERFACES) {
 		ret = -ENOSPC;
 		goto out;
@@ -212,7 +212,7 @@ static int mt7615_add_interface(struct ieee80211_hw *hw,
 	if (ext_phy)
 		mvif->mt76.wmm_idx += 2;
 
-	dev->mt76.vif_mask |= BIT(mvif->mt76.idx);
+	dev->mt76.vif_mask |= BIT_ULL(mvif->mt76.idx);
 	dev->omac_mask |= BIT_ULL(mvif->mt76.omac_idx);
 	phy->omac_mask |= BIT_ULL(mvif->mt76.omac_idx);
 
@@ -268,7 +268,7 @@ static void mt7615_remove_interface(struct ieee80211_hw *hw,
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
-	dev->mt76.vif_mask &= ~BIT(mvif->mt76.idx);
+	dev->mt76.vif_mask &= ~BIT_ULL(mvif->mt76.idx);
 	dev->omac_mask &= ~BIT_ULL(mvif->mt76.omac_idx);
 	phy->omac_mask &= ~BIT_ULL(mvif->mt76.omac_idx);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index dd30f537676d..32f1fe3e1d15 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -327,11 +327,11 @@ mt76x02_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 		idx += 8;
 
 	/* vif is already set or idx is 8 for AP/Mesh/... */
-	if (dev->mt76.vif_mask & BIT(idx) ||
+	if (dev->mt76.vif_mask & BIT_ULL(idx) ||
 	    (vif->type != NL80211_IFTYPE_STATION && idx > 7))
 		return -EBUSY;
 
-	dev->mt76.vif_mask |= BIT(idx);
+	dev->mt76.vif_mask |= BIT_ULL(idx);
 
 	mt76x02_vif_init(dev, vif, idx);
 	return 0;
@@ -344,7 +344,7 @@ void mt76x02_remove_interface(struct ieee80211_hw *hw,
 	struct mt76x02_dev *dev = hw->priv;
 	struct mt76x02_vif *mvif = (struct mt76x02_vif *)vif->drv_priv;
 
-	dev->mt76.vif_mask &= ~BIT(mvif->idx);
+	dev->mt76.vif_mask &= ~BIT_ULL(mvif->idx);
 	mt76_packet_id_flush(&dev->mt76, &mvif->group_wcid);
 }
 EXPORT_SYMBOL_GPL(mt76x02_remove_interface);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index c3f44d801e7f..edfb5428796a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -204,8 +204,8 @@ static int mt7915_add_interface(struct ieee80211_hw *hw,
 	    is_zero_ether_addr(vif->addr))
 		phy->monitor_vif = vif;
 
-	mvif->mt76.idx = ffs(~dev->mt76.vif_mask) - 1;
-	if (mvif->mt76.idx >= MT7915_MAX_INTERFACES) {
+	mvif->mt76.idx = __ffs64(~dev->mt76.vif_mask);
+	if (mvif->mt76.idx >= (MT7915_MAX_INTERFACES << dev->dbdc_support)) {
 		ret = -ENOSPC;
 		goto out;
 	}
@@ -227,7 +227,7 @@ static int mt7915_add_interface(struct ieee80211_hw *hw,
 	if (ret)
 		goto out;
 
-	dev->mt76.vif_mask |= BIT(mvif->mt76.idx);
+	dev->mt76.vif_mask |= BIT_ULL(mvif->mt76.idx);
 	phy->omac_mask |= BIT_ULL(mvif->mt76.omac_idx);
 
 	idx = MT7915_WTBL_RESERVED - mvif->mt76.idx;
@@ -290,7 +290,7 @@ static void mt7915_remove_interface(struct ieee80211_hw *hw,
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
 	mutex_lock(&dev->mt76.mutex);
-	dev->mt76.vif_mask &= ~BIT(mvif->mt76.idx);
+	dev->mt76.vif_mask &= ~BIT_ULL(mvif->mt76.idx);
 	phy->omac_mask &= ~BIT_ULL(mvif->mt76.omac_idx);
 	mutex_unlock(&dev->mt76.mutex);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 3a16a966d9d3..e383168ba124 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -294,7 +294,7 @@ static int mt7921_add_interface(struct ieee80211_hw *hw,
 
 	mt7921_mutex_acquire(dev);
 
-	mvif->mt76.idx = ffs(~dev->mt76.vif_mask) - 1;
+	mvif->mt76.idx = __ffs64(~dev->mt76.vif_mask);
 	if (mvif->mt76.idx >= MT7921_MAX_INTERFACES) {
 		ret = -ENOSPC;
 		goto out;
@@ -310,7 +310,7 @@ static int mt7921_add_interface(struct ieee80211_hw *hw,
 	if (ret)
 		goto out;
 
-	dev->mt76.vif_mask |= BIT(mvif->mt76.idx);
+	dev->mt76.vif_mask |= BIT_ULL(mvif->mt76.idx);
 	phy->omac_mask |= BIT_ULL(mvif->mt76.omac_idx);
 
 	idx = MT7921_WTBL_RESERVED - mvif->mt76.idx;
@@ -354,7 +354,7 @@ static void mt7921_remove_interface(struct ieee80211_hw *hw,
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
-	dev->mt76.vif_mask &= ~BIT(mvif->mt76.idx);
+	dev->mt76.vif_mask &= ~BIT_ULL(mvif->mt76.idx);
 	phy->omac_mask &= ~BIT_ULL(mvif->mt76.omac_idx);
 	mt7921_mutex_release(dev);
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
