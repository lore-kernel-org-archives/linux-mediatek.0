Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A110C02187
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 02:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAFvRSI6KUOifB1Mi3IpomlOOrHuk58k3cEKclUqi60=; b=Imn++wg1p9O+RMbOUL9JCVR/2O
	M5UQu0+TMxpnA8qS+b9BY+fOWvGIk/6V+oRfrX8EW4d2GrXY5CQ+jHlfnA+M6LxrC5k267nMt0Fdg
	RSZx7xbXq0q3uQbvlN+3X/YUIzly+fB5FQr+K23sdvnitkXoiujIRVV6mGWbeB3rPDILHYaLNgmJL
	rJ7NmH5e084ZTJMd2zgy9rkLnjXWZyG1LhjqtSlpxfNMsqPcyfgmprYapykg3pqnFQst7udKClfMc
	KICnAHAKZr6f3p/x156Pvf7SAI78NGuV9ywOTiviC0I7BOWAUetOfOgxnaW1RAyk5kT7X/tL/B/ZH
	JnzNquZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWLi-00000007D4P-1KhP;
	Tue, 14 Jan 2025 02:08:10 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWL9-00000007D0G-1Fnu
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 02:07:36 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-71e1b1767b3so2662991a34.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 18:07:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736820454; x=1737425254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAFvRSI6KUOifB1Mi3IpomlOOrHuk58k3cEKclUqi60=;
        b=EyZPQEiK6HMEuovOa1QqbMUfGnhx5Qc9YixCWUxxOOSzm4J2zhUL8a/hTkhIYpWCaU
         s87y21E1/GPdTVtTsczY46os8KOUG0iXvouU3m52FIwLT17jsSuSllf6P7HQxn09Z/eU
         K64iyY5b0zbBgy3+LoxR75aaOHlD/bOtFb82MGbj4grsTucIbPV+rS8wTRTslnN6acGD
         +BE8Jzk3K3/FfRfyIHqp7/FgS7pxA5FmpR/Gkso1+8CjwsykV08i8TyeSyu9+j7R/8qR
         hHZF13Q1Udgk2gsthYk42pNwDJfkeU1/UgpT41iiwaVDDQuFly0vesygfjWQpp21nK7j
         V77Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpxJBQ+hbC2jcA/UDUTu58O06eEd3NxFbQKIE2Q0ugnkNqhsIpGb+CJjgBphp12IOi+sPACHMuC60OaGw03g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxCsXSfYIWatBBqrN/P424FvXr8pE8X+sNCjyFnbghVBqq4Jx2
	QP7gS27dRhfwyJ1+8VG70eXO2Yiwh1lnt6cgnD6IVWwolOrSnMmA
X-Gm-Gg: ASbGncs5dmg6Vs1oaAWH0zd2Jr+cDTNaXaj05SVEooYaC3OCWlySFKJ53wUvWM4cLBR
	xvxwS4FwmHaNZS3UKgqoXLW7UH2hZ6VjF9HaR35sf0cLGX3BQ39/f03Gzdtm455GvTXUIqna77d
	vT4LFiDJDypMmIo2DnAMGGEfXN8CsoDsYkxZ3a8T5LuK2oD880QLTCclENHe2kpjytEI7QaRAQH
	Srsxypur3rkNNtAqiH+jEJ00MZiGo5RAJgAbo0qDNWBnDO9E5PRivvv9CiD4OCGL47Gl+LE2g==
X-Google-Smtp-Source: AGHT+IFjDi5J9hUEA72Jlvdihlar6QxaFWy8rUuil5dFauMav65dN9TFe89jrIIz7Uhr/G2MVCahhQ==
X-Received: by 2002:a05:6830:6405:b0:71e:4fc:6ee1 with SMTP id 46e09a7af769-721e2e3a547mr16525548a34.9.1736820454411;
        Mon, 13 Jan 2025 18:07:34 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882755172sm3915340eaf.27.2025.01.13.18.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 18:07:32 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 6/6] wifi: mt76: mt7925: update the power-saving flow
Date: Mon, 13 Jan 2025 18:07:12 -0800
Message-Id: <20250114020712.704254-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250114020712.704254-1-sean.wang@kernel.org>
References: <20250114020712.704254-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_180735_339094_9D5DD61E 
X-CRM114-Status: GOOD (  17.25  )
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
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: generate the patch based on the latest mt76 tree
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
index 07e5c1a6d5d5..4d8b4272e147 100644
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


