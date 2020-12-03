Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAACC6369E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 02:22:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 113FE21D91
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 02:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 113FE21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D8VJv/6NQk0WWGkQmXA1EmCJ5jGa+s7AVJmaeE55HL0=; b=oJ8EdLHn2SmEvpYwEbd44hNh9I
	E7YxNF2eOPk0yBnTRSnNEHjqEX1NUfAFbk7MKX5tEvtPgOkEilKLmNDLG8q9KWPL9kKY1gPSLlTNE
	WRlsZntUf+6okrvsuN7c/P5yRGVXol/E3No0ZOpPS4J90PvPJovkX2x7s0+K5AeEn6uQ4mEm4kx2X
	04zrBrUebTF5AY49c+7YWF/xR3kPmthmd1YRPPwtwDOvBsJs4bIr2Q9fyD78q6yBVUWWg7WyyyoJR
	OVVCrQ8MNe07MUQB0zYqeRYP0/1qghpAduKlY71JWi2JRIxHAoUqavTeVgIocm+uJ6S++g5OXxKOA
	ID3ooN/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkeG4-00073g-1E; Thu, 03 Dec 2020 02:22:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkeFy-00072p-Pw; Thu, 03 Dec 2020 02:22:09 +0000
X-UUID: 69e102cb4e694771aa6da2652c785a35-20201202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=woigWvd7ossycJrEapKuUhqSOdHX5El8cwvyJiL27Ug=; 
 b=TRnisXPq8Ub03+JG1ooB2Qexct+v9bEQM+tEXbqbTuUfIuqo4PjBxuezx6jbdJVwqVC7rL6/cvwSqH+ekxVH7Uq+HEuIQ+aMWk7WzBS31MIoKL/JVJ+qHNtQCffDeyXoIst0IM+jt+6HYdBSsxeU7Usxsp0IvIRAwrq7dllADf8=;
X-UUID: 69e102cb4e694771aa6da2652c785a35-20201202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 393280087; Wed, 02 Dec 2020 18:21:59 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Dec 2020 18:21:53 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 10:21:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Dec 2020 10:21:49 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, Marco Elver <elver@google.com>,
 "Andrey
 Ryabinin" <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 0/4] kasan: add workqueue stack for generic KASAN
Date: Thu, 3 Dec 2020 10:21:48 +0800
Message-ID: <20201203022148.29754-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_212207_663762_0DC865F2 
X-CRM114-Status: GOOD (  12.53  )
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

Syzbot reports many UAF issues for workqueue, see [1].
In some of these access/allocation happened in process_one_work(),
we see the free stack is useless in KASAN report, it doesn't help
programmers to solve UAF for workqueue issue.

This patchset improves KASAN reports by making them to have workqueue
queueing stack. It is useful for programmers to solve use-after-free
or double-free memory issue.

Generic KASAN also records the last two workqueue stacks and prints
them in KASAN report. It is only suitable for generic KASAN.

[1]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22+process_one_work
[2]https://bugzilla.kernel.org/show_bug.cgi?id=198437

Walter Wu (4):
workqueue: kasan: record workqueue stack
kasan: print workqueue stack
lib/test_kasan.c: add workqueue test case
kasan: update documentation for generic kasan

---
Changes since v4:
- Not found timer use case, so that remove timer patch
- remove a mention of call_rcu() from the kasan_record_aux_stack()
  Thanks for Dmitry and Alexander suggestion.

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
kernel/workqueue.c                |  3 +++
lib/test_kasan_module.c           | 29 +++++++++++++++++++++++++++++
mm/kasan/generic.c                |  4 +---
mm/kasan/report.c                 |  4 ++--
5 files changed, 38 insertions(+), 7 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
