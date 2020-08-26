Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86851C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 12:31:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51CE320707
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 12:31:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ouncgWmd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="QakGTVbn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51CE320707
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OrAOch+Fot7yY5yMHI2pycpGRKhN4yw0ekP+/MU2iyo=; b=ouncgWmdlMxTvY2au5yij95XR
	YpfCb53calQfHpEeCkwsbNAW82fP7rjGeDEiLXxXp1Zac2WOsOefjt9ekWZXiGKXlGsqYnhBqQacR
	VYsIGyePaKCMNsF+x+nwF6lIkPEGtw1rOChZ73X3HvmD9mVjORxjKlxXNdfyrY5EQeupIO6MWluMQ
	IjAe7xWW5EnfTGKYNiyRED0aaXc9AGvTeeJ3e110/M04fvOb/XXD3S0QmFmxWJK7Vvvskuylm1t9P
	ay3iAAU4oT5f7b6hBhFmJPlf6ryCFsBLz2oia6k6AV1qZnkotXRqpSh45Qva9hGdZe/Ags7oekAjL
	7tybyCIPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAuZn-00067c-RJ; Wed, 26 Aug 2020 12:30:51 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAuZl-00066R-Ow
 for linux-mediatek@lists.infradead.org; Wed, 26 Aug 2020 12:30:51 +0000
Received: by mail-pj1-x1042.google.com with SMTP id ds1so817408pjb.1
 for <linux-mediatek@lists.infradead.org>; Wed, 26 Aug 2020 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lKGfppbU0E9vUo/Yy4y4n653KjJPK3r8SJn5wAvVr+w=;
 b=QakGTVbnXji0yIrLxFbJeBQ4Wf27OXuadMyAl+bRhLmub3MVtzX2wowojkT9zFhudo
 4ecf/bj36eiq5t7/Xlbi1OBjE9CSJ7lTTQASsQMdjzAM31kZSMAdmbDPkmsDq62jIWLm
 4EPiv8fBPc0g7CfEV5HS/ESM5rtS1YmNgyo2FrY7BWcOfbcCTHN6Ub1BNh5nv7MvTo2f
 NgNHpBVzB+w4EAVGzWptlpbZqkUVaejmuPBIF8xTNSRptmsxR3s7Pbv+rkmxNVC4irOT
 TNt184ss1jrFY2Ino4qBMzI6FBff3MO38MvnQxyQ/EKBCU/t3uQH9iZ3kPgbQ/KIzYzM
 HEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lKGfppbU0E9vUo/Yy4y4n653KjJPK3r8SJn5wAvVr+w=;
 b=JK1ThK3qco1FrCru0kqh+M0FJpcH6S8qg2lSm/Ne3SeAD6WJ2k2L/wQh9npYbGByl1
 wR7ec/cLsbuJSDvUFFuibzHuWaGFakVmlvCbNahuwK9uEfTCm8qcxWk8PenYTpPq58tV
 EC8nbSfBDkAFN+zAMzdD9CWCPJXQIsY219D2HkLxNCM02YX3UReNKj1wAv4zWJ5bk1No
 E/Hpm6z9/gNKvZE6sEUI8waDuh8pAlsd7Snat2q0gmStbW/64l8eZpltJMlt8MA3UywQ
 YUJwEkrkyU8or4N0WJJVOJBSkLL9SBIgY+onWTgoMvPEq5OOOSYFmJDe9d+3Z59HVnkt
 Iycw==
X-Gm-Message-State: AOAM532rfdyPd+Op+D1tHdIfYsbME1Gti0K2c6iikkG9fB0Ke+rS3Oq2
 c9Qj76rAJc33HZ4HEj2kbdfUMxlcol+SQmH7AcIORw==
X-Google-Smtp-Source: ABdhPJzfN5W9BaSlDLOyQZ1bH05/BwCHKG7L/Q3MInfwi5CE5Y8xF3ppMa98+Luw2xoB+7F0FyfkJUjO7daLVC4QNBI=
X-Received: by 2002:a17:90a:2d82:: with SMTP id
 p2mr5048424pjd.166.1598445045375; 
 Wed, 26 Aug 2020 05:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200825015654.27781-1-walter-zh.wu@mediatek.com>
 <CANpmjNOvj+=v7VDVDXpsUNZ9o0+KoJVJs0MjLhwr0XpYcYQZ5g@mail.gmail.com>
In-Reply-To: <CANpmjNOvj+=v7VDVDXpsUNZ9o0+KoJVJs0MjLhwr0XpYcYQZ5g@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 26 Aug 2020 14:30:34 +0200
Message-ID: <CAAeHK+yVShDPCxVKDsO_5SwoM2ZG7x7byUJ74PtB7ekY61L2YQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] kasan: add workqueue and timer stack for generic
 KASAN
To: Marco Elver <elver@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_083049_855009_9015CD18 
X-CRM114-Status: GOOD (  23.57  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>, John Stultz <john.stultz@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Stephen Boyd <sboyd@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
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

On Tue, Aug 25, 2020 at 10:26 AM 'Marco Elver' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Tue, 25 Aug 2020 at 03:57, Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > Syzbot reports many UAF issues for workqueue or timer, see [1] and [2].
> > In some of these access/allocation happened in process_one_work(),
> > we see the free stack is useless in KASAN report, it doesn't help
> > programmers to solve UAF on workqueue. The same may stand for times.
> >
> > This patchset improves KASAN reports by making them to have workqueue
> > queueing stack and timer stack information. It is useful for programmers
> > to solve use-after-free or double-free memory issue.
> >
> > Generic KASAN also records the last two workqueue and timer stacks and
> > prints them in KASAN report. It is only suitable for generic KASAN.
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
>
> Acked-by: Marco Elver <elver@google.com>

Reviewed-by: Andrey Konovalov <andreyknvl@google.com>

>
>
>
> > ---
> >
> > Changes since v2:
> > - modify kasan document to be more readable.
> >   Thanks for Marco suggestion.
> >
> > Changes since v1:
> > - Thanks for Marco and Thomas suggestion.
> > - Remove unnecessary code and fix commit log
> > - reuse kasan_record_aux_stack() and aux_stack
> >   to record timer and workqueue stack.
> > - change the aux stack title for common name.
> >
> > ---
> >
> > Documentation/dev-tools/kasan.rst |  4 ++--
> > kernel/time/timer.c               |  3 +++
> > kernel/workqueue.c                |  3 +++
> > lib/test_kasan.c                  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > mm/kasan/report.c                 |  4 ++--
> > 5 files changed, 64 insertions(+), 4 deletions(-)
> >
> > --
> > You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200825015654.27781-1-walter-zh.wu%40mediatek.com.
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/CANpmjNOvj%2B%3Dv7VDVDXpsUNZ9o0%2BKoJVJs0MjLhwr0XpYcYQZ5g%40mail.gmail.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
