Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCG1oAOhK0j9Zzu47AuK/BKOclhYGMLcb8sgRXy0lmQ=; b=MCujsrKorwFV+K
	rsU9WBxLeHDMW9cMEGG4jkmfDeLuHP+a5cL068yz3HNuZ0SAGczT1rSsJs1uwSHISYReg6jbnQVth
	6O2otNpY/N201jh5XseCYOuQHdCKCu8LR5GAO+1ZctdiwmqLIBJOUhxTAUmO0pqcANuuJ8216WAVs
	swy4wBKfv/nskiGh7z44nfWZWhF56BHbRmlm7wzixCQwjLcpLvUOcrpK2baaggDBa6Xlwy9eTrYFi
	e72LSfBLJn1n6FrMfoZL6nW2ZmOAZgOP5qZ6ks/foQZCVyMIMsFBWxH9QPOw9uONsl3ZfEecd9Let
	XJcTyw5PrAhp/3FFC9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUW3O-00DgKh-AP; Wed, 16 Mar 2022 15:59:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUW2i-00Dg6V-0k; Wed, 16 Mar 2022 15:58:34 +0000
X-UUID: 1ac1ba9e6ad143028be7d0dd8d9e9fd2-20220316
X-UUID: 1ac1ba9e6ad143028be7d0dd8d9e9fd2-20220316
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 742645514; Wed, 16 Mar 2022 08:58:26 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 08:58:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Mar 2022 23:58:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 23:58:16 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mark-pk.tsai@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mingo@redhat.com>, <rostedt@goodmis.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] tracing: make tracer_init_tracefs initcall asynchronous
Date: Wed, 16 Mar 2022 23:58:16 +0800
Message-ID: <20220316155816.1094-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220314114749.28646-1-mark-pk.tsai@mediatek.com>
References: <20220314114749.28646-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_085832_089565_A6096EFE 
X-CRM114-Status: GOOD (  32.35  )
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

> > On Fri, 11 Mar 2022 19:26:56 +0800
> > Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > 
> > > tracer_init_tracefs() is slow especially when there are
> > > lots of trace events.
> > > Create a kthread to do tracer_init_tracefs() asynchronously
> > 
> > When making comments like this, please provide the benchmarks you used,
> > with the numbers before and after.
> 
> I've retest it with kernel 5.17-rc7 on my arm64 board, and I found that
> the critical path is trace_eval_sync which spend about 430 ms.
> It's almost half of the time the do_initcalls spends.
> Below is the test result.
> 
> 			before		after
> tracer_init_tracefs	29872 us	66 us
> trace_eval_sync		429695 us	459370 us
> do_initcalls		797818 us	799890 us
> 
> I locally skip trace_eval_sync and got below result.
> 
> 			before		after		diff
> do_initcalls		359252 us	341725 us	-17527 us
> 
> So beside this patch, could we add a kernel parameter or a
> option to skip it when it doesn't used right after kernel boot?
> 

Please ignore this.
I do more tests and found that ftrace_eval_maps is in INIT_DATA.
So the eval_wq may crash if it doesn't finish before init mem
is freed.
And ftrace_eval_maps is big when there are lots of trace event
(About 6KB with arch/arm64/defconfig).
So it seems not a good idea to remove all the needed funcs from init.

So please review v2 [1] I've just push which queue the tracer_init_tracefs()
to eval_map_wq.

[1]: https://lore.kernel.org/lkml/20220316151639.9216-1-mark-pk.tsai@mediatek.com/

> > 
> > > to speed up the initialization of kernel and move the
> > > related functions and variables out of init section.
> > 
> > Thus we sacrifice memory for boot time. I'd like to also see how much
> > memory is freed from init before and after this patch.
> > 
> 
> Below is the INIT_TEXT and INIT_DATA diff:
> 
> 		before	after	diff
> INIT_TEXT	7F290	7EDAC	-0x4e4	bytes
> INIT_DATA	116FE8	116FE8	0	bytes
> 
> And the init section is 64K aligned on arm64 so that when I test
> on my platform, the actual memory freed by initmem_free() have no
> diffrence after apply this patch.
> 
> #define SEGMENT_ALIGN SZ_64K
> 
> > >  
> > >  static int trace_panic_handler(struct notifier_block *this,
> > > diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
> > > index 3147614c1812..fe055bef1e8f 100644
> > > --- a/kernel/trace/trace_events.c
> > > +++ b/kernel/trace/trace_events.c
> > > @@ -3687,7 +3687,7 @@ static __init int event_trace_init_fields(void)
> > >  	return 0;
> > >  }
> > >  
> > > -__init int event_trace_init(void)
> > > +int event_trace_init(void)
> > >  {
> > >  	struct trace_array *tr;
> > >  	struct dentry *entry;
> > 
> > Hmm, this calls early_event_tracer() which is also in __init. Looks like
> > there's going to be a ripple effect due to this change.
> > 
> > If we want to go this route, then first a change must be made to remove the
> > needed functions from init, and then see if we can consolidate it. As there
> > are some init functions that are duplicated for init purposes.
> 
> Got it!
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
