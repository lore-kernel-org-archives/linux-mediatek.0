Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0E1C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 16:12:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 997AA61411
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 16:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 997AA61411
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkKngHyNTer7VQE7PEXX+xxUFFuTtvwBuCMLTq0/koY=; b=D3jwEv09YcrObP
	9avapTPcrqi+xtDcSvCQZytvvgAcTBKUBJboHh0auaCUkcaUFyK+Y91mMRLNhdNyKlWtCYKUoLGuO
	LzcOf7E8R56AVOp1gbH6kQ2vuWd4IyKs4Azppsu8W1NdZIpo0yVeZ2AGlpwxjq32i1tIld+lNUpAq
	w+4rsmk3LkY09NQvy1BIUvdjeVoHstsePTM1gUXMx2Ftt0Btt9y7AmabKsiESBjRZAzmfZz6vUo9W
	Hd3Uz5i8fW3aiNVEdRiB+1jxAnmwsm8C5KRNGK0PuqImaEt97CE6EOwq5d/NuT1ciNQs3bz9wJk09
	9LzEQmMyx6CQl+MZgBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyzIp-000N0t-UA; Thu, 01 Jul 2021 16:12:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyzId-000Mww-BQ; Thu, 01 Jul 2021 16:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SDYozNhStxAiY5qNPydI3RWJmmOM1sqq31q5Qa3cOzY=; b=Tl/in+5MjOSyzhrg3caYBLA1QJ
 pXqrzT+tleAKq2Y4y7XL4dVmnkVIScDKePPTW3vdoRJdHPHjJb769SAKleZLc4wW7yamWj+4NQA80
 DVWwjfIyCmLoFQ11nAAjl+jeLZZw6qV8y6bhUcZqeAKmSfhMDOMQYRl7Q/IBk4yJMdCGP3L7SiAf2
 KWbZJYTXEvICDdBMBas+KnibM/3KKTuAH4qgZET5MoqFBiZBtvA3Bph5L83/fPTVOCZ2I6VNMnxSN
 4zkKnNwjjiEN9fAFZ3355o167BAz0K69PgoriDeblma8xsO5vi7dXgAM/LXaTC/PcQ4pxwq5Kyz7D
 aOy75pvA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyzII-006kbX-TP; Thu, 01 Jul 2021 16:12:06 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E69E3300067;
 Thu,  1 Jul 2021 18:12:00 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C481920198B95; Thu,  1 Jul 2021 18:12:00 +0200 (CEST)
Date: Thu, 1 Jul 2021 18:12:00 +0200
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
Message-ID: <YN3pUNgpBjn42f8s@hirez.programming.kicks-ass.net>
References: <20210630205151.137001-1-surenb@google.com>
 <YN2DsLlE+WtxK6K9@hirez.programming.kicks-ass.net>
 <CAJuCfpF=Ty4ruiKQQweVoF6Ojx8P8LxvUBxp1TmMFo2W1xNWfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpF=Ty4ruiKQQweVoF6Ojx8P8LxvUBxp1TmMFo2W1xNWfg@mail.gmail.com>
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

On Thu, Jul 01, 2021 at 09:09:25AM -0700, Suren Baghdasaryan wrote:
> On Thu, Jul 1, 2021 at 1:59 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Wed, Jun 30, 2021 at 01:51:51PM -0700, Suren Baghdasaryan wrote:
> > > +     /* cmpxchg should be called even when !force to set poll_scheduled */
> > > +     if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) && !force)
> > >               return;
> >
> > Why is that a cmpxchg() ?
> 
> We want to set poll_scheduled and proceed with rescheduling the timer
> unless it's already scheduled, so cmpxchg helps us to make that
> decision atomically. Or did I misunderstand your question?

What's wrong with: atomic_xchg(&group->poll_scheduled, 1) ?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
