Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_RED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E684C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 02:01:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 779BB64E67
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 02:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 779BB64E67
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xLUS8kQOKeenVGFdUcQJXSm49CvdOR6L73DpNXG4VFo=; b=cDze+nmGUN2Wago+bEE8pRLHGj
	KLglFt5ziOb/uJluiLLR5rBTBgVD+iApmmU/wUSXsvblXnCQRNMnmBuulwUFcDT9T15vRYjxv+jC+
	8T2kIP7PggqNlcfFQRSSrEk12yjl5y1p5tJH6igbI2LVcBfv/YSeWA3jH9cZupjM6SThnN+JDMa/X
	NgYt826fwLqfMpwimGHs+fpLcAWCTCxoloP6wBBI8ITgxgU1Do0KaGvISfYpv8ETHCdxy/3DFb+Iy
	ujv25DXfQBJrY1bIJ9QmZ+iGb8e0jL/k0NzREIslIOonCF1YT/XQ8a9sYhdOUMo0uuNa3B5+UDkkh
	lNBdu8uA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLcXH-00El9P-Dj; Mon, 15 Mar 2021 02:00:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLcWX-00El5t-5u; Mon, 15 Mar 2021 02:00:15 +0000
X-UUID: 280eec1056204c569d378d5ef3d26ce9-20210314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WaiYyyqZq1+yfq88XcBbhx6qcQ/Th8yA2MlnH6ci45U=; 
 b=BhIR/dRA1AO5b7ElaaRRsnDXKk0muatGkKQQCZiICOwZmMdsrtkgsn66WIvJjptwT0VC1bEUdak1y8uubSnwoK5xfEw+gBdUYB4xJk38+2ZeNl44951XWXCBAwbxtt9K4h8+0+rAP03e++d8xfkDJCtX3iraiOHK99OlUM2639c=;
X-UUID: 280eec1056204c569d378d5ef3d26ce9-20210314
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 904420742; Sun, 14 Mar 2021 17:59:51 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Mar 2021 18:59:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 09:59:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Mar 2021 09:59:46 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrey Konovalov <andreyknvl@google.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, "Oleg
 Nesterov" <oleg@redhat.com>
CC: <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, Walter Wu <walter-zh.wu@mediatek.com>
Subject: [PATCH] task_work: kasan: record task_work_add() call stack
Date: Mon, 15 Mar 2021 09:59:40 +0800
Message-ID: <20210315015940.11788-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9DA2466084124075C1C17447C85E61ECA4CB0544570674D733F2D6BE08A8DDD32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_020001_973214_50A34CCE 
X-CRM114-Status: GOOD (  15.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Why record task_work_add() call stack?
Syzbot reports many use-after-free issues for task_work, see [1].
After see the free stack and the current auxiliary stack, we think
they are useless, we don't know where register the work, this work
may be the free call stack, so that we miss the root cause and
don't solve the use-after-free.

Add task_work_add() call stack into KASAN auxiliary stack in
order to improve KASAN report. It is useful for programmers
to solve use-after-free issues.

[1]: https://groups.google.com/g/syzkaller-bugs/search?q=kasan%20use-after-free%20task_work_run

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Suggested-by: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Konovalov <andreyknvl@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Oleg Nesterov <oleg@redhat.com>
---
 kernel/task_work.c | 3 +++
 mm/kasan/kasan.h   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/task_work.c b/kernel/task_work.c
index 9cde961875c0..f255294377da 100644
--- a/kernel/task_work.c
+++ b/kernel/task_work.c
@@ -55,6 +55,9 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
 		break;
 	}
 
+	/* record the work call stack in order to print it in KASAN reports */
+	kasan_record_aux_stack(work);
+
 	return 0;
 }
 
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 3436c6bf7c0c..d300fe9415bd 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -146,7 +146,7 @@ struct kasan_alloc_meta {
 	struct kasan_track alloc_track;
 #ifdef CONFIG_KASAN_GENERIC
 	/*
-	 * call_rcu() call stack is stored into struct kasan_alloc_meta.
+	 * Auxiliary stack is stored into struct kasan_alloc_meta.
 	 * The free stack is stored into struct kasan_free_meta.
 	 */
 	depot_stack_handle_t aux_stack[2];
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
