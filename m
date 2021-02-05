Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD327C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 12:56:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E2F264FC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 12:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E2F264FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gIsZDkf62073Dm9pKh+66GqSP42KlDrq1vetGvAsxPo=; b=3AS/hOKG5Q0mg7Mh0vs90gy/0O
	phu/uVCJD3Y+2Z+wVWWbONvgJOGHBm6boZqjXOMR/E+/xM3Dw0qXE0q0kglyV5h+1Enzjdf17EOIk
	LW3nIwQPn13KL6Jb7Y73lpAKla5+ZH0Ix25leIoxNUCUdQ9RGXC6Kr+FvSuM+t5QzFZn14FJUeD4e
	0fps9dOvmoiJ3xFUs2DROHuzChNfMfz/MwXw7a2o8WiQwaVb4NKAXmt1oJ2kNW+7vk8S/n8g0zLvL
	MOLqRr1nVJfHphLjmEe48/I3YhoXImtewSWe9+lFSTc3beKQacZuYFPu2i8SGq+fFJzVAPPqtStDC
	GibTJspw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l80eq-000638-GV; Fri, 05 Feb 2021 12:56:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l80em-000621-Gw
 for linux-mediatek@lists.infradead.org; Fri, 05 Feb 2021 12:56:18 +0000
X-UUID: adae7be41a8e4a64821fdbc986512e19-20210205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=2OpuTN6svTexjDVGOFLVEQgMdLQNO+r5kyq303vE+OU=; 
 b=BCOBW3zzc7z2L4264yxDTLlptFyugn1+RFxw1sIBu/hh9ltWMuSJdcf4F6z3FU7OXqClNTp7YLzUemWPJBe2OwTHW6LJTtKCmx884B39DmKAu0fyJLjMT76aNA3d1Fy4HOaRqevJB+IQ8K3Cetn7q9IApvdA4K7QAhHv6mINXEU=;
X-UUID: adae7be41a8e4a64821fdbc986512e19-20210205
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 555535539; Fri, 05 Feb 2021 04:56:12 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Feb 2021 04:56:10 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Feb 2021 20:55:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 5 Feb 2021 20:55:57 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: [PATCH] mac80211: only schedule TXQ when reasonable airtime reporting
Date: Fri, 5 Feb 2021 20:55:54 +0800
Message-ID: <c48c3555ab2261d6b6674ac7de8203359b80b127.1612529311.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_075617_330489_278C50AC 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For some drivers and hardware may report faulty airtime, which ends up
with excessive hold time (~0.9s on mt7915 multiclent tests) impacting
system performance.

Although issue has been fixed in driver, but it make sense to select txqi
depends on a reasonable airtime reporting to prevent such a case from
happening again.

Tested-by: Jiao Bo <jiao.bao@mediatek.com>
Tested-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 net/mac80211/tx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 6422da6690f7..0b8a8c3600f4 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -3770,6 +3770,10 @@ struct ieee80211_txq *ieee80211_next_txq(struct ieee80211_hw *hw, u8 ac)
 				sta->airtime_weight;
 
 		if (deficit < 0 || !aql_check) {
+			if (txqi->schedule_round == local->schedule_round[ac])
+				goto out;
+
+			txqi->schedule_round = local->schedule_round[ac];
 			list_move_tail(&txqi->schedule_order,
 				       &local->active_txqs[txqi->txq.ac]);
 			goto begin;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
