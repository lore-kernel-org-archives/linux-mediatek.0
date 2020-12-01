Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9722AC64E7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 11:17:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8606206E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 11:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U/wJ3FP9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kbo2RJQI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8606206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YqWXMj2g9WALl1PNwVmiLB+TjnFNrfkmpv9JEKOlQ0Y=; b=U/wJ3FP9GFZ+WDJ3Ss7I7/dHC
	rbQoP9zOkF686RiIGkaXoKxGaPIjmoRTKoyZzr1St8gKVk/lsuXz/5yCKbyYuTWKauIE0xxd9n9jQ
	nsVi/PxxdZXyAyl898rdD00U8bZN+qxhhTACg5/lEHMtpgkBN6Brz7GCFg5uB5ZkXtUAp9CgYYGtn
	pwtNFbJg0Hm8iZmQWivuo0ihECM/eZveBWuq2N2Ck9imGTgc+ZIvHTkcIHqy21lwaYRavG0ceTTUq
	Aw3vZAK6xv/lO6HGsO2bJjgQBgAYPANX9gYt/IY7EtFg4yROD4RMHvkUjPH+CcneQkdDxKJfS666W
	MuFiQvy7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk3et-0006jr-GN; Tue, 01 Dec 2020 11:17:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk3ep-0006iV-Tr; Tue, 01 Dec 2020 11:17:21 +0000
X-UUID: 311682019b124866bb208add095a7881-20201201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pDpaexdIMd2G1eFG8LLARx//qLgP1bMHu0BH8xeP5SE=; 
 b=kbo2RJQIjH9WkHY8T8jFRQi5fIFjRJv/biOPqNms7mCl7zTCkpYNMUqzZfDcn2byNUKgUSOZ8JljvU4kY704Lmh9HT9DG+UgxDFV/CTNa64Ml2px5ZEbLW6jxYPZ3w5MlPreMCjV11mzpImurimLtDl/8WudZDZhfbsy9GTw/Hk=;
X-UUID: 311682019b124866bb208add095a7881-20201201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1859746982; Tue, 01 Dec 2020 03:17:03 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Dec 2020 03:17:06 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Dec 2020 19:17:00 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Dec 2020 19:16:59 +0800
Message-ID: <1606821422.6563.10.camel@mtksdccf07>
Subject: Re: [PATCH v4 0/6] kasan: add workqueue and timer stack for generic
 KASAN
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 1 Dec 2020 19:17:02 +0800
In-Reply-To: <CACT4Y+a=GmYVZwwjyXwO=_AeGy4QB9X=5x7cL76erwjPvRW6Zw@mail.gmail.com>
References: <20200924040152.30851-1-walter-zh.wu@mediatek.com>
 <87h7rfi8pn.fsf@nanos.tec.linutronix.de>
 <CACT4Y+a=GmYVZwwjyXwO=_AeGy4QB9X=5x7cL76erwjPvRW6Zw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_061720_158907_ACC32C02 
X-CRM114-Status: GOOD (  22.14  )
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
Cc: Marco Elver <elver@google.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 Linux-MM <linux-mm@kvack.org>, Stephen
 Boyd <sboyd@kernel.org>, Alexander Potapenko <glider@google.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 John Stultz <john.stultz@linaro.org>, Andrey
 Konovalov <andreyknvl@google.com>, Tejun Heo <tj@kernel.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dmitry,

On Tue, 2020-12-01 at 08:59 +0100, 'Dmitry Vyukov' via kasan-dev wrote:
> On Wed, Sep 30, 2020 at 5:29 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > On Thu, Sep 24 2020 at 12:01, Walter Wu wrote:
> > > Syzbot reports many UAF issues for workqueue or timer, see [1] and [2].
> > > In some of these access/allocation happened in process_one_work(),
> > > we see the free stack is useless in KASAN report, it doesn't help
> > > programmers to solve UAF on workqueue. The same may stand for times.
> > >
> > > This patchset improves KASAN reports by making them to have workqueue
> > > queueing stack and timer stack information. It is useful for programmers
> > > to solve use-after-free or double-free memory issue.
> > >
> > > Generic KASAN also records the last two workqueue and timer stacks and
> > > prints them in KASAN report. It is only suitable for generic KASAN.
> 
> Walter, did you mail v5?
> Checking statuses of KASAN issues and this seems to be not in linux-next.
> 

Sorry for the delay in responding to this patch. I'm busy these few
months, so that suspend processing it.
Yes, I will send it next week. But v4 need to confirm the timer stack is
useful. I haven't found an example. Do you have some suggestion about
timer?

Thanks.
Walter

> > > [1]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22+process_one_work
> > > [2]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22%20expire_timers
> >
> > How are these links useful for people who do not have a gurgle account?
> 
> This is a public mailing list archive, so effectively the same way as
> lore links ;)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
