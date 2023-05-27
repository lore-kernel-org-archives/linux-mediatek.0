Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C897AC77B7E
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 May 2023 10:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtV15axNIDqPdIs+cxeK3x1gW7VpQmKJASBWO5/b3no=; b=wIQwA5AItlhhpjZKjX3HtDv4fj
	Z2qafsSx4/0q8XhBw0q7WbSd/YhwmKJEkOHvKAQvw49ufl7nBs8ydJyE5iCzu54iGANOwUU5iNDuw
	aQrv+MnVbrWkjbqwVxn/r0OjCfCbmUtXeQASoRVyTBrAHGFDCtGJC6EpB69R8CQJEm+YWS/h7QbIs
	ob6Eqkfh+gRlBphcjfYb8pH/Si+lGfzc8jm83u+hV/ktdnTD1kYlCbdd5CdNPYVz+wblTkYoXA3xL
	9APUTVKsSAgf+Xcb5Wbax9QLVZY4uPtmGqEMAsV5UFWArV8wK9Od5wBKbHvSgf/nL1Oklctdp8wRA
	ddQ/6wSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2r9U-005SL1-2D;
	Sat, 27 May 2023 10:28:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2r9P-005SJy-26;
	Sat, 27 May 2023 10:27:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 651B960A28;
	Sat, 27 May 2023 10:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52F2C433EF;
	Sat, 27 May 2023 10:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685183273;
	bh=C+WzGt1q9d0lH05NNK05+tR4vVIYrPDgEpHVAqLkZAc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=UABfiHUpb+nRYDT82tFdgWn3aMX4jyrsJFbjdNZp++nQO53C2VDYOfdSmmzOFGX10
	 Gh/BhqAouZ92Z/rYXq27XJu7/rgJNF2MkSFSqTbSJat111F0GD+XJxQoq0IHyJKxqR
	 FCaamDN9nZlJJrnYyTG00nvRB6FT9LCP97PJpVER8LAj50EuN9UpO0+DcbN7ZI1pVy
	 DC3PF50Olhqx0pZY7UB5Qe6yRAbRLScp51QFKGEtCFt0II6XroAms62KcyQCRCmyXW
	 VzyRHC05Tn/N5JAAV9EgqTAnRlfP930lTzMP129hjSUI3mIrs1mBFl4wfdc/qsKFqL
	 Ae6nCyHaGb7vg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D5FB7CE0DB0; Sat, 27 May 2023 03:27:50 -0700 (PDT)
Date: Sat, 27 May 2023 03:27:50 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH] notifier: Initialize new struct srcu_usage field
Message-ID: <b219e888-762a-454f-9a34-d0891f9cfe3a@paulmck-laptop>
References: <20230526073539.339203-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526073539.339203-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230527_032755_789927_395C2FB5 
X-CRM114-Status: GOOD (  19.43  )
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

On Fri, May 26, 2023 at 03:35:37PM +0800, Chen-Yu Tsai wrote:
> In commit 95433f726301 ("srcu: Begin offloading srcu_struct fields to
> srcu_update"), a new struct srcu_usage field was added, but was not
> properly initialized. This led to a "spinlock bad magic" BUG when
> the SRCU notifier was ever used. This was observed in the MediaTek
> CCI devfreq driver on next-20230525. Trimmed stack trace as follows:
> 
>     BUG: spinlock bad magic on CPU#4, swapper/0/1
>      lock: 0xffffff80ff529ac0, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
>     Call trace:
>      spin_bug+0xa4/0xe8
>      do_raw_spin_lock+0xec/0x120
>      _raw_spin_lock_irqsave+0x78/0xb8
>      synchronize_srcu+0x3c/0x168
>      srcu_notifier_chain_unregister+0x5c/0xa0
>      cpufreq_unregister_notifier+0x94/0xe0
>      devfreq_passive_event_handler+0x7c/0x3e0
>      devfreq_remove_device+0x48/0xe8
> 
> Add __SRCU_USAGE_INIT() to SRCU_NOTIFIER_INIT() so that srcu_usage gets
> initialized properly.
> 
> Fixes: 95433f726301 ("srcu: Begin offloading srcu_struct fields to srcu_update")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Good catch, thank you!

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> ---
> 
> Also, the original patch subject said "srcu_update", however the data
> structure ended up as "srcu_usage". Maybe that could be updated?
> 
>  include/linux/notifier.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/notifier.h b/include/linux/notifier.h
> index 2aba75145144..86544707236a 100644
> --- a/include/linux/notifier.h
> +++ b/include/linux/notifier.h
> @@ -106,12 +106,22 @@ extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
>  #define RAW_NOTIFIER_INIT(name)	{				\
>  		.head = NULL }
>  
> +#ifdef CONFIG_TREE_SRCU
>  #define SRCU_NOTIFIER_INIT(name, pcpu)				\
>  	{							\
>  		.mutex = __MUTEX_INITIALIZER(name.mutex),	\
>  		.head = NULL,					\
> +		.srcuu = __SRCU_USAGE_INIT(name.srcuu),		\
>  		.srcu = __SRCU_STRUCT_INIT(name.srcu, name.srcuu, pcpu), \
>  	}
> +#else
> +#define SRCU_NOTIFIER_INIT(name, pcpu)				\
> +	{							\
> +		.mutex = __MUTEX_INITIALIZER(name.mutex),	\
> +		.head = NULL,					\
> +		.srcu = __SRCU_STRUCT_INIT(name.srcu, name.srcuu, pcpu), \
> +	}
> +#endif
>  
>  #define ATOMIC_NOTIFIER_HEAD(name)				\
>  	struct atomic_notifier_head name =			\
> -- 
> 2.41.0.rc0.172.g3f132b7071-goog
> 

