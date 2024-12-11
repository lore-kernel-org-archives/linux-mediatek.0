Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA03E7717F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7R2p//Pqh9wUP2QmrJjZ02D5zzYfEnah5rmAeHm8NgI=; b=gSUkB5q13V6OXLinVnfpdH9+8c
	D0DVEIoR7F7SLoHHiGF5R3CQXR0HUprwP1ZMZKJODu6v8qdVbCPOGMa0ivzaxAf1sDOMalHEOXu85
	fa98Ns5kJAEZV61GVGIjWGreYjrSoI8/kpqKPMDn4rk714OWJ58CK7V0p6P9KkWLOv1TmqD5lgEoR
	3oUjrsy5rIEcZbpc5dXuUEKicMCOsXpxsKKlw4IcLnDKwY5k4lqXAPAOLnSkSis0Gpzx2UqVefpRG
	k+kpWL1JCrVrx0guR4752OzCDUgITE+OaPKhdWaoKX/106P0MilhLVYPViDDhHOPNa9M3HGcQjUc/
	nhWl9sIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOA-0000000DObo-0m3w;
	Wed, 11 Dec 2024 01:19:42 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBO7-0000000DObC-1gcZ
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:19:40 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2689e7a941fso1952748fac.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733879977; x=1734484777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7R2p//Pqh9wUP2QmrJjZ02D5zzYfEnah5rmAeHm8NgI=;
        b=pbtnJobjq/IcLO98ckqUgxNL5W2s26iPEcwgLwhKbzz3IC0nqmHcugLAGZHgCcCgqV
         ODVLrzJElSawQLsxDT2AK3JzrS6p81HthEUzTT8eShkmwQcQKiwfih/Yv2LzS2f2O/ol
         f8mYSCmtENfc6oJnTRTpYABiegAXENoQUN1P7Hb3RpjhrlqmWAI65pW58359m4Y5FMBN
         dOvfeGS+bzPFHjM4C2RBBNB7+8KfeAjUg1sB/HD2VezsE3muat6NCfSNZsPtH1Jj8cgf
         H0g/D/WrZVMaQbwxDFA2GaW+d22A2YisO6jEHwFmVfdntf/F6f0kmGCF4EwuHuGPbEc1
         ThFA==
X-Forwarded-Encrypted: i=1; AJvYcCVaMuNg3H2C+iNxDaplYgiBuxR0ElVS38dKZt2UynA4qS6tx8j2K+Xv+b153xTD/zh+hvhI8y5GXzi7BOYJEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv2/S2UW+AKtNBOQJMU1StZD6mcoW51SBBlrxvw1ITWV98s8l0
	5upEPylEpU+AZWqhfYg+dQWnYSJdeb5MLXWNxMXTfOq6c4KvgKX2
X-Gm-Gg: ASbGncujrdEfXP+KNwtX3xu97TDmp6FVGyDs6qBoxUF81bqmeWi0un+jWWq+JiVnVrw
	B8TpvkQ6cSQhX6hZP3wzQXm+uO5Yvnd6IKy6RQZ/IEgvA4YazmuFd4n31LNqNapF53tnNQ+zLnp
	W+yUCoGLBbvLwbJp9RlKjTR27N6yIRUAcw4x1ODftlTtUnhaJbgoj3sZkURAs6lz99/s1+TRNkS
	YSNVU54zAncoiE4jeTV5iwCNpICKyOVVLbdIC9gedF37YBad6M7kU5B18czcTZieIUfj30=
X-Google-Smtp-Source: AGHT+IGNuoBK7+mQMrPDJXe8k8x4BCL83y7Gl405d/qpVq9bNdqtQY2pnCr2AcEElpzXFVMS43aLUg==
X-Received: by 2002:a05:6871:6c0f:b0:29d:c5e8:e424 with SMTP id 586e51a60fabf-2a012b4f09cmr706059fac.9.1733879977589;
        Tue, 10 Dec 2024 17:19:37 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:19:36 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 01/17] wifi: mt76: connac: Extend mt76_connac_mcu_uni_add_dev for MLO
Date: Tue, 10 Dec 2024 17:19:10 -0800
Message-Id: <20241211011926.5002-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_171939_444712_2BC8EDC8 
X-CRM114-Status: GOOD (  12.86  )
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

From: Sean Wang <sean.wang@mediatek.com>

This commit extends the `mt76_connac_mcu_uni_add_dev` function to include
support for Multi-Link Operation (MLO). Additionally, backward
compatibility for MT7921 is preserved, enabling seamless integration with
existing setups.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c      | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/main.c     | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c      | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt7925/main.c     | 2 +-
 drivers/net/wireless/mediatek/mt76/mt792x_core.c     | 3 ++-
 8 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 804d3f5a5244..5373937b0e04 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1113,7 +1113,7 @@ mt7615_mcu_uni_add_dev(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 
-	return mt76_connac_mcu_uni_add_dev(phy->mt76, &vif->bss_conf,
+	return mt76_connac_mcu_uni_add_dev(phy->mt76, &vif->bss_conf, &mvif->mt76,
 					   &mvif->sta.wcid, enable);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 77f3e92d581a..4171710d645c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1137,10 +1137,10 @@ EXPORT_SYMBOL_GPL(mt76_connac_mcu_wtbl_ba_tlv);
 
 int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 				struct ieee80211_bss_conf *bss_conf,
+				struct mt76_vif *mvif,
 				struct mt76_wcid *wcid,
 				bool enable)
 {
-	struct mt76_vif *mvif = (struct mt76_vif *)bss_conf->vif->drv_priv;
 	struct mt76_dev *dev = phy->dev;
 	struct {
 		struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 1b0e80dfc346..57a8340fa700 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1938,6 +1938,7 @@ void mt76_connac_mcu_sta_ba_tlv(struct sk_buff *skb,
 				bool enable, bool tx);
 int mt76_connac_mcu_uni_add_dev(struct mt76_phy *phy,
 				struct ieee80211_bss_conf *bss_conf,
+				struct mt76_vif *mvif,
 				struct mt76_wcid *wcid,
 				bool enable);
 int mt76_connac_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif *mvif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 047106b65d2b..bd1455698ebe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -647,6 +647,7 @@ mt7921_vif_connect_iter(void *priv, u8 *mac,
 		ieee80211_disconnect(vif, true);
 
 	mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
+				    &mvif->bss_conf.mt76,
 				    &mvif->sta.deflink.wcid, true);
 	mt7921_mcu_set_tx(dev, vif);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 573a2cd7fe45..1542c762e2a6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -308,6 +308,7 @@ mt7921_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->bss_conf.mt76.wmm_idx = mvif->bss_conf.mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
 
 	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, &vif->bss_conf,
+					  &mvif->bss_conf.mt76,
 					  &mvif->sta.deflink.wcid, true);
 	if (ret)
 		goto out;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 634c42bbf23f..ddd406969061 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1271,6 +1271,7 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 	struct mt792x_dev *dev = mvif->phy->dev;
 	struct ieee80211_hw *hw = mt76_hw(dev);
 	struct ieee80211_bss_conf *bss_conf;
+	struct mt792x_bss_conf *mconf;
 	int i;
 
 	if (vif->type == NL80211_IFTYPE_STATION)
@@ -1278,8 +1279,9 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 		bss_conf = mt792x_vif_to_bss_conf(vif, i);
+		mconf = mt792x_vif_to_link(mvif, i);
 
-		mt76_connac_mcu_uni_add_dev(&dev->mphy, bss_conf,
+		mt76_connac_mcu_uni_add_dev(&dev->mphy, bss_conf, &mconf->mt76,
 					    &mvif->sta.deflink.wcid, true);
 		mt7925_mcu_set_tx(dev, bss_conf);
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 791c8b00e112..22a9437236c0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -372,7 +372,7 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 	else
 		mconf->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL;
 
-	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf,
+	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mconf->mt76,
 					  &mlink->wcid, true);
 	if (ret)
 		goto out;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 042aa8d1b6e7..e6046bfbefe3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -151,7 +151,8 @@ void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
 	link_conf = mt792x_vif_to_bss_conf(vif, mconf->link_id);
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &mlink->wcid);
-	mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mlink->wcid, false);
+	mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mconf->mt76,
+				    &mlink->wcid, false);
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
-- 
2.25.1


