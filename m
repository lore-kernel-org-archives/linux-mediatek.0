Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021D8FF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2I/zvY2t9IYaNU/vQ8uoOUMW08eUe9EXXH2bArv0tJA=; b=omLZZp3glKnCHEIUVdB9z4dRzR
	2Tuw0ReyIWbkGkuOlZMZR2yt4rtZUywHZdWF9+K++EwbLjHzdzs8iFHEDAP/UtIQL84t/yvb0FmmM
	iUQm7AzsApG712CnJQve+eLurxzai+XXKx35a3wg+MRDamodY7uhaPIaVE9ddhLg7xelHIMD9ducM
	Aamz8kZFtVsHKu/ZvRqK2hKSX6PB2/46cZzumqdOLdC7rCXWFv6Vaag4yo1Qk93QScA5INjo3aSTF
	w3ujnyIXHivkoaCEHPfobbq9jATetl65ASYsJ5Xcfbc22ou/8Uj3as0U1CPWk9duqMgSwICm/tZTZ
	cK22UgEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2f-0000000EmYJ-0ulH;
	Sat, 25 Apr 2026 19:51:53 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2c-0000000EmXZ-3vyo
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:51 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d4c383f2fcso7523468a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146710; x=1777751510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2I/zvY2t9IYaNU/vQ8uoOUMW08eUe9EXXH2bArv0tJA=;
        b=EX5WtAVikKAUmNuwQoJ6k3H9xTQKDUfyTcvs3GNFRGwdVvvRIXCu4KwtHSmEWC4NUc
         MPfJY0By1i01mRvT6QueZ5qCQwfp+AzscNum24v15NENgtNNuqFT/+baKEaMfNqrIhrH
         w1QoftriiOeweS0Hux7xeHAXRZhRy6bOXL1nMbjQqjaG8h4dzU2OSMuK15kJoH2e3xU+
         42dRuMgDGyjOLngc+gXutJmAOk5IC4lF7APGXuK1JFpQZllgPySX49/qD5SdYsYvRTl2
         y8E5IhpNg+qwHhLr//BUI4CoXa1ubHxDKIurEwEvPJnYNxAWRdFeKmHsrEs3IpveHJF6
         F9Zw==
X-Forwarded-Encrypted: i=1; AFNElJ/eQh8RRAbJVU9L1ClCMfn7GZGpZ5t0sgN0/8YkbFG4iVWYMl/wbtve0wJTTQ+XWYC7xswzY5QVzJpZjNNnUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoQkaxCHA4hAc/83i4FfVZYUG0MToeyR9li/w1HX+J5IGL3FvI
	2k7dfGhO1TRgqa/3+OYi816vpDIRj6LVJH2l/UuAITnPZm43Beo8WcyO
X-Gm-Gg: AeBDievmOXajqtvfa/+XdqfazgDDs3aQ2i4/hJLuqP0k9aXYq1uD6cZOpxC0tybYOV9
	wt8Wo9xC3oE2AcJVBD67/rAgBasUwyJjU7yX+4QmqSd+k8yXek4enqwSkg/PgLhp++4y7q8XjtQ
	YKkEJ0zS3N5IpzmJsRHgApPwEKM3ZcbQKZ3PoLdS7ErHL+JsmxoQjfh8AUB1vG2IRFgCNbM2kO3
	3UC+PRSQQxlU8EKOTMGhQryxgG+CT41KWaiFWNuX3IxK1hoCEsvrB2ReOX0clOQXnJXJcna8fAx
	+dj7QGGLLZdl5eaxGWgLmg5l3D5xs73VR5SKbA6PCoqnhNoR5PVepPi3+M/9H1kgnSPhJuwF/6F
	LjOaNv4Zkwh0fWJYdEwo1c/hZoVzemaUII7A/l0en+92v9C/JkOuLXoXPWdbd1PcrYCsd8Ec9Ci
	LfVb5ZnNWCD2U6MmwgdXY49UENE2hrJcAVTAdafy21SE0aSae+MH1G/mRxiWpSZHiv2SZlQG9Kb
	Q==
X-Received: by 2002:a05:6830:4ac6:b0:7dc:d967:63de with SMTP id 46e09a7af769-7dcd96766c6mr13718331a34.3.1777146710088;
        Sat, 25 Apr 2026 12:51:50 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:49 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Javier Tia <floss@jetm.me>
Subject: [PATCH v5 17/21] wifi: mt76: mt7925: sync MT7927 BSS band assignment
Date: Sat, 25 Apr 2026 14:50:07 -0500
Message-ID: <20260425195011.790265-18-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125150_986499_3FFB1D35 
X-CRM114-Status: GOOD (  15.46  )
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

MT7927 needs DBDC enabled and uses a fixed firmware band assignment for
2.4GHz and 5/6GHz BSS contexts.

Reprogram the STA dev context when the channel context is assigned so the
firmware sees the updated band_idx before the BSS is used. This avoids
stale band programming after band changes.

Co-developed-by: Javier Tia <floss@jetm.me>
Signed-off-by: Javier Tia <floss@jetm.me>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/init.c  |  9 ++++
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 42 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  1 +
 .../wireless/mediatek/mt76/mt7925/mt7925.h    | 12 ++++++
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |  7 ++++
 5 files changed, 71 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index a8c2ca7c0efc..e85b0d104fbe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -117,6 +117,15 @@ static int __mt7925_init_hardware(struct mt792x_dev *dev)
 	if (ret)
 		goto out;
 
+	if (is_mt7927(&dev->mt76)) {
+		ret = mt7925_mcu_set_dbdc(&dev->mphy, true);
+		if (ret) {
+			dev_warn(dev->mt76.dev,
+				 "MT7927 DBDC enable failed: %d\n", ret);
+			ret = 0;
+		}
+	}
+
 out:
 	return ret;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 044043a8768d..b36f5eb30371 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -396,6 +396,18 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 	mconf->mt76.omac_idx = ieee80211_vif_is_mld(vif) ?
 			       0 : mconf->mt76.idx;
 	mconf->mt76.band_idx = 0xff;
+
+	if (is_mt7927(&dev->mt76)) {
+		struct ieee80211_channel *chan = NULL;
+
+		if (link_conf->chanreq.oper.chan)
+			chan = link_conf->chanreq.oper.chan;
+		else if (mvif->phy->mt76->chandef.chan)
+			chan = mvif->phy->mt76->chandef.chan;
+
+		mconf->mt76.band_idx = mt7927_band_idx(chan->band);
+	}
+
 	mconf->mt76.wmm_idx = ieee80211_vif_is_mld(vif) ?
 			      0 : mconf->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
 	mconf->mt76.link_idx = hweight16(mvif->valid_links);
@@ -2238,6 +2250,29 @@ mt7925_change_sta_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return err;
 }
 
+static int
+mt7927_reconfig_band(struct mt792x_dev *dev, struct ieee80211_vif *vif,
+		     struct ieee80211_bss_conf *link_conf,
+		     struct mt792x_bss_conf *mconf,
+		     u8 band_idx)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_link_sta *mlink = &mvif->sta.deflink;
+	int ret;
+
+	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf,
+					  &mconf->mt76, &mlink->wcid,
+					  false);
+	if (ret)
+		return ret;
+
+	mconf->mt76.band_idx = band_idx;
+
+	return mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf,
+					   &mconf->mt76, &mlink->wcid,
+					   true);
+}
+
 static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 				     struct ieee80211_vif *vif,
 				     struct ieee80211_bss_conf *link_conf,
@@ -2248,6 +2283,7 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct ieee80211_bss_conf *pri_link_conf;
 	struct mt792x_bss_conf *mconf;
+	u8 band_idx;
 
 	mutex_lock(&dev->mt76.mutex);
 
@@ -2261,6 +2297,12 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 						NULL, true);
 	} else {
 		mconf = &mvif->bss_conf;
+
+		if (is_mt7927(&dev->mt76)) {
+			band_idx = mt7927_band_idx(ctx->def.chan->band);
+
+			mt7927_reconfig_band(dev, vif, link_conf, mconf, band_idx);
+		}
 	}
 
 	mconf->mt76.ctx = ctx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index b338d6bf02f5..f7e14cc53dac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2918,6 +2918,7 @@ int mt7925_mcu_set_dbdc(struct mt76_phy *phy, bool enable)
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mt7925_mcu_set_dbdc);
 
 static void
 mt7925_mcu_build_scan_ie_tlv(struct mt76_dev *mdev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 984be40ca76d..242f83f90dd4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -252,6 +252,18 @@ struct mt7925_txpwr {
 	s8 eht996x3_484[16][2];
 };
 
+static inline u8 mt7927_band_idx(enum nl80211_band band)
+{
+	switch (band) {
+	case NL80211_BAND_2GHZ:
+		return 0;
+	case NL80211_BAND_5GHZ:
+	case NL80211_BAND_6GHZ:
+	default:
+		return 1;
+	}
+}
+
 extern const struct ieee80211_ops mt7925_ops;
 
 int __mt7925_start(struct mt792x_phy *phy);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 1626a3684082..97683949a305 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -3,6 +3,7 @@
 
 #include "mt7925.h"
 #include "../dma.h"
+#include "mcu.h"
 #include "mac.h"
 
 int mt7925e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
@@ -144,6 +145,12 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 	if (err)
 		goto out;
 
+	if (is_mt7927(&dev->mt76)) {
+		err = mt7925_mcu_set_dbdc(&dev->mphy, true);
+		if (err)
+			goto out;
+	}
+
 	err = __mt7925_start(&dev->phy);
 out:
 	clear_bit(MT76_RESET, &dev->mphy.state);
-- 
2.43.0


