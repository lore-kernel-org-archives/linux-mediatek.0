Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81677C64E7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 14:03:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F203F2168B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 14:03:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qzKSi5qq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="QfxTVBHw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F203F2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7ud2Y87fBeNitbtwfLDnXn043xxtQ+ju2Old1uzxdkE=; b=qzKSi5qqflMCSoJgyHXdTMvZC
	ZCltmf+julIPI7m3WiOS2erKDREDF1x+kaGw/hAFRIbzRqdTWw7he4deBP/hcihGlv473kAAWu99M
	Hpj0LDk3Cn+46SuESwHGcyjIgaVhddmKe/yUN1yRSrftuY8/i+YFohhZTZuThAZMVq38HY9qvwFQX
	y+FuScWEGmN4MBDd6mbeLoRaVpdaUbuI97WSjY6uL+V5vLnO/nUSu54pHSk5PM0O6zMZ405uqY7Cl
	a0Eutd3lWJgM0P0j7agSiBoVVHtb+87fXyjOW9nu2cQmyco1WzeNJ42Io79k5VFjjdNqL18ApjdtP
	ixYsQGLng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk6F6-00046k-Q7; Tue, 01 Dec 2020 14:02:56 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk6F3-00044i-Q6
 for linux-mediatek@lists.infradead.org; Tue, 01 Dec 2020 14:02:55 +0000
Received: by mail-qt1-x841.google.com with SMTP id l7so1117949qtp.8
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Dec 2020 06:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DowCnJV0jJLxqPNhupVbMRSWGm+7uLhFQL0+P+g8v1E=;
 b=QfxTVBHwfLM/RTcmqP7qAGpmN8zoVJZN3uVb3RgA5Zx6sxjFNx9EX61ScUd2ihRp4m
 IdIO8X60HUdYF7hm3ofecC6QYqNf7d8muHij1SlMtLgd2Uu98smcn7rsSbLEuBI1yZaE
 JfXW2GDH+VbiCeMRXOq3jTxLpXlL75zY6XJi/8YsFmowA+aWUc2r0smb/Cud0R5TESMz
 UKTvjJFJ2Uzuo8VET0aad5u3KWz1pZDiJBa+PmpH7H3MsNS0eGRCFHTOV4G2j1Ie/uLg
 K+Ezx1gxo/gVWFntyD09ZoPaoloXkC8XQK+bR/543ckQKwNGj1sOvp73JdkaQx5vWrZX
 AnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DowCnJV0jJLxqPNhupVbMRSWGm+7uLhFQL0+P+g8v1E=;
 b=eOPJaECYJYsMahWaTfda7oBlyLf5nzGjb7eYqgnm2bCqsdWQjvIDmAqPzLR171tcOs
 CNf3oAtefvC0FSqTz2aKnRFyAIXNVT1DbTk9sFS5lP0LuPR3fzkowV40Kx0gE1+iWpzG
 NNP5DG0jb2GETfO7t5T+qNvqrtXQduGxVtmTmL95e81jYiUCUxrDHekZMgd9FAMtY/qT
 9rPYDjwc1IVNypTud2T2ttlqlLkIkxuBX1FQDQvfRo+UVzAlhFWUhVvPjW2OtB+M9+hB
 G4xSnj0FlXG/w134YSyVYxUh8Dcdrs3S/09HCekhWtd6eKDdR6r9ywbK7FsFC5Rn4c2I
 SVOw==
X-Gm-Message-State: AOAM531v9Jbq0xiDt2J1jZwEq8+lAio5tERVrGCyd9CMwWADMPQCggGl
 InufxO7j7Io6kDCNp9iZ+D9dD0bihjqSGkJO+0ps+g==
X-Google-Smtp-Source: ABdhPJxVr8e6IHqhxlpV/01xGGsXjC2Dt2bzhkooYsHv2mXQAPjcqkx/kLcjhAP7zSaTMnzLAHC47gA77xRhDBnFRuo=
X-Received: by 2002:aed:2664:: with SMTP id z91mr2947243qtc.290.1606831369999; 
 Tue, 01 Dec 2020 06:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20200924040152.30851-1-walter-zh.wu@mediatek.com>
 <87h7rfi8pn.fsf@nanos.tec.linutronix.de>
 <CACT4Y+a=GmYVZwwjyXwO=_AeGy4QB9X=5x7cL76erwjPvRW6Zw@mail.gmail.com>
 <1606821422.6563.10.camel@mtksdccf07>
In-Reply-To: <1606821422.6563.10.camel@mtksdccf07>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 1 Dec 2020 15:02:38 +0100
Message-ID: <CACT4Y+Yy8S0L18u3q1Y1K1r-qqXRWzrVVLPNR_En0hJ9nX7Tbw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] kasan: add workqueue and timer stack for generic
 KASAN
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_090253_925990_2DF8441B 
X-CRM114-Status: GOOD (  21.73  )
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
 Linux-MM <linux-mm@kvack.org>, Stephen Boyd <sboyd@kernel.org>,
 Alexander Potapenko <glider@google.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 John Stultz <john.stultz@linaro.org>, Andrey Konovalov <andreyknvl@google.com>,
 Tejun Heo <tj@kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 1, 2020 at 12:17 PM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> Hi Dmitry,
>
> On Tue, 2020-12-01 at 08:59 +0100, 'Dmitry Vyukov' via kasan-dev wrote:
> > On Wed, Sep 30, 2020 at 5:29 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> > >
> > > On Thu, Sep 24 2020 at 12:01, Walter Wu wrote:
> > > > Syzbot reports many UAF issues for workqueue or timer, see [1] and [2].
> > > > In some of these access/allocation happened in process_one_work(),
> > > > we see the free stack is useless in KASAN report, it doesn't help
> > > > programmers to solve UAF on workqueue. The same may stand for times.
> > > >
> > > > This patchset improves KASAN reports by making them to have workqueue
> > > > queueing stack and timer stack information. It is useful for programmers
> > > > to solve use-after-free or double-free memory issue.
> > > >
> > > > Generic KASAN also records the last two workqueue and timer stacks and
> > > > prints them in KASAN report. It is only suitable for generic KASAN.
> >
> > Walter, did you mail v5?
> > Checking statuses of KASAN issues and this seems to be not in linux-next.
> >
>
> Sorry for the delay in responding to this patch. I'm busy these few
> months, so that suspend processing it.
> Yes, I will send it next week. But v4 need to confirm the timer stack is
> useful. I haven't found an example. Do you have some suggestion about
> timer?

Good question.

We had some use-after-free's what mention call_timer_fn:
https://groups.google.com/g/syzkaller-bugs/search?q=%22kasan%22%20%22use-after-free%22%20%22expire_timers%22%20%22call_timer_fn%22%20
In the reports I checked call_timer_fn appears in the "access" stack
rather in the "free" stack.

Looking at these reports I cannot conclude that do_init_timer stack
would be useful.
I am mildly leaning towards not memorizing do_init_timer stack for now
(until we have clear use cases) as the number of aux stacks is very
limited (2).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
