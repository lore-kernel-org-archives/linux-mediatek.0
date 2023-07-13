Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B5AC001DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 22:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEg1X3cEwlNpx1ZsaMSsEvD6NbkWXibLIE8lL4NXqaQ=; b=nTUTo1/VClekgQtiOLKYDyPALz
	Tqu7EB7JrfV9Yr/7DcmI87Ta9epnlhooOKJGMlNZHJLeDBq35RW2wjBG+7cYDV3LVcAzYzuQFbGCB
	zzbwPkcn8n2EOn6vzesaLOtQZgT4qtGGLOwGYiJB8BDD25yF+lGF/gfIPpk4anQDA831EsUolnmCb
	K6dFAheR7Krx92mIx5Vdh46loIg9TRNPfJ0wcIuIQVhu3mJmVsjk0WEnr6EhesXiqYd5HJ7pII51r
	0nMZrGKISYjDDtBA8NDWzGVvD2egAqP3l9w3Emm17Vll/5dpHw1BId29tBFrB5KzNIsd3s0uVpho9
	yBDlmMig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK4my-004Rgv-2Y;
	Thu, 13 Jul 2023 22:27:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK4mu-004RgB-2l;
	Thu, 13 Jul 2023 22:27:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5CDBF61B45;
	Thu, 13 Jul 2023 22:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50A3C433C7;
	Thu, 13 Jul 2023 22:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689287269;
	bh=I0kzTZFnlT4bjc9zwoxuBIX+VXnchct3aq2xuHL8IYo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=CtEyUvbAxF6FVHziF3TS/0lxpvj6yBjBMohtclxty9JMh/uF6UP5IKjrq5mf8gv4y
	 rxUNzs3Ae6sMV/bwrswqCYFDRzIkA10QYAv5IEUvgWHybKmm2HUaQlFaKtXyIvx1Rw
	 0A+90KhNOAFWlv4FFMGGLHtz0MNKse0SntlPnrFbE/Sizwxo5ABAT4YOfQyg2/9TEI
	 9gYOazxSQEJZfSJVjpVfONZqUMcHXjcBBuX6nSEqEJJsvCB3t4YuwMUG8PyCm9hqMy
	 d8fGCIeHhkLFBLBSNOFBV5RX1OyccAZeSg1unwaXxb+rbaFQUKX47d9EWH9l9pnO1O
	 6P71OvZO2g/Bg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 49328CE009E; Thu, 13 Jul 2023 15:27:49 -0700 (PDT)
Date: Thu, 13 Jul 2023 15:27:49 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: Alan Huang <mmpgouride@gmail.com>,
	Joel Fernandes <joel@joelfernandes.org>,
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
Message-ID: <9467912e-dc27-4e3f-861f-d1c4117ddce5@paulmck-laptop>
References: <0d9e7b4d-6477-47a6-b3d2-2c9d9b64903d@paulmck-laptop>
 <f124e041-6a82-2069-975c-4f393e5c4137@linux.alibaba.com>
 <87292a44-cc02-4d95-940e-e4e31d0bc6f2@paulmck-laptop>
 <f1c60dcb-e32f-7b7e-bf0d-5dec999e9299@linux.alibaba.com>
 <CAEXW_YSODXRfgkR0D2G-x=0uZdsqvF3kZL+LL3DcRX-5CULJ1Q@mail.gmail.com>
 <894a3b64-a369-7bc6-c8a8-0910843cc587@linux.alibaba.com>
 <CAEXW_YSM1yik4yWTgZoxCS9RM6TbsL26VCVCH=41+uMA8chfAQ@mail.gmail.com>
 <F7D5032D-908E-4227-8A38-AF740AC86CDC@gmail.com>
 <c62bd3db-5ed3-4dbf-bba9-d9dace23312c@paulmck-laptop>
 <57b07fc3-6049-6ace-2523-2d013273c456@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57b07fc3-6049-6ace-2523-2d013273c456@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_152752_977520_134878DA 
X-CRM114-Status: GOOD (  43.98  )
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

On Fri, Jul 14, 2023 at 03:00:25AM +0800, Gao Xiang wrote:
> On 2023/7/14 02:14, Paul E. McKenney wrote:
> > On Fri, Jul 14, 2023 at 12:09:27AM +0800, Alan Huang wrote:
> 
> ...
> 
> > > > 
> > > >  From what Sandeep described, the code path is in an RCU reader. My
> > > > question is more, why doesn't it use SRCU instead since it clearly
> > > > does so if BLK_MQ_F_BLOCKING. What are the tradeoffs? IMHO, a deeper
> > > > dive needs to be made into that before concluding that the fix is to
> > > > use rcu_read_lock_any_held().
> > > 
> > > Copied from [1]:
> > > 
> > > "Background: Historically erofs would always schedule a kworker for
> > >   decompression which would incur the scheduling cost regardless of
> > >   the context. But z_erofs_decompressqueue_endio() may not always
> > >   be in atomic context and we could actually benefit from doing the
> > >   decompression in z_erofs_decompressqueue_endio() if we are in
> > >   thread context, for example when running with dm-verity.
> > >   This optimization was later added in patch [2] which has shown
> > >   improvement in performance benchmarks.”
> > > 
> > > I’m not sure if it is a design issue.
> 
> What do you mean a design issue, honestly?  I feel uneasy to hear this.
> 
> > I have no official opinion myself, but there are quite a few people
> > who firmly believe that any situation like this one (where driver or
> > file-system code needs to query the current context to see if blocking
> > is OK) constitutes a design flaw.  Such people might argue that this
> > code path should have a clearly documented context, and that if that
> > documentation states that the code might be in atomic context, then the
> > driver/fs should assume atomic context.  Alternatively, if driver/fs
> 
> I don't think a software decoder (for example, decompression) should be
> left in the atomic context honestly.
> 
> Regardless of the decompression speed of some algorithm theirselves
> (considering very slow decompression on very slow devices), it means
> that we also don't have a way to vmap or likewise (considering
> decompression + handle extra deduplication copies) in the atomic
> context, even memory allocation has to be in an atomic way.
> 
> Especially now have more cases that decodes in the RCU reader context
> apart from softirq contexts?

Just out of curiosity, why are these cases within RCU readers happening?
Is this due to recent MM changes?  But yes, you would have the same
problem in softirq context.

> > needs the context to be non-atomic, the callers should make it so.
> > 
> > See for example in_atomic() and its comment header:
> > 
> > /*
> >   * Are we running in atomic context?  WARNING: this macro cannot
> >   * always detect atomic context; in particular, it cannot know about
> >   * held spinlocks in non-preemptible kernels.  Thus it should not be
> >   * used in the general case to determine whether sleeping is possible.
> >   * Do not use in_atomic() in driver code.
> >   */
> > #define in_atomic()	(preempt_count() != 0)
> > 
> > In the immortal words of Dan Frye, this should be good clean fun!  ;-)
> 
> Honestly, I think such helper (to show whether it's in the atomic context)
> is useful to driver users, even it could cause some false positive in some
> configuration but it's acceptable.
> 
> Anyway, I could "Always use a workqueue.", but again, the original commit
> was raised by a real vendor (OPPO), and I think if dropping this, all
> downstream users which use dm-verity will be impacted and individual end
> users will not be happy as well.

Well, given what we have discussed thus far, for some kernels, you would
always use a workqueue.  One option would be to force CONFIG_PREEMPT_COUNT
to always be enabled, but this option has not been rejected multiple
times in the past.

But you are quite free to roll your own z_erofs_wq_needed().

							Thanx, Paul

