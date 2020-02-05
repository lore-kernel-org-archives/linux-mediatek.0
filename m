Return-Path: <SRS0=voLZ=3Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECF6C35247
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 15:49:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA67520730
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 15:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="id5dVKFS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="VGTRUXMP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA67520730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZO/amAN20r2qukVWlyxXOKloW4LAKNv66SaAHacyNk=; b=id5dVKFSCHNXgO
	+5NkMmmeoM7byWlpd9Abjuiai0KwCMa8G6HHTnSuzsp7xyuWt4PoxmBa3vykSZKBdjzMBUhu2HBZr
	AmzBFq5/AnS2MRYUKYFGeIhI8XPXN49M9ymCgtdIDVH0KNE0kvlVbigmeic1+HuDPoANlB+uiQK5j
	ko1lTZxY771cYxMC4vQPwHWjgUicwihsunDxmhWkK3d+fjE++LEw3IO/GhObFglyg0gyQ9Il5KPc7
	eenJxWrp5zWEP7vaTns1/KadJp2qVXiFyuDznytwqNQDhy+0NiKZdljEe2UAUTiwGEM0qP8aKQTY5
	rbfTj6T3Nuv0Nks3PuoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izMw0-00053L-GE; Wed, 05 Feb 2020 15:49:48 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izMvx-00052u-Dm
 for linux-mediatek@lists.infradead.org; Wed, 05 Feb 2020 15:49:46 +0000
Received: by mail-pl1-x644.google.com with SMTP id t14so1033690plr.8
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Feb 2020 07:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RPp5BsouysxroPhjIW01q+VuZ3Zg2HgHZWKyGaExUZg=;
 b=VGTRUXMPuFFJkymuHS2/Clldk4Y1Ge5GOyVhJ4cs+a/qSOBfjNhHiwLzi7d7OvtKXV
 dTrPuljzYeG2f5M+0LrgXa4dMnoSRLBISr7y4SRJpf74F7YAsfuuBpeTGyDBqGjyeyv0
 J+bgNX7T4s6JbQaikcgdXL8m16mC8nbRAxqAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RPp5BsouysxroPhjIW01q+VuZ3Zg2HgHZWKyGaExUZg=;
 b=m/DfoSFanVxj0DLPC1cWHbdLWKftwJRmEz5uJpKkI0G9TV6v+5Fz40u7zG49RiMN/E
 Xhs+uqHX5fDm/nqAEyb98sqo5kZ3MU1k5rz+0/0/Q7THw2m75ivJ27hD77rVrqAXNQzb
 lxrG2etll0tjS8cHeboDzHkpXbn23jO2wmnmnPolFyDh0qRlPvUW1VFzTIRN4UQ3uP0+
 ac122CjpUn81pXDIrndprOUUJ14WQcxW6Y5ZRhZlbIZfLGhU9R1FCFAJA4mZzeBrIIPn
 PfKp+XQBCJrJ/kmL/JnIgiFV3n6HEwN0p/14BD0e3gXE1apCCyfJRnncCmaq3BLb18yN
 PtBw==
X-Gm-Message-State: APjAAAVLO6yHb9NZmva0TCd5mIuNWjbsy1SG+Rs9koxR1PPcxZ2ElxwS
 LvTp4wMfUUl5cvZZgVplAL0LgGBmrb8=
X-Google-Smtp-Source: APXvYqzBWmPXxov8CXDn0aWq6V0NpdKfdbcbT7BgCYr2N1QKWoHGjuBr62N0A01RE7BiU7Vo8aHXZA==
X-Received: by 2002:a17:90b:4004:: with SMTP id
 ie4mr6308224pjb.49.1580917784505; 
 Wed, 05 Feb 2020 07:49:44 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id f18sm229910pgn.2.2020.02.05.07.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 07:49:43 -0800 (PST)
Date: Wed, 5 Feb 2020 10:49:43 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] binder: transaction latency tracking for user build
Message-ID: <20200205154943.GE142103@google.com>
References: <1580885572-14272-1-git-send-email-Frankie.Chang@mediatek.com>
 <20200205093612.GA1167956@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205093612.GA1167956@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_074945_465366_68660DCC 
X-CRM114-Status: GOOD (  22.21  )
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
 linux-kernel@vger.kernel.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Jian-Min.Liu@mediatek.com, linux-mediatek@lists.infradead.org,
 Frankie Chang <Frankie.Chang@mediatek.com>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 05, 2020 at 09:36:12AM +0000, Greg Kroah-Hartman wrote:
> On Wed, Feb 05, 2020 at 02:52:52PM +0800, Frankie Chang wrote:
> > Record start/end timestamp to binder transaction.
> > When transaction is completed or transaction is free,
> > it would be checked if transaction latency over threshold (2 sec),
> > if yes, printing related information for tracing.
> > 
> > Signed-off-by: Frankie Chang <Frankie.Chang@mediatek.com>
> > ---
> >  drivers/android/Kconfig           |    8 +++
> >  drivers/android/binder.c          |  107 +++++++++++++++++++++++++++++++++++++
> >  drivers/android/binder_internal.h |    4 ++
> >  3 files changed, 119 insertions(+)
> > 
> > diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> > index 6fdf2ab..7ba80eb 100644
> > --- a/drivers/android/Kconfig
> > +++ b/drivers/android/Kconfig
> > @@ -54,6 +54,14 @@ config ANDROID_BINDER_IPC_SELFTEST
> >  	  exhaustively with combinations of various buffer sizes and
> >  	  alignments.
> >  
> > +config BINDER_USER_TRACKING
> > +	bool "Android Binder transaction tracking"
> > +	help
> > +	  Used for track abnormal binder transaction which is over 2 seconds,
> > +	  when the transaction is done or be free, this transaction would be
> > +	  checked whether it executed overtime.
> > +	  If yes, printing out the detail info about it.
> > +
> >  endif # if ANDROID
> >  
> >  endmenu
> > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > index e9bc9fc..5a352ee 100644
> > --- a/drivers/android/binder.c
> > +++ b/drivers/android/binder.c
> > @@ -76,6 +76,11 @@
> >  #include "binder_internal.h"
> >  #include "binder_trace.h"
> >  
> > +#ifdef CONFIG_BINDER_USER_TRACKING
> > +#include <linux/rtc.h>
> > +#include <linux/time.h>
> > +#endif
> > +
> >  static HLIST_HEAD(binder_deferred_list);
> >  static DEFINE_MUTEX(binder_deferred_lock);
> >  
> > @@ -591,8 +596,104 @@ struct binder_transaction {
> >  	 * during thread teardown
> >  	 */
> >  	spinlock_t lock;
> > +#ifdef CONFIG_BINDER_USER_TRACKING
> > +	struct timespec timestamp;
> > +	struct timeval tv;
> > +#endif
> >  };
> >  
> > +#ifdef CONFIG_BINDER_USER_TRACKING
> > +
> > +/*
> > + * binder_print_delay - Output info of a delay transaction
> > + * @t:          pointer to the over-time transaction
> > + */
> > +static void binder_print_delay(struct binder_transaction *t)
> > +{
> > +	struct rtc_time tm;
> > +	struct timespec *startime;
> > +	struct timespec cur, sub_t;
> > +
> > +	ktime_get_ts(&cur);
> > +	startime = &t->timestamp;
> > +	sub_t = timespec_sub(cur, *startime);
> > +
> > +	/* if transaction time is over than 2 sec,
> > +	 * show timeout warning log.
> > +	 */
> > +	if (sub_t.tv_sec < 2)
> > +		return;
> > +
> > +	rtc_time_to_tm(t->tv.tv_sec, &tm);
> > +
> > +	spin_lock(&t->lock);
> > +	pr_info_ratelimited("%d: from %d:%d to %d:%d",
> > +			    t->debug_id,
> > +			    t->from ? t->from->proc->pid : 0,
> > +			    t->from ? t->from->pid : 0,
> > +			    t->to_proc ? t->to_proc->pid : 0,
> > +			    t->to_thread ? t->to_thread->pid : 0);
> > +	spin_unlock(&t->lock);
> > +
> > +	pr_info_ratelimited(" total %u.%03ld s code %u start %lu.%03ld android %d-%02d-%02d %02d:%02d:%02d.%03lu\n",
> > +			    (unsigned int)sub_t.tv_sec,
> > +			    (sub_t.tv_nsec / NSEC_PER_MSEC),
> > +			    t->code,
> > +			    (unsigned long)startime->tv_sec,
> > +			    (startime->tv_nsec / NSEC_PER_MSEC),
> > +			    (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
> > +			    tm.tm_hour, tm.tm_min, tm.tm_sec,
> > +			    (unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
> > +}
> 
> Ick, why not use a tracepoint for this instead?
> 
> And what is userspace supposed to do with this if they see it?

Or another option is to implement this separately outside of binder.c using
register_trace_* on the existing binder tracepoints, similar to what say the
block tracer or preempt-off tracers do. Call it, say, "binder-latency tracer".

That way all of this tracing code is in-kernel but outside of binder.c.

thanks,

 - Joel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
