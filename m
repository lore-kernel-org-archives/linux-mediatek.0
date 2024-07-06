Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3516AC2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fB1JYRMFZwVbYt+IuaFt8+viDBKhrduPeNh84EEGi48=; b=AJ4cU3aZ3QD7liAuYf1YBzVgKQ
	1pXfiSD33jHwG4qYPibHMMSqn9CgaW/fKTWZGGrx1O2ku+2K+DmKUjfFznsbSyIqGfuRMZvN0XnRr
	DeJbaCaJogfphERX/5lK3CNXvnvyGTAncnKYuMeSmeOh2JHvoZhgP/z0C9uqL93HMwmEKvRarOLzk
	lyjYfcOtQ0KurGFNXzhNuU753N/PfS3n+AIqMxwl5YZk2NU6ACzNCmv2/SMFGFRUh9qK2yM2vhOrH
	ZEkTCAVSAYDfaEBMFTP9EhcL8ng3qzN5FqTW26Q2jNoUzZQqz7fRjgEXKIN0m/V5wyV0257NWvEXd
	1uBjvsJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mV-0000000HXiV-2wG0;
	Sat, 06 Jul 2024 08:28:31 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mS-0000000HXgK-3vFs
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:30 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25cb5ee9d2dso294054fac.1
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254508; x=1720859308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fB1JYRMFZwVbYt+IuaFt8+viDBKhrduPeNh84EEGi48=;
        b=WtqHxBLgwPbr9NRFWpcz5NYlut9Zb8LC4QBQ3wWjtZxwVhlGLdTtXBDDy6y5QnQlB4
         q7OEr5Aw/2LEGB2agqcPRmlcyvK7YkUgt+3/D4VHs0AHjhQFkMUsLyKZIHVYUYwslxsU
         2uKP7TiJ/YMaDQpdbGZ6bvvazAQA7mSSzoiNdno68XwdxZvB/n8uD07t3Kw1h1F5vyvC
         +W5whqk2G0v+A0mlJpBad7IqmmCC8iZcb4Pe7POSM+hyayAYZX5jaZJbMeAR023PXr9U
         yJVQ3CkMKBPn598uaQeElTsvsk1F/Beel+geMlaPnF8tIYW0CVbCje6Ghms94QbPwRWx
         QRsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbyDYhgnZg5rN/Q4gNO8gb+KnEeN7aZ8+eJMs/bY8vAifV7865huV0xk7CsFJciMFTNsoTuRkOYs+mzcKl2zgGlEX82tljYZgqh2TZXyTjgOA9
X-Gm-Message-State: AOJu0YyWmr13zhWkVUBputgEtS3b+s3gR6EJK5ahMvV8v0r5I9w1Vn3l
	JJPdrjyM8apt5nY3zdqNUK2vrn1HEdzu9jYu7LJoupVCQmeDL4qc
X-Google-Smtp-Source: AGHT+IEbBxEgHVC8/DnYcOIvLg50uKhSw9Uz87I6Wzgf6jIzs0QbwsclZn2PRIJzSzOKM0fnme89Qw==
X-Received: by 2002:a05:6871:24d7:b0:24f:e599:9168 with SMTP id 586e51a60fabf-25e2b8d0139mr7037870fac.1.1720254508050;
        Sat, 06 Jul 2024 01:28:28 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:26 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 04/37] wifi: mt76: mt7925: set mt7925_mcu_sta_key_tlv according to link id
Date: Sat,  6 Jul 2024 01:27:44 -0700
Message-Id: <16d65aae010113f9be3c4e6e759b4226d396a1be.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012829_041675_1FB5EE7B 
X-CRM114-Status: GOOD (  14.53  )
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

configure mt7925_mcu_sta_key_tlv according to link id

We created a link id field in the common structure mt76_wcid so that
mt7925_mcu_sta_key_tlv can access per-link STA/BSS. Additionally,
.link_id will be required when reporting the link information of Rx status
to mac80211. We will submit the changes for reporting the Rx status in
a separate patch.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h        |  1 +
 drivers/net/wireless/mediatek/mt76/mt7925/main.c |  1 +
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 15 +++++++++++----
 drivers/net/wireless/mediatek/mt76/mt792x.h      | 11 +++++++++++
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 15f83b5adac7..daf1e43e304e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -349,6 +349,7 @@ struct mt76_wcid {
 	u8 sta:1;
 	u8 amsdu:1;
 	u8 phy_idx:2;
+	u8 link_id:4;
 
 	u8 rx_check_pn;
 	u8 rx_key_pn[IEEE80211_NUM_TIDS + 1][6];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index da70c203d618..59b1e920bb4a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -748,6 +748,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	mlink->wcid.phy_idx = mconf->mt76.band_idx;
 	mlink->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mlink->last_txs = jiffies;
+	mlink->wcid.link_id = link_sta->link_id;
 
 	ret = mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index a67d8dd6075f..ba91c8e37dff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -967,6 +967,7 @@ mt7925_mcu_sta_key_tlv(struct mt76_wcid *wcid,
 	struct mt792x_sta *msta = container_of(mlink, struct mt792x_sta, deflink);
 	struct sta_rec_sec_uni *sec;
 	struct mt792x_vif *mvif = msta->vif;
+	struct mt792x_bss_conf *mconf = mt792x_vif_to_link(mvif, wcid->link_id);
 	struct ieee80211_sta *sta;
 	struct ieee80211_vif *vif;
 	struct tlv *tlv;
@@ -978,17 +979,23 @@ mt7925_mcu_sta_key_tlv(struct mt76_wcid *wcid,
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_KEY_V3, sizeof(*sec));
 	sec = (struct sta_rec_sec_uni *)tlv;
-	sec->bss_idx = mvif->bss_conf.mt76.idx;
+	sec->bss_idx = mconf->mt76.idx;
 	sec->is_authenticator = 0;
-	sec->mgmt_prot = 0;
+	sec->mgmt_prot = 1; /* only used in MLO mode */
 	sec->wlan_idx = (u8)wcid->idx;
 
 	if (sta) {
+		struct ieee80211_link_sta *link_sta;
+
 		sec->tx_key = 1;
 		sec->key_type = 1;
-		memcpy(sec->peer_addr, sta->addr, ETH_ALEN);
+		link_sta = mt792x_sta_to_link_sta(vif, sta, wcid->link_id);
+		memcpy(sec->peer_addr, link_sta->addr, ETH_ALEN);
 	} else {
-		memcpy(sec->peer_addr, vif->bss_conf.bssid, ETH_ALEN);
+		struct ieee80211_bss_conf *link_conf;
+
+		link_conf = mt792x_vif_to_bss_conf(vif, wcid->link_id);
+		memcpy(sec->peer_addr, link_conf->bssid, ETH_ALEN);
 	}
 
 	if (cmd == SET_KEY) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 69eb8dac0b70..fe5a6c932705 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -273,6 +273,17 @@ mt792x_vif_to_bss_conf(struct ieee80211_vif *vif, unsigned int link_id)
 	return link_conf_dereference_protected(vif, link_id);
 }
 
+static inline struct ieee80211_link_sta *
+mt792x_sta_to_link_sta(struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+		       unsigned int link_id)
+{
+	if (!ieee80211_vif_is_mld(vif) ||
+	    link_id >= IEEE80211_LINK_UNSPECIFIED)
+		return &sta->deflink;
+
+	return link_sta_dereference_protected(sta, link_id);
+}
+
 static inline struct mt792x_dev *
 mt792x_hw_dev(struct ieee80211_hw *hw)
 {
-- 
2.25.1


