Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEB1C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:16:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4EF920706
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PJp++0We";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OsgvLxeV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4EF920706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ESZC4ErSAg7c6ONwE48YT5NrgB/4a1GDbVyAW8mCTlI=; b=PJp++0WeOb+5cFApt4ztoUJEB
	ml78hW0pZ+38Ll9n7Baymwe24baQvA69s1DwjpurC/pxy1/3CAChBKKIL3HXUnCX4szb55nve2f/a
	ojtyCWwcpkbpO23mMBq8hqtwOAakGZdHpgwnRvGthzXCkDODcJLFPtsQypjSaSivh5H7tACF1ZEI/
	2XAPPnNbtdrh+xyBHcrTPyEP3K271Uoec6ZKkJMpMdHyzzZNK4m7x5ODRbO9z90mGLcoOzXwT4RkP
	T2Rl+5Zvl5dgYguBAKRljaHLQvZsamWmqNdkOw1NRRidKC5NUafh/Iln5+et+pL8nw9d5DsyTmpY9
	lJlU8UFug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOVS-0007CZ-A3; Tue, 25 Aug 2020 02:16:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOVF-000757-Me; Tue, 25 Aug 2020 02:16:03 +0000
X-UUID: 210344919d13427298e6796cfd5ade6d-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ii64oCh7zep+4Ck47ItpZY3LpD+hSPCz2XQvCSfA6EY=; 
 b=OsgvLxeVyRDla5CqbtlfBtLVL9PzP1ctRY7NHfoTjydZ8L1ig2p33mw1pZdM3yyKaSHqwh4qYZL9QSnZdBWTiIVcG81BI1M1QBKx3frxts2N7bB7KL7c2Ca83z34Na9YXqzYTKPNpvZfwKIGZcVhsddLPfqBmScG1lcB4szTgeA=;
X-UUID: 210344919d13427298e6796cfd5ade6d-20200824
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 705570083; Mon, 24 Aug 2020 18:15:53 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 19:15:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:15:43 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:15:43 +0800
Message-ID: <1598321744.29129.4.camel@mtksdccf07>
Subject: Re: [PATCH v2 0/6] kasan: add workqueue and timer stack for generic
 KASAN
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Marco Elver <elver@google.com>
Date: Tue, 25 Aug 2020 10:15:44 +0800
In-Reply-To: <CANpmjNNYhYwyzT3pBzJdb=XCGyLj7X+Fhqui-6JAZJWGys25Rg@mail.gmail.com>
References: <20200824080706.24704-1-walter-zh.wu@mediatek.com>
 <CANpmjNNYhYwyzT3pBzJdb=XCGyLj7X+Fhqui-6JAZJWGys25Rg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 159432FB446FF43D5236F7CC4F80666B07F364717DF91DA958E52F2F389B3D492000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_221601_902090_60BF1520 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: John Stultz <john.stultz@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Linux Memory Management List <linux-mm@kvack.org>, Stephen
 Boyd <sboyd@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Tejun Heo <tj@kernel.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-08-24 at 13:50 +0200, Marco Elver wrote:
> On Mon, 24 Aug 2020 at 10:07, Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > Syzbot reports many UAF issues for workqueue or timer, see [1] and [2].
> > In some of these access/allocation happened in process_one_work(),
> > we see the free stack is useless in KASAN report, it doesn't help
> > programmers to solve UAF on workqueue. The same may stand for times.
> >
> > This patchset improves KASAN reports by making them to have workqueue
> > queueing stack and timer queueing stack information. It is useful for
> > programmers to solve use-after-free or double-free memory issue.
> >
> > Generic KASAN will record the last two workqueue and timer stacks,
> > print them in KASAN report. It is only suitable for generic KASAN.
> >
> > [1]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22+process_one_work
> > [2]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22%20expire_timers
> > [3]https://bugzilla.kernel.org/show_bug.cgi?id=198437
> >
> > Walter Wu (6):
> > timer: kasan: record timer stack
> > workqueue: kasan: record workqueue stack
> > kasan: print timer and workqueue stack
> > lib/test_kasan.c: add timer test case
> > lib/test_kasan.c: add workqueue test case
> > kasan: update documentation for generic kasan
> >
> > ---
> >
> > Changes since v1:
> > - Thanks for Marco and Thomas suggestion.
> > - Remove unnecessary code and fix commit log
> > - reuse kasan_record_aux_stack() and aux_stack
> >   to record timer and workqueue stack.
> > - change the aux stack title for common name.
> 
> Much cleaner.
> 
> In general,
> 
> Acked-by: Marco Elver <elver@google.com>
> 
> but I left some more comments. I'm a bit worried about the tests,
> because of KASAN-test KUnit rework, but probably not much we can do
> until these are added to -mm tree.
> 

Hi Marco,

Thanks for your review and friendly reminder.

If needed, I will rebase and resend the test case.


Walter

> Thanks,
> -- Marco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
