Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A5BC2D0B1
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 06:39:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CB012082E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 06:39:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OugaPyi9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PjOlN03d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CB012082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDzcQGENtuNwZb/wc4ROrv0XH6BPOItIUOfhT7YDFAQ=; b=OugaPyi9x5N3/t
	enC8ugbIh6jFcOmZObAoPJqQXcAzk5W4QD/u/Rii7m2YUrexvaiuruoVQ/xtcu62/EeOQM56pZ1dT
	HMaciAhLwN0vN6WA+9P3k9S9zYgs2qKivrA/gJxg5fIALmO4f+9GnaSefca4viTjzx6tCorJmLeEC
	cifcSjltOv2qUW5gaJ3cjFa375YZnMwArLG0fFPLlxQAcU9kNxUyoQWgW4169ufWhLhuaZDjqxznv
	GfpdyvPyKPMS5fTIcrVbhokORfHKZuwt7e8K2hwvFD0YFKaBwz5anj14XiloHIu4+WyxzsyZ5K52X
	akj8VH4ntNH8y34ChODw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izxIJ-0006LM-A0; Fri, 07 Feb 2020 06:39:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izxIG-0006Ks-T1
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 06:39:14 +0000
X-UUID: d26faf6d420849ecb5a4c7c9f18a5c36-20200206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=R/+a0fdrCDE55+6NHJbY91tgYCmhdw3+sIz81IyvB4g=; 
 b=PjOlN03d0bw3D4X0MX6BBqa30I19p0SQe+jz4E9zwctWkk1CG4I3Vx18Px53VJ+ygcLOjFHlAK5Mf7iefLvzzBPjCNhxTTfE/GT4sD9Ha3DpW0dRn5D272kjIXNox6ZfgUwXGWyEjeWjSEMcXLPdZTu8pMepJTM7K0nQ065Pd5Q=;
X-UUID: d26faf6d420849ecb5a4c7c9f18a5c36-20200206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 557963574; Thu, 06 Feb 2020 22:39:03 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 6 Feb 2020 22:29:43 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 7 Feb 2020 14:28:19 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 7 Feb 2020 14:28:24 +0800
Message-ID: <1581056939.22229.55.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/1] binder: transaction latency tracking for user build
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Joel Fernandes <joel@joelfernandes.org>
Date: Fri, 7 Feb 2020 14:28:59 +0800
In-Reply-To: <20200207031759.GA121785@google.com>
References: <1580885572-14272-1-git-send-email-Frankie.Chang@mediatek.com>
 <20200205093612.GA1167956@kroah.com> <20200205154943.GE142103@google.com>
 <1581045023.22229.46.camel@mtkswgap22> <20200207031759.GA121785@google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_223912_949428_C694C181 
X-CRM114-Status: GOOD (  27.65  )
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
 Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>,
 Jian-Min.Liu@mediatek.com, linux-mediatek@lists.infradead.org,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-02-06 at 22:17 -0500, Joel Fernandes wrote:
> On Fri, Feb 07, 2020 at 11:10:23AM +0800, Frankie Chang wrote:
> > On Wed, 2020-02-05 at 10:49 -0500, Joel Fernandes wrote:
> > > On Wed, Feb 05, 2020 at 09:36:12AM +0000, Greg Kroah-Hartman wrote:
> > > > On Wed, Feb 05, 2020 at 02:52:52PM +0800, Frankie Chang wrote:
> > > > > Record start/end timestamp to binder transaction.
> > > > > When transaction is completed or transaction is free,
> > > > > it would be checked if transaction latency over threshold (2 sec),
> > > > > if yes, printing related information for tracing.
> > > > > 
> > > > > Signed-off-by: Frankie Chang <Frankie.Chang@mediatek.com>
> > > > > ---
> > > > >  drivers/android/Kconfig           |    8 +++
> > > > >  drivers/android/binder.c          |  107 +++++++++++++++++++++++++++++++++++++
> > > > >  drivers/android/binder_internal.h |    4 ++
> > > > >  3 files changed, 119 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> > > > > index 6fdf2ab..7ba80eb 100644
> > > > > --- a/drivers/android/Kconfig
> > > > > +++ b/drivers/android/Kconfig
> > > > > @@ -54,6 +54,14 @@ config ANDROID_BINDER_IPC_SELFTEST
> > > > >  	  exhaustively with combinations of various buffer sizes and
> > > > >  	  alignments.
> > > > >  
> > > > > +config BINDER_USER_TRACKING
> > > > > +	bool "Android Binder transaction tracking"
> > > > > +	help
> > > > > +	  Used for track abnormal binder transaction which is over 2 seconds,
> > > > > +	  when the transaction is done or be free, this transaction would be
> > > > > +	  checked whether it executed overtime.
> > > > > +	  If yes, printing out the detail info about it.
> > > > > +
> > > > >  endif # if ANDROID
> > > > >  
> > > > >  endmenu
> > > > > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > > > > index e9bc9fc..5a352ee 100644
> > > > > --- a/drivers/android/binder.c
> > > > > +++ b/drivers/android/binder.c
> > > > > @@ -76,6 +76,11 @@
> > > > >  #include "binder_internal.h"
> > > > >  #include "binder_trace.h"
> > > > >  
> > > > > +#ifdef CONFIG_BINDER_USER_TRACKING
> > > > > +#include <linux/rtc.h>
> > > > > +#include <linux/time.h>
> > > > > +#endif
> > > > > +
> > > > >  static HLIST_HEAD(binder_deferred_list);
> > > > >  static DEFINE_MUTEX(binder_deferred_lock);
> > > > >  
> > > > > @@ -591,8 +596,104 @@ struct binder_transaction {
> > > > >  	 * during thread teardown
> > > > >  	 */
> > > > >  	spinlock_t lock;
> > > > > +#ifdef CONFIG_BINDER_USER_TRACKING
> > > > > +	struct timespec timestamp;
> > > > > +	struct timeval tv;
> > > > > +#endif
> > > > >  };
> > > > >  
> > > > > +#ifdef CONFIG_BINDER_USER_TRACKING
> > > > > +
> > > > > +/*
> > > > > + * binder_print_delay - Output info of a delay transaction
> > > > > + * @t:          pointer to the over-time transaction
> > > > > + */
> > > > > +static void binder_print_delay(struct binder_transaction *t)
> > > > > +{
> > > > > +	struct rtc_time tm;
> > > > > +	struct timespec *startime;
> > > > > +	struct timespec cur, sub_t;
> > > > > +
> > > > > +	ktime_get_ts(&cur);
> > > > > +	startime = &t->timestamp;
> > > > > +	sub_t = timespec_sub(cur, *startime);
> > > > > +
> > > > > +	/* if transaction time is over than 2 sec,
> > > > > +	 * show timeout warning log.
> > > > > +	 */
> > > > > +	if (sub_t.tv_sec < 2)
> > > > > +		return;
> > > > > +
> > > > > +	rtc_time_to_tm(t->tv.tv_sec, &tm);
> > > > > +
> > > > > +	spin_lock(&t->lock);
> > > > > +	pr_info_ratelimited("%d: from %d:%d to %d:%d",
> > > > > +			    t->debug_id,
> > > > > +			    t->from ? t->from->proc->pid : 0,
> > > > > +			    t->from ? t->from->pid : 0,
> > > > > +			    t->to_proc ? t->to_proc->pid : 0,
> > > > > +			    t->to_thread ? t->to_thread->pid : 0);
> > > > > +	spin_unlock(&t->lock);
> > > > > +
> > > > > +	pr_info_ratelimited(" total %u.%03ld s code %u start %lu.%03ld android %d-%02d-%02d %02d:%02d:%02d.%03lu\n",
> > > > > +			    (unsigned int)sub_t.tv_sec,
> > > > > +			    (sub_t.tv_nsec / NSEC_PER_MSEC),
> > > > > +			    t->code,
> > > > > +			    (unsigned long)startime->tv_sec,
> > > > > +			    (startime->tv_nsec / NSEC_PER_MSEC),
> > > > > +			    (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
> > > > > +			    tm.tm_hour, tm.tm_min, tm.tm_sec,
> > > > > +			    (unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
> > > > > +}
> > > > 
> > > > Ick, why not use a tracepoint for this instead?
> > > > 
> > > > And what is userspace supposed to do with this if they see it?
> > > 
> > > Or another option is to implement this separately outside of binder.c using
> > > register_trace_* on the existing binder tracepoints, similar to what say the
> > > block tracer or preempt-off tracers do. Call it, say, "binder-latency tracer".
> > > 
> > > That way all of this tracing code is in-kernel but outside of binder.c.
> > > 
> > > thanks,
> > > 
> > >  - Joel
> > > 
> > Time limitation of recording is the reason why we don't use tracepoint.
> > In some situations, the exception is caused by a series of transactions
> > interaction.
> > Some abnormal transactions may be pending for a long time ago, they
> > could not be recorded due to buffer limited.
> 
> register_trace_* does not use the trace buffer so I am not sure what you
> mean. I am asking you to use tracepoints, not ftrace events.
> 
> thanks,
> 
>  - Joel
> 
The existing binder tracepoint may not be precise enough because there
is no proper tracepoint which can represent the real finished time of
transaction.

The reason why we don't put the code outside binder.c is that structure
of binder_transaction didn't put in header file.
If it could be moved to binder_internal.h, then we can add
"binder-latency tracer" as you mentioned earlier.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
