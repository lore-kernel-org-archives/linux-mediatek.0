Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D6A606A33A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NgohenKC;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lBgVTl0X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Nb0VjpPF5N2RoOO7Q87qV0NcLe/eXymGX6jacBZvi2k=; b=NgohenKCZrdotF6DHDcj6uxOx7
	TUpV7KEKUYKCpK/iUoC3U8OvigTJ1LQaC83Z4lUjOEG2rZAzk2R9ukRhsrnXg2GyQpvQXCa+dRnN9
	oBrEjYjsOnSdOSKmZahmCIhK+TSyLQVwfHV6RJm7PJgfNXtK8Q22yf8SJmRbgivOeG5S42j602Egc
	jNqPziff8FZSfC643sbY5daiODoH8uhOy7KCMQfLH70f/CRruey2pPgDMHNFqZS4yLwH41wguXL5X
	8maCcmnvwd3PjI9k0esIQgBBoaAOtBfWG3uMGnTx8F558cBvN2sNcMgSfINaYe/R49tOo+iPvUveh
	lZQnO+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQl39-00000003rg8-1SsV;
	Tue, 10 Nov 2026 12:34:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQl37-00000003rf2-07h4
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 12:34:06 +0000
X-UUID: ffd1ca72dd0211f1afed4741b24580c9-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Nb0VjpPF5N2RoOO7Q87qV0NcLe/eXymGX6jacBZvi2k=;
	b=lBgVTl0Xl8WL/6ueAQ790ZmJ3nt55BGd3eot8ue92n7I3VXI84L9ZCVMOKfJ3DZfylDRXk6CLZI0phqlG9NUXqVgGbuHPGOhQ+MWhy+XKrQAVogCuwSdzNZpbZ/i513Jb0D8T8+I1DaoZkWxhf5EMEBq/aftgxSo5QLfTG4QNJ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:07a12f5c-6dee-4727-ac88-55b9fb55ca3a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:5f181557-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ffd1ca72dd0211f1afed4741b24580c9-20261110
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <james-ly.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 641311412; Tue, 10 Nov 2026 05:33:57 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 20:33:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 20:33:55 +0800
From: James-LY Huang <james-ly.huang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<sean.wang@mediatek.com>, <jb.tsai@mediatek.com>, <kun.wu@mediatek.com>,
	<James-LY.Huang@mediatek.com>, james-ly huang <james-ly.huang@mediatek.com>
Subject: [PATCH v2 1/1] wifi: mac80211: don't coalesce a new ROC onto an expired one
Date: Tue, 10 Nov 2026 20:33:51 +0800
Message-ID: <20261110123351.566633-2-james-ly.huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110123351.566633-1-james-ly.huang@mediatek.com>
References: <20261110123351.566633-1-james-ly.huang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_043405_076463_2B417E9C 
X-CRM114-Status: GOOD (  17.58  )
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

ieee80211_coalesce_hw_started_roc() computes the time the running
ROC has left with an unsigned subtraction of 'now' from its end
time. When the running ROC has already expired, the subtraction
wraps around, the check whether the new request still fits into
the remaining time passes, and the new request is coalesced onto
a ROC that has already delivered its events: the new ROC is never
started, and the cookie handed to userspace never expires.

That state is not unusual: a driver usually processes
ieee80211_remain_on_channel_expired() in a work item, so until
that work runs an expired ROC is still on the list with
started=true. A remain-on-channel or off-channel mgmt-TX request
issued in that window hits exactly this path.

Track the end time of the running ROC explicitly and refuse to
coalesce once it has passed. The remaining window computed from
that end time is then guaranteed to be positive.

Signed-off-by: james-ly huang <james-ly.huang@mediatek.com>
---
v2: rewrite commit message and comment
---
 net/mac80211/offchannel.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/offchannel.c b/net/mac80211/offchannel.c
index 44808120ff51..e54425d87b08 100644
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
@@ -540,12 +540,19 @@ ieee80211_coalesce_hw_started_roc(struct ieee80211_local *local,
 	if (!cur_roc->hw_begun && new_roc->duration > cur_roc->duration)
 		return false;
 
-	remaining = cur_roc->start_time +
-		    msecs_to_jiffies(cur_roc->duration) -
-		    now;
+	end = cur_roc->start_time + msecs_to_jiffies(cur_roc->duration);
+
+	/* the current ROC may already be over: drivers handle its
+	 * expiry in a work item, so until that work runs it is
+	 * still listed here with started set and no time left -
+	 * coalescing onto it would leave the new request queued
+	 * behind a ROC that produces no more events
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


