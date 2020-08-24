Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A910C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 08:11:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C89A22072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 08:10:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vYyBvWZ+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UlZb2/C7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C89A22072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lOxrOe0PgamL7ljWrgKeA5gBw149yNYDiT93Y6CAVq0=; b=vYyBvWZ+0IWL4WmBuCBEH6AQMN
	dMgJEgkoou4uXW36dZm7tcSinZ1W3mFostbhagY1DGC0B0BRq13eInf8sYpMWKeFj7HbGEuu5ygD4
	UsGX69wO+giYFsQ0AKYJHYMqeknH7GZR7Dis/lxMJ+1gvyhfzS8oYPvyPgPKEUM/9T2pQsgC2plbY
	E7mrT8IaXnw7QRakkXziWIJzm+mC7hVwxRL7+wIjMLEOu2HO8Bx33Tjbx7tUqUslmn0iH85CKXq5q
	OEvL7wcmmqzHP1L4MXo2fuSGmFu23ouyepzHvIb0eZXhbUKU2TB22K6vVEyCMQWpr3LU6Ju2ZfY1/
	GHTDzWbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA7Z4-0003hN-Nt; Mon, 24 Aug 2020 08:10:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA7Z0-0003fO-A6; Mon, 24 Aug 2020 08:10:47 +0000
X-UUID: 076fd4a3909947cdb7e8e0e78b5d4473-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=r0Oq0tBfZ8jFMLMVK7p67PPtKlTRIAQp8x2ll2ZCeYU=; 
 b=UlZb2/C7+hXXHoBO+SQsDMsV+yZLneeDJDp7fQOKoqb/XrlKTMpksIia2h5kGKDHzQUmj6cmBMUs2e7pCBvdgPqCNkc/ZHY0xULq+Mk/Trg8GI9peijg/HJo1t7MKzcuGPrXBzJkXxdUStTosY2OoRjexBzl9FemnsajuO+57pE=;
X-UUID: 076fd4a3909947cdb7e8e0e78b5d4473-20200824
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1650736023; Mon, 24 Aug 2020 00:10:37 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 01:10:34 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 16:10:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 24 Aug 2020 16:10:33 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Marco Elver <elver@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, John Stultz <john.stultz@linaro.org>, Stephen Boyd
 <sboyd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 1/6] timer: kasan: record timer stack
Date: Mon, 24 Aug 2020 16:10:33 +0800
Message-ID: <20200824081033.24786-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 378A0C9A9031AA52783956160D35589390C54B78AF36FD01C7D67ABD9CD1A3072000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_041046_494218_63310DBD 
X-CRM114-Status: GOOD (  13.68  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When analyze use-after-free or double-free issue, recording the timer
stacks is helpful to to preserve usage history which potentially gives
a hint about the affected code.

Record the most recent two timer init calls in KASAN which are printed
on failure in the KASAN report.

For timers it has turned out to be useful to record the stack trace
of the timer init call. Because if the UAF root cause is in timer init,
then user can see KASAN report to get where it is registered and find
out the root cause. It don't need to enable DEBUG_OBJECTS_TIMERS,
but they have a chance to find out the root cause.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Suggested-by: Marco Elver <elver@google.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>
---

v2:
- Thanks for Marco and Thomas suggestion.
- Remove unnecessary code and fix commit log
- reuse kasan_record_aux_stack() and aux_stack
  to record timer and workqueue stack.

---
 kernel/time/timer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index a16764b0116e..1ed8f8aca7f5 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -796,6 +796,9 @@ static void do_init_timer(struct timer_list *timer,
 	timer->function = func;
 	timer->flags = flags | raw_smp_processor_id();
 	lockdep_init_map(&timer->lockdep_map, name, key, 0);
+
+	/* record the timer stack in order to print it in KASAN report */
+	kasan_record_aux_stack(timer);
 }
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
