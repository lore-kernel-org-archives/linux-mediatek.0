Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8E1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 08:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqHuC2d3910iVgE7RHiYpk2nqJOVmpAANbYss+4tS1k=; b=MA1a/C0fmZuONg
	qUQ0qT5IBQKaMvguZp9bTDpNgciIN3Q3FANcnoBjQzBwfROMNK80LvJvmWDeCk9H+EsytuRD/Up2f
	oFpST0mB207DbZ6f72xrbj1gG78UkInDEZY+K+gCWxVEsbixx971IRXt7rlmVY1l0xo0CAKcWuPjx
	H1Bgrv0dEj9ZGjnfKxVVa+FViCDOgJQ++AeIg7OsrDzoYdnxflZeahm0bvJsxXMlY+S9pthWW5J+T
	ZtAU4faRZbFdISn5retZjRHpfcMFZdoOvXxTfUsfP0oMARd6FVIjhHQTA0XK7/zxURCh4Z/nEvgo5
	t3qDOROevyIKUk7DhV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njGOD-00DELz-Ee; Tue, 26 Apr 2022 08:17:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njGNx-00DEF7-CJ; Tue, 26 Apr 2022 08:17:26 +0000
X-UUID: 109be9e724634deba8282feb1ff6e839-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4b929d51-65e1-49f5-b40d-be6e3e526162, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:716583c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,File:nil,QS:0,BEC:ni
 l
X-UUID: 109be9e724634deba8282feb1ff6e839-20220426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1127446249; Tue, 26 Apr 2022 01:17:16 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 01:17:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Apr 2022 16:17:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Apr 2022 16:17:06 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <mingo@redhat.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v3 1/2] tracing: Avoid adding tracer option before
 update_tracer_options
Date: Tue, 26 Apr 2022 16:17:06 +0800
Message-ID: <20220426081706.13274-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422174258.1f41777a@gandalf.local.home>
References: <20220422174258.1f41777a@gandalf.local.home>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_011725_463694_83C6C82D 
X-CRM114-Status: GOOD (  24.12  )
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

> > To prepare for support asynchronous tracer_init_tracefs initcall,
> > avoid calling create_trace_option_files before __update_tracer_options.
> > Otherwise, create_trace_option_files will show warning because
> > some tracers in trace_types list are already in tr->topts.
> > 
> > For example, hwlat_tracer call register_tracer in late_initcall,
> > and global_trace.dir is already created in tracing_init_dentry,
> > hwlat_tracer will be put into tr->topts.
> > Then if the __update_tracer_options is executed after hwlat_tracer
> > registered, create_trace_option_files find that hwlat_tracer is
> > already in tr->topts.
> > 
> > Link: https://lore.kernel.org/lkml/20220322133339.GA32582@xsang-OptiPlex-9020/
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> 
> Before this patch:
> 
>  # ls /sys/kernel/tracing/options
> annotate	   funcgraph-duration  hex		stacktrace
> bin		   funcgraph-irqs      irq-info		sym-addr
> blk_cgname	   funcgraph-overhead  latency-format	sym-offset
> blk_cgroup	   funcgraph-overrun   markers		sym-userobj
> blk_classic	   funcgraph-proc      overwrite	test_nop_accept
> block		   funcgraph-tail      pause-on-trace	test_nop_refuse
> context-info	   func-no-repeats     printk-msg-only	trace_printk
> disable_on_free    func_stack_trace    print-parent	userstacktrace
> display-graph	   function-fork       raw		verbose
> event-fork	   function-trace      record-cmd
> funcgraph-abstime  graph-time	       record-tgid
> funcgraph-cpu	   hash-ptr	       sleep-time
> 
> 
> After this patch:
> 
>  # ls /sys/kernel/tracing/options
> annotate      disable_on_free  irq-info         raw          trace_printk
> bin           display-graph    latency-format   record-cmd   userstacktrace
> blk_cgname    event-fork       markers          record-tgid  verbose
> blk_cgroup    function-fork    overwrite        stacktrace
> blk_classic   function-trace   pause-on-trace   sym-addr
> block         hash-ptr         printk-msg-only  sym-offset
> context-info  hex              print-parent     sym-userobj
> 
> Not good.

Calling __update_tracer_options() when tracer_options_updated=false have no
effect because it return directly in add_tracer_options().
I will fix it in v4 as you suggest in the below comment.

> 
> > ---
> >  kernel/trace/trace.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > index eb44418574f9..85ec758c4455 100644
> > --- a/kernel/trace/trace.c
> > +++ b/kernel/trace/trace.c
> > @@ -6317,12 +6317,18 @@ static void tracing_set_nop(struct trace_array *tr)
> >  	tr->current_trace = &nop_trace;
> >  }
> >  
> > +static bool tracer_options_updated;
> > +
> >  static void add_tracer_options(struct trace_array *tr, struct tracer *t)
> >  {
> >  	/* Only enable if the directory has been created already. */
> >  	if (!tr->dir)
> >  		return;
> >  
> > +	/* Only create trace option files after update_tracer_options finish */
> > +	if (!tracer_options_updated)
> > +		return;
> > +
> >  	create_trace_option_files(tr, t);
> >  }
> >  
> > @@ -9133,6 +9139,7 @@ static void update_tracer_options(struct trace_array *tr)
> >  {
> >  	mutex_lock(&trace_types_lock);
> >  	__update_tracer_options(tr);
> > +	tracer_options_updated = true;
> 
> I think you want to set this before the __update, as doing it after just
> makes the update a nop.

You are right.
I will update in v4, thanks!

> 
> -- Steve
> 
> 
> >  	mutex_unlock(&trace_types_lock);
> >  }
> >  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
