Return-Path: <SRS0=voLZ=3Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3DCC3F68F
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 09:36:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51FB1217BA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 09:36:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kI/kkrdu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVMZpACb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51FB1217BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdH9E0zG3I0YrDGbXPoZEwVUPfG8E7NV/k/YfbGiEGQ=; b=kI/kkrduHUOZmd
	DvjA8BHyClzJX0xw/GOUJrUNgoHUajKEaVAFCErM28DqHUp0dsYicmEsBAzBLCaOGEk8y/BKsHAmg
	0FAYk6vOu4Dy7O9A5PwRk13w9HvzqEDd8jJGnG5bKfDFypUwzDWXtRUh7AxU2+3bhg08EN5aigso9
	0uCWi4oACY5W4nR7AN0DCXvgNhTVMqb/qh+UJyU7eJiTBoWfIs8oJVKNd1/PVfHD9aZbJNT8u65h7
	2Wl/yvit2l5apybaBoEM/JTK7V7oG5s4NGaHIaiJvlP177Sh8gwOTX9NXzV/QOarTqAiF3+LwPJEO
	ao/LifZuG+dHerBaZqPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izH6Z-0004va-PM; Wed, 05 Feb 2020 09:36:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izH6W-0004uw-RQ
 for linux-mediatek@lists.infradead.org; Wed, 05 Feb 2020 09:36:18 +0000
Received: from localhost (unknown [212.187.182.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AD5E20661;
 Wed,  5 Feb 2020 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580895375;
 bh=RwByi0XDoyCwQdPe5YV1dEFXavEuBmppr0k662j0vE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GVMZpACbv7YDWH+Ckvp13K/sQxq6HMXMZWFjtjxgZOzZCqv9+3Rz5m7YrNUSRGzRo
 8xla3g7gqRFfMK8GwmrjBaSCImKNAg1i5cq0H1VmAJSHqnh8N8ShGFvp+81/Aocfwd
 zPKKa2l7omXB4nxNHq8JHvMsPIqUAf6bH7AZ+bNg=
Date: Wed, 5 Feb 2020 09:36:12 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frankie Chang <Frankie.Chang@mediatek.com>
Subject: Re: [PATCH v1 1/1] binder: transaction latency tracking for user build
Message-ID: <20200205093612.GA1167956@kroah.com>
References: <1580885572-14272-1-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580885572-14272-1-git-send-email-Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_013616_925257_9230FB01 
X-CRM114-Status: GOOD (  18.85  )
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
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 05, 2020 at 02:52:52PM +0800, Frankie Chang wrote:
> Record start/end timestamp to binder transaction.
> When transaction is completed or transaction is free,
> it would be checked if transaction latency over threshold (2 sec),
> if yes, printing related information for tracing.
> 
> Signed-off-by: Frankie Chang <Frankie.Chang@mediatek.com>
> ---
>  drivers/android/Kconfig           |    8 +++
>  drivers/android/binder.c          |  107 +++++++++++++++++++++++++++++++++++++
>  drivers/android/binder_internal.h |    4 ++
>  3 files changed, 119 insertions(+)
> 
> diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> index 6fdf2ab..7ba80eb 100644
> --- a/drivers/android/Kconfig
> +++ b/drivers/android/Kconfig
> @@ -54,6 +54,14 @@ config ANDROID_BINDER_IPC_SELFTEST
>  	  exhaustively with combinations of various buffer sizes and
>  	  alignments.
>  
> +config BINDER_USER_TRACKING
> +	bool "Android Binder transaction tracking"
> +	help
> +	  Used for track abnormal binder transaction which is over 2 seconds,
> +	  when the transaction is done or be free, this transaction would be
> +	  checked whether it executed overtime.
> +	  If yes, printing out the detail info about it.
> +
>  endif # if ANDROID
>  
>  endmenu
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index e9bc9fc..5a352ee 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -76,6 +76,11 @@
>  #include "binder_internal.h"
>  #include "binder_trace.h"
>  
> +#ifdef CONFIG_BINDER_USER_TRACKING
> +#include <linux/rtc.h>
> +#include <linux/time.h>
> +#endif
> +
>  static HLIST_HEAD(binder_deferred_list);
>  static DEFINE_MUTEX(binder_deferred_lock);
>  
> @@ -591,8 +596,104 @@ struct binder_transaction {
>  	 * during thread teardown
>  	 */
>  	spinlock_t lock;
> +#ifdef CONFIG_BINDER_USER_TRACKING
> +	struct timespec timestamp;
> +	struct timeval tv;
> +#endif
>  };
>  
> +#ifdef CONFIG_BINDER_USER_TRACKING
> +
> +/*
> + * binder_print_delay - Output info of a delay transaction
> + * @t:          pointer to the over-time transaction
> + */
> +static void binder_print_delay(struct binder_transaction *t)
> +{
> +	struct rtc_time tm;
> +	struct timespec *startime;
> +	struct timespec cur, sub_t;
> +
> +	ktime_get_ts(&cur);
> +	startime = &t->timestamp;
> +	sub_t = timespec_sub(cur, *startime);
> +
> +	/* if transaction time is over than 2 sec,
> +	 * show timeout warning log.
> +	 */
> +	if (sub_t.tv_sec < 2)
> +		return;
> +
> +	rtc_time_to_tm(t->tv.tv_sec, &tm);
> +
> +	spin_lock(&t->lock);
> +	pr_info_ratelimited("%d: from %d:%d to %d:%d",
> +			    t->debug_id,
> +			    t->from ? t->from->proc->pid : 0,
> +			    t->from ? t->from->pid : 0,
> +			    t->to_proc ? t->to_proc->pid : 0,
> +			    t->to_thread ? t->to_thread->pid : 0);
> +	spin_unlock(&t->lock);
> +
> +	pr_info_ratelimited(" total %u.%03ld s code %u start %lu.%03ld android %d-%02d-%02d %02d:%02d:%02d.%03lu\n",
> +			    (unsigned int)sub_t.tv_sec,
> +			    (sub_t.tv_nsec / NSEC_PER_MSEC),
> +			    t->code,
> +			    (unsigned long)startime->tv_sec,
> +			    (startime->tv_nsec / NSEC_PER_MSEC),
> +			    (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
> +			    tm.tm_hour, tm.tm_min, tm.tm_sec,
> +			    (unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
> +}

Ick, why not use a tracepoint for this instead?

And what is userspace supposed to do with this if they see it?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
