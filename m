Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CABFC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:07:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B14B20838
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 09:07:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DZKREIz8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="O6Nnhsea"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B14B20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WpOzB/tDlB/hepuku8Gn3Ybf4zf6Nt7QrPlWLIL+fG0=; b=DZKREIz84Bj3J+sThIEUfiIkJ
	40sW6CvwCJvyvZ6Hy/NLBOytL/t0AvnDYzOi3prFF0ZbZxQcK/Jynad9oV1NRU5T5zYMERm3jtyOD
	oXxhw8WT9lavRwbpY1CNRUvjank4P5GTPluDoSiJ6JiZOAiJA1FTXCaYVbKO2Fs5v25ispXH5z8+k
	pklwgj82PkG6w63lOuEkKNXpnRdCbraJUIu+jCeKhBXHe9u/VSvY4OMRfYWWLMApwFAeLuImsg/g6
	9RzX9krpYbEfneExuVXEWxBglatThVIrH3Pd7nDkhI612EW8NBdA6FCj7FuMSzNxwmjmGxy9/MPeS
	STk4txOrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1R0e-0005qD-Te; Fri, 31 Jul 2020 09:07:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1R0a-0005me-0D
 for linux-mediatek@lists.infradead.org; Fri, 31 Jul 2020 09:07:22 +0000
X-UUID: 49451108d3b04386abc269c02eb58c7f-20200731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GWjSi3YpoNcum3z51vpLWGdJlfw6cazZXD2o0Kc/Z8k=; 
 b=O6NnhseaIcP0Jh7uVA95WQzHV29EtVPNiod3o//ABBadD2IoWIs1ywgOz14HvSpiHGZmGFWa4elpXw+yRkoKllZNpIlflPhDWLyfbuT3t65GOYDZsoZ5VpV93gfsuQxoC6WfRrc5326NiKcX8JhetiZPzXNDL7mbSjS8E+buwVM=;
X-UUID: 49451108d3b04386abc269c02eb58c7f-20200731
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunlei.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1794041499; Fri, 31 Jul 2020 01:06:59 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 01:57:09 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 16:56:54 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 31 Jul 2020 16:56:54 +0800
Message-ID: <1596185654.11648.1.camel@mbjsdccf07>
Subject: Re: [PATCH] siganl: ignore other signals when doing coredump
From: chunlei.wang <Chunlei.wang@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 31 Jul 2020 16:54:14 +0800
In-Reply-To: <20200723175126.cf6a660e46c8da26b1293eb4@linux-foundation.org>
References: <1595487143.29785.9.camel@mbjsdccf07>
 <20200723175126.cf6a660e46c8da26b1293eb4@linux-foundation.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B18FD86F47E146965362EEBBF044E2D1A9DDC218CF94AD5BBD9FD8C75FCA44012000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_050720_214788_D0E59677 
X-CRM114-Status: GOOD (  24.96  )
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

Please tell us much more about why you think Linux would benefit from
this change.  Precisely what operational problems are you seeing with
the current code?
=>
       Sorry for the late reply.

       If coredump is incomplete, R&D can not find root cause through
coredump.
 If the issue is seldom, this modification will speed up the process of
solving the problem.

       When one thread occur crash, if the default action of the signal
is dump, it will enter do_coredump flow and  SIGNAL_GROUP_COREDUMP is
set to signal->flags. If SIGKILL is received, the function of
prepare_signal will check signal->flags, if the bit of
SIGNAL_GROUP_COREDUMP is true and SIGNAL_GROUP_EXIT is false,  the
SIGKILL will respond immediately, process will do exit flow, but now
process is doing coredump. This is abnormal, do_coredump will be break ,
causing causing the coredump to be  truncated.

On Thu, 2020-07-23 at 17:51 -0700, Andrew Morton wrote:
> On Thu, 23 Jul 2020 14:52:23 +0800 "chunlei.wang" <Chunlei.wang@mediatek.com> wrote:
> 
> > do_coredump flow is interrupted by SIGKILL,
> > causing the coredump to be truncated.
> > 
> 
> Please tell us much more about why you think Linux would benefit from
> this change.  Precisely what operational problems are you seeing with
> the current code?
> 
> 
> > ---
> >  arch/Kconfig    | 12 ++++++++++++
> >  kernel/signal.c |  8 ++++++++
> >  2 files changed, 20 insertions(+)
> > 
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 8cc35dc556c7..559eac47093e 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -834,6 +834,18 @@ config OLD_SIGACTION
> >  config COMPAT_OLD_SIGACTION
> >  	bool
> >  
> > +config IGNORE_ANY_SIGNALS
> > +	tristate "ignore any signals when coredump is doing"
> > +	default n
> > +	help
> > +	  The sigkill is very special. If a process receives a sigkill, it
> > will
> > +	  immediately respond to the sigkill. When a process is abnormal and
> > +	  collecting coredump, the do_coredump flow will be interrupted by
> > +	  SIGKILL, causing the coredump to be truncated. This truncated
> > coredump
> > +	  is incomplete, and also gdb can't load.
> > +	  Maybe we can ignore any signlas when process is collecting coredump.
> > +	  This config can decide whether to ignore any signals.
> > +
> >  config COMPAT_32BIT_TIME
> >  	bool "Provide system calls for 32-bit time_t"
> >  	default !64BIT || COMPAT
> > diff --git a/kernel/signal.c b/kernel/signal.c
> > index 5ca48cc5da76..ccae3c84eb6d 100644
> > --- a/kernel/signal.c
> > +++ b/kernel/signal.c
> > @@ -903,6 +903,14 @@ static bool prepare_signal(int sig, struct
> > task_struct *p, bool force)
> >  	sigset_t flush;
> >  
> >  	if (signal->flags & (SIGNAL_GROUP_EXIT | SIGNAL_GROUP_COREDUMP)) {
> > +
> > +#if defined CONFIG_IGNORE_ANY_SIGNALS
> > +		if (signal->flags & SIGNAL_GROUP_COREDUMP) {
> > +			pr_debug("[%d:%s] skip sig %d due to coredump is doing\n",
> > +					p->pid, p->comm, sig);
> > +			return false;
> > +		}
> > +#endif
> >  		if (!(signal->flags & SIGNAL_GROUP_EXIT))
> >  			return sig == SIGKILL;
> >  		/*
> > -- 
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
