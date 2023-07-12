Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108BFC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 17:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvoEOajiEwYXBD3xzLluGfgCVtGjTJSaHMHQydgzNEE=; b=Lx+SVHIxlYlK32deEVuss0kizc
	Tm8teZTAFV23az8dmaSK8aeOC9ChwdsYSyL59irSz3Ws4XrJrNQB7ICeDCXm0jju4cMcndNuLKN+D
	hoyFAGLqi1AVlh05kald75J4+AoDIXoXcnuVTNI00mihp1LV53OgtXG4FqlH/HjmIHUQq9QezSQl9
	2/vJQltB/GJFv8GY8n+RsIj+aOq2Dz/ryLBnxbeFOUk7D/l3TP5i7yEWJK18RBubTxBmtLj1F3pq9
	7JuZj0zs+EKSctMMrLxBWRlQVCOsKPpiV15qbH1LP68VBEqlWzVQdZvnYOQMeQnROTu2CKP3rs4oa
	xD3DPv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdEs-000gyI-1T;
	Wed, 12 Jul 2023 17:02:54 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdEp-000gwQ-03
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 17:02:53 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b703cbfaf5so117448621fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 10:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1689181367; x=1691773367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvoEOajiEwYXBD3xzLluGfgCVtGjTJSaHMHQydgzNEE=;
        b=cqQDuh7KkBC7Bp6ndhg7nXNYsINnQl/XnlT+1UAc8RaZTq+BuxgRGEoG8mqoOpE6js
         XKPABgipIV5zI1bbzGToaFdttSQ9on3vO/0h7AHhN2349r+/o4nXk2tQ9zir/uj+PMqf
         7U3DT3YK7cdjRWUEqF0PhnLEVmVuRgxy0mUC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689181367; x=1691773367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvoEOajiEwYXBD3xzLluGfgCVtGjTJSaHMHQydgzNEE=;
        b=lAc75FEJYLTDSu7OSBc4ZBoIFZRMGba7DUymCQ3jSpzl9WjB4b5Pb/pbspIyeOc6g5
         mjHx2FYqPc1V1Pfx0lfAJU1/sR9oPB5mjv5nWJgVjmNlEfiftjMA5TGMQ+VL0OixCtNV
         HjQh7/ozwLk8NpmHnYTKBgCPeHQoO4j8Jdu7jv4Tha9MW39aAKkQj092wWDrFg8bzGbL
         DBVMGyMVkTeDBHDMXA+URUMaI0Yilm6+rty6ZlSnNmKWetJHtMwPiblCU0rRCL1HRGpE
         Ko49BMxQ4OYhjiEdWV7hXxyJa/VTogjosgVQGhNMYxQxMxkPOC/5Zv6cz1MJ6FQG3hHY
         q68Q==
X-Gm-Message-State: ABy/qLavxyApmaArmJrUMQ27vvqGPervUdfuJ+0BROD3SgYGe76dJ14c
	NZoIg16OaJQpqD2cuqm6aYbNlQzU+hmig+MSV6E1eQ==
X-Google-Smtp-Source: APBJJlGlT858DQ/NfqPA3OlYGxIXp57HPZH8ded5Q4ToS48ybKGBOA2p1X6hcXClrEz/A6yz7yx5y/8vtOtl4ryFQpk=
X-Received: by 2002:a2e:8909:0:b0:2b6:9f5d:e758 with SMTP id
 d9-20020a2e8909000000b002b69f5de758mr19193207lji.9.1689181367032; Wed, 12 Jul
 2023 10:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230711233816.2187577-1-dhavale@google.com>
In-Reply-To: <20230711233816.2187577-1-dhavale@google.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Wed, 12 Jul 2023 13:02:35 -0400
Message-ID: <CAEXW_YQvpiFEaaNoS=Msgi17mU3kZD+q8bNBaHYasMArG9aPig@mail.gmail.com>
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when !CONFIG_DEBUG_LOCK_ALLOC
To: Sandeep Dhavale <dhavale@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <quic_neeraju@quicinc.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-erofs@lists.ozlabs.org, 
	xiang@kernel.org, Will Shiu <Will.Shiu@mediatek.com>, kernel-team@android.com, 
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_100251_049799_A2B1DF32 
X-CRM114-Status: GOOD (  36.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 11, 2023 at 7:38=E2=80=AFPM Sandeep Dhavale <dhavale@google.com=
> wrote:
>
> Currently if CONFIG_DEBUG_LOCK_ALLOC is not set
>
> - rcu_read_lock_held() always returns 1
> - rcu_read_lock_any_held() may return 0 with CONFIG_PREEMPT_RCU
>
> This is inconsistent and it was discovered when trying a fix
> for problem reported [1] with CONFIG_DEBUG_LOCK_ALLOC is not
> set and CONFIG_PREEMPT_RCU is enabled. Gist of the problem is
> that EROFS wants to detect atomic context so it can do inline
> decompression whenever possible, this is important performance
> optimization. It turns out that z_erofs_decompressqueue_endio()
> can be called from blk_mq_flush_plug_list() with rcu lock held
> and hence fix uses rcu_read_lock_any_held() to decide to use
> sync/inline decompression vs async decompression.
>
> As per documentation, we should return lock is held if we aren't
> certain. But it seems we can improve the checks for if the lock
> is held even if CONFIG_DEBUG_LOCK_ALLOC is not set instead of
> hardcoding to always return true.
>
> * rcu_read_lock_held()
> - For CONFIG_PREEMPT_RCU using rcu_preempt_depth()
> - using preemptible() (indirectly preempt_count())
>
> * rcu_read_lock_bh_held()
> - For CONFIG_PREEMPT_RT Using in_softirq() (indirectly softirq_cont())
> - using preemptible() (indirectly preempt_count())
>
> Lastly to fix the inconsistency, rcu_read_lock_any_held() is updated
> to use other rcu_read_lock_*_held() checks.
>
> Two of the improved checks are moved to kernel/rcu/update.c because
> rcupdate.h is included from the very low level headers which do not know
> what current (task_struct) is so the macro rcu_preempt_depth() cannot be
> expanded in the rcupdate.h. See the original comment for
> rcu_preempt_depth() in patch at [2] for more information.
>
> [1]
> https://lore.kernel.org/all/20230621220848.3379029-1-dhavale@google.com/
> [2]
> https://lore.kernel.org/all/1281392111-25060-8-git-send-email-paulmck@lin=
ux.vnet.ibm.com/
>
> Reported-by: Will Shiu <Will.Shiu@mediatek.com>
> Signed-off-by: Sandeep Dhavale <dhavale@google.com>
> ---
>  include/linux/rcupdate.h | 12 +++---------
>  kernel/rcu/update.c      | 21 ++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> index 5e5f920ade90..0d1d1d8c2360 100644
> --- a/include/linux/rcupdate.h
> +++ b/include/linux/rcupdate.h
> @@ -319,14 +319,11 @@ int rcu_read_lock_any_held(void);
>  # define rcu_lock_acquire(a)           do { } while (0)
>  # define rcu_lock_release(a)           do { } while (0)
>
> -static inline int rcu_read_lock_held(void)
> -{
> -       return 1;
> -}
> +int rcu_read_lock_held(void);
>
>  static inline int rcu_read_lock_bh_held(void)
>  {
> -       return 1;
> +       return !preemptible() || in_softirq();
>  }
>
>  static inline int rcu_read_lock_sched_held(void)
> @@ -334,10 +331,7 @@ static inline int rcu_read_lock_sched_held(void)
>         return !preemptible();
>  }
>
> -static inline int rcu_read_lock_any_held(void)
> -{
> -       return !preemptible();
> -}
> +int rcu_read_lock_any_held(void);
>
>  static inline int debug_lockdep_rcu_enabled(void)
>  {
> diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
> index 19bf6fa3ee6a..b34fc5bb96cf 100644
> --- a/kernel/rcu/update.c
> +++ b/kernel/rcu/update.c
> @@ -390,8 +390,27 @@ int rcu_read_lock_any_held(void)
>  }
>  EXPORT_SYMBOL_GPL(rcu_read_lock_any_held);
>
> -#endif /* #ifdef CONFIG_DEBUG_LOCK_ALLOC */
> +#else /* #ifdef CONFIG_DEBUG_LOCK_ALLOC */
>
> +int rcu_read_lock_held(void)
> +{
> +       if (IS_ENABLED(CONFIG_PREEMPT_RCU))
> +               return rcu_preempt_depth();
> +       return !preemptible();
> +}
> +EXPORT_SYMBOL_GPL(rcu_read_lock_held);
> +
> +int rcu_read_lock_any_held(void)
> +{
> +       if (rcu_read_lock_held() ||
> +           rcu_read_lock_bh_held() ||
> +           rcu_read_lock_sched_held())
> +               return 1;
> +       return !preemptible();

Actually even the original code is incorrect (the lockdep version)
since preemptible() cannot be relied upon if CONFIG_PREEMPT_COUNT is
not set. However, that's debug code. In this case, it is a real
user (the fs code). In non-preemptible kernels, we are always in an
RCU-sched section. So you can't really see if anyone called your code
under rcu_read_lock(). The rcu_read_lock/unlock() would be getting
NOOPed. In such a kernel, it will always tell your code it is in an
RCU reader. That's not ideal for that erofs code?

Also, per that erofs code:
        /* Use (kthread_)work and sync decompression for atomic contexts on=
ly */
        if (!in_task() || irqs_disabled() || rcu_read_lock_any_held()) {

I guess you are also assuming that rcu_read_lock_any_held() tells you
something about atomicity but strictly speaking, it doesn't because
preemptible RCU readers are preemptible. You can't block but
preemption is possible so it is not "atomic". Maybe you meant "cannot
block"?

As such this patch looks correct to me, one thing I noticed is that
you can check rcu_is_watching() like the lockdep-enabled code does.
That will tell you also if a reader-section is possible because in
extended-quiescent-states, RCU readers should be non-existent or
that's a bug.

Could you also verify that this patch does not cause bloating of the
kernel if lockdep is disabled?

thanks,

 - Joel

