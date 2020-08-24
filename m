Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAB1C433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 08:14:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6188B2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 08:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mxLgsn08";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VHJf/G5t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6188B2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J5BpusUhJigO5mJqrBh35PkJ86kpWHbf0RVawLOTyeE=; b=mxLgsn08VhbTyzD00z880OqUsy
	MAfrRQ1gqFTN03jc00xJKEr5fzE7x0b4aZY/c4kA8gO3QD35wsfxVLMJuo9vzySsmYVJvMi744XGz
	EdUu0alL1jvHa7+y3k5zTJNSd9s82AUSt8w73YlG71XURvcjxVg17motJKROywSNDlPlPV1f84NBy
	J8/kfqJD/x8rgpbH2PAdnwFmUpAP6UaJXsfKOWUT51Y3fHVM1kMp5Y1zvaXgdkEqsixW+GlGWbiHG
	jyTzdXoxxQQvfmqhSC/A+hWAllwWN8Bx568qHxy0qhTlxFgR9JhuAvt670Y/veiBuopVj2aaswTMx
	IHjbVjVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA7cf-0004FM-T9; Mon, 24 Aug 2020 08:14:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA7cW-0004CF-A1; Mon, 24 Aug 2020 08:14:25 +0000
X-UUID: 667f1ec3a1e94e13a396bfd08c4900f2-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Ws+o5UOYVh6zo1fhqEVNgTGjFEJeI4HICegFEkqKmwA=; 
 b=VHJf/G5tfTuvjMvpwsJE0QKIC1uZINdkgBOHAmp8bJ5BUndZUXULuUQpSpxyXkaQT4VCVJ7TRp23IcBsu2UupMlU/A+kDwo3AngagdmDTfQS5yqaCHTtxwRRGy+gACvudA2IyupolbTNRH/+5sfm1mt9ybSlJsTe8oz7COapQeU=;
X-UUID: 667f1ec3a1e94e13a396bfd08c4900f2-20200824
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1406164859; Mon, 24 Aug 2020 00:14:19 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 01:07:09 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 16:07:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 24 Aug 2020 16:07:06 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Marco Elver <elver@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Stultz
 <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>
Subject: [PATCH v2 0/6] kasan: add workqueue and timer stack for generic KASAN
Date: Mon, 24 Aug 2020 16:07:06 +0800
Message-ID: <20200824080706.24704-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3CA77E6D371981748F1B9D271F7149CE6182270AF73BF62DA9C780BF27EE73342000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_041424_538803_B7D63D77 
X-CRM114-Status: GOOD (  11.96  )
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
queueing stack and timer queueing stack information. It is useful for
programmers to solve use-after-free or double-free memory issue.

Generic KASAN will record the last two workqueue and timer stacks,
print them in KASAN report. It is only suitable for generic KASAN.

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

Changes since v1:
- Thanks for Marco and Thomas suggestion.
- Remove unnecessary code and fix commit log
- reuse kasan_record_aux_stack() and aux_stack
  to record timer and workqueue stack.
- change the aux stack title for common name.

---

Documentation/dev-tools/kasan.rst |  4 ++--
kernel/time/timer.c               |  3 +++
kernel/workqueue.c                |  3 +++
lib/test_kasan.c                  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
mm/kasan/report.c                 |  4 ++--
5 files changed, 64 insertions(+), 4 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
