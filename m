Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE403C64E7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 01:29:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 630B32222C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 01:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 630B32222C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=752a47AVq8tQLlTt1K6TBMZVMtKOBt98Vqw0L/ImmQc=; b=i+DOChisMg3NHBry1EybVe/h0
	NECh36MMmra8zEjSwQTklGgY/TaeMLzwIvHgDvFbR+cwJ7Hizi4oqCb7jO11cz5obSUOgUNF+ewuu
	8bNchn0Fxelu4IO+mTY84rZmozyPsijeOHwPK6GX1t42m8Z3jlg/mB20UQGr7muqY/yrdJx9hgzmn
	4YYfscqevaDqPjvsCljkXgFCOXYLKluWPnFiR+tASSO1F2En2RsiSG8Va8HBINXBeIfDBEkmqFabp
	5iEmbOJMDJp8kmiECkbG2K5cMzSUOF3w/2CPawrF4aCd5IUeNtAUeJPKBe6LNw3uclkj0aWYIYJ+b
	gIyfOHJjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkGxe-00023g-4P; Wed, 02 Dec 2020 01:29:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkGxZ-00022A-IN; Wed, 02 Dec 2020 01:29:34 +0000
X-UUID: 8e1aaeb22fc84150bb01bfb04d8bc5e9-20201201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aFh6DrFU7jAcnRRxu+a/aUKMgiC608ISwon0hAJWMbM=; 
 b=BcCp9VTjpgJ6ETurY7dkzQDQHBpDn5/J//dd41fnUHj22xiLGknLUW/eo8vhESkrEtorZs2O6fsAYUPdzZYAn6PiuGDXPsikaBOvqYTHekt8qHsgtWJ/+I2/MUd1Num+Ltm3z1p3X4dTwimXfSzeSzNCeGFVDehkjI4lzmCVqZo=;
X-UUID: 8e1aaeb22fc84150bb01bfb04d8bc5e9-20201201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 678264695; Tue, 01 Dec 2020 17:29:29 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Dec 2020 17:22:28 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Dec 2020 09:22:20 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Dec 2020 09:22:20 +0800
Message-ID: <1606872145.1015.5.camel@mtksdccf07>
Subject: Re: [PATCH v4 0/6] kasan: add workqueue and timer stack for generic
 KASAN
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 2 Dec 2020 09:22:25 +0800
In-Reply-To: <CACT4Y+Yy8S0L18u3q1Y1K1r-qqXRWzrVVLPNR_En0hJ9nX7Tbw@mail.gmail.com>
References: <20200924040152.30851-1-walter-zh.wu@mediatek.com>
 <87h7rfi8pn.fsf@nanos.tec.linutronix.de>
 <CACT4Y+a=GmYVZwwjyXwO=_AeGy4QB9X=5x7cL76erwjPvRW6Zw@mail.gmail.com>
 <1606821422.6563.10.camel@mtksdccf07>
 <CACT4Y+Yy8S0L18u3q1Y1K1r-qqXRWzrVVLPNR_En0hJ9nX7Tbw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C1099CD3A8527B7642F07659FBF80227BD8F9D554DF4ECC02ABA034D081813CC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_202933_804740_FA76DA84 
X-CRM114-Status: GOOD (  24.83  )
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

On Tue, 2020-12-01 at 15:02 +0100, 'Dmitry Vyukov' via kasan-dev wrote:
> On Tue, Dec 1, 2020 at 12:17 PM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > Hi Dmitry,
> >
> > On Tue, 2020-12-01 at 08:59 +0100, 'Dmitry Vyukov' via kasan-dev wrote:
> > > On Wed, Sep 30, 2020 at 5:29 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> > > >
> > > > On Thu, Sep 24 2020 at 12:01, Walter Wu wrote:
> > > > > Syzbot reports many UAF issues for workqueue or timer, see [1] and [2].
> > > > > In some of these access/allocation happened in process_one_work(),
> > > > > we see the free stack is useless in KASAN report, it doesn't help
> > > > > programmers to solve UAF on workqueue. The same may stand for times.
> > > > >
> > > > > This patchset improves KASAN reports by making them to have workqueue
> > > > > queueing stack and timer stack information. It is useful for programmers
> > > > > to solve use-after-free or double-free memory issue.
> > > > >
> > > > > Generic KASAN also records the last two workqueue and timer stacks and
> > > > > prints them in KASAN report. It is only suitable for generic KASAN.
> > >
> > > Walter, did you mail v5?
> > > Checking statuses of KASAN issues and this seems to be not in linux-next.
> > >
> >
> > Sorry for the delay in responding to this patch. I'm busy these few
> > months, so that suspend processing it.
> > Yes, I will send it next week. But v4 need to confirm the timer stack is
> > useful. I haven't found an example. Do you have some suggestion about
> > timer?
> 
> Good question.
> 
> We had some use-after-free's what mention call_timer_fn:
> https://groups.google.com/g/syzkaller-bugs/search?q=%22kasan%22%20%22use-after-free%22%20%22expire_timers%22%20%22call_timer_fn%22%20
> In the reports I checked call_timer_fn appears in the "access" stack
> rather in the "free" stack.
> 
Yes, call stack already is useful for it in KASAN report.

> Looking at these reports I cannot conclude that do_init_timer stack
> would be useful.
> I am mildly leaning towards not memorizing do_init_timer stack for now
> (until we have clear use cases) as the number of aux stacks is very
> limited (2).
> 
Got it. I will remove timer patch and send v5.
Thanks for your suggestion.

Walter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
