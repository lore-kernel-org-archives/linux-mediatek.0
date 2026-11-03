Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A93C606A335
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3/Z6mQ9e;
	dkim=temperror header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=TIkHMe7e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=v/FpDG427viY8CwqO1g7Q3Hr8Tb4FHtEPxku2gNFaSQ=; b=3/Z6mQ9eWghr18wyHmo2nCDCbK
	/4l0Qnjo6RSn4KdrCYKn+zikFBP7Z/pJwN4KF/EWsyEA04y+OK7xEBYEakJP6FVFyhK7SitI5GXyC
	GWbqJdMPATSEBqkFR4UlGWxQdgMfkF9yMNADxQTLZm8C+OlSZu92uUg6oV3TWkHVtegymzJD2L8r9
	k3UA0RXr0TgHcu+j/HoiQCZutQJW+hONaa0pRaBe/Dp4ebpzWqNpsseCumJPmhYkqo2bgoGwqew+U
	Z48I/MuveoHk0wGXBJzXuyxutp7cOf9KjEaXo940YcGyj1KyTM13BFjKPnkwFiChZL0ETyjsAvHZc
	Uvrpo8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAWt-00000001hb9-2RPv;
	Tue, 03 Nov 2026 09:10:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAWo-00000001hZw-3Ioo
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 09:10:06 +0000
X-UUID: 574bab62d76611f1acbe4559397dec65-20261103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=v/FpDG427viY8CwqO1g7Q3Hr8Tb4FHtEPxku2gNFaSQ=;
	b=TIkHMe7e1JyNHMiLNxf4HSA9Y2qRZz5K07u9sGMV54isw22v1sFjv9yErRMkG/JXcS8E+6jSlioYDkJOvm6d5fO+rryopPkc9q/rjTx8Kw7OwjHWy+xgJc0XaJ4ZYYajm0OFNTj+yjivYu8ItMHqsRvvtix57v9/DcIWJLlaxGA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:99ad4e66-bb6d-45c5-bb1e-6ae370566f92,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:5afb56bb-4006-44bb-949c-6e25a7b8dad4,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 574bab62d76611f1acbe4559397dec65-20261103
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 686962251; Tue, 03 Nov 2026 02:09:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Nov 2026 17:09:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Nov 2026 17:09:55 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <johannes@sipsolutions.net>
CC: <nbd@nbd.name>, <lorenzo@kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <Sean.Wang@mediatek.com>,
	<jb.tsai@mediatek.com>, <Evan-ym.Li@mediatek.com>, Yin-Ming Li
	<evan-ym.li@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] wifi: mac80211: drain TXQ wake tasklet before freeing hardware
Date: Tue, 3 Nov 2026 17:09:53 +0800
Message-ID: <20261103090953.1148722-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_011002_836359_468439CC 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

From: Yin-Ming Li <evan-ym.li@mediatek.com>

Driver queue wakeups schedule wake_txqs_tasklet asynchronously. Stopping
the driver work that issued a wakeup does not wait for this tasklet, and
ieee80211_unregister_hw() does not drain it.

Drain the tasklet in ieee80211_free_hw(), before destroying the local
mutex and releasing the hardware allocation. Drivers must stop their
asynchronous producers before calling ieee80211_free_hw(); this drain
waits for a tasklet those producers have already scheduled. Using the
final free boundary also covers deferred wakeups scheduled while the
driver finishes bus teardown after ieee80211_unregister_hw() returns.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Yin-Ming Li <evan-ym.li@mediatek.com>
---
 net/mac80211/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index f996e15e3d9e35cacddedf482a34c40c587d3e52..086b9ca3485398b4ef2ff60c3f9387dd909a8008 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -1755,6 +1755,9 @@ void ieee80211_free_hw(struct ieee80211_hw *hw)
 	struct ieee80211_local *local = hw_to_local(hw);
 	enum nl80211_band band;
 
+	/* Driver callbacks have stopped; drain their deferred TXQ wakeups. */
+	tasklet_kill(&local->wake_txqs_tasklet);
+
 	mutex_destroy(&local->iflist_mtx);
 
 	idr_for_each(&local->ack_status_frames,
-- 
2.43.0

