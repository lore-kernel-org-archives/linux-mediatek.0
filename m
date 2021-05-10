Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFC6C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 07:46:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADEEC61432
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 07:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADEEC61432
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eRop8cijlGf0g6ppN6Puj6FtH88VIHH0Pt+7unLd+Js=; b=b3h3tXc7q/iPxkxgoIobhvtRH
	ziwqVwjN8z+Q9kDEg7usRFn1Uihe28+Re0mxcH6wmisaDLEXP8hhFgMCbmR0PG4KKUq6ANmSm1c87
	XR0XAQcGK//NC0de27rM9ezJp1/vY+mE+uCRhcXeMihrXPVb8WFkVlLNc8e7NG5CM9ZZTUNQ1URUy
	Oq+p6a1anGt0fZyrYMO7EmZUFaHzi1YhQ+zeFzDZHi9ty4bOz+xEyrHi+GRKK8LOtBJ3fzDYe65Ll
	SJF1fYCSNGVsFUOlaJ5FpQQDuSgI13+jlcIDU68LCcC9n3Fzzqbrto7wijcPURb+YPWYbstqFIvHS
	HvJPUf2gA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg0cj-00DYjX-4v; Mon, 10 May 2021 07:46:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg0ca-00DYie-SY; Mon, 10 May 2021 07:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=HD6cG/SOqee6i5pdXdQy5wARsZJb5H5w2TiQc6+BC7g=; b=xNBGtDbaeZU66+SZwQdgGqeZBa
 IQN+qPzzUtOgtzk3xEy2vOcWDopJgXFwJS8XsETuxkvsz+rsejLWo/7H3Ny17scaEF+XG9Se1/hZA
 Jcb9Nd3mqOovOrFkRhcJNJa5pSL8sygQFba1eDOuB8m9NGuRV+u6LM0E8Pz+zU1idGwjpLVvB8CX4
 g6yRdmLSghHBawhsRYGZtZ76S1g3llfC5QJeydslZXbNJJl+f7oZ9ww+p3u8HheNxX6AVfmTZFJEu
 VOfDKRHUWirUQyARmDrCX4zmYdZZH68iGB5Q1je0ZbcyfCkdJ+k1Td8uNiafKYN5m5z7mRz7tWTaz
 E05+zI/g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg0cX-008Nzx-Sr; Mon, 10 May 2021 07:46:31 +0000
X-UUID: 5e49b5e12b2e48b789422baf1948972d-20210510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HD6cG/SOqee6i5pdXdQy5wARsZJb5H5w2TiQc6+BC7g=; 
 b=kZ4K2gtGS7yh8PBKpPiqnc53nSoNL4+t87MSMLg3BToOUAThPnK08BYmNawQdYp4+Atcbi7p2GcErCWoX3hqDe+JZppoNGdw0UfOT0BNVsnZRnZUnu2TNCyCKGudVDE5KMdaROkEsSo9z5a2mCBLSy46ajWqJmi3vXfzl2KyyL8=;
X-UUID: 5e49b5e12b2e48b789422baf1948972d-20210510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 983326895; Mon, 10 May 2021 00:46:22 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 00:36:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 15:36:17 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 May 2021 15:36:16 +0800
Message-ID: <1620631421.29475.106.camel@mbjsdccf07>
Subject: Re: [PATCH][v2] rtnetlink: add rtnl_lock debug log
From: Rocco.Yue <rocco.yue@mediatek.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Peter Enderborg <peter.enderborg@sony.com>, Thomas Gleixner
 <tglx@linutronix.de>, Anshuman Khandual <anshuman.khandual@arm.com>, "Vitor
 Massaru Iha" <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>, "Wei
 Yang" <richard.weiyang@gmail.com>, Cong Wang <cong.wang@bytedance.com>, "Di
 Zhu" <zhudi21@huawei.com>, Stephen Hemminger <stephen@networkplumber.org>,
 Francis Laniel <laniel_francis@privacyrequired.com>, Roopa Prabhu
 <roopa@cumulusnetworks.com>, Andrii Nakryiko <andrii@kernel.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>, netdev
 <netdev@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, <wsd_upsream@mediatek.com>
Date: Mon, 10 May 2021 15:23:41 +0800
In-Reply-To: <CAHp75VftbW7pgkfrSB6teKZO4EfGH9UWkhy1SAtijCLvKz8HTQ@mail.gmail.com>
References: <20210508085738.6296-1-rocco.yue@mediatek.com>
 <CAHp75VftbW7pgkfrSB6teKZO4EfGH9UWkhy1SAtijCLvKz8HTQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 476A657A0289A88F888480F2D6FE95E576AF42C2725E86517F412CC6E207CC222000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_004629_966173_65611CDB 
X-CRM114-Status: GOOD (  25.90  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2021-05-09 at 12:42 +0300, Andy Shevchenko wrote:
> On Sat, May 8, 2021 at 12:11 PM Rocco Yue <rocco.yue@mediatek.com> wrote:
> >
> > We often encounter system hangs caused by certain process
> > holding rtnl_lock for a long time. Even if there is a lock
> > detection mechanism in Linux, it is a bit troublesome and
> > affects the system performance. We hope to add a lightweight
> > debugging mechanism for detecting rtnl_lock.
> >
> > Up to now, we have discovered and solved some potential bugs
> > through this lightweight rtnl_lock debugging mechanism, which
> > is helpful for us.
> >
> > When you say Y for RTNL_LOCK_DEBUG, then the kernel will detect
> > if any function hold rtnl_lock too long and some key information
> > will be printed out to help locate the problem.
> >
> > i.e: from the following logs, we can clearly know that the pid=2206
> > RfxSender_4 process holds rtnl_lock for a long time, causing the
> > system to hang. And we can also speculate that the delay operation
> > may be performed in devinet_ioctl(), resulting in rtnl_lock was
> > not released in time.
> >
> > <6>[   40.191481][    C6] rtnetlink: -- rtnl_print_btrace start --
> 
> You don't seem to get it. It's a quite long trace for the commit
> message. Do you need all those lines below? Why?
> 

The contents shown in all the lines below are the original printed after
adding this patch, I pasted these lines into commit message to
illustrate this patch as a case.

It now appears that some of following are indeed unnecessary, I am going
to condense a lot of following contents as follows.

Could you please help to take a look at it again? many thanks :-)

[   40.191481] rtnetlink: -- rtnl_print_btrace start --
[   40.191494] RfxSender_4[2206][R] hold rtnl_lock more than 2 sec,
start time: 38181400013
[   40.191571] Call trace:
[   40.191586]  rtnl_print_btrace+0xf0/0x124
[   40.191656]  __delay+0xc0/0x180
[   40.191663]  devinet_ioctl+0x21c/0x75c
[   40.191668]  inet_ioctl+0xb8/0x1f8
[   40.191675]  sock_do_ioctl+0x70/0x2ac
[   40.191682]  sock_ioctl+0x5dc/0xa74
[   40.191715] rtnetlink: -- rtnl_print_btrace end --
[   42.181879] rtnetlink: rtnl_lock is held by [2206] from
[38181400013] to [42181875177]

> > <6>[   40.191494][    C6] rtnetlink: RfxSender_4[2206][R] hold rtnl_lock
> > more than 2 sec, start time: 38181400013
> > <4>[   40.191510][    C6]  devinet_ioctl+0x1fc/0x75c
> > <4>[   40.191517][    C6]  inet_ioctl+0xb8/0x1f8
> > <4>[   40.191527][    C6]  sock_do_ioctl+0x70/0x2ac
> > <4>[   40.191533][    C6]  sock_ioctl+0x5dc/0xa74
> > <4>[   40.191541][    C6]  __arm64_sys_ioctl+0x178/0x1fc
> > <4>[   40.191548][    C6]  el0_svc_common+0xc0/0x24c
> > <4>[   40.191555][    C6]  el0_svc+0x28/0x88
> > <4>[   40.191560][    C6]  el0_sync_handler+0x8c/0xf0
> > <4>[   40.191566][    C6]  el0_sync+0x198/0x1c0
> > <6>[   40.191571][    C6] Call trace:
> > <6>[   40.191586][    C6]  rtnl_print_btrace+0xf0/0x124
> > <6>[   40.191595][    C6]  call_timer_fn+0x5c/0x3b4
> > <6>[   40.191602][    C6]  expire_timers+0xe0/0x49c
> > <6>[   40.191609][    C6]  __run_timers+0x34c/0x48c
> > <6>[   40.191616][    C6]  run_timer_softirq+0x28/0x58
> > <6>[   40.191621][    C6]  efi_header_end+0x168/0x690
> > <6>[   40.191628][    C6]  __irq_exit_rcu+0x108/0x124
> > <6>[   40.191635][    C6]  __handle_domain_irq+0x130/0x1b4
> > <6>[   40.191643][    C6]  gic_handle_irq.29882+0x6c/0x2d8
> > <6>[   40.191648][    C6]  el1_irq+0xdc/0x1c0
> > <6>[   40.191656][    C6]  __delay+0xc0/0x180
> > <6>[   40.191663][    C6]  devinet_ioctl+0x21c/0x75c
> > <6>[   40.191668][    C6]  inet_ioctl+0xb8/0x1f8
> > <6>[   40.191675][    C6]  sock_do_ioctl+0x70/0x2ac
> > <6>[   40.191682][    C6]  sock_ioctl+0x5dc/0xa74
> > <6>[   40.191688][    C6]  __arm64_sys_ioctl+0x178/0x1fc
> > <6>[   40.191694][    C6]  el0_svc_common+0xc0/0x24c
> > <6>[   40.191699][    C6]  el0_svc+0x28/0x88
> > <6>[   40.191705][    C6]  el0_sync_handler+0x8c/0xf0
> > <6>[   40.191710][    C6]  el0_sync+0x198/0x1c0
> > <6>[   40.191715][    C6] rtnetlink: -- rtnl_print_btrace end --
> >
> > <6>[   42.181879][ T2206] rtnetlink: rtnl_lock is held by [2206] from
> > [38181400013] to [42181875177]
> 

Best Regards
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
