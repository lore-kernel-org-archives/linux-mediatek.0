Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77478C5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJzjnsYLL4UwomFHEFbRiMkzuuEN73DtDLFwq3zURGc=; b=fPhm3+uLNfYooIxgh+pMIsFjyx
	6Up6wU5KMYi1n8nR1z+z2JSiniT97q0Akwn31YTj/FfaTcJ4HdyrzAmhDrEVS3t8n6dUcz17xSd0K
	nyG3zN3qVL2Bt3uaw3581biLUeF8PCobiGTskKulP5+mwfacgY62ckLkL2DPHbQ0n2JKowbMGiyaI
	F04IIFoCn+mZjx5+MUDyBI8NNfzpZnGGWnidp9hn5U6epvOJ2ONQHkFk/2DJI1LPBCa05Am3RRo84
	XR2xWjyvg1wISUmfjKtcxBWsb2zh8tGGGRFxPrBFpWxUHaeNbJWOC+uUhjB3z89DZlpafdqkFfzA9
	G9uPGjwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaja-0000000HKZ8-15Kp;
	Mon, 24 Aug 2026 19:53:30 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajY-0000000HKXh-209k
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:29 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-43b7e186a0cso1607795fac.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601207; x=1788206007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJzjnsYLL4UwomFHEFbRiMkzuuEN73DtDLFwq3zURGc=;
        b=LC6T0HRyDNiaN9WATwSTMQC38LloLBwqRViOg4NpnWWlJP3PuOshy9O9Y+Bx0f/13M
         76JlKFfgTSOBzhSKy9SYpLLOsuqB62hQia6edCi28Qw13h13OITgQ7tNbs5sHODcXLcD
         A8SmDqdv4ozROnEsI5+BYWeFoj8NAa9A672o2ec5byBzIyKktGM4/XBg5FeQZ1acXk1Y
         XoXc1TKHBj/dmwLB+fPIP4bmmSt9OljIFhhPmin/RUAFMViJ/w2l4gL/Fkme+l6z+Imz
         BNR7aZjO6Rr0B/171qVf6omzCoAiT+Jt/qyDJePQYO+a6UesR7pV9WxFQcNzBSRUEMeQ
         Hyhw==
X-Forwarded-Encrypted: i=1; AHgh+RoR2Usr5pBVEDWCHSefu8PhxnYf78jjFzpDm2vhUaIS0hQZQZXSDq7TmXJ/bxunH2dt7d81egZegwKtg4NTyw==@lists.infradead.org
X-Gm-Message-State: AFuF++nPAw0LvBEGkh7Hfto6wlLzKCS5926E72EN1X2ecv1T0LO+o3qd
	Db4sJZsEPCJKqe/iuu5APA9TuPe7oBr3I3KFhIr77CnU/z4jd8/lqHqD
X-Gm-Gg: AR+sD13fSwdxBYX/RTiFnTMti81GMhU94U1SrFNvQSGwr1wDdKCSueOzAK6N6YexNs2
	3kZeIhWtQXSKSvAeVWzsibdx7WNOaQ7OfE+olahqWG1VqznqoQsCcQnA+3wke5vSKVziGqSV9KU
	igKB6FZdC9i82yBZVUqGgyAkofm55wtPsewctHospJOouUiPbdJgZFiXXn4sowDS31pKkPcJH3q
	pWdqqpSiAceysht8w/Dp3lnyYl9HSGTZyRi0xWVnQ4ARWONDTjugO43LGyZdA6r2rXdP+SC382r
	2qqWAniNhWYlCzQQ1RtAb4sRUSISbKYBDTC0pFgc1UMhXo0GMDl4u3jxSe3UDj2Tl59eBW9ZX9j
	q/p+nw4kz18i5cQjVr9r3ZcxOsGmQXe+AyoJ8Ue7/zChz18mND9lb9Z3He68CVGz4gcbTodZykE
	tEoty/Nimw8Keub0Db9o0igmyX6CzzU2/p9+G4YEmYyQzsl50GscfYoQOF68helDxXv8Eep3xno
	ofqLOZWbKC5v8sSWigpO2TuSbL2nrTHDa/sQe0LcQ/q
X-Received: by 2002:a05:6870:469f:b0:457:4470:96e2 with SMTP id 586e51a60fabf-4637fd74442mr20423477fac.12.1787601207417;
        Mon, 24 Aug 2026 12:53:27 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:26 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 10/15] wifi: mt76: mt7925: fill all DW intervals in NAN avail_map
Date: Mon, 24 Aug 2026 14:52:22 -0500
Message-ID: <20260824195227.12589-11-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125328_527674_1052A120 
X-CRM114-Status: GOOD (  13.54  )
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

Fill avail_map for all DW intervals instead of only DW index 0.
FW requires the bitmap to be set across all 16 DW intervals for
correct NAN scheduling. Without this, NDP ping latency is extremely
high (~200ms) because FW only schedules data in the first DW interval.

Also set ch_type = 1 for new channel entries to indicate
channel-based (non-band) availability.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 27 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  3 +++
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index fc105e48eaca..4a1f80fac1b5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -491,9 +491,14 @@ static u32 mt7925_nan_slot_to_bitmap(struct ieee80211_vif *vif,
 
 			if (FIELD_GET(NAN_CH_CTRL_PRIMARY_CH, raw) ==
 			    slot_chan->chan->hw_value) {
-				u32 map = le32_to_cpu(ch_list[j].avail_map[0]);
+				u32 dw;
 
-				ch_list[j].avail_map[0] = cpu_to_le32(map | BIT(i));
+				for (dw = 0; dw < NAN_TOTAL_DW; dw++) {
+					u32 map = le32_to_cpu(ch_list[j].avail_map[dw]);
+
+					ch_list[j].avail_map[dw] =
+						cpu_to_le32(map | BIT(i));
+				}
 				le32_add_cpu(&ch_list[j].num, 1);
 				is_found = true;
 				break;
@@ -501,12 +506,18 @@ static u32 mt7925_nan_slot_to_bitmap(struct ieee80211_vif *vif,
 		}
 
 		if (!is_found && num_channels < NAN_TIMELINE_MGMT_CHNL_LIST_NUM) {
+			u32 dw;
+
 			ch_list[num_channels].ch_info =
-				cpu_to_le32(FIELD_PREP(NAN_CH_CTRL_OP_CLASS,
+				cpu_to_le32(FIELD_PREP(NAN_CH_CTRL_CH_TYPE,
+						       NAN_BAND_CHANNEL_ENTRY_LIST_TYPE_CHANNEL) |
+					    FIELD_PREP(NAN_CH_CTRL_OP_CLASS,
 						       slot->channel_entry[0]) |
 					    FIELD_PREP(NAN_CH_CTRL_PRIMARY_CH,
 						       slot_chan->chan->hw_value));
-			ch_list[num_channels].avail_map[0] = cpu_to_le32(BIT(i));
+			for (dw = 0; dw < NAN_TOTAL_DW; dw++)
+				ch_list[num_channels].avail_map[dw] =
+					cpu_to_le32(BIT(i));
 			le32_add_cpu(&ch_list[num_channels].num, 1);
 			ch_list[num_channels].is_valid++;
 			num_channels++;
@@ -681,17 +692,19 @@ mt7925_nan_fill_crb_committed(struct mt7925_nan_sched_update_crb_tlv *crb_tlv,
 
 		/*
 		 * Convert peer schedule slots to FW avail_map bitmap.
-		 * Each bit in avail_map[0] represents one time slot where
-		 * the peer has committed availability.
+		 * Each bit represents one time slot where the peer has
+		 * committed availability. Fill all DW intervals the same.
 		 */
 		for (slot = 0; slot < CFG80211_NAN_SCHED_NUM_TIME_SLOTS;
 		     slot++) {
 			struct ieee80211_nan_channel *ch = map->slots[slot];
+			u32 dw;
 
 			if (!ch || !ch->chanctx_conf)
 				continue;
 
-			tl->avail_map[0] |= cpu_to_le32(BIT(slot));
+			for (dw = 0; dw < NAN_TOTAL_DW; dw++)
+				tl->avail_map[dw] |= cpu_to_le32(BIT(slot));
 		}
 	}
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index b03b909a98d2..32e2e9cfffc7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -117,12 +117,15 @@ enum nan_peer_supported_bands {
 	NAN_SUPPORTED_BN_NUM
 };
 
+#define NAN_CH_CTRL_CH_TYPE		BIT(0)
 #define NAN_CH_CTRL_OP_CLASS		GENMASK(15, 8)
 #define NAN_CH_CTRL_PRIMARY_CH		GENMASK(23, 16)
 
 #define NAN_CRB_USE_DATA_PATH		BIT(0)
 #define NAN_CRB_AVAIL_6G_FORMAT		GENMASK(2, 1)
 
+#define NAN_BAND_CHANNEL_ENTRY_LIST_TYPE_CHANNEL	1
+
 struct mt7925_nan_social_ch_scan_params {
 	u8 dwell_time[NAN_MAX_SOCIAL_CHANNELS];
 	__le16 scan_period[NAN_MAX_SOCIAL_CHANNELS];
-- 
2.43.0


