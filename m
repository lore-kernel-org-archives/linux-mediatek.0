Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9445BC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:21:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 632F32073A
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="udadTjkd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SMQ+HDqc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 632F32073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=50qeRzPAkVITjBPozVa0R+pAZZym+MXKu2J+w0Rf1w8=; b=udadTjkd5t0ru0tF/swx1vi0o6
	xDVmsO4R8iFjTXLWaMH016zgDiyRrdluo6BLAERIznFwE1dTjD8zLPZnzEHFdAuNRKX6PU+YUhKP3
	ayOy8flopLFoA8ddNb8ZcYsV4qhB0gJDv23QzgQNw0vo4zZyNGphn0Pq+YVbu/RYzQu6lpzcWU+py
	Ww7KuAa0eOHwsHY1kiiPf/+zTfhFykKxl8x+9c43bEssAcit0RZQhOB01Dwzlheqv3nmAmcC377b7
	rx/TFH5+Zsr/7t3rIEB+GFwlcqBv0HHz8TfJHbUqUHHgWutBqlC1xnR41FA8Dv+BxDffx13cfMmJM
	xnxCifaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k527g-00039a-4g; Mon, 10 Aug 2020 07:21:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k527a-00037g-Ne; Mon, 10 Aug 2020 07:21:27 +0000
X-UUID: d16c1ccafa1d47168a19ccbb5a51a505-20200809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8hb1XmCOYYfoHO2INc2JsSa/wZHmidgJRDdB3egeX9U=; 
 b=SMQ+HDqc9JZ3FaxSewQJaEBxCuE2aLVL/LY32B9mIdtH7TldvAJw0kksEXpoORisUxJU0rqFiysRM95qk12M1qJ7FoYRDti/B3QK4LK40GZjEa8EDF2epUmuERB+BuUur64cCu8nn9VO/NCGsGoAQllAC0loyzK2wTsx3CH/Ioo=;
X-UUID: d16c1ccafa1d47168a19ccbb5a51a505-20200809
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1824962338; Sun, 09 Aug 2020 23:21:15 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 00:21:17 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 15:21:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Aug 2020 15:21:15 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, John Stultz <john.stultz@linaro.org>, Stephen Boyd
 <sboyd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Tejun Heo
 <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Subject: [PATCH 0/5] kasan: add workqueue and timer stack for generic KASAN
Date: Mon, 10 Aug 2020 15:21:15 +0800
Message-ID: <20200810072115.429-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_032126_992104_54E0BB6B 
X-CRM114-Status: GOOD (  12.35  )
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

In order to print the last two workqueue and timer stacks, so that
we add new members in struct kasan_alloc_meta.
- two workqueue queueing work stacks, total size is 8 bytes.
- two timer queueing stacks, total size is 8 bytes.

Orignial struct kasan_alloc_meta size is 16 bytes. After add new
members, then the struct kasan_alloc_meta total size is 32 bytes,
It is a good number of alignment. Let it get better memory consumption.

[1]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22+process_one_work
[2]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22%20expire_timers
[3]https://bugzilla.kernel.org/show_bug.cgi?id=198437

Walter Wu (5):
timer: kasan: record and print timer stack
workqueue: kasan: record and print workqueue stack
lib/test_kasan.c: add timer test case
lib/test_kasan.c: add workqueue test case
kasan: update documentation for generic kasan

Documentation/dev-tools/kasan.rst |  4 ++--
include/linux/kasan.h             |  4 ++++
kernel/time/timer.c               |  2 ++
kernel/workqueue.c                |  3 +++
lib/test_kasan.c                  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
mm/kasan/generic.c                | 42 ++++++++++++++++++++++++++++++++++++++++++
mm/kasan/kasan.h                  |  6 +++++-
mm/kasan/report.c                 | 22 ++++++++++++++++++++++
8 files changed, 134 insertions(+), 3 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
