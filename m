Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78C7C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 02:14:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B410E20786
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 02:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nFxeLEQl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EZ1kaKjO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B410E20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+tP5qLGsmRlK3tFNFu1nCLWGRiydpaQ7G3+fr2W8n2s=; b=nFxeLEQl2ca0xjKigTd8RO1Hp
	Zh1bprTjHCLXEzVxO4wObSEhEzSqqG+uhKkAIgGUGzep4DYNASuB+b9UsFDHtkeyK4lln81lCDGYx
	hfejzIh3ecBqNRjgE7eXM6Ho/TGXJP66FM7skoGafRG7HcCCfYlSimQ+yDJIjwUHe9ZaV+2cdca2X
	Ku7j/u1Z2u4BruZIUpbDCj+F6yF4bwulmo+KQbxaH66wHeeaRXdyeU4/6KqOatETIYQf5AegctNJg
	Y+O3c1GO0XABA6G4y+pFtSFqQh5zFTdsfoQwjWjqYmZoHjofVjqrZDWRURlrkGRCweLIO/N/4fAIR
	DT58DMDJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDelg-0008Qy-6f; Thu, 03 Sep 2020 02:14:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDelb-0008Pq-VU; Thu, 03 Sep 2020 02:14:26 +0000
X-UUID: 68dc97f0ca474a7aaf850b66d612bb0e-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AajrTFn3Auk2rKVdZkKi5kCzYDhKTsT5vsI2D4hD++Q=; 
 b=EZ1kaKjOaJXCgq9CSc/GJa0d6scGXUi12iacVmetb4oWXI5LQeIxFP3dv+kDGi+NRLBuXadjY9QM1DuSqHqlLmWx6hMW4wWAB1biiv1r3eH1IPb3XxAUg8y8Pp/d5QpOtIDaQIPAEiGeH+LQ+WuYL4qGeiE75HHVtFyzEcFd6qA=;
X-UUID: 68dc97f0ca474a7aaf850b66d612bb0e-20200902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <claude.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 184725020; Wed, 02 Sep 2020 18:14:10 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 19:14:09 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 10:14:06 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Sep 2020 10:14:06 +0800
Message-ID: <1599099247.4435.4.camel@mtksdccf07>
Subject: Re: [PATCH] PM: s2idle: Introduce syscore callbacks in s2idle flow
From: Claude.Yen <Claude.Yen@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 3 Sep 2020 10:14:07 +0800
In-Reply-To: <CAJZ5v0hOGEUamXw124q4CnL67o97qRHy9Vv9_F2AQqefDdu3vQ@mail.gmail.com>
References: <1598943859-21857-1-git-send-email-claude.yen@mediatek.com>
 <CAJZ5v0hOGEUamXw124q4CnL67o97qRHy9Vv9_F2AQqefDdu3vQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1BF4C1899FB0BB2C5EFD5FF48193355333B30A741024572127D6DC6D18D88B412000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_221424_201672_BA85A603 
X-CRM114-Status: GOOD (  21.35  )
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
 Linux PM <linux-pm@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Douglas
 Anderson <dianders@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
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

On Tue, 2020-09-01 at 13:57 +0200, Rafael J. Wysocki wrote:
> On Tue, Sep 1, 2020 at 9:05 AM Claude Yen <claude.yen@mediatek.com> wrote:
> >
> > This series based on 5.9-rc1
> > This patch makes s2idle call existing syscore callbacks. Currently,
> > when s2idle is selected as system suspend method, callbacks hooked
> > by register_syscore_ops() will not be triggered. This may induce
> > unexpected results.
> 
> They are not executed by design.
> 
> > For example, sched_clock_suspend() was added to s2idle flow in
> > commit 3f2552f7e9c5 ("timers/sched_clock: Prevent generic sched_clock
> > wrap caused by tick_freeze()") to fix clock wrap problem. However,
> > sched_clock_suspend() is originally registered in syscore callback.
> 
> I'm not sure why this matters here.

If functions in syscore callbacks are needed in s2idle, explicit
migration is needed like commit 3f2552f7e9c5 ("timers/sched_clock:
Prevent generic sched_clock wrap caused by tick_freeze()").
Thus, I am wondering if such effort could be saved.

> > With this patch, if another syscore callback is needed in s2idle,
> > additional migration effort could be saved.
> 
> s2idle cannot execute syscore callbacks, because it doesn' take
> non-boot CPUs offline and it won't do that.
> 
> Thanks!

Yes, the current design of syscore callback needs non-boot CPUs offline.
Considering the following case: in s2idle flow, there is a status that
only one CPU is alive and other CPUs have enter deepest idle state.
This situation is similar to getting non-boot CPUs offline, though all
CPUs are online from kernel's perspective.

Reply from Stephen mentioned that if an operation is needed in both
S2R and s2idle, CPU_PM notifier can be utilized. 
In my opinion, CPU_PM notifier is particularly for CPU entering idle
state. In contrast, syscore callback is for system going low power
state. There exists semantic difference between these two callbacks.

Could the current design of syscore callback be re-designed as
system-wide suspend callback?

Proposed suspend flow in this patch:

    Freeze tasks
        |
        V
    Device suspend callbacks
        |
        |-------------s2idle----------
        |                            |
        V                            |
    Disable nonboot CPUs    Is this CPU last core to enter idle?
        |                            |
        V                            |-------------
    syscore callbacks                |            |
        |                           No           Yes
        V                            |            |
    platform suspend                 V            V
                                 enter idle     syscore callback
                                                  |
                                                  V
                                                enter idle

Regards,
Claude

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
