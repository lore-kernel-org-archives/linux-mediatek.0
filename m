Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965CEC5DF9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeonRlP0AmNpIWgR3zOOTFzTXc3/eUo2hUs/hJhA6L8=; b=GzMVCDH2oknv4B4z8Wm7EjY4z5
	L97/Se45ZZe0X8Pl5OITdeqV+49PnBN4PqdItT3RpUGvuZu448G26lz1vZ1ocXJB655a+FhcVDIz8
	vmX5swYf5vTNyYU0Ta9ln5YUxNLQ6verID1IO4ROdxPHK0k2gLmN9Gb1HnQD9EbqRsctQgOwqD8NP
	rvCyG/TlUVeQJUg819tzR9vvigmCJEBth3cfyQS0GfGaFOL6Vl8zOsh3SrfjugkaS4GLNxHs4pJnd
	iwr1q7Faycm0cBwHk/0dVs5PQn57QQ2QFO4zSCcmdp0XBjaochadSl+Ram9tKknfZpkc7iQU5c9J+
	cfGc9SWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajD-0000000HKMZ-19Ue;
	Mon, 24 Aug 2026 19:53:07 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaj8-0000000HKLi-3v4V
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:04 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-448b69cfc6dso3791109fac.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601182; x=1788205982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TeonRlP0AmNpIWgR3zOOTFzTXc3/eUo2hUs/hJhA6L8=;
        b=dGZfE6k8DPhyRrQuecpVQfjM4PEBHlw6UYsiOhJB1+tyr83tK8IIwd4H/v7cY/F69Z
         pamgdaYIBl6JTiL5q31GuA78b0EWeWYDazxS8OvFV+BgppguDS+EandmJKqKfjls0BHB
         iK80oHzFcAJFVz7WUjFPsfTf+W3YjQv36aJ2K2Bol1hHzCgJnU3DdcIG3VyPexJOCoh3
         hTQCgMZ56aeK0vwADyWLvtvI6nQ7nZPTN41jbCkWrDJCJstMiW6txPxI5h+DkjJjAHzU
         b4JS0+cUri6mj5ZHYpVPQIBrKMDVCA6JRob873paWB3/v+cFU8zLHO3jn66O9xd2XM1z
         sFUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrooYuEHupCgQxpsNY5nSBngddQtMcIe0S76bx/dZzQK45J6hhnIkynuhfZAR0hMpSETrHSJ/w0SS4ss+cBPA==@lists.infradead.org
X-Gm-Message-State: AFuF++n5QEERUI1rnBnVkyPUcoTF+wqOgHZy4MsjEmwHuugGENzr+weA
	onh7eDyflbfdnM+Ea4cXZ+wWU0Yd8jXD7Cx/LhP5+wlJnr1UnTNwDUdX
X-Gm-Gg: AR+sD121CbA22iAVNVI0ETLsiIH6bTmA4ENaBsIO4mMbR7C6TzqucczdmJ4O/oSLRne
	FOZ8uQRU01wmNZrtCyWrK249i5vV1WRzOiC9FwTRmcXlwoW+Z0QbwsiSt3bWmlsFJM7Nb5Fv9DL
	08RcCqiFPr4kcqvsQjIFtQ305Z1bGfz7mLM0EVhRAVN6sbeANlp1mlzuvd8wvFyOSb+eNUN63Ev
	nE6e+eAalNdUAT4WLhlVWJ19Os7ovpzBlV9Yb9KOjPBg51QJfvy/l0N1tsPlBiVA3q+u2jkBLC8
	aCDL/zdxAaodY8IRjGB6GZHNWr8WeNbsqxPmnrG5J0vjvUXVF8X6EIlAbJ3u4HFczbrBbLysa/f
	ApjtW+q2r9RbNJmr/jy/bopG9Zlxcw1Z/lZP6KXk9eyiWxlNgVkRHpt84wUSDtE/zNATqLsmtt2
	x22edq7QdO0//kpGItK0AwSijohJAIDzIcxP2C2yR9Sj8kkGexqIBm1LAedyzlambOtDElmbShS
	G+9xXRhGT9LKYT8PiIRh9KHkLKXE5iLcwNHeNZcDLeajH7yhObp0B74zlH8
X-Received: by 2002:a05:6870:ab8b:b0:435:16e9:f288 with SMTP id 586e51a60fabf-4644b59067cmr1615297fac.20.1787601181803;
        Mon, 24 Aug 2026 12:53:01 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:01 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 03/15] wifi: mt76: mt7925: fix NAN committed CRB timeline layout
Date: Mon, 24 Aug 2026 14:52:15 -0500
Message-ID: <20260824195227.12589-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125302_980285_539B434E 
X-CRM114-Status: GOOD (  13.10  )
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

From: Stella Liu <yu-ching.liu@mediatek.com>

The committed CRB timeline carried a local_map_id byte that does not
exist in the firmware NAN_SCHEDULE_TIMELINE_T layout (map id plus 3
reserved bytes), shifting the availability bitmap. Drop it and match
the firmware structure.

The common-slot check is also dropped as redundant: mac80211 already
tracks common slots, so avail_map is built directly from the peer
schedule.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 37 ++++++-------------
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  3 +-
 2 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index ba7374fb7c03..e51e91f08b49 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -753,52 +753,38 @@ static int mt7925_nan_peer_cap_tlv(struct sk_buff *skb,
 
 static void
 mt7925_nan_fill_crb_committed(struct mt7925_nan_sched_update_crb_tlv *crb_tlv,
-			      struct ieee80211_vif *vif,
 			      struct ieee80211_nan_peer_sched *sched)
 {
-	struct ieee80211_nan_sched_cfg *local_sched;
-	u8 local_map_id;
 	u32 m, slot;
 
-	if (!vif || !sched)
+	if (!sched)
 		return;
 
-	local_sched = &vif->cfg.nan_sched;
-	local_map_id = mt7925_nan_avail_attr_ctrl(local_sched) &
-		       NAN_AVAIL_CTRL_MAPID;
-
 	for (m = 0; m < CFG80211_NAN_MAX_PEER_MAPS &&
 	     m < NAN_TIMELINE_MGMT_SIZE; m++) {
+		struct ieee80211_nan_peer_map *map = &sched->maps[m];
 		struct mt7925_nan_sched_timeline *tl =
 			&crb_tlv->comm_faw_timeline[m];
-		struct ieee80211_nan_peer_map *map = &sched->maps[m];
-		u32 avail_map = 0;
 
 		if (map->map_id == CFG80211_NAN_INVALID_MAP_ID)
 			continue;
 
 		tl->map_id = map->map_id;
-		tl->local_map_id = local_map_id;
 
+		/*
+		 * Convert peer schedule slots to FW avail_map bitmap.
+		 * Each bit in avail_map[0] represents one time slot where
+		 * the peer has committed availability.
+		 */
 		for (slot = 0; slot < CFG80211_NAN_SCHED_NUM_TIME_SLOTS;
 		     slot++) {
-			struct ieee80211_nan_channel *local_ch;
-			struct ieee80211_nan_channel *peer_ch;
+			struct ieee80211_nan_channel *ch = map->slots[slot];
 
-			local_ch = local_sched->schedule[slot];
-			peer_ch = map->slots[slot];
-
-			if (!local_ch || !local_ch->chanctx_conf ||
-			    !peer_ch || !peer_ch->chanctx_conf)
-				continue;
-
-			if (local_ch->chanctx_conf != peer_ch->chanctx_conf)
+			if (!ch || !ch->chanctx_conf)
 				continue;
 
-			avail_map |= BIT(slot);
+			tl->avail_map[0] |= cpu_to_le32(BIT(slot));
 		}
-
-		tl->avail_map[0] = cpu_to_le32(avail_map);
 	}
 }
 
@@ -824,8 +810,7 @@ static int mt7925_nan_update_crb_tlv(struct sk_buff *skb,
 	crb_tlv->is_use_ranging = false;
 	crb_tlv->comm_ndc_ctrl.is_valid = false;
 
-	mt7925_nan_fill_crb_committed(crb_tlv, msta->vif->phy->dev->nan_vif,
-				      sta->nan_sched);
+	mt7925_nan_fill_crb_committed(crb_tlv, sta->nan_sched);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 91f4e999711e..fab10b829eaa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -348,8 +348,7 @@ struct mt7925_nan_sched_update_peer_cap_tlv {
 
 struct mt7925_nan_sched_timeline {
 	u8 map_id;
-	u8 local_map_id;
-	u8 reserved[2];
+	u8 reserved[3];
 	union {
 		__le32 avail_map[NAN_TOTAL_DW];
 		u8 avail_block[NAN_TOTAL_DW * 4];
-- 
2.43.0


