Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34395C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 11:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qr9T/IEtSmvWBRgXQIAl5LnvBRelGg+4iW2oAymhrQ4=; b=Qqhw7uyjZAvJsj
	HmADIkcfLJmzdkAo6VcxIWruF9170Y+Z7X4xTFnGsWPwxCZ66kcELCn8kclKTggQ1UboDez5WIiF+
	sUIzlR9Fa+aVGPTvc/vSfES9JLWeuiITc+AGAc5k9+88Gxgtc7k6pkK+4kBrtvkjhCwukkIKd/g1i
	xqZRqLm7gmpQUfik68lLabKc67sdYZu78HnfkYk7Xh8RI1WZWVNVdMFsK02TPAm0UMzBin2zaVriE
	2r+IlczhSdW74CC60C4xLoItHiu/SH32ZkrzFDnie9tg2zEDxhDCvF5NIQMOTdQ6S/ttItlAtLtA+
	yjXCTXdV1GBhWq38KSdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTjLo-005Hq1-9E; Mon, 14 Mar 2022 11:59:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTjL4-005HSA-LR; Mon, 14 Mar 2022 11:58:16 +0000
X-UUID: 99cbe8f079194f53b89b7b2c779d70c2-20220314
X-UUID: 99cbe8f079194f53b89b7b2c779d70c2-20220314
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 21003918; Mon, 14 Mar 2022 04:57:52 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Mar 2022 04:47:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Mar 2022 19:47:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Mar 2022 19:47:49 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <mingo@redhat.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] tracing: make tracer_init_tracefs initcall asynchronous
Date: Mon, 14 Mar 2022 19:47:49 +0800
Message-ID: <20220314114749.28646-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220311113153.2d627800@gandalf.local.home>
References: <20220311113153.2d627800@gandalf.local.home>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_045814_762733_2F4F8B20 
X-CRM114-Status: GOOD (  36.56  )
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

> On Fri, 11 Mar 2022 19:26:56 +0800
> Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> 
> > tracer_init_tracefs() is slow especially when there are
> > lots of trace events.
> > Create a kthread to do tracer_init_tracefs() asynchronously
> 
> When making comments like this, please provide the benchmarks you used,
> with the numbers before and after.

I've retest it with kernel 5.17-rc7 on my arm64 board, and I found that
the critical path is trace_eval_sync which spend about 430 ms.
It's almost half of the time the do_initcalls spends.
Below is the test result.

			before		after
tracer_init_tracefs	29872 us	66 us
trace_eval_sync		429695 us	459370 us
do_initcalls		797818 us	799890 us

I locally skip trace_eval_sync and got below result.

			before		after		diff
do_initcalls		359252 us	341725 us	-17527 us

So beside this patch, could we add a kernel parameter or a
option to skip it when it doesn't used right after kernel boot?

> 
> > to speed up the initialization of kernel and move the
> > related functions and variables out of init section.
> 
> Thus we sacrifice memory for boot time. I'd like to also see how much
> memory is freed from init before and after this patch.
> 

Below is the INIT_TEXT and INIT_DATA diff:

		before	after	diff
INIT_TEXT	7F290	7EDAC	-0x4e4	bytes
INIT_DATA	116FE8	116FE8	0	bytes

And the init section is 64K aligned on arm64 so that when I test
on my platform, the actual memory freed by initmem_free() have no
diffrence after apply this patch.

#define SEGMENT_ALIGN SZ_64K

> > 
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  fs/tracefs/inode.c          |  8 ++++----
> >  kernel/trace/ftrace.c       | 12 ++++++------
> >  kernel/trace/trace.c        | 21 ++++++++++++++++-----
> >  kernel/trace/trace_events.c |  2 +-
> >  4 files changed, 27 insertions(+), 16 deletions(-)
> > 
> > diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
> > index de7252715b12..9a713d6bcb7e 100644
> > --- a/fs/tracefs/inode.c
> > +++ b/fs/tracefs/inode.c
> > @@ -561,10 +561,10 @@ struct dentry *tracefs_create_dir(const char *name, struct dentry *parent)
> >   *
> >   * Returns the dentry of the instances directory.
> >   */
> > -__init struct dentry *tracefs_create_instance_dir(const char *name,
> > -					  struct dentry *parent,
> > -					  int (*mkdir)(const char *name),
> > -					  int (*rmdir)(const char *name))
> > +struct dentry *tracefs_create_instance_dir(const char *name,
> > +					   struct dentry *parent,
> > +					   int (*mkdir)(const char *name),
> > +					   int (*rmdir)(const char *name))
> >  {
> >  	struct dentry *dentry;
> >  
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index a4b462b6f944..197630cbd5dd 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -940,7 +940,7 @@ static const struct file_operations ftrace_profile_fops = {
> >  };
> >  
> >  /* used to initialize the real stat files */
> > -static struct tracer_stat function_stats __initdata = {
> > +static struct tracer_stat function_stats = {
> >  	.name		= "functions",
> >  	.stat_start	= function_stat_start,
> >  	.stat_next	= function_stat_next,
> > @@ -949,7 +949,7 @@ static struct tracer_stat function_stats __initdata = {
> >  	.stat_show	= function_stat_show
> >  };
> >  
> > -static __init void ftrace_profile_tracefs(struct dentry *d_tracer)
> > +static void ftrace_profile_tracefs(struct dentry *d_tracer)
> >  {
> >  	struct ftrace_profile_stat *stat;
> >  	struct dentry *entry;
> > @@ -991,7 +991,7 @@ static __init void ftrace_profile_tracefs(struct dentry *d_tracer)
> >  }
> >  
> >  #else /* CONFIG_FUNCTION_PROFILER */
> > -static __init void ftrace_profile_tracefs(struct dentry *d_tracer)
> > +static void ftrace_profile_tracefs(struct dentry *d_tracer)
> >  {
> >  }
> >  #endif /* CONFIG_FUNCTION_PROFILER */
> > @@ -6359,7 +6359,7 @@ void ftrace_destroy_filter_files(struct ftrace_ops *ops)
> >  	mutex_unlock(&ftrace_lock);
> >  }
> >  
> > -static __init int ftrace_init_dyn_tracefs(struct dentry *d_tracer)
> > +static int ftrace_init_dyn_tracefs(struct dentry *d_tracer)
> >  {
> >  
> >  	trace_create_file("available_filter_functions", TRACE_MODE_READ,
> > @@ -7754,8 +7754,8 @@ void ftrace_init_tracefs(struct trace_array *tr, struct dentry *d_tracer)
> >  			  d_tracer, tr, &ftrace_no_pid_fops);
> >  }
> >  
> > -void __init ftrace_init_tracefs_toplevel(struct trace_array *tr,
> > -					 struct dentry *d_tracer)
> > +void ftrace_init_tracefs_toplevel(struct trace_array *tr,
> > +				  struct dentry *d_tracer)
> >  {
> >  	/* Only the top level directory has the dyn_tracefs and profile */
> >  	WARN_ON(!(tr->flags & TRACE_ARRAY_FL_GLOBAL));
> > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > index eb44418574f9..f55da82060e2 100644
> > --- a/kernel/trace/trace.c
> > +++ b/kernel/trace/trace.c
> > @@ -9562,10 +9562,10 @@ int tracing_init_dentry(void)
> >  extern struct trace_eval_map *__start_ftrace_eval_maps[];
> >  extern struct trace_eval_map *__stop_ftrace_eval_maps[];
> >  
> > -static struct workqueue_struct *eval_map_wq __initdata;
> > -static struct work_struct eval_map_work __initdata;
> > +static struct workqueue_struct *eval_map_wq;
> > +static struct work_struct eval_map_work;
> >  
> > -static void __init eval_map_work_func(struct work_struct *work)
> > +static void eval_map_work_func(struct work_struct *work)
> >  {
> >  	int len;
> >  
> > @@ -9573,7 +9573,7 @@ static void __init eval_map_work_func(struct work_struct *work)
> >  	trace_insert_eval_map(NULL, __start_ftrace_eval_maps, len);
> >  }
> >  
> > -static int __init trace_eval_init(void)
> > +static int trace_eval_init(void)
> >  {
> >  	INIT_WORK(&eval_map_work, eval_map_work_func);
> >  
> > @@ -9671,7 +9671,7 @@ static struct notifier_block trace_module_nb = {
> >  };
> >  #endif /* CONFIG_MODULES */
> >  
> > -static __init int tracer_init_tracefs(void)
> > +static int tracefs_init(void *data)
> >  {
> >  	int ret;
> >  
> > @@ -9721,6 +9721,17 @@ static __init int tracer_init_tracefs(void)
> >  	return 0;
> >  }
> >  
> > +static __init int tracer_init_tracefs(void)
> > +{
> > +	struct task_struct *thread;
> > +
> > +	thread = kthread_run(tracefs_init, NULL, "tracefs_init");
> > +	if (IS_ERR(thread))
> > +		return PTR_ERR(thread);
> > +
> > +	return 0;
> > +}
> > +
> >  fs_initcall(tracer_init_tracefs);
> >  
> >  static int trace_panic_handler(struct notifier_block *this,
> > diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
> > index 3147614c1812..fe055bef1e8f 100644
> > --- a/kernel/trace/trace_events.c
> > +++ b/kernel/trace/trace_events.c
> > @@ -3687,7 +3687,7 @@ static __init int event_trace_init_fields(void)
> >  	return 0;
> >  }
> >  
> > -__init int event_trace_init(void)
> > +int event_trace_init(void)
> >  {
> >  	struct trace_array *tr;
> >  	struct dentry *entry;
> 
> Hmm, this calls early_event_tracer() which is also in __init. Looks like
> there's going to be a ripple effect due to this change.
> 
> If we want to go this route, then first a change must be made to remove the
> needed functions from init, and then see if we can consolidate it. As there
> are some init functions that are duplicated for init purposes.

Got it!

> 
> -- Steve


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
