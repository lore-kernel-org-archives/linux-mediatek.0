Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2656CC001B0
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjO6Ct8hKjOL2j6zv6lo3CzVUIMch7lPoxf820Is+Lc=; b=mKdrP8y8tzFrMnACZ47V/Lz61O
	KU0TqzmnWWS37NIPstrRLjKz9wmDvFKIapnuIY07fIHGwof+ak3NJqQrKCW0qPaaAfMMLaC417SbZ
	mxUME4TvGz4mI5CtGA88GsNneKU1Lnocx3M78JcW1/8emC1dgUZwpHTdd54jSb8z16E70ySdL1zle
	M8Tzjhb23dhWtZNsSo2OjDILqQO4it0THPfa5fiMLDIcM0OkO+c/VLiIAVk38U2weJCimhvMsGGba
	ncyZe77n6XtTq6MhBQ+gA4EPJSBRVgQIxm2CixGauMCpduEpW2uN8pQjKp3kbH0VMcT0F7BXEUb1U
	eP1UvrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMBN-006iMk-1o;
	Fri, 14 Jul 2023 17:02:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMBJ-006iLa-1N;
	Fri, 14 Jul 2023 17:02:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1EF2D61D52;
	Fri, 14 Jul 2023 17:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754D8C433C8;
	Fri, 14 Jul 2023 17:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689354130;
	bh=jY6JZxKceDtVZD4Gt1yOdz9n+P+MKOe0fgA+nUL1asY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=lVDdgcy6wu6DgGYTSgR37ppjVW6mcMp7lZ+9syQr5XuU9PVInkTh8p+1zs8uUv23H
	 ERsMBzcIO+Nnq2qgU2LUsvZGA6LXRvy3ITeapw95JehlLDCY1x+m1xrQNkVLtsPRby
	 9Ct2BLyGq3pUyrhc3SJ6hgKK5wJGi4knIU98s//qe+J/xPOWqBFMv1vEznnT4/u2eO
	 fL1kmvuAMS/8XFpOrIf40/rcfHTaevI21jB6Rn4Em1gmUPrdt5BSiFxc1ZBcuJNo+Y
	 3wgNkiGu1QSHbreTAqP+NBA9airT5t6KwlYjQfOVBxITLeIQl3VmS75u+Eo/Efz2A0
	 4Yh24fqoZXBfQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 13CC3CE03B3; Fri, 14 Jul 2023 10:02:10 -0700 (PDT)
Date: Fri, 14 Jul 2023 10:02:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: Joel Fernandes <joel@joelfernandes.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-erofs@lists.ozlabs.org, xiang@kernel.org,
	Will Shiu <Will.Shiu@mediatek.com>, kernel-team@android.com,
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when
 !CONFIG_DEBUG_LOCK_ALLOC
Message-ID: <e8ee7006-c1d0-4c04-bd25-0f518fb6534b@paulmck-laptop>
References: <f124e041-6a82-2069-975c-4f393e5c4137@linux.alibaba.com>
 <87292a44-cc02-4d95-940e-e4e31d0bc6f2@paulmck-laptop>
 <f1c60dcb-e32f-7b7e-bf0d-5dec999e9299@linux.alibaba.com>
 <CAEXW_YSODXRfgkR0D2G-x=0uZdsqvF3kZL+LL3DcRX-5CULJ1Q@mail.gmail.com>
 <894a3b64-a369-7bc6-c8a8-0910843cc587@linux.alibaba.com>
 <CAEXW_YSM1yik4yWTgZoxCS9RM6TbsL26VCVCH=41+uMA8chfAQ@mail.gmail.com>
 <58b661d0-0ebb-4b45-a10d-c5927fb791cd@paulmck-laptop>
 <7d433fac-a62d-4e81-b8e5-57cf5f2d1d55@paulmck-laptop>
 <F160D7F8-57DC-4986-90A9-EB50F7C89891@gmail.com>
 <6E5326AD-9A5D-4570-906A-BDE8257B6F0C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6E5326AD-9A5D-4570-906A-BDE8257B6F0C@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_100213_545606_6D336911 
X-CRM114-Status: GOOD (  45.48  )
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
Reply-To: paulmck@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 14, 2023 at 11:54:47PM +0800, Alan Huang wrote:
> 
> > 2023年7月14日 23:35，Alan Huang <mmpgouride@gmail.com> 写道：
> > 
> >> 
> >> 2023年7月14日 10:16，Paul E. McKenney <paulmck@kernel.org> 写道：
> >> 
> >> On Thu, Jul 13, 2023 at 09:33:35AM -0700, Paul E. McKenney wrote:
> >>> On Thu, Jul 13, 2023 at 11:33:24AM -0400, Joel Fernandes wrote:
> >>>> On Thu, Jul 13, 2023 at 10:34 AM Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
> >>>>> On 2023/7/13 22:07, Joel Fernandes wrote:
> >>>>>> On Thu, Jul 13, 2023 at 12:59 AM Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
> >>>>>>> On 2023/7/13 12:52, Paul E. McKenney wrote:
> >>>>>>>> On Thu, Jul 13, 2023 at 12:41:09PM +0800, Gao Xiang wrote:
> >>>>>>> 
> >>>>>>> ...
> >>>>>>> 
> >>>>>>>>> 
> >>>>>>>>> There are lots of performance issues here and even a plumber
> >>>>>>>>> topic last year to show that, see:
> >>>>>>>>> 
> >>>>>>>>> [1] https://lore.kernel.org/r/20230519001709.2563-1-tj@kernel.org
> >>>>>>>>> [2] https://lore.kernel.org/r/CAHk-=wgE9kORADrDJ4nEsHHLirqPCZ1tGaEPAZejHdZ03qCOGg@mail.gmail.com
> >>>>>>>>> [3] https://lore.kernel.org/r/CAB=BE-SBtO6vcoyLNA9F-9VaN5R0t3o_Zn+FW8GbO6wyUqFneQ@mail.gmail.com
> >>>>>>>>> [4] https://lpc.events/event/16/contributions/1338/
> >>>>>>>>> and more.
> >>>>>>>>> 
> >>>>>>>>> I'm not sure if it's necessary to look info all of that,
> >>>>>>>>> andSandeep knows more than I am (the scheduling issue
> >>>>>>>>> becomes vital on some aarch64 platform.)
> >>>>>>>> 
> >>>>>>>> Hmmm...  Please let me try again.
> >>>>>>>> 
> >>>>>>>> Assuming that this approach turns out to make sense, the resulting
> >>>>>>>> patch will need to clearly state the performance benefits directly in
> >>>>>>>> the commit log.
> >>>>>>>> 
> >>>>>>>> And of course, for the approach to make sense, it must avoid breaking
> >>>>>>>> the existing lockdep-RCU debugging code.
> >>>>>>>> 
> >>>>>>>> Is that more clear?
> >>>>>>> 
> >>>>>>> Personally I'm not working on Android platform any more so I don't
> >>>>>>> have a way to reproduce, hopefully Sandeep could give actually
> >>>>>>> number _again_ if dm-verity is enabled and trigger another
> >>>>>>> workqueue here and make a comparsion why the scheduling latency of
> >>>>>>> the extra work becomes unacceptable.
> >>>>>>> 
> >>>>>> 
> >>>>>> Question from my side, are we talking about only performance issues or
> >>>>>> also a crash? It appears z_erofs_decompress_pcluster() takes
> >>>>>> mutex_lock(&pcl->lock);
> >>>>>> 
> >>>>>> So if it is either in an RCU read-side critical section or in an
> >>>>>> atomic section, like the softirq path, then it may
> >>>>>> schedule-while-atomic or trigger RCU warnings.
> >>>>>> 
> >>>>>> z_erofs_decompressqueue_endio
> >>>>>> -> z_erofs_decompress_kickoff
> >>>>>> ->z_erofs_decompressqueue_work
> >>>>>>  ->z_erofs_decompress_queue
> >>>>>>   -> z_erofs_decompress_pcluster
> >>>>>>    -> mutex_lock
> >>>>>> 
> >>>>> 
> >>>>> Why does the softirq path not trigger a workqueue instead?
> >>>> 
> >>>> I said "if it is". I was giving a scenario. mutex_lock() is not
> >>>> allowed in softirq context or in an RCU-reader.
> >>>> 
> >>>>>> Per Sandeep in [1], this stack happens under RCU read-lock in:
> >>>>>> 
> >>>>>> #define __blk_mq_run_dispatch_ops(q, check_sleep, dispatch_ops) \
> >>>>>> [...]
> >>>>>>                rcu_read_lock();
> >>>>>>                (dispatch_ops);
> >>>>>>                rcu_read_unlock();
> >>>>>> [...]
> >>>>>> 
> >>>>>> Coming from:
> >>>>>> blk_mq_flush_plug_list ->
> >>>>>>                           blk_mq_run_dispatch_ops(q,
> >>>>>>                                __blk_mq_flush_plug_list(q, plug));
> >>>>>> 
> >>>>>> and __blk_mq_flush_plug_list does this:
> >>>>>>          q->mq_ops->queue_rqs(&plug->mq_list);
> >>>>>> 
> >>>>>> This somehow ends up calling the bio_endio and the
> >>>>>> z_erofs_decompressqueue_endio which grabs the mutex.
> >>>>>> 
> >>>>>> So... I have a question, it looks like one of the paths in
> >>>>>> __blk_mq_run_dispatch_ops() uses SRCU.  Where are as the alternate
> >>>>>> path uses RCU. Why does this alternate want to block even if it is not
> >>>>>> supposed to? Is the real issue here that the BLK_MQ_F_BLOCKING should
> >>>>>> be set? It sounds like you want to block in the "else" path even
> >>>>>> though BLK_MQ_F_BLOCKING is not set:
> >>>>> 
> >>>>> BLK_MQ_F_BLOCKING is not a flag that a filesystem can do anything with.
> >>>>> That is block layer and mq device driver stuffs. filesystems cannot set
> >>>>> this value.
> >>>>> 
> >>>>> As I said, as far as I understand, previously,
> >>>>> .end_io() can only be called without RCU context, so it will be fine,
> >>>>> but I don't know when .end_io() can be called under some RCU context
> >>>>> now.
> >>>> 
> >>>>> From what Sandeep described, the code path is in an RCU reader. My
> >>>> question is more, why doesn't it use SRCU instead since it clearly
> >>>> does so if BLK_MQ_F_BLOCKING. What are the tradeoffs? IMHO, a deeper
> >>>> dive needs to be made into that before concluding that the fix is to
> >>>> use rcu_read_lock_any_held().
> >>> 
> >>> How can this be solved?
> >>> 
> >>> 1. Always use a workqueue.  Simple, but is said to have performance
> >>> issues.
> >>> 
> >>> 2. Pass a flag in that indicates whether or not the caller is in an
> >>> RCU read-side critical section.  Conceptually simple, but might
> >>> or might not be reasonable to actually implement in the code as
> >>> it exists now. (You tell me!)
> >>> 
> >>> 3. Create a function in z_erofs that gives you a decent
> >>> approximation, maybe something like the following.
> >>> 
> >>> 4. Other ideas here.
> >> 
> >> 5. #3 plus make the corresponding Kconfig option select
> >> PREEMPT_COUNT, assuming that any users needing compression in
> >> non-preemptible kernels are OK with PREEMPT_COUNT being set.
> >> (Some users of non-preemptible kernels object strenuously
> >> to the added overhead from CONFIG_PREEMPT_COUNT=y.)
> > 
> > 6. Set one bit in bio->bi_private, check the bit and flip it in rcu_read_lock() path,
> > then in z_erofs_decompressqueue_endio, check if the bit has changed.
> 
> Seems bad, read and modify bi_private is a bad idea.

Is there some other field that would work?

							Thanx, Paul

> > Not sure if this is feasible or acceptable. :)
> > 
> >> 
> >> Thanx, Paul
> >> 
> >>> The following is untested, and is probably quite buggy, but it should
> >>> provide you with a starting point.
> >>> 
> >>> static bool z_erofs_wq_needed(void)
> >>> {
> >>> if (IS_ENABLED(CONFIG_PREEMPTION) && rcu_preempt_depth())
> >>> return true;  // RCU reader
> >>> if (IS_ENABLED(CONFIG_PREEMPT_COUNT) && !preemptible())
> >>> return true;  // non-preemptible
> >>> if (!IS_ENABLED(CONFIG_PREEMPT_COUNT))
> >>> return true;  // non-preeemptible kernel, so play it safe
> >>> return false;
> >>> }
> >>> 
> >>> You break it, you buy it!  ;-)
> >>> 
> >>> Thanx, Paul
> 
> 

