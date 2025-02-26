Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406FAC021BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 02:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4Gi5oLcnu13m4QqfB45wOY6IeSYSo6Ivw3GwbQxIL4=; b=atcew4KIqpWA8rLJUIA6/Akwls
	xXovxmGydhqwkcNqoWZUCR/2VXqT80mkYuvWP7d3P2gVEk2hnILuwgE+RTGVD204mZuDtdKXyk9d7
	RFacGLH5iC0KqP+t+OitRYYi261Dl1jr7D/XRVDGQQ5ka3asuvtVfBaO5FK4PnJci4K+y9dEh3myN
	jlq1Lz9920Jqe6YsPaf1d8QnYXu0BFBY2tB4/jIMnh/y2cpPnSh+Kg2I0O7oWlOmejAfrfIlu3qsL
	WoHsG10ifFF+ZoTL4+RaRcX1GtvQKGBPj0gQh8zwWjpDzgSAItG6hMqFNdXdeY2ly1i1YY3f7coYI
	Pd+iKn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7bs-00000002EUO-1au3;
	Wed, 26 Feb 2025 02:57:20 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7bp-00000002ETO-3CF3
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Feb 2025 02:57:19 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-726819aa3fcso3453890a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2025 18:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740538637; x=1741143437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4Gi5oLcnu13m4QqfB45wOY6IeSYSo6Ivw3GwbQxIL4=;
        b=CPMfrejjjMk9hvcNOf75EPkk/yHNzBwN/RSJbuhJ+KhLCbQ8wlEdr6BKWAAMWRxCLQ
         479vV11VkJzrLCHet0tXFDa/UxA2H6nX7+NAA5hiPrNC+Duo5GKGig4Byam8lX/yPsmI
         tkwwv28NqmZE6o3dtal6BE3Jdelwxae+FAXRr0Ge8SEWXkGD8p3XDY3xUJylcy3fBxT4
         p0CBk0VLj4mbLPp+8HUUu7NPsGxG5wj6Pa6NUh7WmrbKip4jaVBtnbUrWCqF+oU5ZqBi
         DKchRpV05e9NX1zcfpDqRtOjXnGqs10c1GdQ6mBcQCU4GqSb8+EoxfaONQbh5tmbm8Es
         L6dw==
X-Forwarded-Encrypted: i=1; AJvYcCVRCshJqMZ2uOT9I26TpypobzkiiHU62TyDdNzCyRGRtWbW8Om0UVHodDvpf5e39Xvr3XqZCUWFaCYjCiRU3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoZPu4AUYTTGkA3FbioqbsNcdWQydLQNOc0tk8mtTDS61XaoAB
	4NP7ycV6B699G7YMIXyHPhLi6wfti4oVb4U52RFl757HJGiq3+DU
X-Gm-Gg: ASbGnctELK3FFdKDvdMOzwk1HwMNYxdSnoQwcPzw2GT5nf3l83yISKHkvFMnImvr+ie
	0i4uqFnM5XWCYlGF5ui/zoUzjxnrbJMEXcOIPR07RJV3kPZLV/umUbKwqdRGjY07JIdEa5YDAqn
	5gA4KzRMJyh8mXhp8UZzoKNH1sIOyPHjWrLoXlO34lGEoRaEoAv2uLt69l4UfAEBtHdeoqGfpKr
	isBwbVPu+jyTEPqOCDl8fqqEIAiGGaY73F1t8H84RMMWKPQS+WB/R+Mg4bVlVJFMneZd7DGHORk
	n88rJle29YthJUUD+aJI+Rt288zXk4HqUCJJoDigECQ=
X-Google-Smtp-Source: AGHT+IGsp1z/zREzEGPS570DiATvLdI7NdTqzP+4QxfZKU3Y/BqW1Jyn1C1SsdTmTBZv6xAjGL3bww==
X-Received: by 2002:a05:6830:6706:b0:727:f9a:8aea with SMTP id 46e09a7af769-728a50c73bamr1093423a34.4.1740538635443;
        Tue, 25 Feb 2025 18:57:15 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c1113f0135sm676360fac.27.2025.02.25.18.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:57:14 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Caleb Jorden <cjorden@gmail.com>
Subject: [PATCH v4 6/6] wifi: mt76: mt7925: update the power-saving flow
Date: Tue, 25 Feb 2025 18:56:47 -0800
Message-Id: <20250226025647.102904-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226025647.102904-1-sean.wang@kernel.org>
References: <20250226025647.102904-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_185717_806996_888898B4 
X-CRM114-Status: GOOD (  17.82  )
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

After joining MLO, ensure that all links are setup before
enabling power-saving.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Cc: stable@vger.kernel.org
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Tested-by: Caleb Jorden <cjorden@gmail.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:
  1) generate the patch based on the latest mt76 tree
  2) update the commit message
v3:
  1) fixed the merge conflict
v4:
  1) added tested-by tag
---
 .../net/wireless/mediatek/mt76/mt7925/init.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 65 ++++++++++++++++---
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  1 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  9 +++
 4 files changed, 67 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index f41ca4248497..a2bb36dab231 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -244,6 +244,7 @@ int mt7925_register_device(struct mt792x_dev *dev)
 	dev->mt76.tx_worker.fn = mt792x_tx_worker;
 
 	INIT_DELAYED_WORK(&dev->pm.ps_work, mt792x_pm_power_save_work);
+	INIT_DELAYED_WORK(&dev->mlo_pm_work, mt7925_mlo_pm_work);
 	INIT_WORK(&dev->pm.wake_work, mt792x_pm_wake_work);
 	spin_lock_init(&dev->pm.wake.lock);
 	mutex_init(&dev->pm.mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 4a9f393b45ba..395c3d5d7954 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -427,6 +427,7 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->bss_conf.vif = mvif;
 	mvif->sta.vif = mvif;
 	mvif->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+	mvif->mlo_pm_state = MT792x_MLO_LINK_DISASSOC;
 
 	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink);
 	if (ret < 0)
@@ -1284,6 +1285,8 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		mvif->wep_sta = NULL;
 		ewma_rssi_init(&mvif->bss_conf.rssi);
 	}
+
+	mvif->mlo_pm_state = MT792x_MLO_LINK_DISASSOC;
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_remove);
 
@@ -1355,6 +1358,38 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return ret;
 }
 
+static void
+mt7925_mlo_pm_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	struct mt792x_dev *dev = priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	unsigned long valid = ieee80211_vif_is_mld(vif) ?
+				    mvif->valid_links : BIT(0);
+	struct ieee80211_bss_conf *bss_conf;
+	int i;
+
+	if (mvif->mlo_pm_state != MT792x_MLO_CHANGED_PS)
+		return;
+
+	mt792x_mutex_acquire(dev);
+	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+		bss_conf = mt792x_vif_to_bss_conf(vif, i);
+		mt7925_mcu_uni_bss_ps(dev, bss_conf);
+	}
+	mt792x_mutex_release(dev);
+}
+
+void mt7925_mlo_pm_work(struct work_struct *work)
+{
+	struct mt792x_dev *dev = container_of(work, struct mt792x_dev,
+					      mlo_pm_work.work);
+	struct ieee80211_hw *hw = mt76_hw(dev);
+
+	ieee80211_iterate_active_interfaces(hw,
+					    IEEE80211_IFACE_ITER_RESUME_ALL,
+					    mt7925_mlo_pm_iter, dev);
+}
+
 static bool is_valid_alpha2(const char *alpha2)
 {
 	if (!alpha2)
@@ -1904,6 +1939,9 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 		mt7925_mcu_sta_update(dev, NULL, vif, true,
 				      MT76_STA_INFO_STATE_ASSOC);
 		mt7925_mcu_set_beacon_filter(dev, vif, vif->cfg.assoc);
+
+		if (ieee80211_vif_is_mld(vif))
+			mvif->mlo_pm_state = MT792x_MLO_LINK_ASSOC;
 	}
 
 	if (changed & BSS_CHANGED_ARP_FILTER) {
@@ -1914,9 +1952,19 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 	}
 
 	if (changed & BSS_CHANGED_PS) {
-		for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
-			bss_conf = mt792x_vif_to_bss_conf(vif, i);
+		if (hweight16(mvif->valid_links) < 2) {
+			/* legacy */
+			bss_conf = &vif->bss_conf;
 			mt7925_mcu_uni_bss_ps(dev, bss_conf);
+		} else {
+			if (mvif->mlo_pm_state == MT792x_MLO_LINK_ASSOC) {
+				mvif->mlo_pm_state = MT792x_MLO_CHANGED_PS_PENDING;
+			} else if (mvif->mlo_pm_state == MT792x_MLO_CHANGED_PS) {
+				for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+					bss_conf = mt792x_vif_to_bss_conf(vif, i);
+					mt7925_mcu_uni_bss_ps(dev, bss_conf);
+				}
+			}
 		}
 	}
 
@@ -1967,11 +2015,12 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 	if (changed & (BSS_CHANGED_QOS | BSS_CHANGED_BEACON_ENABLED))
 		mt7925_mcu_set_tx(dev, info);
 
-	if (changed & BSS_CHANGED_BSSID) {
-		if (ieee80211_vif_is_mld(vif) &&
-		    hweight16(mvif->valid_links) == 2)
-			/* Indicate the secondary setup done */
-			mt7925_mcu_uni_bss_bcnft(dev, info, true);
+	if (mvif->mlo_pm_state == MT792x_MLO_CHANGED_PS_PENDING) {
+		/* Indicate the secondary setup done */
+		mt7925_mcu_uni_bss_bcnft(dev, info, true);
+
+		ieee80211_queue_delayed_work(hw, &dev->mlo_pm_work, 5 * HZ);
+		mvif->mlo_pm_state = MT792x_MLO_CHANGED_PS;
 	}
 
 	mt792x_mutex_release(dev);
@@ -2055,8 +2104,6 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			goto free;
 
 		if (mconf != &mvif->bss_conf) {
-			mt7925_mcu_set_bss_pm(dev, link_conf, true);
-
 			err = mt7925_set_mlo_roc(phy, &mvif->bss_conf,
 						 vif->active_links);
 			if (err < 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index fd5f9d4ea4a7..cb7b1a49fbd1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -268,6 +268,7 @@ int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
 int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable);
+void mt7925_mlo_pm_work(struct work_struct *work);
 void mt7925_scan_work(struct work_struct *work);
 void mt7925_roc_work(struct work_struct *work);
 int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 32ed01a96bf7..6e25a4421e12 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -81,6 +81,13 @@ enum mt792x_reg_power_type {
 	MT_AP_VLP,
 };
 
+enum mt792x_mlo_pm_state {
+	MT792x_MLO_LINK_DISASSOC,
+	MT792x_MLO_LINK_ASSOC,
+	MT792x_MLO_CHANGED_PS_PENDING,
+	MT792x_MLO_CHANGED_PS,
+};
+
 DECLARE_EWMA(avg_signal, 10, 8)
 
 struct mt792x_link_sta {
@@ -134,6 +141,7 @@ struct mt792x_vif {
 	struct mt792x_phy *phy;
 	u16 valid_links;
 	u8 deflink_id;
+	enum mt792x_mlo_pm_state mlo_pm_state;
 
 	struct work_struct csa_work;
 	struct timer_list csa_timer;
@@ -239,6 +247,7 @@ struct mt792x_dev {
 	const struct mt792x_irq_map *irq_map;
 
 	struct work_struct ipv6_ns_work;
+	struct delayed_work mlo_pm_work;
 	/* IPv6 addresses for WoWLAN */
 	struct sk_buff_head ipv6_ns_list;
 
-- 
2.25.1


