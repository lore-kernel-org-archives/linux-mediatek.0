Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196A2C001DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTGh7hHulo00OaeOJkOBrU4VOTE+UM3hsFQlgTXR0Xs=; b=v8AFqBUZrXMoFow4SE8YdvLRr9
	gC/OVGdFR5aw6xYXqlj7/BEzlmP0sWhGvslmfujNZUOC9RCur9qAwbICjDmrpik0ERZF7bL+6k3JW
	9vcIxnfHiOHUIPv6V1fNwjJXc5zRZNEV30b1xFGF6MiCAOgyYdbnsZr+VQEgsvsOoA4lv2Jw/fiuA
	btE0UORv4KJx+Vq/XMrqW7/OwKtUdx1OhrQ3mUVovwQT/6vTukkcrHQJ8qRm5rhsXK8Z/DdqUPS7G
	gT72weliawfKCS7FAWCJ0C6x5Dfb9nZY4MNgtYMOQj4ak9Shp+O3GIREZChau6uZSSVlOQ4Lkcy7k
	pMqLQNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK0Dx-0043oV-1A;
	Thu, 13 Jul 2023 17:35:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK0Dt-0043nd-39;
	Thu, 13 Jul 2023 17:35:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4E47F61B0A;
	Thu, 13 Jul 2023 17:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0998C433C8;
	Thu, 13 Jul 2023 17:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689269724;
	bh=nVjA5DBJ4Jf6ILT1G2kqYsugYxkNpdWew6RWRChpACw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=UH7d4gNKL0u/IgFEobZtu+99pbkCzDViNGEtw5/owow5ZnIT5997RKaz0RL9HEcye
	 LCniBqIBWl/7yvxFEKp2p7nRfTW/UPYENSu2nrxorGWngViKrvbq6lofuc+5qI2dYI
	 aTT7ETaqJzuIXFYbvUVv5YQLWUlVtNYrClaOVRZq8BNhrKZSCSLmakQpG1Gjg7GSTn
	 dZZDux/20jEC503+r/ss5IqqngL2ZFIQaVLk5UfVnSeJEypnYgqMiBxIuGn0Y0MSzI
	 v4WYJpN6bSaWEK063CqFGJtmBOn0swyIQ6jyA7QdYXXpIi/cWNWDv/+YyqdYYZ2XZT
	 4TSi0u+CCqQ7Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3847CCE009F; Thu, 13 Jul 2023 10:35:24 -0700 (PDT)
Date: Thu, 13 Jul 2023 10:35:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sandeep Dhavale <dhavale@google.com>
Cc: Joel Fernandes <joel@joelfernandes.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
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
Message-ID: <39923da8-16a1-43a8-99f1-5e13508e4ee4@paulmck-laptop>
References: <161f1615-3d85-cf47-d2d5-695adf1ca7d4@linux.alibaba.com>
 <0d9e7b4d-6477-47a6-b3d2-2c9d9b64903d@paulmck-laptop>
 <f124e041-6a82-2069-975c-4f393e5c4137@linux.alibaba.com>
 <87292a44-cc02-4d95-940e-e4e31d0bc6f2@paulmck-laptop>
 <f1c60dcb-e32f-7b7e-bf0d-5dec999e9299@linux.alibaba.com>
 <CAEXW_YSODXRfgkR0D2G-x=0uZdsqvF3kZL+LL3DcRX-5CULJ1Q@mail.gmail.com>
 <894a3b64-a369-7bc6-c8a8-0910843cc587@linux.alibaba.com>
 <CAEXW_YSM1yik4yWTgZoxCS9RM6TbsL26VCVCH=41+uMA8chfAQ@mail.gmail.com>
 <58b661d0-0ebb-4b45-a10d-c5927fb791cd@paulmck-laptop>
 <CAB=BE-QSaRKvVQg28wu6zVoO9RwiHZgXJzUaEMdbtpieVLmT8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB=BE-QSaRKvVQg28wu6zVoO9RwiHZgXJzUaEMdbtpieVLmT8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_103526_091018_AD1C7D82 
X-CRM114-Status: GOOD (  33.70  )
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

On Thu, Jul 13, 2023 at 10:05:46AM -0700, Sandeep Dhavale wrote:
> Hello All,
> 
> Let me answer some of the questions raised here.
> 
> * Performance aspect
> EROFS is one of the popular filesystem of choice in Android for read
> only partitions
> as it provides 30%+ storage space savings with compression.
> In addition to microbenchmarks, boot times and cold app launch
> benchmarks are very
> important to the Android ecosystem as they directly translate to
> responsiveness from user point of view. We saw some
> performance penalty in cold app launch benchmarks in a few scenarios.
> Analysis showed that the significant variance was coming from the
> scheduling cost while decompression cost was more or less the same.
> Please see the [1] which shows scheduling costs for kthread vs kworker.
> 
> > Just out of curiosity, exactly how much is it costing to trigger the
> workqueue?
> I think the cost to trigger is not much, it's the actual scheduling latency for
> the thread is the one which we want to cut down. And if we are already in
> thread context then there is no point in incurring any extra cost if
> we can detect
> it reliably. That is what erofs check is trying to do.
> 
> >One additional question...  What is your plan for kernels built with
> CONFIG_PREEMPT_COUNT=n?
> If there is no reliable way to detect if we can block or not then in that
> case erofs has no option but to schedule the kworker.
> 
> * Regarding BLK_MQ_F_BLOCKING
> As mentioned by Gao in the thread this is a property of blk-mq device
> underneath,
> so erofs cannot control it has it has to work with different types of
> block devices.
> 
> * Regarding rcu_is_watching()
> 
> >I am assuming you mean you would grab the mutex accidentally when in an RCU
> reader, and might_sleep() presumably in the mutex internal code will scream?
> 
> Thank you Paul for explaining in detail why it is important. I can get
> the V2 going.
> >From the looking at the code at kernel/sched/core.c which only looks
> at rcu_preempt_depth(),
> I am thinking it may still get triggered IIUC.
> 
> > The following is untested, and is probably quite buggy, but it should
> provide you with a starting point.
> ..
> 
> Yes, that can fix the problem at hand as the erofs check also looks
> for rcu_preempt_depth().
> A similar approach was discarded as rcu_preempt_depth() was though to
> be low level
> and we used rcu_read_lock_any_held() which is the superset until we
> figured out inconsistency
> when ! CONFIG_DEBUG_LOCK_ALLOC.

Thank you for the background.

> Paul, Joel,
> Shall we fix the rcu_read_lock_*held() regardless of how erofs
> improves the check?

Help me out here.  Exactly what is broken with rcu_read_lock_*held(),
keeping in mind their intended use for lockdep-based debugging?

							Thanx, Paul

> Thanks,
> Sandeep.
> 
> [1] https://lore.kernel.org/linux-erofs/20230208093322.75816-1-hsiangkao@linux.alibaba.com/

