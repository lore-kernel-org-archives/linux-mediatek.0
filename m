Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1CFC11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 16:40:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B072B613DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 16:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B072B613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMnD7DsVni39YiFB72s6ENh0JnMgNRJrQgK4QaPpz/0=; b=DSz8W3qFpZDOai
	b1TcS0Bx+E17Eu/qfLsrhyvacZsvKKn7A/yOdV3DmkkSMEIyyJ3JeDpPkU16KJdUcHgBlPp14jylL
	um+VZ5qj5DDfTH8mg4QzupkpQU/KsSBtZ4mFTDs3JdNqi+kKtn48HVCXPOPTjh1mEquwdVQjGCtCk
	DtR+zQii/nDb9jN5go6/6w8j8dJZFE5Qr6ZERe+j5lsceR1s5JYx24LfeM56+q1J31u9IHGMO2pi7
	3FlK6xog/Qg22Vd41goO9qXsw6OHAd8BTAKgGCDRIb5UdIX5Xmt0TOUymWs3h60Hffqr0oN/NbNU8
	c+GUQ0LUYjb3UOJTrFww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyzjK-000SpN-E6; Thu, 01 Jul 2021 16:39:58 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyzj6-000Smq-1o
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 16:39:46 +0000
Received: by mail-pg1-x529.google.com with SMTP id e33so6636666pgm.3
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Jul 2021 09:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cfR2cpEKwd7JnwMd7pln/e5tA5maTHJfnUSpc6bVutM=;
 b=hd3FmeECoBLGhbkNg99GbCXDXsYXw0+us5vtgKFZNZj0P+an07WD20BVGZ0D3rstzY
 AxCHukR8Iiijs6HfR2C0vBEYprz/T8BgKA2xRxiNofkCzKDyjGlf7Y4v6vLelqUcVaEI
 LzVJfkVmWsCr6WRLFTqWhEa2bDKkzKGLBsyyetIirE5hgm4L2bvSoFTapDNIwaSjk2RE
 SUmdZ95HuCy4XNmntWeqUGernbMehmL3KA+rxWVQ8FM75r9tXzNQ83lBMHLUduU2q9fT
 pSeyU14m0RANquZGfLRE57nVMh/DpTMeReOLQEIsYsY7Oxeb6+wMSGRxnOgpUDnkdu2o
 N2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cfR2cpEKwd7JnwMd7pln/e5tA5maTHJfnUSpc6bVutM=;
 b=n9j4hhE+Idmuqi9mJss9diD84quuhcKpbAwbIhv6/C89Kbgy7YH0NuQrjoJxypiclc
 PQviUfbPTa+Dvx7t8u7oE7UiCB4RYg4yts7L7t03PV0MEJ2Z4EizZuhirTIp+cSPcvl2
 D4h51iKY6Rqlj86wBuB5WxZXJy6lbQqYHwbASSwXAuJqNqw4nsD+LVayDGsG7T2Nk38I
 htzqJlMEnT3JMH7PPmLR0Y1bRfbNdSyCtq/hZRqMVeA4EU3OpXmNltxLjBJQjq9qQXAY
 rKlp1oLv08bojx2QEk7bF9evfoQnpgeUxciiMIMp3rRSgqb3ce42jBBjjvBvaEPsPf7H
 jd2Q==
X-Gm-Message-State: AOAM531JIcpxWm4K/7197/vyv/v+LfQ6sSCL1bqVg+S8ULFxoTsqujeE
 L31A0JI4G8zvIO/K8gS2GVMx9w==
X-Google-Smtp-Source: ABdhPJwybx/XAmsHosT1b2ZP2gPi4pjG51QHEkjfIgVkF3UL8gkxmxo0KDwi5eVlCQ13ykwKNY3X2w==
X-Received: by 2002:a63:1913:: with SMTP id z19mr483993pgl.294.1625157581991; 
 Thu, 01 Jul 2021 09:39:41 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:726f])
 by smtp.gmail.com with ESMTPSA id b10sm487999pfi.122.2021.07.01.09.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 09:39:41 -0700 (PDT)
Date: Thu, 1 Jul 2021 12:39:38 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>, mingo@redhat.com,
 juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, bristot@redhat.com, matthias.bgg@gmail.com,
 minchan@google.com, timmurray@google.com, yt.chang@mediatek.com,
 wenju.xu@mediatek.com, jonathan.jmchen@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-team@android.com,
 SH Chen <show-hong.chen@mediatek.com>
Subject: Re: [PATCH v2 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
Message-ID: <YN3vyvoDwSUepM18@cmpxchg.org>
References: <20210630205151.137001-1-surenb@google.com>
 <YN2DsLlE+WtxK6K9@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YN2DsLlE+WtxK6K9@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_093944_127730_450422A7 
X-CRM114-Status: GOOD (  17.33  )
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

On Thu, Jul 01, 2021 at 10:58:24AM +0200, Peter Zijlstra wrote:
> On Wed, Jun 30, 2021 at 01:51:51PM -0700, Suren Baghdasaryan wrote:
> > +	/* cmpxchg should be called even when !force to set poll_scheduled */
> > +	if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) && !force)
> >  		return;
> 
> Why is that a cmpxchg() ?

I now realize you had already pointed that out, but I dismissed it in
the context of poll_lock not being always taken after all.

But you're right, cmpxchg indeed seems inappropriate. xchg will do
just fine for this binary toggle.

When it comes to ordering, looking at it again, I think we actually
need ordering here that the seqcount doesn't provide. We have:

timer:
scheduled = 0
smp_rmb()
x = state

scheduler:
state = y
smp_wmb()
if xchg(scheduled, 1) == 0
  mod_timer()

Again, the requirement is that when the scheduler sees the timer as
already or still pending, the timer must observe its state updates -
otherwise we miss poll events.

The seqcount provides the wmb and rmb, but the scheduler-side read of
@scheduled mustn't be reordered before the write to @state. Likewise,
the timer-side read of @state also mustn't occur before the write to
@scheduled.

AFAICS this is broken, not just in the patch, but also in the current
code when timer_pending() on the scheduler side gets reordered. (Not
sure if timer reading state can be reordered before the detach_timer()
of its own expiration, but I don't see full ordering between them.)

So it seems to me we need the ordered atomic_xchg() on the scheduler
side, and on the timer side an smp_mb() after we set scheduled to 0.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
