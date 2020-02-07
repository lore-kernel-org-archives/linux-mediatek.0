Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A268C35247
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 03:18:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D0E4222C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 03:18:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FgVL5i3T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="njryT19l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D0E4222C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAJYRaGNYtvAH1rDCMaTbq2D1J4NqK6GNF7NzsV4AFQ=; b=FgVL5i3T1I32pZ
	HgmwJRy0/HNbXhpyeoWy0J5DsbsLPEcg+AYR8i4oYXnByngX6Rcu8DpfUfwsBMC+jYjgq7DWqkg2k
	4KgTbgWvsPrUFbce/y+Uw1HLEPiEjNdo6cNTvBxtBESLQJDru8HrVzbXppu1LsvZCrKSCo5OxjAVd
	j4GtZKBCIZVEh9nEz6EYgvfgdVQQ7rwFBOkMLoQ0HcV5g8LnMl35lljEjR9/Hwe+w+V8hQZwzorMI
	Rpx2mC/+JMXr2YKdCJRsclxCOkqg9eaMaJgp922+EKpPqydJH189WdO0q4szn+OQvqGBOpwzab6fo
	DIfdH1tT8ZwVW10N+FQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izu9c-00080y-VX; Fri, 07 Feb 2020 03:18:04 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izu9Z-0007zo-Qb
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 03:18:03 +0000
Received: by mail-qv1-xf43.google.com with SMTP id y8so336339qvk.6
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2020 19:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9YF6ecQRqIE8t6EFOJ14Q98ubnBBnPGkQjHTJTEVnLM=;
 b=njryT19l+gNefzd/NtXJh2y7d4uVNDu2lGxqqrFj+5JRr/tMid/zGMYHMMFWp9vnUJ
 sdPb0nZMzZeo/+BtndY/5T4deVJdCq+o8ZLBszI5Hf895CV5HaoiZ+CdadpbTrW4PFwy
 8DxTjtnuVeSiS5BUkek/ESIwaGuF8VFCvwCIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9YF6ecQRqIE8t6EFOJ14Q98ubnBBnPGkQjHTJTEVnLM=;
 b=LPYs+gs2v5cQWiWHC+OGQMA2oH6p3EdesgL0X7WdhIORk0+ByP6zv3S+bNi7WBEVQ/
 EyXObyTvXSMR181swB1s2SU6JIQHQsOcCzU5O09MlynhnfljMpwaaJ636Qhf4ZYnVnOy
 EbKLDlKjlT+k6T3pX5QicZlRn+mddEdkcy/4+vRl8aK8fFptB5SHJKo9z1cOb5t/qZ9J
 WxhpoveuIGnKgx1ivNa+lrEF9Ilq7/g+YBNMrjz+SgP+qlhabGT7BA0Ensu/glh9GS6p
 FVHy1DJa/z8HRL19CcSl/BsiYsJKwPJLrmnYtbE1nLWrShK3em97hPZwOqtvc7DCb2FH
 SPcA==
X-Gm-Message-State: APjAAAUkmbtjc8LkiGUxlq3dMX8L344aIzeZkor0eU8yZmPgvxCHWRaq
 6w0zrMtKQ4Rw2QajFcUejORbOw==
X-Google-Smtp-Source: APXvYqwu46t0zjq5HVDEfaBuzKZbvsLDcdjKLvXTD1BwARDAOpYzs6XAsiSOqT4HXC7C/VWXZEQ6sw==
X-Received: by 2002:ad4:496f:: with SMTP id p15mr5003458qvy.191.1581045480294; 
 Thu, 06 Feb 2020 19:18:00 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id c8sm723458qtp.13.2020.02.06.19.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 19:17:59 -0800 (PST)
Date: Thu, 6 Feb 2020 22:17:59 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Frankie Chang <Frankie.Chang@mediatek.com>
Subject: Re: [PATCH v1 1/1] binder: transaction latency tracking for user build
Message-ID: <20200207031759.GA121785@google.com>
References: <1580885572-14272-1-git-send-email-Frankie.Chang@mediatek.com>
 <20200205093612.GA1167956@kroah.com>
 <20200205154943.GE142103@google.com>
 <1581045023.22229.46.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1581045023.22229.46.camel@mtkswgap22>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_191801_866533_275F52E8 
X-CRM114-Status: GOOD (  26.75  )
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
Cc: Todd Kjos <tkjos@android.com>, wsd_upstream@mediatek.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Jian-Min.Liu@mediatek.com, linux-mediatek@lists.infradead.org,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 07, 2020 at 11:10:23AM +0800, Frankie Chang wrote:
> On Wed, 2020-02-05 at 10:49 -0500, Joel Fernandes wrote:
> > On Wed, Feb 05, 2020 at 09:36:12AM +0000, Greg Kroah-Hartman wrote:
> > > On Wed, Feb 05, 2020 at 02:52:52PM +0800, Frankie Chang wrote:
> > > > Record start/end timestamp to binder transaction.
> > > > When transaction is completed or transaction is free,
> > > > it would be checked if transaction latency over threshold (2 sec),
> > > > if yes, printing related information for tracing.
> > > > 
> > > > Signed-off-by: Frankie Chang <Frankie.Chang@mediatek.com>
> > > > ---
> > > >  drivers/android/Kconfig           |    8 +++
> > > >  drivers/android/binder.c          |  107 +++++++++++++++++++++++++++++++++++++
> > > >  drivers/android/binder_internal.h |    4 ++
> > > >  3 files changed, 119 insertions(+)
> > > > 
> > > > diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> > > > index 6fdf2ab..7ba80eb 100644
> > > > --- a/drivers/android/Kconfig
> > > > +++ b/drivers/android/Kconfig
> > > > @@ -54,6 +54,14 @@ config ANDROID_BINDER_IPC_SELFTEST
> > > >  	  exhaustively with combinations of various buffer sizes and
> > > >  	  alignments.
> > > >  
> > > > +config BINDER_USER_TRACKING
> > > > +	bool "Android Binder transaction tracking"
> > > > +	help
> > > > +	  Used for track abnormal binder transaction which is over 2 seconds,
> > > > +	  when the transaction is done or be free, this transaction would be
> > > > +	  checked whether it executed overtime.
> > > > +	  If yes, printing out the detail info about it.
> > > > +
> > > >  endif # if ANDROID
> > > >  
> > > >  endmenu
> > > > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > > > index e9bc9fc..5a352ee 100644
> > > > --- a/drivers/android/binder.c
> > > > +++ b/drivers/android/binder.c
> > > > @@ -76,6 +76,11 @@
> > > >  #include "binder_internal.h"
> > > >  #include "binder_trace.h"
> > > >  
> > > > +#ifdef CONFIG_BINDER_USER_TRACKING
> > > > +#include <linux/rtc.h>
> > > > +#include <linux/time.h>
> > > > +#endif
> > > > +
> > > >  static HLIST_HEAD(binder_deferred_list);
> > > >  static DEFINE_MUTEX(binder_deferred_lock);
> > > >  
> > > > @@ -591,8 +596,104 @@ struct binder_transaction {
> > > >  	 * during thread teardown
> > > >  	 */
> > > >  	spinlock_t lock;
> > > > +#ifdef CONFIG_BINDER_USER_TRACKING
> > > > +	struct timespec timestamp;
> > > > +	struct timeval tv;
> > > > +#endif
> > > >  };
> > > >  
> > > > +#ifdef CONFIG_BINDER_USER_TRACKING
> > > > +
> > > > +/*
> > > > + * binder_print_delay - Output info of a delay transaction
> > > > + * @t:          pointer to the over-time transaction
> > > > + */
> > > > +static void binder_print_delay(struct binder_transaction *t)
> > > > +{
> > > > +	struct rtc_time tm;
> > > > +	struct timespec *startime;
> > > > +	struct timespec cur, sub_t;
> > > > +
> > > > +	ktime_get_ts(&cur);
> > > > +	startime = &t->timestamp;
> > > > +	sub_t = timespec_sub(cur, *startime);
> > > > +
> > > > +	/* if transaction time is over than 2 sec,
> > > > +	 * show timeout warning log.
> > > > +	 */
> > > > +	if (sub_t.tv_sec < 2)
> > > > +		return;
> > > > +
> > > > +	rtc_time_to_tm(t->tv.tv_sec, &tm);
> > > > +
> > > > +	spin_lock(&t->lock);
> > > > +	pr_info_ratelimited("%d: from %d:%d to %d:%d",
> > > > +			    t->debug_id,
> > > > +			    t->from ? t->from->proc->pid : 0,
> > > > +			    t->from ? t->from->pid : 0,
> > > > +			    t->to_proc ? t->to_proc->pid : 0,
> > > > +			    t->to_thread ? t->to_thread->pid : 0);
> > > > +	spin_unlock(&t->lock);
> > > > +
> > > > +	pr_info_ratelimited(" total %u.%03ld s code %u start %lu.%03ld android %d-%02d-%02d %02d:%02d:%02d.%03lu\n",
> > > > +			    (unsigned int)sub_t.tv_sec,
> > > > +			    (sub_t.tv_nsec / NSEC_PER_MSEC),
> > > > +			    t->code,
> > > > +			    (unsigned long)startime->tv_sec,
> > > > +			    (startime->tv_nsec / NSEC_PER_MSEC),
> > > > +			    (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
> > > > +			    tm.tm_hour, tm.tm_min, tm.tm_sec,
> > > > +			    (unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
> > > > +}
> > > 
> > > Ick, why not use a tracepoint for this instead?
> > > 
> > > And what is userspace supposed to do with this if they see it?
> > 
> > Or another option is to implement this separately outside of binder.c using
> > register_trace_* on the existing binder tracepoints, similar to what say the
> > block tracer or preempt-off tracers do. Call it, say, "binder-latency tracer".
> > 
> > That way all of this tracing code is in-kernel but outside of binder.c.
> > 
> > thanks,
> > 
> >  - Joel
> > 
> Time limitation of recording is the reason why we don't use tracepoint.
> In some situations, the exception is caused by a series of transactions
> interaction.
> Some abnormal transactions may be pending for a long time ago, they
> could not be recorded due to buffer limited.

register_trace_* does not use the trace buffer so I am not sure what you
mean. I am asking you to use tracepoints, not ftrace events.

thanks,

 - Joel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
