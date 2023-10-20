Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692DECDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 10:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfzu4PuU4U1VyIXKiQlT29qOcJb8gWTph7d+WXlaujM=; b=Z0b1rJMDFqQMv7eEKbbJs99d3C
	XWayvZYCWfUFq0EXVcFn9fa8uQSDhBb3czrPWapBEgq6YYtjtFbAyf+ipbgAuviCthj4Tyxjf2OrE
	UbHY/bT4+N2MsdCNw9v2103u5XYBqSkl2iwyBHGhzEmdRxu0RLz7fTomUAigOu7VmZF2JRSz/EZwW
	77q5u66MsrYzJvhoflDv+gwwpjjvUtmLA2ZHTgR4lGRSH/R7onJJayxJMW84DRHVFCsy7m74Ahrs/
	n3fSPbOqWwP6nDaTX71RYMab8eULyg5cVtWsjNav5IBqg7bGYk534izyoACuP+ItNZ7Xi4V/K5hhX
	i1ssopxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmn3-001mOS-2X;
	Fri, 20 Oct 2023 10:31:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmn0-001mNZ-1h
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Oct 2023 10:31:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3B4E2B82FE3;
	Fri, 20 Oct 2023 10:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400A0C433C8;
	Fri, 20 Oct 2023 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697797892;
	bh=N114NVR2yH2worVoQ2OyetWtwUD+J/sPtCWEuQnFtbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BNebuQge7I8SDIsHFKAimevChhqM+b3WXaJL4n0Gw6ujdwdLy75mBekWRxl8y5Vzb
	 ZKV9roiGrTwFgEAixt/IHjRHeY6YNPGEs5YbFdIz4jCcrwknatfkH648+KdzyGzptc
	 mOyGG65i+DL35wcDNIoPty/Xhhr9OCcUn66oYZ/B3kbnzT1BPy6w18XVWk8vQrDf8P
	 TbssYCXipQDlQCc9BYN6NC69HB1J3cKtnVQyTfdQow9N7qTSlVBzjHvVGpLi7ZarxW
	 FbaoPNifXWBZQ539d5EwBikOPrtauC3RUstgpAoJbUb5Quejs+uFy8QdCct7GElNO/
	 4SLGif3RlUiOQ==
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
Subject: [PATCH v3 03/13] wifi: mt76: move mt76_net_setup_tc in common code
Date: Fri, 20 Oct 2023 12:30:50 +0200
Message-ID: <8510d01c6ab2c067777a593700a17a6af414c404.1697797423.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1697797422.git.lorenzo@kernel.org>
References: <cover.1697797422.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_033134_827941_B3E37025 
X-CRM114-Status: GOOD (  10.21  )
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
index 2e9f208ae8f8..141f2e80c165 100644
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


