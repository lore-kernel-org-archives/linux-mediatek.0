Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A2EC30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 07:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Genc6bw8EEUj5p6mEyYsPrW+rddwzOEpICsPZD+xTQ=; b=yHlB+07RDbx/aUPqy7Gpz3XduS
	FOwJAowhETw0T3GkKO0LQAmKDKsCnL1RXCLhdRIK+0tHD0QqmMGxMbTtuwoggcXa9sIpBCDtwyQbo
	ngyOA/6OvE9KXOBm6XggfYHdHWxCQ8acdthJ5wY86Uasz6uy3p/1Y54Vg7bJ6+i8XZ3r4+ZJfefgA
	WyK7wK0rBGOzn4kRRRHs0R2xiNoDdn1OSvcJ1zhrhpFhWRhwLlBWNrHWHjjDAgqKgz0HGBGtYQeHn
	Wj8EfzNlbl/pFQwkmJIwxr6slmMPMB7oyzLOatG50evCpQefK7mQaFxi/Dla87Fm8qrxmSQ0F89xx
	H3T+d0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPdca-0000000FBAJ-2uxZ;
	Fri, 05 Jul 2024 07:44:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPdcP-0000000FB7I-137B
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 07:44:34 +0000
X-UUID: 678663d63aa211ef9daba96ee3f3cc8c-20240705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+Genc6bw8EEUj5p6mEyYsPrW+rddwzOEpICsPZD+xTQ=;
	b=bwjoGfPL9yTThfu/BMQrX/7TZyznst4ipScPeXv0zLJ1BWPDn5MDSwDHk0qkq2lt7GK0WlvWuIfzenKcBKGZu7UaLeTlJzbUkcUZpez8ps2t3OgT4TxtUdrMo+A8aXRz7BQIVe20IW8a1mlNjrhgIdNsWkkQ0ChWV/qUX21hP0k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:e671e62e-7ebf-422c-94c0-7445d72fa374,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:c7f1fcd4-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 678663d63aa211ef9daba96ee3f3cc8c-20240705
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 670428037; Fri, 05 Jul 2024 00:44:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 5 Jul 2024 15:43:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 5 Jul 2024 15:43:51 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: do not check BSS color collision in certain cases
Date: Fri, 5 Jul 2024 15:43:46 +0800
Message-ID: <20240705074346.11228-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_004433_315746_391EE2A2 
X-CRM114-Status: UNSURE (   9.47  )
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

Do not check BSS color collision in following cases
1. already under a color change
2. color change is disabled

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
---
 net/mac80211/rx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 0ff9062a130c..59ad24a71141 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3358,6 +3358,7 @@ static void
 ieee80211_rx_check_bss_color_collision(struct ieee80211_rx_data *rx)
 {
 	struct ieee80211_mgmt *mgmt = (void *)rx->skb->data;
+	struct ieee80211_bss_conf *bss_conf;
 	const struct element *ie;
 	size_t baselen;
 
@@ -3368,7 +3369,9 @@ ieee80211_rx_check_bss_color_collision(struct ieee80211_rx_data *rx)
 	if (ieee80211_hw_check(&rx->local->hw, DETECTS_COLOR_COLLISION))
 		return;
 
-	if (rx->link->conf->csa_active)
+	bss_conf = rx->link->conf;
+	if (bss_conf->csa_active || bss_conf->color_change_active ||
+	    !bss_conf->he_bss_color.enabled)
 		return;
 
 	baselen = mgmt->u.beacon.variable - rx->skb->data;
@@ -3380,7 +3383,6 @@ ieee80211_rx_check_bss_color_collision(struct ieee80211_rx_data *rx)
 				    rx->skb->len - baselen);
 	if (ie && ie->datalen >= sizeof(struct ieee80211_he_operation) &&
 	    ie->datalen >= ieee80211_he_oper_size(ie->data + 1)) {
-		struct ieee80211_bss_conf *bss_conf = rx->link->conf;
 		const struct ieee80211_he_operation *he_oper;
 		u8 color;
 
-- 
2.25.1


