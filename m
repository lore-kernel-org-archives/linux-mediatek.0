Return-Path: <SRS0=tzuU=55=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7880BC2BA19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 06:34:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47D07206E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 06:34:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u/0X3DKW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eZvH9TL2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47D07206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxQnMuqWRdoU2/I1X32aJcOPTMkvIkZGEzuB9rbka/o=; b=u/0X3DKWi6zUUG
	/ZG1eK+Lbd/w8D44R2ZsPzu/xBBd2iOGNojkPBX0TuY3toj9Ucf7G7kgAv4z8i8imJdY6/srwNjpI
	m0WthKT+YMA5N/nDAoHTld2aSIqprWvepDav1/5zS8Yz5vi6l3VviD0D7z8xw9N9OinstR1ghU0Dw
	b5oIAqLfWP8eyXEupr59i38DXnARH5RopHNkFRMql8BE5xtj3iz4wggV3QhoscNZbjs8Da3MYzjK3
	B8ZYPP6dvE02EBT8VTMQRRXcPgWseFqBxu8zkONHo5jjdIN/wFsxgnztTDE/OLG/mIMykNKCpbszR
	CjMcQz7Pj55CpkUxFfdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNsgD-0007Pt-7o; Mon, 13 Apr 2020 06:34:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNsgA-0007Op-Et
 for linux-mediatek@lists.infradead.org; Mon, 13 Apr 2020 06:34:48 +0000
X-UUID: ed02e55cd774426a85fb717f46b9c197-20200412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=34rlSUxTMlshzDSRi/mw46IKNke5K9TPavLiM4hQcoE=; 
 b=eZvH9TL2ima4o0e9YGlHbg6lNxcGB6zMm6UW30SmWKSbJmf0bk+c62uXBxfCmUCDdEcV7Yr647enB8R37l/teyA1oZXL8abTLzKnribm69IRJ6B1s5wCg2zUWdbi6h5H1p0LuevSQLCqvwrGuGA8MwdOACQpeEGFKNTEPpnvoMk=;
X-UUID: ed02e55cd774426a85fb717f46b9c197-20200412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1092265012; Sun, 12 Apr 2020 22:34:33 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Apr 2020 23:24:37 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Apr 2020 14:24:31 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Apr 2020 14:24:30 +0800
Message-ID: <1586759071.9539.15.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/1] binder: transaction latency tracking for user build
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 13 Apr 2020 14:24:31 +0800
In-Reply-To: <20200207132635.GB121785@google.com>
References: <1580885572-14272-1-git-send-email-Frankie.Chang@mediatek.com>
 <20200205093612.GA1167956@kroah.com> <20200205154943.GE142103@google.com>
 <1581045023.22229.46.camel@mtkswgap22> <20200207031759.GA121785@google.com>
 <1581056939.22229.55.camel@mtkswgap22> <20200207132635.GB121785@google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F139ADF625BA0CD6E58403A292981815779C4F37ACFDC969602B864F5B31798B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200412_233446_508852_D0D4BEEE 
X-CRM114-Status: GOOD (  33.58  )
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

On Fri, 2020-02-07 at 08:26 -0500, Joel Fernandes wrote:
> On Fri, Feb 07, 2020 at 02:28:59PM +0800, Frankie Chang wrote:
> > On Thu, 2020-02-06 at 22:17 -0500, Joel Fernandes wrote:
> > > On Fri, Feb 07, 2020 at 11:10:23AM +0800, Frankie Chang wrote:
> > > > On Wed, 2020-02-05 at 10:49 -0500, Joel Fernandes wrote:
> > > > > On Wed, Feb 05, 2020 at 09:36:12AM +0000, Greg Kroah-Hartman wrote:
> > > > > > On Wed, Feb 05, 2020 at 02:52:52PM +0800, Frankie Chang wrote:
> > > > > > > Record start/end timestamp to binder transaction.
> > > > > > > When transaction is completed or transaction is free,
> > > > > > > it would be checked if transaction latency over threshold (2 sec),
> > > > > > > if yes, printing related information for tracing.
> > > > > > > 
> > > > > > > Signed-off-by: Frankie Chang <Frankie.Chang@mediatek.com>
> > > > > > > ---
> > > > > > >  drivers/android/Kconfig           |    8 +++
> > > > > > >  drivers/android/binder.c          |  107 +++++++++++++++++++++++++++++++++++++
> > > > > > >  drivers/android/binder_internal.h |    4 ++
> > > > > > >  3 files changed, 119 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> > > > > > > index 6fdf2ab..7ba80eb 100644
> > > > > > > --- a/drivers/android/Kconfig
> > > > > > > +++ b/drivers/android/Kconfig
> > > > > > > @@ -54,6 +54,14 @@ config ANDROID_BINDER_IPC_SELFTEST
> > > > > > >  	  exhaustively with combinations of various buffer sizes and
> > > > > > >  	  alignments.
> > > > > > >  
> > > > > > > +config BINDER_USER_TRACKING
> > > > > > > +	bool "Android Binder transaction tracking"
> > > > > > > +	help
> > > > > > > +	  Used for track abnormal binder transaction which is over 2 seconds,
> > > > > > > +	  when the transaction is done or be free, this transaction would be
> > > > > > > +	  checked whether it executed overtime.
> > > > > > > +	  If yes, printing out the detail info about it.
> > > > > > > +
> > > > > > >  endif # if ANDROID
> > > > > > >  
> > > > > > >  endmenu
> > > > > > > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > > > > > > index e9bc9fc..5a352ee 100644
> > > > > > > --- a/drivers/android/binder.c
> > > > > > > +++ b/drivers/android/binder.c
> > > > > > > @@ -76,6 +76,11 @@
> > > > > > >  #include "binder_internal.h"
> > > > > > >  #include "binder_trace.h"
> > > > > > >  
> > > > > > > +#ifdef CONFIG_BINDER_USER_TRACKING
> > > > > > > +#include <linux/rtc.h>
> > > > > > > +#include <linux/time.h>
> > > > > > > +#endif
> > > > > > > +
> > > > > > >  static HLIST_HEAD(binder_deferred_list);
> > > > > > >  static DEFINE_MUTEX(binder_deferred_lock);
> > > > > > >  
> > > > > > > @@ -591,8 +596,104 @@ struct binder_transaction {
> > > > > > >  	 * during thread teardown
> > > > > > >  	 */
> > > > > > >  	spinlock_t lock;
> > > > > > > +#ifdef CONFIG_BINDER_USER_TRACKING
> > > > > > > +	struct timespec timestamp;
> > > > > > > +	struct timeval tv;
> > > > > > > +#endif
> > > > > > >  };
> > > > > > >  
> > > > > > > +#ifdef CONFIG_BINDER_USER_TRACKING
> > > > > > > +
> > > > > > > +/*
> > > > > > > + * binder_print_delay - Output info of a delay transaction
> > > > > > > + * @t:          pointer to the over-time transaction
> > > > > > > + */
> > > > > > > +static void binder_print_delay(struct binder_transaction *t)
> > > > > > > +{
> > > > > > > +	struct rtc_time tm;
> > > > > > > +	struct timespec *startime;
> > > > > > > +	struct timespec cur, sub_t;
> > > > > > > +
> > > > > > > +	ktime_get_ts(&cur);
> > > > > > > +	startime = &t->timestamp;
> > > > > > > +	sub_t = timespec_sub(cur, *startime);
> > > > > > > +
> > > > > > > +	/* if transaction time is over than 2 sec,
> > > > > > > +	 * show timeout warning log.
> > > > > > > +	 */
> > > > > > > +	if (sub_t.tv_sec < 2)
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	rtc_time_to_tm(t->tv.tv_sec, &tm);
> > > > > > > +
> > > > > > > +	spin_lock(&t->lock);
> > > > > > > +	pr_info_ratelimited("%d: from %d:%d to %d:%d",
> > > > > > > +			    t->debug_id,
> > > > > > > +			    t->from ? t->from->proc->pid : 0,
> > > > > > > +			    t->from ? t->from->pid : 0,
> > > > > > > +			    t->to_proc ? t->to_proc->pid : 0,
> > > > > > > +			    t->to_thread ? t->to_thread->pid : 0);
> > > > > > > +	spin_unlock(&t->lock);
> > > > > > > +
> > > > > > > +	pr_info_ratelimited(" total %u.%03ld s code %u start %lu.%03ld android %d-%02d-%02d %02d:%02d:%02d.%03lu\n",
> > > > > > > +			    (unsigned int)sub_t.tv_sec,
> > > > > > > +			    (sub_t.tv_nsec / NSEC_PER_MSEC),
> > > > > > > +			    t->code,
> > > > > > > +			    (unsigned long)startime->tv_sec,
> > > > > > > +			    (startime->tv_nsec / NSEC_PER_MSEC),
> > > > > > > +			    (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
> > > > > > > +			    tm.tm_hour, tm.tm_min, tm.tm_sec,
> > > > > > > +			    (unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
> > > > > > > +}
> > > > > > 
> > > > > > Ick, why not use a tracepoint for this instead?
> > > > > > 
> > > > > > And what is userspace supposed to do with this if they see it?
> > > > > 
> > > > > Or another option is to implement this separately outside of binder.c using
> > > > > register_trace_* on the existing binder tracepoints, similar to what say the
> > > > > block tracer or preempt-off tracers do. Call it, say, "binder-latency tracer".
> > > > > 
> > > > > That way all of this tracing code is in-kernel but outside of binder.c.
> > > > > 
> > > > > thanks,
> > > > > 
> > > > >  - Joel
> > > > > 
> > > > Time limitation of recording is the reason why we don't use tracepoint.
> > > > In some situations, the exception is caused by a series of transactions
> > > > interaction.
> > > > Some abnormal transactions may be pending for a long time ago, they
> > > > could not be recorded due to buffer limited.
> > > 
> > > register_trace_* does not use the trace buffer so I am not sure what you
> > > mean. I am asking you to use tracepoints, not ftrace events.
> > > 
> > > thanks,
> > > 
> > >  - Joel
> > > 
> > The existing binder tracepoint may not be precise enough because there
> > is no proper tracepoint which can represent the real finished time of
> > transaction.
> 
> May be you can add such TP then?
> 
Yes, we will add TP at the real finished time of transaction.

> > The reason why we don't put the code outside binder.c is that structure
> > of binder_transaction didn't put in header file.
> > If it could be moved to binder_internal.h, then we can add
> > "binder-latency tracer" as you mentioned earlier.
> 
> That should be doable.
> 
> The reason I don't like custom tracing logic in core files as your patch is
> doing, is that it is doubtful if a lot of people would use it to warrant
> adding into a core file. In this case, probably a separate tracer (outside of
> binder.c) is a better option so as to not pollute the core files.
> 
> thanks,
> 
>  - Joel
> 
Thanks for your advice, sincerely.

We will move tracing logic out of core files and implement a separate
latency tracer. And also move some structures needed by tracer module
from core file to header file (binder_internal.h) in next version.

Many thanks,

 - Frankie

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
