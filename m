Return-Path: <SRS0=aHEw=KD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D627C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 May 2021 09:06:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBD32611ED
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 May 2021 09:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBD32611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fbTuOcndqxdQ5QAD9ySdbtClitWsrNUtXy7b3Osnn6E=; b=fe+AFak6fjp6J/ZJKc2VqBfTO
	KFGE3XLOg1OHXGgzLqcTI30jkGrfvVcJGZ38PrGyOPyyus1jYt13C1eHjJTuDoaFCfYzm8HJN0CoW
	DWuscj+sS7h84+VfEMicaszWBerAi7abQMtSRd1FxRMtePGRN8hwQnLTBqKmu1Tf/UOjWAi/DZkAw
	QB8GkX4J5zS02Oc0s9jkR0y8bJ2dETL9QbCG+sDxSWJ+J8Cj65m6pDv1DRSm6BohZZC4K2+AJSRG6
	O0o67qyBF61CGKYjYc38D01zBZMWfY8iLLGmIFhOSJAPCQ61RUcIp+FiMWRdE+YIjr9kSA0wkISZO
	0GeuQgNvw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfIuu-009CNk-U4; Sat, 08 May 2021 09:06:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfIus-009CNb-2E; Sat, 08 May 2021 09:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=ThqJf39aKXx+UzwVFKsb5ZTUf0AwJR+IhNPiPfgedsE=; b=iXm2g+oXBB7x/EVUV2v/uVWM0I
 YyC4KvyxhmEGTx3GNd8EgKBNqoJdlS1YBes4kIQsbDFZ6rVzq0RbOjJOXPlRdDi3gV60KUef/IxkE
 DuMCunQ9dwupehcn5olngClr0iGScDU3wGM3lMVGSR3E7WGaEHA9MVcNVPpJMr2+RSC2pSI222woa
 A/CWgMm4l6SRpl73CWz+jBtC7rAB8msZkUja9iwTWeZqDXpgV5P1FD2tnkVqsyNkTU+sT/0A7JecE
 dZH0ekmWvQ0HB2C0w1WEltahl7sPAyx2U3l8M3zJ7QxpLxqm46dHGGS2CrS0Ra4vunjCzA8ZVAVd+
 K7mserJA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfIum-007S8j-KI; Sat, 08 May 2021 09:06:27 +0000
X-UUID: a578c1460a6b4bffa6217c66cb1f5142-20210508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ThqJf39aKXx+UzwVFKsb5ZTUf0AwJR+IhNPiPfgedsE=; 
 b=cW563wWY9ICnfGb72VrBC28Ldq1dMl+4wLP5mfT3GCW6HSk4wUFKZbwBfcgq15KUBu4rAHRL5aagy04vOQFunpYCPjG/kKx7gaqKJH8xTJHHSbeJaTxtHOM1fM0vCu4dJ44kWoWL5wT72eCm2oGVcsmal1pUjapmf9SXpvSR7BQ=;
X-UUID: a578c1460a6b4bffa6217c66cb1f5142-20210508
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 202464844; Sat, 08 May 2021 02:06:19 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 May 2021 02:06:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 8 May 2021 17:06:03 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 8 May 2021 17:06:01 +0800
Message-ID: <1620464012.29475.76.camel@mbjsdccf07>
Subject: Re: [PATCH] rtnetlink: add rtnl_lock debug log
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
Date: Sat, 8 May 2021 16:53:32 +0800
In-Reply-To: <CAHp75Vc=GMv5dJ1dJYr=B3W6c+nuPCfXa4wxLJOYPTuqrMskFg@mail.gmail.com>
References: <20210429070237.3012-1-rocco.yue@mediatek.com>
 <CAHp75Vc=GMv5dJ1dJYr=B3W6c+nuPCfXa4wxLJOYPTuqrMskFg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210508_020626_111517_9014C8C1 
X-CRM114-Status: GOOD (  29.58  )
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

> > We often encounter system hangs caused by certain processes
> > holding rtnl_lock for a long time. Even if there is a lock
> > detection mechanism in Linux, it is a bit troublesome and
> > affects the system performance. We hope to add a lightweight
> > debugging mechanism for detecting rtnl_lock.
> >
> > Up to now, we have discovered and solved some potential bugs
> > through such debug information of this lightweight rtnl_lock,
> > which is helpful for us.
> >
> > When you say Y for RTNL_LOCK_DEBUG, then the kernel will detect
> > if any function hold rtnl_lock too long and some key information
> > will be printed to help identify the issue point.
> >
> > i.e: from the following logs, we can clear know that the pid=5546
> 
> clearly
> 
> > RfxSender_4 process hold rtnl_lock for a long time, causing the
> 
> holds
> 
> > system hang. And we can also speculate that the delay operation
> 
> to hang
> 

Thanks for your review, Andy.

I Will fix them.

> > may be performed in devinet_ioctl(), resulting in rtnl_lock was
> > not released in time.
> >
> > <6>[  141.151364] ----------- rtnl_print_btrace start -----------
> 
> Can you, please, shrink this to the point?
> 

Will shrink these points.

> > <6>[  141.152079] RfxSender_4[5546][R] hold rtnl_lock more than 2 sec,
> > start time: 139129481562
> > <4>[  141.153114]  rtnl_lock+0x88/0xfc
> > <4>[  141.153523]  devinet_ioctl+0x190/0x1268
> > <4>[  141.154007]  inet_ioctl+0x108/0x1f4
> > <4>[  141.154449]  sock_do_ioctl+0x88/0x200
> > <4>[  141.154911]  sock_ioctl+0x4b0/0x884
> > <4>[  141.155367]  do_vfs_ioctl+0x6b0/0xcc4
> > <4>[  141.155830]  __arm64_sys_ioctl+0xc0/0xec
> > <4>[  141.156326]  el0_svc_common+0x130/0x2c0
> > <4>[  141.156810]  el0_svc_handler+0xd0/0xe0
> > <4>[  141.157283]  el0_svc+0x8/0xc
> > <4>[  141.157646] Call trace:
> > <4>[  141.157956]  dump_backtrace+0x0/0x240
> > <4>[  141.158418]  show_stack+0x18/0x24
> > <4>[  141.158836]  rtnl_print_btrace+0x138/0x1cc
> > <4>[  141.159362]  call_timer_fn+0x120/0x47c
> > <4>[  141.159834]  expire_timers+0x28c/0x420
> > <4>[  141.160306]  __run_timers+0x3d0/0x494
> > <4>[  141.160768]  run_timer_softirq+0x24/0x48
> > <4>[  141.161262]  __do_softirq+0x26c/0x968
> > <4>[  141.161725]  irq_exit+0x1f8/0x2b4
> > <4>[  141.162145]  __handle_domain_irq+0xdc/0x15c
> > <4>[  141.162672]  gic_handle_irq+0xe4/0x188
> > <4>[  141.163144]  el1_irq+0x104/0x200
> > <4>[  141.163559]  __const_udelay+0x118/0x1b0
> > <4>[  141.164044]  devinet_ioctl+0x1a0/0x1268
> > <4>[  141.164527]  inet_ioctl+0x108/0x1f4
> > <4>[  141.164968]  sock_do_ioctl+0x88/0x200
> > <4>[  141.165428]  sock_ioctl+0x4b0/0x884
> > <4>[  141.165868]  do_vfs_ioctl+0x6b0/0xcc4
> > <4>[  141.166330]  __arm64_sys_ioctl+0xc0/0xec
> > <4>[  141.166825]  el0_svc_common+0x130/0x2c0
> > <4>[  141.167308]  el0_svc_handler+0xd0/0xe0
> > <4>[  141.167786]  el0_svc+0x8/0xc
> > <6>[  141.168153] ------------ rtnl_print_btrace end -----------
> >
> > <6>[  147.321389] rtnl_lock is held by [5546] from
> > [139129481562] to [147321378812]
> 
> 
> ...
> 
> > +static struct rtnl_debug_btrace_t rtnl_instance = {
> > +       .task           = NULL,
> > +       .pid            = 0,
> > +       .start_time     = 0,
> > +       .end_time       = 0,
> > +       .nr_entries     = 0,
> 
> static assumes all 0:s, what's the point?
> 

will fix it in the patch v2.

> > +};
> 
> ...
> 
> > +static void rtnl_print_btrace(struct timer_list *unused)
> > +{
> > +       pr_info("----------- %s start -----------\n", __func__);
> > +       pr_info("%s[%d][%c] hold rtnl_lock more than 2 sec, start time: %llu\n",
> > +               rtnl_instance.task->comm,
> > +               rtnl_instance.pid,
> > +               task_state_to_char(rtnl_instance.task),
> > +               rtnl_instance.start_time);
> > +       stack_trace_print(rtnl_instance.addrs, rtnl_instance.nr_entries, 0);
> 
> > +       show_stack(rtnl_instance.task, NULL, KERN_DEBUG);
> 
> Unaligned debug level.
> 

KERN_INFO is expected, I will fix it in patch v2.

> > +       pr_info("------------ %s end -----------\n", __func__);
> 
> Looking into tons of these, perhaps you need to define pr_fmt(). I
> haven't checked if it's already defined, though.
> 

In the files related rtnetlink, pr_fmt() is not defined. I am not sure
if I can define one since there are other error logs in the rtnetlink.c.

In addition, there is "rtnl_lock" field in the log, I usually use it to
retrieve whether rtnl_lock is held for a long time.

If adding pr_fmt() is better, it is ok to me :-)

> > +}
> 
> ...
> 
> > +       if (rtnl_instance.end_time - rtnl_instance.start_time > 2000000000ULL) {
> 
> Perhaps you should use one of the defined constants from time64.h ?
> 

Will have a separate patch for this.

> > +               pr_info("rtnl_lock is held by [%d] from [%llu] to [%llu]\n",
> > +                       rtnl_instance.pid,
> > +                       rtnl_instance.start_time,
> > +                       rtnl_instance.end_time);
> > +       }
> 

Best Regard
Rocco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
