Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2037C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkVJXYM+zi6SjXLRqekD7iKK468PDnoArr5I8FHR5v8=; b=VegJ1n4YA2nDAA
	Ofg7n+X5h6k4OWuK/buYB6M98/gVV1bM94sDtGBXGTyc+mhSFDRyX+Dz7Cihvl52Iv3yHnGeflnUx
	aF8MpQ32IzJ1k3yd6X+jgs42jwSALh8VeON38f/bxyqGRanMx3M0jvRKUlbMNe9WhwdhCCDHIurn6
	KSjtqabUT6p/7QC+maakmHqDWKu0ZLc038pqmjHp/vDSMOPwx7KjhO6rAJ/X+FMqQWoFPGGs2c2Wh
	lXDOB0rRkXm6e3A3J/jWrlSqWG6GoATJ+8YcQNkV5iPZJNwm39OrmSnSqPz53OKZVLEul1vesnnMf
	QPoZ+u5TqpEBIm10E8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX1rz-00DtAs-5K; Wed, 23 Mar 2022 14:21:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX1rm-00Dt89-Cs; Wed, 23 Mar 2022 14:21:39 +0000
X-UUID: 3741ed3bdd6346d8a9ac8ce9d492186f-20220323
X-UUID: 3741ed3bdd6346d8a9ac8ce9d492186f-20220323
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 925210231; Wed, 23 Mar 2022 07:21:32 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 07:21:30 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 22:21:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Mar 2022 22:21:29 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <lkp@intel.com>, <lkp@lists.01.org>,
 <mark-pk.tsai@mediatek.com>, <matthias.bgg@gmail.com>, <mingo@redhat.com>,
 <oliver.sang@intel.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] tracing: Avoid adding duplicated tracer options when
 update_tracer_options is running in parallel
Date: Wed, 23 Mar 2022 22:21:29 +0800
Message-ID: <20220323142129.4175-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220323093021.4f541b40@gandalf.local.home>
References: <20220323093021.4f541b40@gandalf.local.home>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_072138_462980_2CF56B47 
X-CRM114-Status: GOOD (  23.30  )
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

> On Wed, 23 Mar 2022 11:24:42 +0800
> Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> 
> > When update_tracer_options is running in parallel,
> > tr->tops might be updated before the trace_types list traversal.
> > Let update_tracer_options traverse the trace_types list safely in
> > kernel init time and avoid the tr->tops update before it finish.
> 
> ??? Have you seen a bug here? I'm totally confused by this.

Sorry to make you confused.

After the below patch, update_tracer_options might be executed later than registering
hwlat_tracer, which is in late_initcall.

https://lore.kernel.org/lkml/20220316151639.9216-1-mark-pk.tsai@mediatek.com/

The init_hwlat_tracer initcall will put hwlat_tracer to tr->tops.
Then when the later arrived __update_tracer_options is trying to
update all the tracer options, create_trace_option_files show the
below warning because hwlat_tracer is already in the list.

[ 6.680068 ][ T7 ] WARNING: CPU: 0 PID: 7 at kernel/trace/trace.c:8899 create_trace_option_files (kernel/trace/trace.c:8899 (discriminator 1))

full log: https://lore.kernel.org/lkml/20220322133339.GA32582@xsang-OptiPlex-9020/


> 
> > 
> > Link: https://lore.kernel.org/lkml/20220322133339.GA32582@xsang-OptiPlex-9020/
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  kernel/trace/trace.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > index adb37e437a05..2974ae056068 100644
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
> 
> How is update_trace_options run in parallel?
> 
> There's a mutex that protects it. 
> 

Oh sorry.
What I trying to tell is that update_trace_options is run in parallel with
the initcall thread after:

https://lore.kernel.org/lkml/20220316151639.9216-1-mark-pk.tsai@mediatek.com/


> -- Steve
> 
> 
> >  	__update_tracer_options(tr);
> > +	tracer_options_updated = true;
> >  	mutex_unlock(&trace_types_lock);
> >  }
> >  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
