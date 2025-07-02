Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08132C8303F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u5uiOpHyPLSsv2+8VZ4TMFdbB7Fh6NmSFxifxYc9Wc4=; b=lAdBtlg9rK53eO5FOpEkPBzNOZ
	Aq8LzUl1MJodrt6u9XbAcWnYHxR3SFBKA64RBti+Dd1hNtd47wgzePNF4zwiz3BY6E9Yy07xZPq5E
	PUtg3OaIigw/PtO44yZ0AA44XF8U0F7HfcQX7FApKvlnGNjT/+GbBBRyh+2NKE4Z+FLyLrSICik1t
	Zl4ejvacjbhAYazPXa5trjC8UuzLnj3R4x/6gvT2t1AnCWvDf3SbAvUwNpCA//ktjiqYWD64fWgMG
	mU+ZEBr2e4l4jyJPKJK03xst7t983WpB5EaJm5kxyULyCZMC2KCe7+rTUaAQmy3/43hvUaHzn9+Q6
	SxXLv/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvg8-000000088kN-34ym;
	Wed, 02 Jul 2025 11:31:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuxx-00000007zU8-1Y6m
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Jul 2025 10:45:26 +0000
X-UUID: a5f66524573111f09eb0dd999d3936bf-20250702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=u5uiOpHyPLSsv2+8VZ4TMFdbB7Fh6NmSFxifxYc9Wc4=;
	b=cUdV5xN7ik6ZHb7ERPmxy2AQgEqvbSUi7Et9c0t1jMOtUyphGaym+j8MyInXvObHsnGFl6leqasxqeVcuQYPGYETChAdL46FSlx1dUP4KJJqmH1F/s0ipkkp6uNBNgHZ3uYNabShCow5KGDOhezXJuAgcwdWUoG8K6pBs/RxXSk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:e05b8957-8022-4b42-a7c2-a099c7d2b331,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:1f51a49c-b8a9-480a-b7e5-687022facff7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a5f66524573111f09eb0dd999d3936bf-20250702
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 804825149; Wed, 02 Jul 2025 03:45:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 2 Jul 2025 18:45:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 2 Jul 2025 18:45:16 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: disallow AP interface from getting BIGTK in RX path
Date: Wed, 2 Jul 2025 18:45:16 +0800
Message-ID: <20250702104516.2738962-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_034525_416432_D58A914D 
X-CRM114-Status: GOOD (  12.41  )
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

The problem was that when the AP interface with BIGTK set received
beacons with MMIE from other BSSes, it tried to verify the MIC using its
BIGTK, which must fail and be notified to the upper layer by
cfg80211_rx_unprot_mlme_mgmt().

The solution is to prevent the AP interface from getting BIGTK in
the RX path, as the AP should only use the BIGTK to calculate the
beacon's MIC value.

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
Reviewed-by: Money Wang <money.wang@mediatek.com>
---
 net/mac80211/rx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 7671fd39a60e..f2d63a7cc642 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -1888,6 +1888,10 @@ ieee80211_rx_get_bigtk(struct ieee80211_rx_data *rx, int idx)
 	 * index (i.e., a key that we do not have).
 	 */
 
+	/* AP interface sould not use BIGTK to decrypt */
+	if (rx->sdata->vif.type == NL80211_IFTYPE_AP)
+		return NULL;
+
 	if (idx < 0) {
 		idx = NUM_DEFAULT_KEYS + NUM_DEFAULT_MGMT_KEYS;
 		idx2 = idx + 1;
-- 
2.25.1


