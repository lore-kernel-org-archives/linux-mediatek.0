Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E2FC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 12:55:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A92A020882
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 12:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PNgb7VOr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A92A020882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b0T5L3cYle2xFqlyyDEmtdPHz41FH2gZfpwIT+2hoDE=; b=PNgb7VOrZmBaM1WuJHJp7r1V9
	NMWpb1WPVUz+5NAqfnYeEMDRlkt6sYHgysyfauVjXzxrrYwHxfrH3aqdFBL0Ozcspx2j3n4H//1gp
	+yVciPMqoknbYBiAKSxxbm7X9074SHopl4w/noyknJTVzsPTDkrDR6yyRfakbnJadxjRDBbCurSF2
	S9GDn/kyei5x2ngfS74+CEiroyJXzclJJgXukgzfNSc7Syy528rWc3f5Ic1JP9Ao9hpwfy05OD3Nm
	9wmc5WOP1qqZ/+bZeX29cXnmbeIxN8xgNdUdYYVSmvlEENzSisejwXCg1KZ8xz+6YfhT5nH5KAJQl
	aZQMpQZkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGM6h-0007rw-3d; Thu, 10 Sep 2020 12:55:19 +0000
Received: from cloudserver094114.home.pl ([79.96.170.134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGM6b-0007qm-T4; Thu, 10 Sep 2020 12:55:14 +0000
Received: from 89-64-87-170.dynamic.chello.pl (89.64.87.170) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.468)
 id 0b9e2c09bd0fb81d; Thu, 10 Sep 2020 14:55:07 +0200
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: "Claude. Yen" <Claude.Yen@mediatek.com>
Subject: Re: [PATCH] PM: s2idle: Introduce syscore callbacks in s2idle flow
Date: Thu, 10 Sep 2020 14:55:06 +0200
Message-ID: <1955367.r5QahNuf3v@kreacher>
In-Reply-To: <1599099247.4435.4.camel@mtksdccf07>
References: <1598943859-21857-1-git-send-email-claude.yen@mediatek.com>
 <CAJZ5v0hOGEUamXw124q4CnL67o97qRHy9Vv9_F2AQqefDdu3vQ@mail.gmail.com>
 <1599099247.4435.4.camel@mtksdccf07>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_085514_057868_BC17F029 
X-CRM114-Status: GOOD (  25.52  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Frederic Weisbecker <fweisbec@gmail.com>, Linux PM <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <swboyd@chromium.org>,
 Ingo Molnar <mingo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thursday, September 3, 2020 4:14:07 AM CEST Claude. Yen wrote:
> On Tue, 2020-09-01 at 13:57 +0200, Rafael J. Wysocki wrote:
> > On Tue, Sep 1, 2020 at 9:05 AM Claude Yen <claude.yen@mediatek.com> wrote:
> > >
> > > This series based on 5.9-rc1
> > > This patch makes s2idle call existing syscore callbacks. Currently,
> > > when s2idle is selected as system suspend method, callbacks hooked
> > > by register_syscore_ops() will not be triggered. This may induce
> > > unexpected results.
> > 
> > They are not executed by design.
> > 
> > > For example, sched_clock_suspend() was added to s2idle flow in
> > > commit 3f2552f7e9c5 ("timers/sched_clock: Prevent generic sched_clock
> > > wrap caused by tick_freeze()") to fix clock wrap problem. However,
> > > sched_clock_suspend() is originally registered in syscore callback.
> > 
> > I'm not sure why this matters here.
> 
> If functions in syscore callbacks are needed in s2idle, explicit
> migration is needed like commit 3f2552f7e9c5 ("timers/sched_clock:
> Prevent generic sched_clock wrap caused by tick_freeze()").
> Thus, I am wondering if such effort could be saved.

Yes, it could.

You can define platform ops for s2idle and invoke what's needed from there.

> > > With this patch, if another syscore callback is needed in s2idle,
> > > additional migration effort could be saved.
> > 
> > s2idle cannot execute syscore callbacks, because it doesn' take
> > non-boot CPUs offline and it won't do that.
> > 
> > Thanks!
> 
> Yes, the current design of syscore callback needs non-boot CPUs offline.
> Considering the following case: in s2idle flow, there is a status that
> only one CPU is alive and other CPUs have enter deepest idle state.
> This situation is similar to getting non-boot CPUs offline, though all
> CPUs are online from kernel's perspective.

It is only similar AFAICS.

You don't migrate interrupts during s2idle, for example.

> Reply from Stephen mentioned that if an operation is needed in both
> S2R and s2idle, CPU_PM notifier can be utilized. 
> In my opinion, CPU_PM notifier is particularly for CPU entering idle
> state. In contrast, syscore callback is for system going low power
> state. There exists semantic difference between these two callbacks.

Fair enough.

> Could the current design of syscore callback be re-designed as
> system-wide suspend callback?

No, it couldn't.

> Proposed suspend flow in this patch:
> 
>     Freeze tasks
>         |
>         V
>     Device suspend callbacks
>         |
>         |-------------s2idle----------
>         |                            |
>         V                            |
>     Disable nonboot CPUs    Is this CPU last core to enter idle?
>         |                            |
>         V                            |-------------
>     syscore callbacks                |            |
>         |                           No           Yes
>         V                            |            |
>     platform suspend                 V            V
>                                  enter idle     syscore callback
>                                                   |
>                                                   V
>                                                 enter idle
> 

The primary problem with this is that on some architectures (x86 at least)
the syscore things cannot be run during the s2idle flow.

Also there is a way to invoke them through the platform ops as I said.

Thanks!




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
