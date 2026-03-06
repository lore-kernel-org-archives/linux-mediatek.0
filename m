Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54648F5141C
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFThv3/KwCcJjpSjEVWA04EAjQFCUckpBbwFZ3Jw+5M=; b=ox+LuXjoYV3mvb/pCNkKvZk+a7
	d60idq5wI5OsoO0y0nqxtJmg+24PMgOCdxaiP4Bk6TmRYeDaaU1hDtbP4hFciBzRheBcSxT5UCJf+
	VwDJ5Il15PMZpKU8bQxHa3Vp2wryIJV3AirfzOLfmw/3wDF0udD8xt0Cm+wiRbDAGy2Z71Dx6+Zg9
	ORvLzPzSWA8vfidRgbGccAo/FTmN1YACURVviroZVOEkKdUifVgXWVme/5dCVJbjPJfMfaNILA934
	PjZbBR16fW7QUgTO4PYxpterlJbExJGQ1DuV3pnndtW25aXu9+8Dial0kzVgQtVlUxPnp6xgC9Mjm
	4gulLrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeVv-00000004dTW-0uk4;
	Fri, 06 Mar 2026 23:23:23 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeVs-00000004dRK-35Bb
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:21 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-40fb2789476so3925578fac.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839399; x=1773444199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFThv3/KwCcJjpSjEVWA04EAjQFCUckpBbwFZ3Jw+5M=;
        b=IUBviyX2vcT4mwfGLrJLp5g5sIo7MZKGoXdPA9KOa94D8uY1Eli2RsHxEHG62f8Kz3
         TWYn/ZLGhkr4i5PNAkJmXZINJMMCBS/2atM9mp+wF4VUIBG+AFihADXQFwIg+5U6llPN
         0EUMAw8VblH0f2OVl7fXheF8ERCxEe4Yv4RuGCcfJRn0SpGhtGBUa6cXMnwiFCMMWHPF
         63R0ZmU0l28eaqLih8DigPl7EhyE1qt0gzQM5g7DApfjR2ALZzw57U4aE2hseIkzOM3s
         P7S94rRZ0ytlq9/S3oiGS/tpiQSDYxB8bGG+njAJPJp9sXC6YsTwRT62mW/xmWnj11Pd
         qOTg==
X-Forwarded-Encrypted: i=1; AJvYcCWt1gxrdFt+t9hkWP9M/u46tm/ZCXnllOeXbvIs9f0bSl9zFF1h9TU80mo8HdgjGV+i+QfuAi68FladCVGK4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMe+4MKDkss6kMPgdwDqdC+MFKvw/WNzbk3RJYWOZ0qyrovJud
	vH36FD8gGoLE2PcVnSVxFGYiyXM8U9tmkTiIjExEc26hrPkW9YL6StYG
X-Gm-Gg: ATEYQzwCCH7McAscahfV//5cc8/5zdds1m5oDJepqf0GmTro0HmvrDIGh59nlitvZ2w
	zCKuhvQ59W8/lmT4Ky9Og5Obx5SB7gu9yy2ASZtpbTPdY543y3/R6bZMEan1VFbwdG9eEKFsUNd
	3Grt4W99qigMBPHm61m/hy0yvYAChkgEAOrCK+/h7PFoX7oLUvw36PDvK+k33xTBoLKh6W1z+5W
	MYCo/bRZkOpO6+v3713GJdwWHafF41r6P6s6oHUcoWpyfy1x8507jH6egUnt0Nz/oKyikbJk+RT
	gc9wGIaSENjKYMqPqr7gLU+OUpHbGAKZBDSMRRtl0jO/fCgPmoV4KBDNMm7cq8If2yIiQR38aHD
	uNj+SS77x1lzF1CcZiz94zcTTRfsgAGPMyy8tjO+lPcg7dahaY8TKO9o8FPlev7F+22GDYIY7Ie
	KoVo2ydnChyhh0qtpf+U3DEod7NL61VJopJx1Iv2AzRTjDHBg=
X-Received: by 2002:a05:6870:bac4:b0:409:62ce:83f6 with SMTP id 586e51a60fabf-416c3ae28a8mr4667196fac.5.1772839399592;
        Fri, 06 Mar 2026 15:23:19 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:18 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 03/19] wifi: mt76: mt7925: pass mlink and mconf to sta_mld_tlv()
Date: Fri,  6 Mar 2026 17:22:22 -0600
Message-ID: <20260306232238.2039675-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152320_783158_2E8FF22F 
X-CRM114-Status: GOOD (  13.24  )
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

Drop the mt792x_sta_to_link() lookup in mt7925_mcu_sta_mld_tlv() and
pass mlink and mconf from the caller instead. The link context is
already known at the call site, making the lookup redundant.

This keeps the helper lookup-free and makes MLD link selection
explicit.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 53 +++++++++++++------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 0d5519e5dc4a..7582a8c48607 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1914,36 +1914,53 @@ mt7925_mcu_sta_eht_mld_tlv(struct sk_buff *skb,
 
 static void
 mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
-		       struct ieee80211_vif *vif, struct ieee80211_sta *sta)
+		       struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta,
+		       struct mt792x_bss_conf *mconf,
+		       struct mt792x_link_sta *mlink)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
-	unsigned long valid = mvif->valid_links;
-	struct mt792x_bss_conf *mconf;
-	struct mt792x_link_sta *mlink;
+		struct mt792x_dev *dev = mvif->phy->dev;
+	struct mt792x_bss_conf *mconf_pri;
 	struct sta_rec_mld *mld;
 	struct tlv *tlv;
-	int i, cnt = 0;
+	u8 cnt = 0;
+
+	/* Primary link always uses driver's deflink WCID. */
+	mconf_pri = (msta->deflink_id != IEEE80211_LINK_UNSPECIFIED) ?
+		    mt792x_vif_to_link(mvif, msta->deflink_id) : NULL;
+
+	/* If caller is operating on deflink, reuse its mconf as primary. */
+	if (!mconf_pri && mlink == &msta->deflink)
+		mconf_pri = mconf;
+
+	if (!mconf_pri) {
+		dev_warn_ratelimited(dev->mt76.dev,
+				     "mt7925: MLD_TLV_LINK skip (no primary mconf) sta=%pM\n",
+			sta->addr);
+		return;
+	}
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_MLD, sizeof(*mld));
 	mld = (struct sta_rec_mld *)tlv;
 	memcpy(mld->mac_addr, sta->addr, ETH_ALEN);
+
 	mld->primary_id = cpu_to_le16(msta->deflink.wcid.idx);
 	mld->wlan_id = cpu_to_le16(msta->deflink.wcid.idx);
-	mld->link_num = min_t(u8, hweight16(mvif->valid_links), 2);
 
-	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
-		if (cnt == mld->link_num)
-			break;
+	/* Always encode primary link first. */
+	mld->link[cnt].wlan_id = cpu_to_le16(msta->deflink.wcid.idx);
+	mld->link[cnt++].bss_idx = mconf_pri->mt76.idx;
 
-		mconf = mt792x_vif_to_link(mvif, i);
-		mlink = mt792x_sta_to_link(msta, i);
+	/* Optionally encode the currently-updated secondary link. */
+	if (mlink && mlink != &msta->deflink && mconf) {
+		mld->secondary_id = cpu_to_le16(mlink->wcid.idx);
 		mld->link[cnt].wlan_id = cpu_to_le16(mlink->wcid.idx);
 		mld->link[cnt++].bss_idx = mconf->mt76.idx;
-
-		if (mlink != &msta->deflink)
-			mld->secondary_id = cpu_to_le16(mlink->wcid.idx);
 	}
+
+	mld->link_num = cnt;
 }
 
 static void
@@ -1969,6 +1986,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 	int conn_state;
 
 	mconf = mt792x_vif_to_link(mvif, info->wcid->link_id);
+	mlink = container_of(info->wcid, struct mt792x_link_sta, wcid);
 
 	skb = __mt76_connac_mcu_alloc_sta_req(dev, &mconf->mt76, info->wcid,
 					      MT7925_STA_UPDATE_MAX_SIZE);
@@ -1979,8 +1997,6 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 				    CONN_STATE_DISCONNECT;
 
 	if (info->enable && info->link_sta) {
-		mlink = container_of(info->wcid, struct mt792x_link_sta, wcid);
-
 		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->link_conf,
 					      info->link_sta,
 					      conn_state, info->newly);
@@ -1999,7 +2015,10 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 					    info->state);
 
 		if (info->state != MT76_STA_INFO_STATE_NONE) {
-			mt7925_mcu_sta_mld_tlv(skb, info->vif, info->link_sta->sta);
+			mt7925_mcu_sta_mld_tlv(skb, info->vif,
+					       info->link_sta->sta,
+					       mconf, mlink);
+
 			mt7925_mcu_sta_eht_mld_tlv(skb, info->vif, info->link_sta->sta);
 		}
 	}
-- 
2.43.0


