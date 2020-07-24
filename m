Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3079FC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 00:51:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F27DC20714
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 00:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vt7u/+sH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="v/Vk3wVo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F27DC20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g5hRCs/eg448L4czfUdobgTvtvAhwJVOpM09B3O9qzs=; b=Vt7u/+sHiGSV6/sJCcKvTkepY
	30nPldK394TAyy0N/X8D/o6elO6XoFAUpv5Kxc7q4VHybyPvfF6NqgK0YsPSW3WIYEhnv/gN2scr+
	vQMqAXj7UzqtkfPETw+aU1fzbwzckJ05jeSFrgGFB/TNEAZOENXv0FPUL99EMQAZfDGVQDBbkhlO6
	Y0miHq7XIB2r1G0K3N/OO72X2xQ7Y/3WpJqxddeDGRxQZw/3Gf2uxvzzLGPR8jUrXujKr/95ZoSIK
	4WbL9Bt3goPMaytq51m26JQwzUhUFbYaU9wru0sFClqkqIOL8jYJHdAXMxJYXpnoD+qyZulDfQkUp
	8AF0U16ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jylvv-0006lY-7l; Fri, 24 Jul 2020 00:51:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jylvr-0006kx-Rs
 for linux-mediatek@lists.infradead.org; Fri, 24 Jul 2020 00:51:29 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CAAA420714;
 Fri, 24 Jul 2020 00:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595551887;
 bh=BnKCkpGkP+pFuk+qwhsfu+o80uLTf/9xasn5HddVPXM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=v/Vk3wVoLIUlVXVgewVnHjVoL1xRK51Y2ByjVi8GSOaHtS/+Eo3ByCbKIclIqDQFB
 nqg5kWtzVYXfIYzE8ysxgEuW7CbURIlBV5NuwLhumr6mW8u3wXPH3kt4FzFASl3c3p
 3LK9jIFoqorc01QjABFen+sA9Iwf4mSnYDZ/sQZA=
Date: Thu, 23 Jul 2020 17:51:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "chunlei.wang" <Chunlei.wang@mediatek.com>
Subject: Re: [PATCH] siganl: ignore other signals when doing coredump
Message-Id: <20200723175126.cf6a660e46c8da26b1293eb4@linux-foundation.org>
In-Reply-To: <1595487143.29785.9.camel@mbjsdccf07>
References: <1595487143.29785.9.camel@mbjsdccf07>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_205128_032680_CAE6B04B 
X-CRM114-Status: GOOD (  17.50  )
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
Cc: weiwei.zhang@mediatek.com, wsd_upstream@mediatek.com,
 Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Oleg Nesterov <oleg@redhat.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 23 Jul 2020 14:52:23 +0800 "chunlei.wang" <Chunlei.wang@mediatek.com> wrote:

> do_coredump flow is interrupted by SIGKILL,
> causing the coredump to be truncated.
> 

Please tell us much more about why you think Linux would benefit from
this change.  Precisely what operational problems are you seeing with
the current code?


> ---
>  arch/Kconfig    | 12 ++++++++++++
>  kernel/signal.c |  8 ++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 8cc35dc556c7..559eac47093e 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -834,6 +834,18 @@ config OLD_SIGACTION
>  config COMPAT_OLD_SIGACTION
>  	bool
>  
> +config IGNORE_ANY_SIGNALS
> +	tristate "ignore any signals when coredump is doing"
> +	default n
> +	help
> +	  The sigkill is very special. If a process receives a sigkill, it
> will
> +	  immediately respond to the sigkill. When a process is abnormal and
> +	  collecting coredump, the do_coredump flow will be interrupted by
> +	  SIGKILL, causing the coredump to be truncated. This truncated
> coredump
> +	  is incomplete, and also gdb can't load.
> +	  Maybe we can ignore any signlas when process is collecting coredump.
> +	  This config can decide whether to ignore any signals.
> +
>  config COMPAT_32BIT_TIME
>  	bool "Provide system calls for 32-bit time_t"
>  	default !64BIT || COMPAT
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 5ca48cc5da76..ccae3c84eb6d 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -903,6 +903,14 @@ static bool prepare_signal(int sig, struct
> task_struct *p, bool force)
>  	sigset_t flush;
>  
>  	if (signal->flags & (SIGNAL_GROUP_EXIT | SIGNAL_GROUP_COREDUMP)) {
> +
> +#if defined CONFIG_IGNORE_ANY_SIGNALS
> +		if (signal->flags & SIGNAL_GROUP_COREDUMP) {
> +			pr_debug("[%d:%s] skip sig %d due to coredump is doing\n",
> +					p->pid, p->comm, sig);
> +			return false;
> +		}
> +#endif
>  		if (!(signal->flags & SIGNAL_GROUP_EXIT))
>  			return sig == SIGKILL;
>  		/*
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
