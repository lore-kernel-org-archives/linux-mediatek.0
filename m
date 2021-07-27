Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79FFC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 15:52:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79BE761B6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 15:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79BE761B6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vpctCx5IlwY4bUDfz78TwPscSaadvbt0zro9k0PU/M=; b=AxOgv0VzXS5svi
	fPEDz2YcI4DzjkuV3qdZjVaxqKC4WwSJy7U6hW/tDDaS7Zs3Fv8pUnNRrY05xax516Crd9njA21Qd
	fpKILgHA6O9ihl3Do6jkQ6X4E7g3WJfeMGNS6dhmRPX/sy8J+EpgJqJlSFMqocLOPUx41O/48u7om
	28UVxdZIQJPCEmKlDIToZkRHlMGZiy3P7h89lEVLbpc2Hl4RutJDjZCetXlc2RPQXgZVFVcMZwGa/
	iDTwotvx1LyhskHie+zvEY+w6Dvjcf+z+GuUSiCNoz7YYfemUaqlkl9LMBG0BNF6Rz1IddAGGa/ac
	7CssjOme8Ldlx6Nd/NfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8PNe-00FEeJ-H9; Tue, 27 Jul 2021 15:52:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8PNR-00FEcv-5f; Tue, 27 Jul 2021 15:52:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67B5561B67;
 Tue, 27 Jul 2021 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627401136;
 bh=2M4I/mu6xPFSIP+j/+krkUQV4J56r38KGvOPB5zqfqg=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=AypakK5c36T8nSGOIhomIZwC7/7HKJLnvUycK3cAJfl3+FMnarKIn5viIWd31kOCH
 X5jcPJcoKbMPpl4w4HlYoHyL6as86fgtn/StvJH83Wo4v0K+dkwoqfPBbuQdtpwR1j
 rVnbcdcZmQmFVOtzWhnZht9j/EafQKkI4MIrfBED6f1v2/WGVwgTFobt+5VSO4DtBQ
 g36SgCbe4yVSX1ApBNl6oBBeGq2qlxnOgvQIY3IaHoDJjijJVQtL+MEJ4PFpwuwKb5
 rKG5e8kR0KTTQUlLgILPgiWrJ5nznfgeCyTktu8LJpHLRY2SDOyHmZ9uhhH0S9OnkO
 waJ1Pw9MiP6hg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 37FB05C0699; Tue, 27 Jul 2021 08:52:16 -0700 (PDT)
Date: Tue, 27 Jul 2021 08:52:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Cheng Jui Wang <cheng-jui.wang@mediatek.com>
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 clang-built-linux@googlegroups.com, josh@joshtriplett.org,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com, joel@joelfernandes.org,
 matthias.bgg@gmail.com, nathan@kernel.org, ndesaulniers@google.com,
 wsd_upstream@mediatek.com, eason-yh.lin@mediatek.com
Subject: Re: [PATCH] rcu: Add missing unlock in rcu_print_task_stall
Message-ID: <20210727155216.GV4397@paulmck-ThinkPad-P17-Gen-1>
References: <20210727074542.25095-1-cheng-jui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727074542.25095-1-cheng-jui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_085217_311659_862A45AB 
X-CRM114-Status: GOOD (  21.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 27, 2021 at 03:45:42PM +0800, Cheng Jui Wang wrote:
> We encouterd a deadlock with following lockdep warning. The
> rcu_print_task_stall is supposed to release rnp->lock, but may just
> return without unlock.
> 
> 	if (!rcu_preempt_blocked_readers_cgp(rnp))
> 		return 0;
> 
> Add missing unlock before return to fix it.
> 
> ============================================
> WARNING: possible recursive locking detected
> 5.10.43
> --------------------------------------------
> swapper/7/0 is trying to acquire lock:
> ffffffc01268c018 (rcu_node_0){-.-.}-{2:2}, at: rcu_dump_cpu_stacks+0x94/0x138
> 
> but task is already holding lock:
> ffffffc01268c018 (rcu_node_0){-.-.}-{2:2}, at: check_cpu_stall+0x34c/0x6f8
> 
> other info that might help us debug this:
>  Possible unsafe locking scenario:
> 
>        CPU0
>        ----
>   lock(rcu_node_0);
>   lock(rcu_node_0);
> 
>  *** DEADLOCK ***
> 
>  May be due to missing lock nesting notation
> 
> 1 lock held by swapper/7/0:
>  #0: ffffffc01268c018 (rcu_node_0){-.-.}-{2:2},  at: check_cpu_stall+0x34c/0x6f8
> 
> stack backtrace:
> CPU: 7 PID: 0 Comm: swapper/7
> Call trace:
>  dump_backtrace.cfi_jt+0x0/0x8
>  show_stack+0x1c/0x2c
>  dump_stack_lvl+0xd8/0x16c
>  validate_chain+0x2124/0x2d34
>  __lock_acquire+0x7e4/0xed4
>  lock_acquire+0x114/0x394
>  _raw_spin_lock_irqsave+0x88/0xd4
>  rcu_dump_cpu_stacks+0x94/0x138
>  check_cpu_stall+0x498/0x6f8
>  rcu_sched_clock_irq+0xd4/0x214
>  update_process_times+0xb4/0xf4
>  tick_sched_timer+0x98/0x110
>  __hrtimer_run_queues+0x19c/0x2bc
>  hrtimer_interrupt+0x10c/0x3a8
>  arch_timer_handler_phys+0x5c/0x98
>  handle_percpu_devid_irq+0xe0/0x2a8
>  __handle_domain_irq+0xd0/0x19c
>  gic_handle_irq+0x6c/0x134
>  el1_irq+0xe0/0x1c0
>  arch_cpu_idle+0x1c/0x30
>  default_idle_call+0x58/0xcc
>  do_idle.llvm.13807299673429836468+0x118/0x2e8
>  cpu_startup_entry+0x28/0x2c
>  secondary_start_kernel+0x1d0/0x23c
> 
> Signed-off-by: Cheng Jui Wang <cheng-jui.wang@mediatek.com>

Good catch, thank you!

However, Yanfei Xu beat you to this with commit f6b3995a8b56dc ("rcu:
Fix stall-warning deadlock due to non-release of rcu_node ->lock"),
which is in -rcu and slated for the upcoming merge window.

His commit 8baded711edc ("rcu: Fix to include first blocked task in
stall warning") might also be of interest to you.

							Thanx, Paul

> ---
>  kernel/rcu/tree_stall.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
> index 6c76988cc019..3dc464d4d9a5 100644
> --- a/kernel/rcu/tree_stall.h
> +++ b/kernel/rcu/tree_stall.h
> @@ -267,8 +267,10 @@ static int rcu_print_task_stall(struct rcu_node *rnp, unsigned long flags)
>  	struct task_struct *ts[8];
>  
>  	lockdep_assert_irqs_disabled();
> -	if (!rcu_preempt_blocked_readers_cgp(rnp))
> +	if (!rcu_preempt_blocked_readers_cgp(rnp)) {
> +		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>  		return 0;
> +	}
>  	pr_err("\tTasks blocked on level-%d rcu_node (CPUs %d-%d):",
>  	       rnp->level, rnp->grplo, rnp->grphi);
>  	t = list_entry(rnp->gp_tasks->prev,
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
