Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B073EFCE54
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 23:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITGj90b4rmhj9ra+omckXD+F4UkNt/EJau7xKxZK9QM=; b=afG0bxOnBujNSnd47kD1djdJEJ
	J1QhEpRCaY/8dMAYoOrEC6mUBmXfFl+39e4CXQ5jcpLWw0SHNr5Bxc1qkOO/lCZoN09wcLjBHiUkQ
	Lxo02Dt4X2x0x8VFoFDmqtIFPVKGxJ5mwTmP6+xszy3bfYxwVQWfzrGztL5tG7yNABN7tKHggbaz4
	1JB8VtreiR7FpttoK8FGBT3Sz4ZjgiL6r/D5nlWWDlcxlLxm09E1JzYG2D1x/aqTkdDu1YkB+AfUj
	+wibjCJyAPYyWtqRm8L4i/bIxJEHB5mFZEUv8X+QVDXFTIUINyHBKCCoHI7Y6XgzxWNlgNCQUikLr
	qYDZ4Z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvze-00000000eHI-2IFz;
	Wed, 04 Mar 2026 23:51:06 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvzY-00000000eEY-3rgo
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 23:51:05 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d18d0e6d71so5626937a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 15:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668260; x=1773273060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ITGj90b4rmhj9ra+omckXD+F4UkNt/EJau7xKxZK9QM=;
        b=fi2F2pxpF1C6sFCVg6uaL0dfQJy22nlDtJimnFMgi6+fb43MXbkaBSXrI3lNnxd119
         wQ/+clWsb6Pq2aMWW/GqYN0ZkG9VVSAWsjKnKLK096/GkL6R+vOQ+EZp0gX26CIADEot
         gKKjT0qT7Gd2QmEq/r0M6lUenggnucPGueJ36VQ8qpO9YcW5v+lnr1O1ygaHzD41gBZS
         cp9I9cb7KcXl/c3t+gj8+8l+UYb0CKhRkmXED5L+C6OytCfnCjF1kFzKe0TH8/Ogvu7n
         lW3UfUiE1lQrdGvdCqtE9oHtvW6tYS0ccZcmPb3b7up7CIE9sK9l8fbpjbO9P/kbsDc+
         vVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT1OKCWIo9TMuCla4YeJSwA+6K7zur0fVUSKD1wG3+in80y4FX6mg6B1eGx0S53xbQE7Nyzz7w+lWsOhFY2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCTP5L9wFpnuio/0zYjQbccwbjmrHTog0GdbYDobc9Gi6USM6I
	y10IDgtQbADidYtjtdFjHlAKP8rHS5sCrEcdXEVjzmckiZi9bMGZ0x07
X-Gm-Gg: ATEYQzw1/qmJbT9lzl6PVViz6IXl2bS9XhI+KKp9wk3c0VA0gEZzfol+IK1tJq8cZQW
	qcaGIgARbkmv3O05nVxwBCQLzVgAFsIq9gZg+OvFi4fGQJwC/WJ3UWuz3CPwvSakKkbMlrqeBu1
	4KMBa4NiQC1ip40UXJwWLJ9z0WK0NX5tYg/g6G4Ve/1Sio4VJiG6/AF9LqGESk3kBNFg5ltUbGo
	MkQ5oV4N4tGymjo82PGx8RHCwVafFQqVn1Y32ph3QfnJbtZq4I37t/Zma4QjSD6awtTDhaR/3oC
	BKOAr2XE78cUSheTwMiQwZLpMG1j9XVdt2jazdd7DDFYkMoHP394BJrb43duI/uwC1EWTJzekGb
	yEGxVFibEKahjJ2nOIQ8RVQT0JbHnMkc/NAf0UUq9bjy5JFpAewctbzLYI59fDWnqKqqc+/tFzi
	eIiIoh6JDlcc5Gx0f1BnJl4TDSY8aRihfe9s1AE6Tt01Cp/Z0=
X-Received: by 2002:a05:6820:1786:b0:679:a41d:2d2f with SMTP id 006d021491bc7-67b1770a269mr2380231eaf.30.1772668260004;
        Wed, 04 Mar 2026 15:51:00 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2bfee3csm14410687eaf.7.2026.03.04.15.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:50:59 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	yuchi.wang@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 6/7] wifi: mt76: mt7925: add mac80211 NAN start/stop/change_conf ops
Date: Wed,  4 Mar 2026 17:50:19 -0600
Message-ID: <20260304235020.40451-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304235020.40451-1-sean.wang@kernel.org>
References: <20260304235020.40451-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155100_968961_D4462E0F 
X-CRM114-Status: GOOD (  14.64  )
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

Wire mac80211 NAN start/stop/change_conf callbacks to mt7925 NAN MCU
enable/disable/config. Track the active NAN vif and notify mac80211 on
cluster join events.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 69 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.c   |  7 ++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +
 3 files changed, 78 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index afcc0fa4aa35..f215984495c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -11,6 +11,7 @@
 #include "regd.h"
 #include "mcu.h"
 #include "mac.h"
+#include "nan.h"
 
 static void
 mt7925_init_he_caps(struct mt792x_phy *phy, enum nl80211_band band,
@@ -442,6 +443,8 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	INIT_WORK(&mvif->csa_work, mt7925_csa_work);
 	timer_setup(&mvif->csa_timer, mt792x_csa_timer, 0);
 
+	if (vif->type == NL80211_IFTYPE_NAN)
+		dev->nan_vif = vif;
 out:
 	mt792x_mutex_release(dev);
 
@@ -2297,6 +2300,69 @@ static void mt7925_channel_switch_rx_beacon(struct ieee80211_hw *hw,
 	}
 }
 
+static int mt7925_start_nan(struct ieee80211_hw *hw,
+			    struct ieee80211_vif *vif,
+			    struct cfg80211_nan_conf *conf)
+{
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct ieee80211_bss_conf *link_conf = &vif->bss_conf;
+	int err = 0;
+
+	mt792x_mutex_acquire(dev);
+
+	link_conf->chanreq.oper.chan = conf->band_cfgs[NL80211_BAND_2GHZ].chan;
+
+	err = mt7925_mcu_add_bss_info(&dev->phy, NULL, link_conf,
+				      NULL, true);
+	if (err < 0)
+		goto out;
+
+	err = mt7925_nan_enable(vif, dev, conf);
+
+out:
+	mt792x_mutex_release(dev);
+
+	return err;
+}
+
+static int mt7925_stop_nan(struct ieee80211_hw *hw,
+			   struct ieee80211_vif *vif)
+{
+	struct ieee80211_bss_conf *link_conf = &vif->bss_conf;
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	int err = 0;
+
+	mt792x_mutex_acquire(dev);
+
+	err = mt7925_nan_disable(vif, dev);
+	if (err < 0)
+		goto out;
+
+	err = mt7925_mcu_add_bss_info(&dev->phy, NULL, link_conf,
+				      NULL, false);
+out:
+	mt792x_mutex_release(dev);
+
+	return err;
+}
+
+static int mt7925_nan_change_conf(struct ieee80211_hw *hw,
+				  struct ieee80211_vif *vif,
+				  struct cfg80211_nan_conf *conf,
+				  u32 changes)
+{
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	int err = 0;
+
+	mt792x_mutex_acquire(dev);
+
+	err = mt7925_nan_change_configure(vif, dev, conf);
+
+	mt792x_mutex_release(dev);
+
+	return err;
+}
+
 const struct ieee80211_ops mt7925_ops = {
 	.tx = mt792x_tx,
 	.start = mt7925_start,
@@ -2366,6 +2432,9 @@ const struct ieee80211_ops mt7925_ops = {
 	.channel_switch = mt7925_channel_switch,
 	.abort_channel_switch = mt7925_abort_channel_switch,
 	.channel_switch_rx_beacon = mt7925_channel_switch_rx_beacon,
+	.start_nan = mt7925_start_nan,
+	.stop_nan = mt7925_stop_nan,
+	.nan_change_conf = mt7925_nan_change_conf,
 };
 EXPORT_SYMBOL_GPL(mt7925_ops);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 9483ee94c05e..bb67374c9764 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -344,11 +344,18 @@ mt7925_nan_mcu_handle_de_event(struct mt792x_dev *dev, struct tlv *tlv)
 	if (de_evt->event_type != NAN_EVENT_ID_JOINED_CLUSTER)
 		return;
 
+	if (!ieee80211_vif_nan_started(dev->nan_vif)) {
+		dev_warn(dev->mt76.dev, "nan: joined-cluster event but NAN not started\n");
+		return;
+	}
+
 	dev_dbg(dev->mt76.dev, "nan: anchor_master_rank=%*phN\n",
 		NAN_ANCHOR_MASTER_RANK_NUM, de_evt->anchor_master_rank);
 
 	dev_dbg(dev->mt76.dev, "nan: own_nmi=%pM master_nmi=%pM\n",
 		de_evt->own_nmi, de_evt->master_nmi);
+
+	ieee80211_nan_cluster_joined(dev->nan_vif, cluster_id, true, GFP_KERNEL);
 }
 
 void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 1f381ab356bc..d3988e5b38c0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -261,6 +261,8 @@ struct mt792x_dev {
 	u32 backup_l2;
 
 	struct ieee80211_chanctx_conf *new_ctx;
+
+	struct ieee80211_vif *nan_vif;
 };
 
 static inline struct mt792x_bss_conf *
-- 
2.43.0


