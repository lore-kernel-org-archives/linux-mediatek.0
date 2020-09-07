Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77F7C43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 12:25:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6783820757
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 12:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PFOUCiBD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDXXann8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6783820757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fekJTiDUWrG2LYAV8koO6/N6p4YpzTYzsUBPXgtv/p8=; b=PFOUCiBDwYpp8dWQHzBo/hwf0
	j28nmALvbT0cudiQbehQfjhwIf/7LUFnf9lKtTZpKJTfSfOMF3PByEy1T9mJtv7z3cyTnZkbx2HKT
	ZL80kAFa7VabfRg6FJU9O96lQmUDSj4YhLNajxMgQRk4ldePcREsrHXFVUePqTjyK5iihdTdkVvPI
	R7L1ghYPCfAI0cgOhENXrWggQ82IAD5x+Gagn+s9N/bywCSfbfcZn28Mvnu1rvYAk8KkX8JOd47jx
	u1cVKXHcB6izDrMPQiS8V6imxoLwSu60SLzKq3u2UCB0PpGTPAk7ZrPHMtZqXGXarHYTLSRbGOH1f
	ci3c2VsRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFGDV-0002Yv-BV; Mon, 07 Sep 2020 12:25:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFGDQ-0002YK-NY
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 12:25:47 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAC9F206E6;
 Mon,  7 Sep 2020 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599481543;
 bh=0GkemVbhPGonDb0iW9he6rt4lMu/PJt7ohxQhtJQZiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DDXXann8fwHMU/sTA7iJ/vV+n4Qe7KEg8vIkMRDSyOwPNj1nM/WFEWcC/12I6SdgW
 S0xTulnFyrqnK7sIHmdDqErfGZF55SePVBiG7w29nqeyuNdAL3p6qKcPTe+DnJKKNo
 9aNPA1UTHWhSk0vLLvEp9QTMwzet9mbv42/HrhDQ=
Date: Mon, 7 Sep 2020 14:25:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frankie Chang <Frankie.Chang@mediatek.com>
Subject: Re: [PATCH v8 3/3] binder: add transaction latency tracer
Message-ID: <20200907122557.GC2029056@kroah.com>
References: <20200907070045.GA605692@kroah.com>
 <1599480055-25781-1-git-send-email-Frankie.Chang@mediatek.com>
 <1599480055-25781-4-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599480055-25781-4-git-send-email-Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_082544_899233_FB7D154B 
X-CRM114-Status: GOOD (  30.53  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>, Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 08:00:55PM +0800, Frankie Chang wrote:
> From: "Frankie.Chang" <Frankie.Chang@mediatek.com>
> 
> Record start/end timestamp for binder transaction.
> When transaction is completed or transaction is free,
> it would be checked if transaction latency over threshold
> (default 2 sec), if yes, printing related information for tracing.
> 
> /* Implement details */
> - Add latency tracer module to monitor transaction
>   by attaching to new tracepoints introduced
>   when transactions are allocated and freed.
>   The trace_binder_txn_latency_free would not be enabled
>   by default. Monitoring which transaction is too slow to
>   cause some of exceptions is important. So we hook the
>   tracepoint to call the monitor function.
> 
> - Since some of modules would trigger timeout NE
>   if their binder transaction don't finish in time,
>   such as audio timeout (5 sec), even BT command
>   timeout (2 sec), etc.
>   Therefore, setting the timeout threshold as default
>   2 seconds could be helpful to debug.
>   But this timeout threshold is configurable, to let
>   all users determine the more suitable threshold.
> 
> - The reason why printing the related information to
>   kernel information log but not trace buffer is that
>   some abnormal transactions may be pending for a long
>   time ago, they could not be recorded due to buffer
>   limited.
> 
> Signed-off-by: Frankie.Chang <Frankie.Chang@mediatek.com>
> Acked-by: Todd Kjos <tkjos@google.com>
> ---
>  drivers/android/Kconfig                 |    8 +++
>  drivers/android/Makefile                |    1 +
>  drivers/android/binder.c                |    6 ++
>  drivers/android/binder_internal.h       |   13 ++++
>  drivers/android/binder_latency_tracer.c |  112 +++++++++++++++++++++++++++++++
>  drivers/android/binder_trace.h          |   26 ++++++-
>  6 files changed, 163 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/android/binder_latency_tracer.c
> 
> diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> index 53b22e2..8aadaf4 100644
> --- a/drivers/android/Kconfig
> +++ b/drivers/android/Kconfig
> @@ -54,6 +54,14 @@ config ANDROID_BINDER_IPC_SELFTEST
>  	  exhaustively with combinations of various buffer sizes and
>  	  alignments.
>  
> +config BINDER_TRANSACTION_LATENCY_TRACKING
> +	tristate "Android Binder transaction tracking"
> +	help
> +	  Used for track abnormal binder transaction which is over threshold,
> +	  when the transaction is done or be free, this transaction would be
> +	  checked whether it executed overtime.
> +	  If yes, printing out the detailed info.
> +
>  endif # if ANDROID
>  
>  endmenu
> diff --git a/drivers/android/Makefile b/drivers/android/Makefile
> index c9d3d0c9..c2ffdb6 100644
> --- a/drivers/android/Makefile
> +++ b/drivers/android/Makefile
> @@ -4,3 +4,4 @@ ccflags-y += -I$(src)			# needed for trace events
>  obj-$(CONFIG_ANDROID_BINDERFS)		+= binderfs.o
>  obj-$(CONFIG_ANDROID_BINDER_IPC)	+= binder.o binder_alloc.o
>  obj-$(CONFIG_ANDROID_BINDER_IPC_SELFTEST) += binder_alloc_selftest.o
> +obj-$(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)	+= binder_latency_tracer.o
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 0cab900..65ad38c 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -2674,6 +2674,7 @@ static void binder_transaction(struct binder_proc *proc,
>  		return_error_line = __LINE__;
>  		goto err_alloc_t_failed;
>  	}
> +	trace_binder_txn_latency_alloc(t);
>  	INIT_LIST_HEAD(&t->fd_fixups);
>  	binder_stats_created(BINDER_STAT_TRANSACTION);
>  	spin_lock_init(&t->lock);
> @@ -5177,6 +5178,7 @@ static void print_binder_transaction_ilocked(struct seq_file *m,
>  		   to_proc ? to_proc->pid : 0,
>  		   t->to_thread ? t->to_thread->pid : 0,
>  		   t->code, t->flags, t->priority, t->need_reply);
> +	trace_binder_txn_latency_info(m, t);
>  	spin_unlock(&t->lock);
>  
>  	if (proc != to_proc) {
> @@ -5818,4 +5820,8 @@ static int __init binder_init(void)
>  #define CREATE_TRACE_POINTS
>  #include "binder_trace.h"
>  
> +EXPORT_TRACEPOINT_SYMBOL(binder_txn_latency_alloc);
> +EXPORT_TRACEPOINT_SYMBOL(binder_txn_latency_info);
> +EXPORT_TRACEPOINT_SYMBOL(binder_txn_latency_free);
> +
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h
> index 872232f..309d1b10 100644
> --- a/drivers/android/binder_internal.h
> +++ b/drivers/android/binder_internal.h
> @@ -15,6 +15,11 @@
>  #include <uapi/linux/android/binderfs.h>
>  #include "binder_alloc.h"
>  
> +#if IS_ENABLED(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)
> +#include <uapi/linux/time_types.h>
> +#include <linux/rtc.h>
> +#endif
> +
>  struct binder_context {
>  	struct binder_node *binder_context_mgr_node;
>  	struct mutex context_mgr_node_lock;
> @@ -524,6 +529,14 @@ struct binder_transaction {
>  	 * during thread teardown
>  	 */
>  	spinlock_t lock;
> +	/**
> +	 * @timestamp and @tv are used to record the time
> +	 * that the binder transaction startup
> +	 */
> +#if IS_ENABLED(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)
> +	struct timespec64 timestamp;
> +	struct __kernel_old_timeval tv;

As I stated in the 0/3 email, please use the correct in-kernel structure
for this.  That structure is _ONLY_ for old userspace api compatibility
issues.  Which is not the case here at all.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
