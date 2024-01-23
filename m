Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E63C47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 05:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bPxRxUZ+oqA+o7sYWwaUKD66vQMoVKVjNA4iAjZv5pg=; b=AguLICSpESKvMwMmhf5O7IlTvx
	vuFI06CU7m07+vhVpbwW1LSPQEpz7Mt7hg0I0cHg4PFFTfLMt76cozadmPha6eWoVV4a9/M5P4dEm
	kAk/42OxY4vJe/q8VEc2VQDaCIxq4UXKxniHeHulxoU5W+m/BAN2tQkLcJKR1wjZeyywhaFHH8JY3
	/N9BQseVcp9pAL+B2LNyqUoJK9qGRfrdNvz5ZOknffaPunJV+SYia8gjO+zSOWeZWEbnLSaORUa7w
	qAY9ZSLLX1reEjzeCHRidlEHIPlJEOR2a/cFYhcpjE2rTgFj7mI5ubdcRbkvaU0gBauA0Lo/Azsv6
	QyilmrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS9eQ-00FByW-1G;
	Tue, 23 Jan 2024 05:48:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS9eN-00FBvH-2w
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jan 2024 05:48:45 +0000
X-UUID: 0b94957cb9b311eea0bf134e88e6c2dc-20240122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bPxRxUZ+oqA+o7sYWwaUKD66vQMoVKVjNA4iAjZv5pg=;
	b=KTgVAgRmF3u7YEMbp3b1YKxcH9rKqCThWDfQCic+dJDPUKQMTe6Sduz88kXLSFHxhFbVxIamaE7YwEyXw1bVIy9C+9xEwCc6G/IloA2sGmTWju/ySgLdoi852AVXJq4jgpnrlr3Abm8ndD9xrtlMSJbL09BO7C8jJosi1OSO6yk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:3a92b2dc-4e23-421e-9bcd-3886d7e57348,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6e16cf4,CLOUDID:5f0e2683-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0b94957cb9b311eea0bf134e88e6c2dc-20240122
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 480950446; Mon, 22 Jan 2024 22:48:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 Jan 2024 13:48:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 23 Jan 2024 13:48:09 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: apply duration for SW scan
Date: Tue, 23 Jan 2024 13:47:52 +0800
Message-ID: <20240123054752.22833-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_214843_958309_C39E00D6 
X-CRM114-Status: GOOD (  10.37  )
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

This patch makes duration in scan request be applicable when using
SW scan, but only accepts durations greater than the default value for
the following reasons:
1. Most APs have a beacoon interval of 100ms.
2. Sending and receiving probe require some delay.
3. Setting channel to HW also requires some delays

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
---
 net/mac80211/scan.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/scan.c b/net/mac80211/scan.c
index 645355e5f1bc..8adcb23262f5 100644
--- a/net/mac80211/scan.c
+++ b/net/mac80211/scan.c
@@ -671,7 +671,10 @@ static void ieee80211_scan_state_send_probe(struct ieee80211_local *local,
 	 * After sending probe requests, wait for probe responses
 	 * on the channel.
 	 */
-	*next_delay = IEEE80211_CHANNEL_TIME;
+	*next_delay = msecs_to_jiffies(scan_req->duration) >
+		      IEEE80211_PROBE_DELAY + IEEE80211_CHANNEL_TIME ?
+		      msecs_to_jiffies(scan_req->duration) - IEEE80211_PROBE_DELAY :
+		      IEEE80211_CHANNEL_TIME;
 	local->next_scan_state = SCAN_DECISION;
 }
 
@@ -994,7 +997,10 @@ static void ieee80211_scan_state_set_channel(struct ieee80211_local *local,
 	 */
 	if ((chan->flags & (IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_RADAR)) ||
 	    !scan_req->n_ssids) {
-		*next_delay = IEEE80211_PASSIVE_CHANNEL_TIME;
+		*next_delay = msecs_to_jiffies(scan_req->duration) >
+			      IEEE80211_PASSIVE_CHANNEL_TIME ?
+			      msecs_to_jiffies(scan_req->duration) :
+			      IEEE80211_PASSIVE_CHANNEL_TIME;
 		local->next_scan_state = SCAN_DECISION;
 		if (scan_req->n_ssids)
 			set_bit(SCAN_BEACON_WAIT, &local->scanning);
-- 
2.25.1


