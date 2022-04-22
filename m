Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8454EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 21:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDmMUefa3tUME8o1o1ec9MShF7f942LCGYPNflVAllY=; b=UXGOktPyGp37mA
	lxhlHKrJ06iLZZlzDdLskktIfvArB0jyG8y0el3Dsyq4WF0/4IpdVqO4yNLZY/Lmp0VJyHcpHm08f
	MDR2bY2rKFP1A9ZaA6KUzo8kIirehsC+S884HSuOv5ipKuq6I6nMXN647bSO29vUrYwBwb/nsVTyQ
	0GaoYXyZfmYtSK1GZ6h2G+NgPPy8Sws1mhrGtvZ0mZj7oFdPK135EMfoR5pijadwDvESPmwY6DHHw
	ILq6g/z+QzqCkwqszJXIbNfuDMUfsT8oWIpZsapnVnKHbq9sl11BvMtgYGHT0E3RrOAEKJAE3iUKj
	AkXCFy1w0trFHy27q6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni13d-002bQ8-6r; Fri, 22 Apr 2022 21:43:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni13R-002bOn-5A; Fri, 22 Apr 2022 21:43:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A4DD9B83272;
 Fri, 22 Apr 2022 21:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78106C385AA;
 Fri, 22 Apr 2022 21:43:00 +0000 (UTC)
Date: Fri, 22 Apr 2022 17:42:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: <mingo@redhat.com>, <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v3 1/2] tracing: Avoid adding tracer option before
 update_tracer_options
Message-ID: <20220422174258.1f41777a@gandalf.local.home>
In-Reply-To: <20220323152257.7871-2-mark-pk.tsai@mediatek.com>
References: <20220323152257.7871-1-mark-pk.tsai@mediatek.com>
 <20220323152257.7871-2-mark-pk.tsai@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_144305_535192_31993D00 
X-CRM114-Status: GOOD (  21.72  )
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

On Wed, 23 Mar 2022 23:22:56 +0800
Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:

> To prepare for support asynchronous tracer_init_tracefs initcall,
> avoid calling create_trace_option_files before __update_tracer_options.
> Otherwise, create_trace_option_files will show warning because
> some tracers in trace_types list are already in tr->topts.
> 
> For example, hwlat_tracer call register_tracer in late_initcall,
> and global_trace.dir is already created in tracing_init_dentry,
> hwlat_tracer will be put into tr->topts.
> Then if the __update_tracer_options is executed after hwlat_tracer
> registered, create_trace_option_files find that hwlat_tracer is
> already in tr->topts.
> 
> Link: https://lore.kernel.org/lkml/20220322133339.GA32582@xsang-OptiPlex-9020/
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Before this patch:

 # ls /sys/kernel/tracing/options
annotate	   funcgraph-duration  hex		stacktrace
bin		   funcgraph-irqs      irq-info		sym-addr
blk_cgname	   funcgraph-overhead  latency-format	sym-offset
blk_cgroup	   funcgraph-overrun   markers		sym-userobj
blk_classic	   funcgraph-proc      overwrite	test_nop_accept
block		   funcgraph-tail      pause-on-trace	test_nop_refuse
context-info	   func-no-repeats     printk-msg-only	trace_printk
disable_on_free    func_stack_trace    print-parent	userstacktrace
display-graph	   function-fork       raw		verbose
event-fork	   function-trace      record-cmd
funcgraph-abstime  graph-time	       record-tgid
funcgraph-cpu	   hash-ptr	       sleep-time


After this patch:

 # ls /sys/kernel/tracing/options
annotate      disable_on_free  irq-info         raw          trace_printk
bin           display-graph    latency-format   record-cmd   userstacktrace
blk_cgname    event-fork       markers          record-tgid  verbose
blk_cgroup    function-fork    overwrite        stacktrace
blk_classic   function-trace   pause-on-trace   sym-addr
block         hash-ptr         printk-msg-only  sym-offset
context-info  hex              print-parent     sym-userobj

Not good.

> ---
>  kernel/trace/trace.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index eb44418574f9..85ec758c4455 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -6317,12 +6317,18 @@ static void tracing_set_nop(struct trace_array *tr)
>  	tr->current_trace = &nop_trace;
>  }
>  
> +static bool tracer_options_updated;
> +
>  static void add_tracer_options(struct trace_array *tr, struct tracer *t)
>  {
>  	/* Only enable if the directory has been created already. */
>  	if (!tr->dir)
>  		return;
>  
> +	/* Only create trace option files after update_tracer_options finish */
> +	if (!tracer_options_updated)
> +		return;
> +
>  	create_trace_option_files(tr, t);
>  }
>  
> @@ -9133,6 +9139,7 @@ static void update_tracer_options(struct trace_array *tr)
>  {
>  	mutex_lock(&trace_types_lock);
>  	__update_tracer_options(tr);
> +	tracer_options_updated = true;

I think you want to set this before the __update, as doing it after just
makes the update a nop.

-- Steve


>  	mutex_unlock(&trace_types_lock);
>  }
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
