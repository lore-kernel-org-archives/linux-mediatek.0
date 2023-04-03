Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43570C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 21:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tr5PKTZkytsHces4K8xckZrMRgweSHoafCTFPOREkbc=; b=gOg7NtHj6mdyjTCBlgSLRWe2Cq
	0zknj9K7jDQKI/N+nov8ajZoVqaUuU5rI1ckBq6ohf56faRgIok0uICmuQJlTRfzpvUAMk/UUNhMe
	RZcl42nZpudeAU87HvwI/+Y33nGWp+uZiO1oF2ugWudIbvz3WxJ8lVzndGRnq4ZgDiSHDfl8rewDK
	Qa1fJJthqViHMjLQ0wH3lXXW8g+x3KsKXdWNYR9HmL8XQityTRzP+dbuCrQyAHddK61Xl7SH26yVl
	Yi2OnYk98SnsiW4wvkvKVtoa5J9RDg1q6sDc46CVw6yRcYH7O3W7xbx8ilIQAMWkCuZUW2Uy62tCf
	Bt0W7YVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjRfh-00GtUF-0D;
	Mon, 03 Apr 2023 21:25:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjRfe-00GtD0-1I
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Apr 2023 21:24:59 +0000
X-UUID: f047ef1ad26511edb7d8d11f642b8e78-20230403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Tr5PKTZkytsHces4K8xckZrMRgweSHoafCTFPOREkbc=;
	b=n9sIBALoq+Wva5x2CWAmkIlgvhsvw/uvHm0gWOZOuT/PYwPk8NDyviMSOE1c5mFUliJ8sPE4E9UyX7gwP9us3YbWYS7JhSaSzoeH3a9YgZVxT0rBXl0EuwdtDwcNFVdQGInZqXST1sZ3PK17ITeo7tt0SRfNh7YLzxjpEYVBAww=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:6fd91030-1f71-4042-8c4e-df9c154b9b70,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:2d602cb5-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: f047ef1ad26511edb7d8d11f642b8e78-20230403
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yi-chia.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1262990357; Mon, 03 Apr 2023 14:24:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 4 Apr 2023 05:04:35 +0800
Received: from mussdccf250.mussds.eus.mediatek.inc (10.73.250.250) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 4 Apr 2023 05:04:33 +0800
From: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Subject: [PATCH 1/2] wifi: mac80211: track obss color bitmap
Date: Mon, 3 Apr 2023 14:04:29 -0700
Message-ID: <774ab129159408a3f3e04b7e662cb559cf087c48.1680553706.git.yi-chia.hsieh@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_142458_456126_4D0DD27B 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

Track OBSS BSS colors on checking OBSS Beacons and report used color bitmap to
hostapd when collide.

Signed-off-by: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
---
 include/net/mac80211.h | 1 +
 net/mac80211/rx.c      | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 219fd15893b0..f003e0dbc7c4 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -749,6 +749,7 @@ struct ieee80211_bss_conf {
 
 	bool color_change_active;
 	u8 color_change_color;
+	u64 used_color_bitmap;
 
 	bool vht_su_beamformer;
 	bool vht_su_beamformee;
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index f7fdfe710951..e4a60992e4eb 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3264,9 +3264,11 @@ ieee80211_rx_check_bss_color_collision(struct ieee80211_rx_data *rx)
 
 		color = le32_get_bits(he_oper->he_oper_params,
 				      IEEE80211_HE_OPERATION_BSS_COLOR_MASK);
+		bss_conf->used_color_bitmap |= BIT_ULL(color);
+
 		if (color == bss_conf->he_bss_color.color)
 			ieee80211_obss_color_collision_notify(&rx->sdata->vif,
-							      BIT_ULL(color),
+							      bss_conf->used_color_bitmap,
 							      GFP_ATOMIC);
 	}
 }
-- 
2.39.0


