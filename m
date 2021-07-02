Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B90C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 09:28:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 556ED6120D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 09:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 556ED6120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDUmWiCeSRLM4Lqnb++ULNu4/rdrWtzeOjzEN4ZqB2A=; b=rwkvvpK/YSBwb5
	t8s+E98C3LwxeI7lioMV6CsTrVTCmI9aji6SBfhCE1MNYmlnWzqSrNUAhTvrht55Iv4ngw0HfUa07
	69WjCU6ZRCtUxSwBUxphldUx1AfnJdpYr/fA7dNNdHt8W+VAHK9FsUY6yV2RUWGSt9GIDUORbQ7+A
	OQY1hSYKdAl96R8YIVJRpGz3oFmX4Etr8OznwGHDWxVqAElKZoXh/ziFpBi+WLddCkAzek1XYpijd
	ReAbCGGr3n6I79qHE/NjOnEEFQ//Csw24YEsXSIphWE67VxPG2x2YSnx7SXsX8LCbIDGm/pNPyXMV
	wnpZlIljlcCOETQJcycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzFTF-002clC-LE; Fri, 02 Jul 2021 09:28:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzFT4-002cju-VJ; Fri, 02 Jul 2021 09:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=v8zrj1V6xVcbepaiWjbS8RX/IKFy1g4AS4gveeyabo0=; b=M2RmgXOBRo85weL/DN4WbfCTsM
 msh2vX1S2LNpJeOv1OnqIHC3/D2z2XO2JnaPYsB/gML0pm9QEoP/8Zt1dDVhX65HYNhpMsz1qOHUt
 VWN/fIMSINkpa2Je04+48lNrjC1pJPo/SCGId5oJaA7XclfTQT/fnlw0sz2kP12pSZseof8Zkux1r
 r9kRqHgL3XXQQ2pct1v0qdzgqGOVJr1V+AfPz4CA3ONk+tCgJe0F6BdC5hrRFZArCtDLdicb/hJy7
 j/8pNYUqbzX//LWS1RCJhe4fz70uTSJG/ItmIuwlH5ov3yPpz2P0bBL0KasSAxp3sTP0V10vJ7uNj
 iuiq02ZA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzFSy-00DpD7-NH; Fri, 02 Jul 2021 09:28:09 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 932E2300091;
 Fri,  2 Jul 2021 11:28:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 724F12DD2264A; Fri,  2 Jul 2021 11:28:05 +0200 (CEST)
Date: Fri, 2 Jul 2021 11:28:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Benjamin Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 matthias.bgg@gmail.com, Minchan Kim <minchan@google.com>,
 Tim Murray <timmurray@google.com>, YT Chang <yt.chang@mediatek.com>,
 Wenju Xu =?utf-8?B?KOiuuOaWh+S4vik=?= <wenju.xu@mediatek.com>,
 Jonathan JMChen =?utf-8?B?KOmZs+WutuaYjik=?= <jonathan.jmchen@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-team <kernel-team@android.com>,
 SH Chen <show-hong.chen@mediatek.com>
Subject: Re: [PATCH v2 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
Message-ID: <YN7cJZOZzjYJFClR@hirez.programming.kicks-ass.net>
References: <20210630205151.137001-1-surenb@google.com>
 <YN2DsLlE+WtxK6K9@hirez.programming.kicks-ass.net>
 <CAJuCfpF=Ty4ruiKQQweVoF6Ojx8P8LxvUBxp1TmMFo2W1xNWfg@mail.gmail.com>
 <YN3pUNgpBjn42f8s@hirez.programming.kicks-ass.net>
 <CAJuCfpFKDhcgjU=MGsz+JuetrWvYCe0EL3FMp91zopH+8T=mMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpFKDhcgjU=MGsz+JuetrWvYCe0EL3FMp91zopH+8T=mMQ@mail.gmail.com>
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

On Thu, Jul 01, 2021 at 09:28:04AM -0700, Suren Baghdasaryan wrote:
> On Thu, Jul 1, 2021 at 9:12 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Thu, Jul 01, 2021 at 09:09:25AM -0700, Suren Baghdasaryan wrote:
> > > On Thu, Jul 1, 2021 at 1:59 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > > >
> > > > On Wed, Jun 30, 2021 at 01:51:51PM -0700, Suren Baghdasaryan wrote:
> > > > > +     /* cmpxchg should be called even when !force to set poll_scheduled */
> > > > > +     if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) && !force)
> > > > >               return;
> > > >
> > > > Why is that a cmpxchg() ?
> > >
> > > We want to set poll_scheduled and proceed with rescheduling the timer
> > > unless it's already scheduled, so cmpxchg helps us to make that
> > > decision atomically. Or did I misunderstand your question?
> >
> > What's wrong with: atomic_xchg(&group->poll_scheduled, 1) ?
> 
> Yes, since poll_scheduled can be only 0 or 1 atomic_xchg should work
> fine here. Functionally equivalent but I assume atomic_xchg() is more
> efficient due to no comparison.

Mostly conceptually simpler; the cmpxchg-on-0 makes that you have to
check if there's ever any state outside of {0,1}. The xchg() thing is
the classical test-and-set pattern.

On top of all that, the cmpxchg() can fail, which brings ordering
issues.

Typically, I think, you want to ensure that everything that happens
before psi_schedule_poll_work() is visible to the work when it runs
(also see Johannes' email). In case poll_scheduled is already 1, the
cmpxchg will fail and *NOT* provide that ordering. Meaning the work
might not observe the latest changes. xchg() doesn't have this subtlety.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
