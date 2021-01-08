Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53EAC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 12:56:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E16FE23770
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 12:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E16FE23770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WO7MIXJ3JXsz9Z/U7sKcpVMfGEYFZqLpLy82hZ3hnKk=; b=B+DQXZ68Z100ENH/g5xpWruvy
	Td7mHY6wPkfRHpITC9u8GpUGZXnHaIsX7FEgoiV1blzYcOkPdOhvac1dFdGda3NfdKsQEYaljBItK
	Q3MP2qmLcmr4GmUyw1KwWXQIWa+yd6035LkBlwyCtV/qCf2NEhKGkIHlhHkBtH+GfeGuICUy26T75
	mJfCaoTnv9i8xc77EpWwCcKIfoK4GJ43PzXqBGlsR59XHVGhU0TWB3bJaMHRYzK7fVGD+xBskKfHc
	dohsj+8j0SfV6U78oBdS8wJeSsQYcCWX7RdWx2yG8V7lnE87sc0Ddvcb8uV/43b7AbQDVpzpodaM4
	PHF1IPJJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxrIr-0003Do-Id; Fri, 08 Jan 2021 12:55:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxrIn-0003Ar-OP; Fri, 08 Jan 2021 12:55:39 +0000
X-UUID: f3bd684b84dd4b219a321441dd1a0225-20210108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kUg0ZzySdmtzjiTuob1lGZS9ymttw87zYEphZgyDmcE=; 
 b=VSFnPkHhnrchPUyFFpZcX5oJBQBDrwyPwPMflfsNTuq2X9c3opCB8S08+4cNLWGdMvf0q238m9kw1WAXsAww3hXW+370b4GJVsMBvht4ouCUElnAX/I3FmfQDARkdUmmQ6FFTsXjjGOQbpZpwlRw9aNHuARrWJ5Fgy4m16bBUOo=;
X-UUID: f3bd684b84dd4b219a321441dd1a0225-20210108
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 309406692; Fri, 08 Jan 2021 04:55:31 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Jan 2021 04:55:29 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Jan 2021 20:55:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Jan 2021 20:55:27 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <sumit.garg@linaro.org>
Subject: Re: [PATCH v2] arm64: perf: Fix access percpu variables in
 preemptible context
Date: Fri, 8 Jan 2021 20:55:27 +0800
Message-ID: <20210108125527.14175-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAFA6WYNepUP=SeHWnDDbxx=ggwPq2jDd5JmrcXD5GoMC5dYH2g@mail.gmail.com>
References: <CAFA6WYNepUP=SeHWnDDbxx=ggwPq2jDd5JmrcXD5GoMC5dYH2g@mail.gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F980DBE543524F6AD1695F19CA3150DE4755680F32B8DE46EE87E0314CCD295D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_075538_542102_D9CF5C47 
X-CRM114-Status: GOOD (  23.56  )
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
Cc: mark.rutland@arm.com, lecopzer.chen@mediatek.com, will@kernel.org,
 alexander.shishkin@linux.intel.com, catalin.marinas@arm.com,
 yj.chiang@mediatek.com, alexandru.elisei@arm.com, linux-kernel@vger.kernel.org,
 acme@kernel.org, oliver.sang@intel.com, peterz@infradead.org, mingo@redhat.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 namhyung@kernel.org, jolsa@redhat.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sumit,
 
Thanks for your reply.
 
> On Mon, 21 Dec 2020 at 21:53, Lecopzer Chen <lecopzer.chen@mediatek.com> wrote:
> >
> > commit 367c820ef08082 ("arm64: Enable perf events based hard lockup detector")
> > reinitilizes lockup detector after arm64 PMU is initialized and open
> > a window for accessing smp_processor_id() in preemptible context.
> > Since hardlockup_detector_perf_init() always called in init stage
> > with a single cpu, but we initialize lockup detector after the init task
> > is migratable.
> >
> > Fix this by utilizing lockup detector reconfiguration which calls
> > softlockup_start_all() on each cpu and calls watatchdog_nmi_enable() later.
> > Because softlockup_start_all() use IPI call function to make sure
> > watatchdog_nmi_enable() will bind on each cpu and fix this issue.
> 
> IMO, this just creates unnecessary dependency for hardlockup detector
> init via softlockup detector (see the alternative definition of
> lockup_detector_reconfigure()).


The arm64/Kconfig select HAVE_HARDLOCKUP_DETECTOR_PERF if we have NMI:
	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI

And in lib/Kconfig.debug HARDLOCKUP_DETECTOR select SOFTLOCKUP_DETECTOR automatically.
	config HARDLOCKUP_DETECTOR_PERF
		bool
		select SOFTLOCKUP_DETECTOR

So we don't need to explicitly select softlockup.
And actually this patch is not a perfect solution like you said
(hardlockup depends on softlockup),
but the key point is that lockup_detector_init() seems only design for
using in early init stage and not for calling in later deffered initial process.


> 
> >
> >     BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> 
> How about just the below fix in order to make CONFIG_DEBUG_PREEMPT happy?
> 
> diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
> index 247bf0b1582c..db06ee28f48e 100644
> --- a/kernel/watchdog_hld.c
> +++ b/kernel/watchdog_hld.c
> @@ -165,7 +165,7 @@ static void watchdog_overflow_callback(struct
> perf_event *event,
> 
>  static int hardlockup_detector_event_create(void)
>  {
> -       unsigned int cpu = smp_processor_id();
> +       unsigned int cpu = raw_smp_processor_id();
>         struct perf_event_attr *wd_attr;
>         struct perf_event *evt;
> 

This won't solve the issue that arm64 called this in preemptible context,
I was trying to find a balance that can pass CONFIG_DEBUG_PREEMPT and
calling lockup_detector_init() in non-preemptive context.

watchdog_nmi_probe() and the following hardlockup_detector_event_create use
this_cpu_read/write, thus the topic of solution is better to be
'how to call lockup_detector_init() in preemptive context'

we can't just use preempt_disable/enable between lockup_detector_init() because
the call tree inside it will use kamlloc() with GFP_KERNEL which would check by might_sleep()


The v2 is now what I can find to solve this and the smallest change.
But the drawback, again, is hardlockup depends on softlockup.

The other solution may be executed lockup_detector_init in a binded thread
which only bind to one cpu.


BRs,
Lecopzer


> -Sumit
> 
> >     caller is debug_smp_processor_id+0x20/0x2c
> >     CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.10.0+ #276
> >     Hardware name: linux,dummy-virt (DT)
> >     Call trace:
> >       dump_backtrace+0x0/0x3c0
> >       show_stack+0x20/0x6c
> >       dump_stack+0x2f0/0x42c
> >       check_preemption_disabled+0x1cc/0x1dc
> >       debug_smp_processor_id+0x20/0x2c
> >       hardlockup_detector_event_create+0x34/0x18c
> >       hardlockup_detector_perf_init+0x2c/0x134
> >       watchdog_nmi_probe+0x18/0x24
> >       lockup_detector_init+0x44/0xa8
> >       armv8_pmu_driver_init+0x54/0x78
> >       do_one_initcall+0x184/0x43c
> >       kernel_init_freeable+0x368/0x380
> >       kernel_init+0x1c/0x1cc
> >       ret_from_fork+0x10/0x30
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
