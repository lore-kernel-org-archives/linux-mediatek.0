Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C73DC11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 17:46:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F66161416
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 17:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F66161416
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQ/+pOPgvPEB6hsGByJmjqJIqRbTgNzH6HRrKcsuhk0=; b=bgchhf8hYNx3Ay
	Y/UO0gv1qdqKaGEFfl+crFmp7tKBULS+mlt1G7LULy22prbWyiqxrdLIHCwBS8glBoKO6nb9w1xub
	ql/9AK8USM7s9gW1EZjRAeUw67yxIJk57AcfK/hV9x6gi5BFKTH4zUsH7KlNf7zb1Ih4N14rw3YYq
	XK2k2PaFAGUJRcR1he83/m2H8/QFySSjX1lp8PK1/9eXeEeIsn8zR5Z46l+xH3c7sz/fbhk/rwR5G
	CNd4J/iJ8W4wtA3E5O6FasfrUjZye1JTRt/ndnAZ0wISJtX+yiDb8LFnrA9iKrM81wUBGKJPhrukX
	4F+fKkNx8elqElzom1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz0lW-000f3P-Hg; Thu, 01 Jul 2021 17:46:18 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz0lT-000f02-Mj
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 17:46:17 +0000
Received: by mail-yb1-xb31.google.com with SMTP id i4so12198796ybe.2
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Jul 2021 10:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YuEQ/0+GfUXuD93+sD0b18biDb2M6pGGHSqSSO1+UuE=;
 b=LwRldiJ6x3BDPyzWXCUQCVT7w7Nq6ItegVRwz4Hvnijj6RznRtT6uC+9iCLJJYi02f
 zzHxxy8uov62zs7l+LUOTT2P2/0A3RTfmmDwkwSbdU8OeTFmo3+g/0x6stmjWlYW8iP0
 E267aJc0D98iMrWtKF0OqHOsfJuyoO2P4Tnr00mVS7NKlj/jCCwAUYv/76rc9PbWfZb+
 TB92w5TUe9RTMCLYfVSADk2JJ6kpREuyEEXk1uvYzjxbJLOvu/aV47llCbzQX5nsBYk9
 6yxuTDS8ZD5FvhhC9z+ggI6rYAUJqE4pMLgTU7zHXqRc8gm8ltSTr2yK/aIOmZ0b9hCa
 4R1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YuEQ/0+GfUXuD93+sD0b18biDb2M6pGGHSqSSO1+UuE=;
 b=BuMo5uFqCvfjRl2RwG3VUMB3/yihLB4YeifWpLDQPOGB2a+wCOCRcrIg7mtxzfpHu1
 k5lV/mWtb2vXn6v5KQ2uU8i5+cLP70gZakmfclj+aQJxhBsfV9ewhggNfqRJjUJXF5Rk
 Yk2PT2WpXiW5QN1Fw8iKNj7yNQLXNNZCXZhqWwdZ88IvVuOwMQRg/SgW5kl0bukwwbpg
 oE1diBUm2txXB76rz4vbraA5gUhOjsd8FTN5WZ9M4hnMR+LnD5N9yWjexZqyGjxoIGcU
 NRSofwzjPx+UKAEHsJ0OOgaA11GqSKzSQLVH6T14eXGZiOOwipdtNEiyx5SU5GMw+zcp
 w05w==
X-Gm-Message-State: AOAM530m4461goZZLgUH0dkCiDCISBkCMKjw3NKK/StpvmwAChevucM/
 oBF0CZN/5pp2aiY00eCuCxJ0+YPqMUsVraEO2oEnTQ==
X-Google-Smtp-Source: ABdhPJyW+2rNHz7TTh5ZLTxu/vUeNLQKnS5QAbeoiQWOV850EJ4EckVI9IjlgDPCCTSf4VVjHk8r9Cs11z6N8Gfg6qc=
X-Received: by 2002:a25:2e49:: with SMTP id b9mr1337732ybn.250.1625161571802; 
 Thu, 01 Jul 2021 10:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210630205151.137001-1-surenb@google.com>
 <YN2DsLlE+WtxK6K9@hirez.programming.kicks-ass.net>
 <YN3vyvoDwSUepM18@cmpxchg.org>
In-Reply-To: <YN3vyvoDwSUepM18@cmpxchg.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 1 Jul 2021 10:46:00 -0700
Message-ID: <CAJuCfpFTWUWmr_Zjj9d1rzNvtO9MjD-FQo1-j0aE6XN74b7_Lg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Benjamin Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
 Daniel Bristot de Oliveira <bristot@redhat.com>, matthias.bgg@gmail.com, 
 Minchan Kim <minchan@google.com>, Tim Murray <timmurray@google.com>, 
 YT Chang <yt.chang@mediatek.com>,
 =?UTF-8?B?V2VuanUgWHUgKOiuuOaWh+S4vik=?= <wenju.xu@mediatek.com>, 
 =?UTF-8?B?Sm9uYXRoYW4gSk1DaGVuICjpmbPlrrbmmI4p?=
 <jonathan.jmchen@mediatek.com>, 
 LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel-team <kernel-team@android.com>, 
 SH Chen <show-hong.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_104615_791968_066BE7C2 
X-CRM114-Status: GOOD (  25.79  )
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

On Thu, Jul 1, 2021 at 9:39 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> On Thu, Jul 01, 2021 at 10:58:24AM +0200, Peter Zijlstra wrote:
> > On Wed, Jun 30, 2021 at 01:51:51PM -0700, Suren Baghdasaryan wrote:
> > > +   /* cmpxchg should be called even when !force to set poll_scheduled */
> > > +   if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) && !force)
> > >             return;
> >
> > Why is that a cmpxchg() ?
>
> I now realize you had already pointed that out, but I dismissed it in
> the context of poll_lock not being always taken after all.
>
> But you're right, cmpxchg indeed seems inappropriate. xchg will do
> just fine for this binary toggle.
>
> When it comes to ordering, looking at it again, I think we actually
> need ordering here that the seqcount doesn't provide. We have:
>
> timer:
> scheduled = 0
> smp_rmb()
> x = state
>
> scheduler:
> state = y
> smp_wmb()
> if xchg(scheduled, 1) == 0
>   mod_timer()
>
> Again, the requirement is that when the scheduler sees the timer as
> already or still pending, the timer must observe its state updates -
> otherwise we miss poll events.
>
> The seqcount provides the wmb and rmb, but the scheduler-side read of
> @scheduled mustn't be reordered before the write to @state. Likewise,
> the timer-side read of @state also mustn't occur before the write to
> @scheduled.
>
> AFAICS this is broken, not just in the patch, but also in the current
> code when timer_pending() on the scheduler side gets reordered. (Not
> sure if timer reading state can be reordered before the detach_timer()
> of its own expiration, but I don't see full ordering between them.)
>
> So it seems to me we need the ordered atomic_xchg() on the scheduler
> side, and on the timer side an smp_mb() after we set scheduled to 0.

Thanks for the analysis Johannes. Let me dwell on it a bit.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
