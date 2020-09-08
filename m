Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E435C43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 09:06:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F0E22166E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 09:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jJvxerUp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Rb6G1CwM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F0E22166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ghS6qLi6UayIp4ZEg4/mKF3bAGker90+GT0E92JZR08=; b=jJvxerUpkSeoBJrUC63qpgCmCZ
	rPFsYiALKD+IRDqthTmGEaRYGwX8Jz9Ecah+uTJzjOQ10S9L3WzQWuCSgop8XtjMkPUlU1srjdbd3
	0UOz42XiosvVGokkuc4iLi5KXac7u8n4xbDm9PNvLsi8TechV3Ft6d09koMet+oGnyE1DLjz3MAHq
	x/vHHf3RmcdlJ/qWtmlDTqssMS/dilRcbvH9PHGJQgMpLszXHGdF5Zn3Qzs472gI+GO9gSA1DHOT7
	SmZ7cTviTFfbrgTW83fYw0FyBfdR8+E7bk032/jxfA1xpTEM6pbsPKc9zpeNP90CFdhhRJfYiZsA1
	S7JDBBog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFZa2-0005Bq-2P; Tue, 08 Sep 2020 09:06:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFZZy-0005AI-5J; Tue, 08 Sep 2020 09:06:18 +0000
X-UUID: 997230dc330e402085b990f4f5be01e4-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=SQD49d6hVayfxN4/ILoTkIw56AypoTBrgE49r+z4QKQ=; 
 b=Rb6G1CwMw8w/oVgKzg10L6RmdzueAkHYCWjyvEzegrUjIGTF2mpeWt3KiO6ScuHD8p956NB6HVa4xhia9VE1ZJ3W35tqrcikNJmKxrlNFW1hJttodOEsQ38MXkvvlez2B57sCyKHQQgytIxoRoj6HEYR7gZe5ES46UFq/fQjmjc=;
X-UUID: 997230dc330e402085b990f4f5be01e4-20200908
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jing-ting.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 859885154; Tue, 08 Sep 2020 01:06:04 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 02:06:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 17:05:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Sep 2020 17:05:46 +0800
From: Jing-Ting Wu <jing-ting.wu@mediatek.com>
To: Peter Zijlstra <peterz@infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH 1/1] sched/rt: add rt throttled/unthrottled log
Date: Tue, 8 Sep 2020 17:05:46 +0800
Message-ID: <1599555946-30802-1-git-send-email-jing-ting.wu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_050618_351131_E49ECDBE 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: linux-arm-kernel@lists.infradead.org,
 Jing-Ting Wu <jing-ting.wu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Always print logs when rt throttle/unthrottle,
it is much easier to locate the throttled period.

Signed-off-by: Jing-Ting Wu <jing-ting.wu@mediatek.com>
---
 kernel/sched/rt.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index f215eea..598046c 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -902,6 +902,9 @@ static int do_sched_rt_period_timer(struct rt_bandwidth *rt_b, int overrun)
 				rt_rq->rt_throttled = 0;
 				enqueue = 1;
 
+				printk_deferred("sched: RT throttling inactivated cpu=%d\n",
+						i);
+
 				/*
 				 * When we're idle and a woken (rt) task is
 				 * throttled check_preempt_curr() will set
@@ -970,7 +973,7 @@ static int sched_rt_runtime_exceeded(struct rt_rq *rt_rq)
 		 */
 		if (likely(rt_b->rt_runtime)) {
 			rt_rq->rt_throttled = 1;
-			printk_deferred_once("sched: RT throttling activated\n");
+			printk_deferred("sched: RT throttling activated\n");
 		} else {
 			/*
 			 * In case we did anyway, make it go away,
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
