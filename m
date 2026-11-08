Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C64606A332
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=umHr/xUv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PApx7aNH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2ImTsYPrfEljpxg4p9epHRlQC0cVDFbjJcUcIEwrTtc=; b=umHr/xUvpq8gkq
	oWx4bVMXwClpZPgBkJaPtp/uSJZP5LCYGI3WTpirjN4zRgoPxIKNJgTaLr6nshbQkSXU2dwzUn2s9
	TGoQxba6dPN9q2Er6zqtjla9hdUEoO587/YDCDrMRSYu9wfb9Q1JdKvbi2LNewn0PzZeqiG7yehYc
	7V/vAcp18USK96oNfdKE789DYsw3KmPPtyOXVP+6UFJRMdLqjvYQY/N+3+jZgYf4+gl482MWiSnGi
	5WBAm++cVFbNismyUPVHnwUiJnfvAT1m+YdKADDrC2grlxxv1xoglMdN3vtz8uaOAp9C0rQXD3EWK
	/3nzwyoW/wiQDnc7qUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxC2-0000000FmSk-2ynK;
	Sun, 08 Nov 2026 07:19:58 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxC0-0000000FmSF-07fF
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 07:19:57 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so127165c88.1
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 23:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122395; x=1794727195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ImTsYPrfEljpxg4p9epHRlQC0cVDFbjJcUcIEwrTtc=;
        b=PApx7aNH4MbjFpoEVlJJ6LTi3RBwTHxiM2mVJtdbWHOPUjSx/50w01TGJ5h+EyNcwA
         7f8qeiTjsYw1gISxNQvM2Z3an/hZqhMo2U8jTU4eGsEWrtND1ym6h561fiErVpHaIlhu
         8AJgIvMqsRZwlj4rvgX8VxGbkUzA2ggdeW3AjYu1eQiBZEohF+O93rr0xECFzHhCyfRb
         L03bKlY/BuMkwFlPNJW5HHx3tYld9t2WIZHR+K5OzG86uh5XUL9qCg3qQsftLK8F6lpA
         /NeIIU9gN0WD4/Udd73eMH4utpH6/pSIEw2cKf3lVcE3uj0W3DNMm4ELnuYCh1Fn1k2C
         ZMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122395; x=1794727195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ImTsYPrfEljpxg4p9epHRlQC0cVDFbjJcUcIEwrTtc=;
        b=Uu8MYhHeouTqFzHXopyeiTurog+6yrozsPXlOHbZw8Tk25D58Gg3zufADIIWBqWPdn
         D0pCMB+1kXhnNTxz59JxMUoGxBOBerC9I+G/ILzqcxJppooi6ecvuEZiRLSoXg8DxSVz
         r6x0M4785QXbdL2cT43aw0mo7c6TkOt1Buu76slYL1zgAx4qC4A0JdvAXSbMOg4l9gM+
         hUT68KrPGIHxbFFBS0COR4GebASKcFn5/E6bYJ7EuolcM1QX5bGkqpCZb1/Kj9rVxY4G
         84OQadmNw3QuKCsAxQ9XWpcsmrnEwCumYoxGLvjCota337PJTtqrkWO04vKuthijngB7
         e0zA==
X-Forwarded-Encrypted: i=1; AL+hErE0y9qLF/yxdeDdh4FYrmYRg0KI59RGQEnS1CPM4ZJgvXnUDAJB3hQdlb7x+bLVZY9mGVyGWFvjUfeMNoXOew==@lists.infradead.org
X-Gm-Message-State: APuU4Z/ruHDIWJIjD8LgKBb4BzovVi3c4mPQszaUz4ashBWLPJwjkR4M
	bKxrtLGyZflBWwBeAmC6FHwdSzs1DEcZKxS6NV33aPTvU7nQelmv+O0F
X-Gm-Gg: AYBFou3+iJxzL3XyXZFsW8FGOu0ghotMi2E+IgDiyv7BBtbP7Ga+blH8Fhvb3uTXAC4
	Yds7Zq79DZ+skPE4+FXEQvq/WQuQz/bdVIhhwNvcIcuhuJcBfKdQ6x6dCQ1l+m/ADZ1lknwMxMG
	mrOLnjBtMvCzy9eKdveN+LHBwYEK9aOV1sD8k/CV8pLzCl4l33r6bcNkaZfheKFtNOtyk/WADFT
	FijRcAJP58fE1DFruhShrVZGJi18FPwDSMGSXb4AAzYEF1HJJGSQQpKNfr/6LK8tpRxUNCHMYTU
	cJBNWP7kK+cLXy8XoKxKFX+Hoq9mVDANZq8D/YGnkhb/Y0BWIsyWoPvqzEcKdSOpuW29JHdTSW3
	URO/ghO3ovVVshEdX5kG1AmJMgPo2eMbshaiL3u0HFms8Ita5Gknt0qkDA3YFtXxb3MgJFrXbId
	DbhQ6Pcz1oAdF5mLhKbMRkhEAxR7ANXMBlw/35xLWIb1WPgiajs8mZSsO71sjaSTJ00UYobPSuj
	YxvXQq9sCXjh3WObDrILl3PwAaPTqkrKxfB6yY58R1Zlty2egDUs+hWL9SY5xBPLG9Rvetmqzho
	K769LNpy35Mj+hyF6LMSFZJggdf1kl43wDEAMVfsGeaLFw==
X-Received: by 2002:a05:701b:450c:10b0:192:fd91:c567 with SMTP id a92af1059eb24-1b39fe87361mr1402459c88.11.1794122394823;
        Sat, 07 Nov 2026 23:19:54 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:54 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 3/4] wifi: mt7601u: add AP operations and beacon handling
Date: Sun,  8 Nov 2026 12:47:45 +0530
Message-ID: <20261108071820.35303-4-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108071820.35303-1-johnrobin044@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
 <20261108071820.35303-1-johnrobin044@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_231956_098173_98D7AD08 
X-CRM114-Status: GOOD (  18.10  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement the start_ap() and stop_ap() callbacks required for AP mode.
This clears the WCID tables and manages the hardware Pre-TBTT timer
for beaconing. Additionally, update mt7601u_bss_info_changed() to
handle BSS_CHANGED_BEACON and BSS_CHANGED_BEACON_ENABLED, routing
beacon frames through mt7601u_mac_set_beacon() and applying the
appropriate hardware SYNC modes for AP and ADHOC interfaces.

Signed-off-by: John Robin <johnrobin044@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/mac.c   | 59 ++++++++++++++++---
 drivers/net/wireless/mediatek/mt7601u/mac.h   |  3 +-
 drivers/net/wireless/mediatek/mt7601u/main.c  | 56 +++++++++++++++++-
 .../net/wireless/mediatek/mt7601u/mt7601u.h   |  3 +-
 4 files changed, 110 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mac.c b/drivers/net/wireless/mediatek/mt7601u/mac.c
index bf485dabca745..5e2dec131331c 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mac.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mac.c
@@ -272,13 +272,13 @@ void mt7601u_mac_set_short_preamble(struct mt7601u_dev *dev, bool short_preamb)
 		mt76_clear(dev, MT_AUTO_RSP_CFG, MT_AUTO_RSP_PREAMB_SHORT);
 }
 
-void mt7601u_mac_config_tsf(struct mt7601u_dev *dev, bool enable, int interval)
+void mt7601u_mac_config_tsf(struct mt7601u_dev *dev, struct ieee80211_vif *vif,
+			    bool enable, int interval)
 {
 	u32 val = mt7601u_rr(dev, MT_BEACON_TIME_CFG);
 
-	val &= ~(MT_BEACON_TIME_CFG_TIMER_EN |
-		 MT_BEACON_TIME_CFG_SYNC_MODE |
-		 MT_BEACON_TIME_CFG_TBTT_EN);
+	val &= ~(MT_BEACON_TIME_CFG_TIMER_EN | MT_BEACON_TIME_CFG_SYNC_MODE |
+		 MT_BEACON_TIME_CFG_TBTT_EN | MT_BEACON_TIME_CFG_BEACON_TX);
 
 	if (!enable) {
 		mt7601u_wr(dev, MT_BEACON_TIME_CFG, val);
@@ -287,9 +287,22 @@ void mt7601u_mac_config_tsf(struct mt7601u_dev *dev, bool enable, int interval)
 
 	val &= ~MT_BEACON_TIME_CFG_INTVAL;
 	val |= FIELD_PREP(MT_BEACON_TIME_CFG_INTVAL, interval << 4) |
-		MT_BEACON_TIME_CFG_TIMER_EN |
-		MT_BEACON_TIME_CFG_SYNC_MODE |
-		MT_BEACON_TIME_CFG_TBTT_EN;
+	       MT_BEACON_TIME_CFG_TIMER_EN | MT_BEACON_TIME_CFG_TBTT_EN;
+
+	/* AP Mode */
+	if (vif && (vif->type == NL80211_IFTYPE_AP ||
+		    vif->type == NL80211_IFTYPE_P2P_GO))
+		val |= FIELD_PREP(MT_BEACON_TIME_CFG_SYNC_MODE, 3) |
+		       MT_BEACON_TIME_CFG_BEACON_TX;
+	/* IBSS / Ad-Hoc Mode */
+	else if (vif && vif->type == NL80211_IFTYPE_ADHOC)
+		val |= FIELD_PREP(MT_BEACON_TIME_CFG_SYNC_MODE, 2) |
+		       MT_BEACON_TIME_CFG_BEACON_TX;
+	/* Station mode */
+	else
+		val |= FIELD_PREP(MT_BEACON_TIME_CFG_SYNC_MODE, 1);
+
+	mt7601u_wr(dev, MT_BEACON_TIME_CFG, val);
 }
 
 static void mt7601u_check_mac_err(struct mt7601u_dev *dev)
@@ -401,6 +414,38 @@ void mt7601u_mac_set_ampdu_factor(struct mt7601u_dev *dev)
 		   FIELD_PREP(MT_MAX_LEN_CFG_AMPDU, min_factor));
 }
 
+int mt7601u_mac_set_beacon(struct mt7601u_dev *dev, struct ieee80211_vif *vif,
+			   struct ieee80211_bss_conf *info)
+{
+	struct sk_buff *skb = ieee80211_beacon_get(dev->hw, vif, 0);
+	struct mt76_txwi *txwi;
+	int err, words;
+
+	if (!skb)
+		return 0;
+
+	/* USB devices already reserve enough skb headroom */
+	err = skb_cow_head(skb, sizeof(struct mt76_txwi));
+	if (err) {
+		dev_kfree_skb(skb);
+		return err;
+	}
+
+	txwi = (struct mt76_txwi *)skb_push(skb, sizeof(struct mt76_txwi));
+	memset(txwi, 0, sizeof(*txwi));
+
+	txwi->wcid = 0;
+	txwi->len_ctl = cpu_to_le16(skb->len - sizeof(struct mt76_txwi));
+	txwi->rate_ctl = cpu_to_le16(0);
+
+	words = DIV_ROUND_UP(skb->len, 4);
+	err = mt7601u_burst_write_regs(dev, MT_BEACON_BASE,
+				       (const u32 *)skb->data, words);
+	dev_kfree_skb(skb);
+
+	return err;
+}
+
 static void
 mt76_mac_process_rate(struct ieee80211_rx_status *status, u16 rate)
 {
diff --git a/drivers/net/wireless/mediatek/mt7601u/mac.h b/drivers/net/wireless/mediatek/mt7601u/mac.h
index 54bd4fac54d83..528756ccf4725 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mac.h
+++ b/drivers/net/wireless/mediatek/mt7601u/mac.h
@@ -167,5 +167,6 @@ struct mt76_tx_status
 mt7601u_mac_fetch_tx_status(struct mt7601u_dev *dev);
 void mt76_send_tx_status(struct mt7601u_dev *dev, struct mt76_tx_status *stat);
 void mt7601u_set_macaddr(struct mt7601u_dev *dev, const u8 *addr);
-
+int mt7601u_mac_set_beacon(struct mt7601u_dev *dev, struct ieee80211_vif *vif,
+			   struct ieee80211_bss_conf *info);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt7601u/main.c b/drivers/net/wireless/mediatek/mt7601u/main.c
index 05ba43e1985c8..4389e332dfe19 100644
--- a/drivers/net/wireless/mediatek/mt7601u/main.c
+++ b/drivers/net/wireless/mediatek/mt7601u/main.c
@@ -149,7 +149,7 @@ mt7601u_bss_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		 *	 rt2x00 doesn't seem to be bothered though.
 		 */
 		if (is_zero_ether_addr(info->bssid))
-			mt7601u_mac_config_tsf(dev, false, 0);
+			mt7601u_mac_config_tsf(dev, vif, false, 0);
 	}
 
 	if (changed & BSS_CHANGED_BASIC_RATES) {
@@ -161,7 +161,20 @@ mt7601u_bss_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	}
 
 	if (changed & BSS_CHANGED_BEACON_INT)
-		mt7601u_mac_config_tsf(dev, true, info->beacon_int);
+		mt7601u_mac_config_tsf(dev, vif, true, info->beacon_int);
+
+	if ((changed & BSS_CHANGED_BEACON) && vif->type == NL80211_IFTYPE_AP)
+		mt7601u_mac_set_beacon(dev, vif, info);
+
+	if ((changed & BSS_CHANGED_BEACON_ENABLED) &&
+	    vif->type == NL80211_IFTYPE_AP) {
+		if (info->enable_beacon)
+			mt76_set(dev, MT_BEACON_TIME_CFG,
+				 MT_BEACON_TIME_CFG_BEACON_TX);
+		else
+			mt76_clear(dev, MT_BEACON_TIME_CFG,
+				   MT_BEACON_TIME_CFG_BEACON_TX);
+	}
 
 	if (changed & BSS_CHANGED_HT || changed & BSS_CHANGED_ERP_CTS_PROT)
 		mt7601u_mac_set_protection(dev, info->use_cts_prot,
@@ -183,6 +196,43 @@ mt7601u_bss_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mutex_unlock(&dev->mutex);
 }
 
+static int mt7601u_start_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			    struct ieee80211_bss_conf *link_conf)
+{
+	struct mt7601u_dev *dev = hw->priv;
+	int err = 0;
+
+	mutex_lock(&dev->mutex);
+
+	/* Clear the wcid Table */
+	for (int i = 1; i < 128; i++)
+		mt7601u_mac_wcid_setup(dev, i, 0, NULL);
+
+	/* Set pre TBTT to 6ms */
+	mt76_rmw_field(dev, MT_INT_TIMER_CFG, MT_INT_TIMER_CFG_PRE_TBTT, 6);
+	mt76_set(dev, MT_INT_TIMER_EN, MT_INT_TIMER_EN_PRE_TBTT_EN);
+
+	mt7601u_mac_config_tsf(dev, vif, true, link_conf->beacon_int);
+
+	mutex_unlock(&dev->mutex);
+
+	return err;
+}
+
+static void mt7601u_stop_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			    struct ieee80211_bss_conf *link_conf)
+{
+	struct mt7601u_dev *dev = hw->priv;
+
+	mutex_lock(&dev->mutex);
+
+	mt7601u_mac_config_tsf(dev, vif, false, 0);
+
+	mt76_clear(dev, MT_INT_TIMER_EN, MT_INT_TIMER_EN_PRE_TBTT_EN);
+
+	mutex_unlock(&dev->mutex);
+}
+
 static int
 mt76_wcid_alloc(struct mt7601u_dev *dev)
 {
@@ -419,6 +469,8 @@ const struct ieee80211_ops mt7601u_ops = {
 	.config = mt7601u_config,
 	.configure_filter = mt76_configure_filter,
 	.bss_info_changed = mt7601u_bss_info_changed,
+	.start_ap = mt7601u_start_ap,
+	.stop_ap = mt7601u_stop_ap,
 	.sta_add = mt7601u_sta_add,
 	.sta_remove = mt7601u_sta_remove,
 	.sta_notify = mt7601u_sta_notify,
diff --git a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
index 118d437078537..7366e1c476339 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
+++ b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
@@ -359,7 +359,8 @@ void mt7601u_mac_work(struct work_struct *work);
 void mt7601u_mac_set_protection(struct mt7601u_dev *dev, bool legacy_prot,
 				int ht_mode);
 void mt7601u_mac_set_short_preamble(struct mt7601u_dev *dev, bool short_preamb);
-void mt7601u_mac_config_tsf(struct mt7601u_dev *dev, bool enable, int interval);
+void mt7601u_mac_config_tsf(struct mt7601u_dev *dev, struct ieee80211_vif *vif,
+			    bool enable, int interval);
 void
 mt7601u_mac_wcid_setup(struct mt7601u_dev *dev, u8 idx, u8 vif_idx, u8 *mac);
 void mt7601u_mac_set_ampdu_factor(struct mt7601u_dev *dev);
-- 
2.56.0


