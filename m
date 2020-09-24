Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4E3C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 04:13:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB282223E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 04:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BL8R4ven";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="E3/wAGMv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FB282223E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cAFFHX35vPV9SeTyKLUucwseqTy3Z4ptiBI6tSw9hyc=; b=BL8R4venY5npruav2WuYIcBcax
	cvafHzy+42d4FOKN3rL+z6YroIwM5fetUBtOtS6CxlVglO9PGhHy8QNR2AhC21CmtFsb+ubfLokAh
	klKvk42BDvI1QCOnWhKDJRu5HqFHQd0DCqGcUSdeG0elYEhIffS/KtoP1+LtNrM3n4PLEM4s6ZgSh
	hclKbYL8OeOTre7/cJamwvueabRI0dgCG74itSK17lp8Njt48h9sKogVCKQTmb5iQbI69Ix2gXLnj
	FUhUErSLfOXMKBHBr0LPGkWbKAQ07PE7m6oEmFKBnrEG8VOZwE4tivKONaj91lS6+YMheCY+xzsjJ
	1f+ul9fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLIco-000711-AJ; Thu, 24 Sep 2020 04:12:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLIcb-0006xS-3y; Thu, 24 Sep 2020 04:12:42 +0000
X-UUID: 9719909be86747739cb9098c6c5c3258-20200923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RdjwgzjFAA7kh4oYttC+KDV9EMdKnsHtZfsovneYDmY=; 
 b=E3/wAGMvbiVxeZiSvtko4FfxITwmhAOa3xv/KjgLm9QAwIuijozLtFHlOfqinkm3NJUy+djAtLpk3tkZUDgGFJTszKlmIlQCmmBqw9qbMRy1qANtvYtf57NCc+Ddfgerio+bh+DVUESJjXiNmxMw2i3b5ZpyvC/priV5TyPHAmg=;
X-UUID: 9719909be86747739cb9098c6c5c3258-20200923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1957805237; Wed, 23 Sep 2020 20:12:37 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Sep 2020 21:02:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 12:02:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Sep 2020 12:02:28 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
 <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Stephen Boyd
 <sboyd@kernel.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Marco Elver <elver@google.com>, Andrey Ryabinin
 <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, "Dmitry
 Vyukov" <dvyukov@google.com>, Andrey Konovalov <andreyknvl@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 0/6] kasan: add workqueue and timer stack for generic KASAN
Date: Thu, 24 Sep 2020 12:01:52 +0800
Message-ID: <20200924040152.30851-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: FB7A3B37DFD44E891641141635D054C21024695F78B6E62C4D04FF435D1CC3DA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_001241_398344_57F156DF 
X-CRM114-Status: GOOD (  12.31  )
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

Syzbot reports many UAF issues for workqueue or timer, see [1] and [2].
In some of these access/allocation happened in process_one_work(),
we see the free stack is useless in KASAN report, it doesn't help
programmers to solve UAF on workqueue. The same may stand for times.

This patchset improves KASAN reports by making them to have workqueue
queueing stack and timer stack information. It is useful for programmers
to solve use-after-free or double-free memory issue.

Generic KASAN also records the last two workqueue and timer stacks and
prints them in KASAN report. It is only suitable for generic KASAN.

[1]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22+process_one_work
[2]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22%20expire_timers
[3]https://bugzilla.kernel.org/show_bug.cgi?id=198437

Walter Wu (6):
timer: kasan: record timer stack
workqueue: kasan: record workqueue stack
kasan: print timer and workqueue stack
lib/test_kasan.c: add timer test case
lib/test_kasan.c: add workqueue test case
kasan: update documentation for generic kasan

---
Changes since v3:
- testcases have merge conflict, so that need to
  be rebased onto the KASAN-KUNIT.

Changes since v2:
- modify kasan document to be readable,
  Thanks for Marco suggestion.

Changes since v1:
- Thanks for Marco and Thomas suggestion.
- Remove unnecessary code and fix commit log
- reuse kasan_record_aux_stack() and aux_stack
  to record timer and workqueue stack.
- change the aux stack title for common name.

---
Documentation/dev-tools/kasan.rst |  5 +++--
kernel/time/timer.c               |  3 +++
kernel/workqueue.c                |  3 +++
lib/test_kasan_module.c           | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
mm/kasan/report.c                 |  4 ++--
5 files changed, 66 insertions(+), 4 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
