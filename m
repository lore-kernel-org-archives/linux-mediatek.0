Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2179606A31B
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 09:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RB2rA906;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=YlCByzyE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6AB0aUftO+vEy/g2psH5+jOjb1/rV0ha7zr/Qi/8gcE=; b=RB2rA90609e19iu/pCLMAlQKeK
	NPu24jwrEWAlejMmNtQJttYOGrCRD8sQwXwWUgMP0Q0IAytorHP9jpmB5hn5ddyeZza++rCo4bsi/
	JTNeC+yW82BTMzMUNS+o949DPUl48xvp/fTEyrQUXL0gNEN+lE9lfxMChJcxF3IXurFFS75+c1lQB
	GQHDRdlRsb49sW+zxlto/UE3QfJSPTWWU3mD+giz3dE07bEhZIc36uRU5jWUe6aN2nYYjPjYno0V6
	HVbM0vQRNRsfDI8SPkigkNFaVKyXN1aCOgo59Q4c3jS54TwxlKEB9PWaeQmXG4gUkixwpGC/n3HfF
	S43NXpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXB1-00000004rFv-1rve;
	Wed, 04 Nov 2026 09:21:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXAy-00000004rEs-2UlH
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Nov 2026 09:21:01 +0000
X-UUID: 0914e37ad83111f1acbe4559397dec65-20261104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6AB0aUftO+vEy/g2psH5+jOjb1/rV0ha7zr/Qi/8gcE=;
	b=YlCByzyEwHv+dBZM5cHnNcrKbEpVq95FyE+uye20jD7q7uk5dTVp1A4OEa78lxJvc2ua3molRuPc4RMca/TGFk1at5n9WExu2aCZHFN9fCo3x5kM7TRKu2CHJX8QnupIMomLTEHLe24dhbpioTXKqU9VjMilVg9xwSpBtwAfX1I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:63f33e22-ea4d-446d-a703-8607899ae277,IP:0,U
	RL:0,TC:0,Content:25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:b0318ac,CLOUDID:0e5261bb-4006-44bb-949c-6e25a7b8dad4,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:4|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0914e37ad83111f1acbe4559397dec65-20261104
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1253380444; Wed, 04 Nov 2026 02:20:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Nov 2026 17:20:51 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 4 Nov 2026 17:20:51 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <johannes@sipsolutions.net>
CC: <nbd@nbd.name>, <lorenzo@kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <Sean.Wang@mediatek.com>,
	<jb.tsai@mediatek.com>, <James-LY.Huang@mediatek.com>, james-ly huang
	<james-ly.huang@mediatek.com>
Subject: [PATCH 1/1] wifi: mac80211: don't coalesce a new ROC onto an expired one
Date: Wed, 4 Nov 2026 17:20:50 +0800
Message-ID: <20261104092050.1930716-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_012100_671499_A0C0EF98 
X-CRM114-Status: GOOD (  16.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: james-ly huang <james-ly.huang@mediatek.com>

ieee80211_coalesce_hw_started_roc() computed the remaining time of the
running ROC as

	remaining = cur_roc->start_time +
		    msecs_to_jiffies(cur_roc->duration) - now;

and merged the new request into it when the new duration fits. When the
running ROC is already over, that subtraction wraps around (unsigned),
the "fits" check passes, and the new request gets added behind a ROC
that will never produce another on_channel or expired event.

The expired-but-still-listed state is not rare at all: the driver's
ieee80211_remain_on_channel_expired() only queues the hw_roc_done work,
so until that work runs - the driver's UNI_ROC_ABORT round trip can
take tens of ms - every ROC on the list whose time is up stays listed
with started=true. A remain-on-channel / mgmt-TX request arriving in
that window hits exactly this path.

Check the ROC's end time explicitly with time_after_eq() and refuse to
coalesce once it has passed; compute the (now guaranteed positive)
remaining window from the same end time.

Signed-off-by: james-ly huang <james-ly.huang@mediatek.com>
---
 net/mac80211/offchannel.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/offchannel.c b/net/mac80211/offchannel.c
index 44808120ff51..a9cc802f68dc 100644
--- a/net/mac80211/offchannel.c
+++ b/net/mac80211/offchannel.c
@@ -529,7 +529,7 @@ ieee80211_coalesce_hw_started_roc(struct ieee80211_local *local,
 				  struct ieee80211_roc_work *cur_roc)
 {
 	unsigned long now = jiffies;
-	unsigned long remaining;
+	unsigned long end;
 
 	if (WARN_ON(!cur_roc->started))
 		return false;
@@ -540,12 +540,20 @@ ieee80211_coalesce_hw_started_roc(struct ieee80211_local *local,
 	if (!cur_roc->hw_begun && new_roc->duration > cur_roc->duration)
 		return false;
 
-	remaining = cur_roc->start_time +
-		    msecs_to_jiffies(cur_roc->duration) -
-		    now;
+	end = cur_roc->start_time + msecs_to_jiffies(cur_roc->duration);
+
+	/* The current ROC may already be over: the driver's
+	 * ieee80211_remain_on_channel_expired() only queues hw_roc_done,
+	 * so until that work runs the ROC stays on roc_list with
+	 * started=true and no remaining time. Coalescing onto it would
+	 * leave the new request queued behind a ROC that will not produce
+	 * another on_channel or expired event
+	 */
+	if (time_after_eq(now, end))
+		return false;
 
 	/* if it doesn't fit entirely, schedule a new one */
-	if (new_roc->duration > jiffies_to_msecs(remaining))
+	if (new_roc->duration > jiffies_to_msecs(end - now))
 		return false;
 
 	/* add just after the current one so we combine their finish later */
-- 
2.45.2


