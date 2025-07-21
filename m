Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B533C83F1A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 06:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ejOCHf77d+DjOE4ApvpfLpumIkFayGw7G+IOfOQkomY=; b=srKAaQOJT2Vx6mRx8jtPn2If7P
	/xz4n1Asuq5xlkcPph2J2zHpBrQ/wlGY4BoHgg9LuFznmqQNo1EtYBv/2g7yad1cd2a/jHi2CfLUX
	iB656Vfph6GI/mUnmbnQal5QPwPNAZ3m4+qMYBwIYG3hp6HJENWrQCHYU9Jh3e7dLeOEkyQ1IxHyH
	9ILYLHf9MKAeoKfNKiHYZsGyK4LonOHvm5IZAelwP1MS1phtWoHmkQLW56ZtutGyiDgXaqF3A5gR7
	YvAVEnxY/40nV8C0jm7HmV0i2XTqwLSINOQWaA0+wucYOoFG2N72PcBQKj4BVEAUf+auMaHA2ouxL
	tOQ+LmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udk2G-0000000GN0y-2o7s;
	Mon, 21 Jul 2025 06:30:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udk2D-0000000GMz8-3ZUK
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Jul 2025 06:30:03 +0000
X-UUID: 195afb5a65fc11f09f706fa2197c6ceb-20250720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ejOCHf77d+DjOE4ApvpfLpumIkFayGw7G+IOfOQkomY=;
	b=B2ZZvsF43eCnqOuC/a4H4P/5YClJgkNzTihDqORJU239GNta1fEDur2tv4+CXt2RsftKTG1kgMEyJ8/XXG+b8/z5MZ00O6+xIAnAHU14JX/SPsNT4erT5qvkb2aoaCy/LavGUTeOzJ6KN38lIW9zK+yZd/A3AqwYxuHhvroj+AM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:17c7236f-62d6-401b-a5ba-1df171ebc617,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:d0633a73-f565-4a89-86be-304708e7ad47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 195afb5a65fc11f09f706fa2197c6ceb-20250720
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 229836893; Sun, 20 Jul 2025 23:29:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Jul 2025 14:29:43 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Jul 2025 14:29:43 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH wireless-next v2] wifi: mac80211: determine missing link_id in ieee80211_rx_for_interface() based on frequency
Date: Mon, 21 Jul 2025 14:29:29 +0800
Message-ID: <20250721062929.1662700-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_233001_906728_C64A72D1 
X-CRM114-Status: GOOD (  12.64  )
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

For broadcast frames, every interface might have to process it and
therefore the link_id cannot be determined in the driver.

In mac80211, when the frame is about to be forwarded to each interface,
we can use the member "freq" in struct ieee80211_rx_status to determine
the "link_id" for each interface.

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
Reviewed-by: Money Wang <money.wang@mediatek.com>
---
v2:
  - use frequency instead of band
---
 net/mac80211/rx.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index b414c9e6e61b..2ac8ccb838ff 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5106,8 +5106,29 @@ static bool ieee80211_rx_for_interface(struct ieee80211_rx_data *rx,
 		struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 
 		sta = sta_info_get_bss(rx->sdata, hdr->addr2);
-		if (status->link_valid)
+		if (status->link_valid) {
 			link_id = status->link_id;
+		} else if (ieee80211_vif_is_mld(&rx->sdata->vif) &&
+			   status->freq) {
+			struct ieee80211_link_data *link;
+			struct ieee80211_chanctx_conf *conf;
+			int i;
+
+			for_each_valid_link(&rx->sdata->wdev, i) {
+				link = rcu_dereference(rx->sdata->link[i]);
+				if (!link || !link->conf)
+					continue;
+
+				conf = rcu_dereference(link->conf->chanctx_conf);
+				if (!conf || !conf->def.chan)
+					continue;
+
+				if (status->freq == conf->def.chan->center_freq) {
+					link_id = i;
+					break;
+				}
+			}
+		}
 	}
 
 	if (!ieee80211_rx_data_set_sta(rx, sta, link_id))
-- 
2.25.1


