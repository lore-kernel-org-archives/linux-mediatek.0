Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0328DE70713
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 10:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JGS+Mr1i4NMvRKCfnylbjQKFPGxoeFseTg9gb/CuKg=; b=nBjL+sU/0E2ySBnwppSbJQAXFS
	qFbbWPCmvcpXa1lcSF21kBOa8HCTPybBxCJPEnWwM76cAJJkp8njP+Gz3qiTq4ei8LvwXDYBMZYVk
	UvvDhCRLvOu9EzRlTihbRTtxW3rdmg1NUXEN/NDi9Ac2NE6LrB2W08KtDFHVWglnZNClwn6CeoVNa
	CbRzGUWK/vRqe1+qPjh4LHRewyM6iuKQ6qb0LLQTB1vvAQcfu1tGws337oPc7LHUw1kLzgwepUShb
	v7iwdr2Oed0oCHzoqq5P1497wSsYqgKX9iIuoDw7RrIt3JGAQZ31pgWu4REnodkqOfZikyAKfMTBF
	Rvo7NkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjHA9-005qec-31;
	Thu, 21 Sep 2023 10:44:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjHA7-005qdJ-33
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 10:44:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 2FCFBCE1D4E;
	Thu, 21 Sep 2023 10:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1843DC3279F;
	Thu, 21 Sep 2023 10:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695293036;
	bh=JmPRwGD8tXRsnlGbou9Rh78/vsK7nzRrY8wYaA8z1qg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KwutYm2orkJo8R5BbNM2OY0xhq6wxrn98m10MKv7lyRbBGyTO38s7sLJ29bIUkNpN
	 fMIi9jnrUpfr0KopuniSf+rGImmiURVbQVYPGvoI31MYfg33Cw7rDfT/V5uP0xKr3Q
	 /FSiWvJlrJFnXm+XVGfYr/LyQnRyvaH4zQ5WMRhPcV8Ygdu40UPtJyVqs8OCS43mmb
	 h3rg0dTDZ/roYAV+fN1KHSH+PH8Kg9kKKMwDojaEm0uYoLcFTbHDJosAM/Q2LzJ57D
	 UuvBhZ18XMjQ0lM6tx9RBCHnZTF12b6rn/qQf91EZSbLFMEq+wLfTDSsDj3d8z3/5Z
	 ulMxDFtw5Kq3g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: lorenzo.bianconi@redhat.com,
	linux-wireless@vger.kernel.org,
	ryder.lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	shayne.chen@mediatek.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/9] wifi: mt76: move mt76_net_setup_tc in common code
Date: Thu, 21 Sep 2023 12:43:32 +0200
Message-ID: <ce4092754b42ced1a2417fa7590bf5656b090abb.1695292502.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695292502.git.lorenzo@kernel.org>
References: <cover.1695292502.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_034400_339172_9E596924 
X-CRM114-Status: GOOD (  11.49  )
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

This is a preliminary patch to introduce WED support for mt7996

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c    | 16 ++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h        |  6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 16 +---------------
 3 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index cb76053973aa..15c4ca664b3a 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1842,3 +1842,19 @@ enum mt76_dfs_state mt76_phy_dfs_state(struct mt76_phy *phy)
 	return MT_DFS_STATE_ACTIVE;
 }
 EXPORT_SYMBOL_GPL(mt76_phy_dfs_state);
+
+#ifdef CONFIG_NET_MEDIATEK_SOC_WED
+int mt76_net_setup_tc(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		      struct net_device *netdev, enum tc_setup_type type,
+		      void *type_data)
+{
+	struct mt76_phy *phy = hw->priv;
+	struct mtk_wed_device *wed = &phy->dev->mmio.wed;
+
+	if (!mtk_wed_device_active(wed))
+		return -EOPNOTSUPP;
+
+	return mtk_wed_device_setup_tc(wed, netdev, type, type_data);
+}
+EXPORT_SYMBOL_GPL(mt76_net_setup_tc);
+#endif /* CONFIG_NET_MEDIATEK_SOC_WED */
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 82e33a1b36ab..e8e9d9bc3730 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1047,6 +1047,12 @@ bool ____mt76_poll_msec(struct mt76_dev *dev, u32 offset, u32 mask, u32 val,
 void mt76_mmio_init(struct mt76_dev *dev, void __iomem *regs);
 void mt76_pci_disable_aspm(struct pci_dev *pdev);
 
+#ifdef CONFIG_NET_MEDIATEK_SOC_WED
+int mt76_net_setup_tc(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		      struct net_device *netdev, enum tc_setup_type type,
+		      void *type_data);
+#endif /*CONFIG_NET_MEDIATEK_SOC_WED */
+
 static inline u16 mt76_chip(struct mt76_dev *dev)
 {
 	return dev->rev >> 16;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index a3fd54cc1911..ba34c8e19aab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1653,20 +1653,6 @@ mt7915_net_fill_forward_path(struct ieee80211_hw *hw,
 
 	return 0;
 }
-
-static int
-mt7915_net_setup_tc(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-		    struct net_device *netdev, enum tc_setup_type type,
-		    void *type_data)
-{
-	struct mt7915_dev *dev = mt7915_hw_dev(hw);
-	struct mtk_wed_device *wed = &dev->mt76.mmio.wed;
-
-	if (!mtk_wed_device_active(wed))
-		return -EOPNOTSUPP;
-
-	return mtk_wed_device_setup_tc(wed, netdev, type, type_data);
-}
 #endif
 
 const struct ieee80211_ops mt7915_ops = {
@@ -1721,6 +1707,6 @@ const struct ieee80211_ops mt7915_ops = {
 	.set_radar_background = mt7915_set_radar_background,
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED
 	.net_fill_forward_path = mt7915_net_fill_forward_path,
-	.net_setup_tc = mt7915_net_setup_tc,
+	.net_setup_tc = mt76_net_setup_tc,
 #endif
 };
-- 
2.41.0


