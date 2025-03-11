Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F524C28B2F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFIEFsJ/XwhiiAo2vPWbGWqybVOzafl7NckxY+ZBUYI=; b=GefVDaFqrYBmrOW1ebbzRJapgt
	wGDYSTNOPBWEjZ7gvEBUNaPFtH1jHU0a6Wq9vWHxPNGwusdJGfZyPo0wbro3kuAp8eFmK8NpmSXfs
	PHQG/3qIbj54puZayN9lh/mtj8vZN7FNxqJDPOiNFCo5GGQgs78VM2Ma8uUR77fXfzBxDiGc8yHg4
	jauIavLi4Kj3Udm/qc0y6Oo2XM2QL+N/CmViVWF7ul4v9MQQdaC8cwZFYJbQ0TkpwX8nMZAd4hdOF
	X7sHeJtx7aBvjoMwagZ9muGUVNU23bu0+eNhhJKAdXXklYu3fRGpJ1hierYwvJv0AOcgNT819F05d
	6eU8jx2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3nR-00000006WiR-08yr;
	Tue, 11 Mar 2025 17:53:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3fU-00000006VBn-0GOv;
	Tue, 11 Mar 2025 17:45:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FDFC5C661C;
	Tue, 11 Mar 2025 17:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD865C4CEEA;
	Tue, 11 Mar 2025 17:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715127;
	bh=aHLPl/dBaOFAsE6VXcW0EJsceJVpUH2lwy+xqRiq47w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rh7ARPgRO7AJ9HDLjEhnsPcplj+WfjMYSTIhPia46Acr7sRPPEksZWJUDVAWf2+1Z
	 RDmTE+6jTLsyNubyKEDAPLBm7kzFuHep7Wgizu6/Lp5oB8TqlQPkrdGARO+wv9j/JT
	 U2s2MGi4fUY9QSk0vFEaWWg6yX0U6qadWq5X/aCeRheG+f8uogDAgjvsz4ccrtkrKC
	 IUV6WxbuUdzIJ1hkPFYxbi7iomUmla8Q1MUDrxfpTqyNRluhNNZ7CwRRfLNBpKFuOz
	 PjN+9czZXXTr/P/CMS1LuceUMTMGmXxQQABH9XoLuO8bJW9bmO5hx7ZO5m79vhnQb3
	 Fan8xTrdWtUVQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 18:45:03 +0100
Subject: [PATCH v2 04/13] wifi: mt76: mt7996: Add vif_cfg_changed callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mt7996-mlo-v2-4-31df6972519b@kernel.org>
References: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
In-Reply-To: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_104528_228414_18386E53 
X-CRM114-Status: GOOD (  11.72  )
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

Introduce vif_cfg_changed mac80211 callback as preliminary patch to
enable MLO support in MT7996 driver.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 35 +++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 34f984387c00714fbe72af5220ec067760510bb8..59a1e5e52450accc5b01fbe0c3af7e84bcc87df6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -679,6 +679,39 @@ mt7996_update_mu_group(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mt76_wr(dev, MT_WF_PHYRX_BAND_GID_TAB_POS3(band), mu[3]);
 }
 
+static void
+mt7996_vif_cfg_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		       u64 changed)
+{
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+
+	mutex_lock(&dev->mt76.mutex);
+
+	if ((changed & BSS_CHANGED_ASSOC) && vif->cfg.assoc) {
+		struct ieee80211_bss_conf *link_conf;
+		unsigned long link_id;
+
+		for_each_vif_active_link(vif, link_conf, link_id) {
+			struct mt7996_vif_link *link;
+
+			link = mt7996_vif_link(dev, vif, link_id);
+			if (!link)
+				continue;
+
+			if (!link->phy)
+				continue;
+
+			mt7996_mcu_add_bss_info(link->phy, vif, link_conf,
+						&link->mt76, true);
+			mt7996_mcu_add_sta(dev, vif, &link->mt76, NULL,
+					   CONN_STATE_PORT_SECURE,
+					   !!(changed & BSS_CHANGED_BSSID));
+		}
+	}
+
+	mutex_unlock(&dev->mt76.mutex);
+}
+
 static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 				    struct ieee80211_vif *vif,
 				    struct ieee80211_bss_conf *info,
@@ -705,7 +738,6 @@ static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 	 * and then peer references bss_info_rfch to set bandwidth cap.
 	 */
 	if ((changed & BSS_CHANGED_BSSID && !is_zero_ether_addr(info->bssid)) ||
-	    (changed & BSS_CHANGED_ASSOC && vif->cfg.assoc) ||
 	    (changed & BSS_CHANGED_BEACON_ENABLED && info->enable_beacon)) {
 		mt7996_mcu_add_bss_info(phy, vif, info, mvif, true);
 		mt7996_mcu_add_sta(dev, vif, mvif, NULL, CONN_STATE_PORT_SECURE,
@@ -1688,6 +1720,7 @@ const struct ieee80211_ops mt7996_ops = {
 	.conf_tx = mt7996_conf_tx,
 	.configure_filter = mt7996_configure_filter,
 	.bss_info_changed = mt7996_bss_info_changed,
+	.vif_cfg_changed = mt7996_vif_cfg_changed,
 	.sta_state = mt76_sta_state,
 	.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
 	.link_sta_rc_update = mt7996_sta_rc_update,

-- 
2.48.1


