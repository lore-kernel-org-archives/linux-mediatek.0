Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D519EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 21:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZTUnI6d8S8lOCvLIZaV/WnDbZOnjxlpdLIn7J7T5Ws=; b=LIX5RxsojoodigUTEm1ZNuJKbq
	eCdYjkD2ckREtTcWwgopQzc036IwmBctWPbD6yWEpRUvFDZd+eUyGZnsEVBw37oqC6X9SWWU+w0hr
	4LDpAesEw3FzJln4Wx4pcRB6rcxGj1qAzM95yasygDPW99OLNsUyCBdI6RNeyyDrQc2H3E0hQbV7B
	pSKQSzss/tOxQ7/gMitHyd2y3Fvnt6hj2bDRtxI6Pm6ZrR4YuT+JPurXSCFLJkSe45fVOLh1opPRJ
	S1tWAErXN/IjrUxLGcKJGPnAWhgUxHgkka4iKdJRrWw8pZK4L4vDrV8KeiJ2tqAMjMftIlAFmz6C9
	knn0ahww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJhGw-001I1s-26;
	Wed, 12 Jul 2023 21:21:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJhGt-001Hzh-0W
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 21:21:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbc244d384so76750225e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 14:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689196868; x=1691788868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZTUnI6d8S8lOCvLIZaV/WnDbZOnjxlpdLIn7J7T5Ws=;
        b=riVOxBRsNlbit4Y503zwT+PkVQPKGT/R2DE0Ewx9khEJPZrhlAKOZKDrQOUSfw1Cpd
         FjziADc8hAjUgHBvF3g18IW0jau1z9D/EJxtH9rWZiJVC3mL7PVmHS+GKfsIY8OQO8RW
         sQt9fkLpMyKgk8utotrNJjM84rCa0Zz8GcEqKhFTJPIlKgoLY09856Cu4Y7288qQZils
         nCWHVmCPjm2nzvydu5jBuaZB9oL1tuEP+i0FqezV9AwoYDoElW1VogVbj2cZZvb6Rq/C
         TozA28S0bwWVhE8m5Qx4F9rhIHR+Amb8eas94sO7h08yeNW10vPOZQ9cENTT9C07EOWm
         rg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689196868; x=1691788868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZTUnI6d8S8lOCvLIZaV/WnDbZOnjxlpdLIn7J7T5Ws=;
        b=g7O94wNIQmybpyPFnEP48yHUw2j+tBwgy0ewasNWKgn8WoZUYgOcmXmKZEs9mTxlqo
         /qBDhBVPI30fuderOlBh0caMIlpXY8UBgSt2ctIHWN822SO5GQCFrHS8BIuxNCw8eP+D
         3RV3jQYtZOxEoASN50ZlYPTVt7tyRc6AUuFUvttqXp6VF4q2/wDjooEOidtpD1Eah6gp
         THruLzjpFDp4CWRAYUeMvX9t6ugxyb08avNUutSDE5PygIEcy2ylIDNz9wQgxmjOQol+
         4KFyo+bUPUWRwAKo9r6Ofng9hyXFSHDmRQAulYX7kC515/BHu+7P6wA+wnETKnPL6Qzm
         hjGQ==
X-Gm-Message-State: ABy/qLbetOo8tA0mnH51O3+taFUvyDc7QKlyQbe+9JOyRFsZ6MyaCLuo
	JCGsS6/WM7+b5UrZHChuc8iF+ebD114aeepnq8lBYA==
X-Google-Smtp-Source: APBJJlF02gY8bEC0+lYROMVW41NJjfAkJDC91HvoX0ewa2c+XazwQOw0ZGwvXcadoBMYjI5IXT+IOvbvZzU0knL3QpU=
X-Received: by 2002:a05:600c:2295:b0:3f8:facf:7626 with SMTP id
 21-20020a05600c229500b003f8facf7626mr17690397wmf.20.1689196867941; Wed, 12
 Jul 2023 14:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230711233816.2187577-1-dhavale@google.com> <CAEXW_YQvpiFEaaNoS=Msgi17mU3kZD+q8bNBaHYasMArG9aPig@mail.gmail.com>
In-Reply-To: <CAEXW_YQvpiFEaaNoS=Msgi17mU3kZD+q8bNBaHYasMArG9aPig@mail.gmail.com>
From: Sandeep Dhavale <dhavale@google.com>
Date: Wed, 12 Jul 2023 14:20:56 -0700
Message-ID: <CAB=BE-Rm0ycTZXj=wHW_FBCCKbswG+dh3L+o1+CUW=Pg_oWnyw@mail.gmail.com>
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when !CONFIG_DEBUG_LOCK_ALLOC
To: Joel Fernandes <joel@joelfernandes.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_142115_198855_EB6E613E 
X-CRM114-Status: GOOD (  24.96  )
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

Hi Joel,
Thank you for the review!
> Actually even the original code is incorrect (the lockdep version)
> since preemptible() cannot be relied upon if CONFIG_PREEMPT_COUNT is
> not set. However, that's debug code. In this case, it is a real
> user (the fs code). In non-preemptible kernels, we are always in an
> RCU-sched section. So you can't really see if anyone called your code
> under rcu_read_lock(). The rcu_read_lock/unlock() would be getting
> NOOPed. In such a kernel, it will always tell your code it is in an
> RCU reader. That's not ideal for that erofs code?
>
> Also, per that erofs code:
>         /* Use (kthread_)work and sync decompression for atomic contexts only */
>         if (!in_task() || irqs_disabled() || rcu_read_lock_any_held()) {
>
> I guess you are also assuming that rcu_read_lock_any_held() tells you
> something about atomicity but strictly speaking, it doesn't because
> preemptible RCU readers are preemptible. You can't block but
> preemption is possible so it is not "atomic". Maybe you meant "cannot
> block"?
>
Yes, you are correct. For decompression erofs needs to grab pcluster mutex lock,
erofs wants to know if we can or cannot block to decide sync vs async
decompression.

Good point about !CONFIG_PREEMPT_COUNT. Yes, in that case erofs
will always do async decompression which is less than ideal. Maybe
erofs check can be modified to account for !CONFIG_PREEMPT_COUNT.

> As such this patch looks correct to me, one thing I noticed is that
> you can check rcu_is_watching() like the lockdep-enabled code does.
> That will tell you also if a reader-section is possible because in
> extended-quiescent-states, RCU readers should be non-existent or
> that's a bug.
>
Please correct me if I am wrong, reading from the comment in
kernel/rcu/update.c rcu_read_lock_held_common()
..
  * The reason for this is that RCU ignores CPUs that are
 * in such a section, considering these as in extended quiescent state,
 * so such a CPU is effectively never in an RCU read-side critical section
 * regardless of what RCU primitives it invokes.

It seems rcu will treat this as lock not held rather than a fact that
lock is not held. Is my understanding correct?
The reason I chose not to consult rcu_is_watching() in this version
is because check "sleeping function called from invalid context"
will still get triggered (please see kernel/sched/core.c __might_resched())
as it does not consult rcu_is_watching() instead looks at
rcu_preempt_depth() which will be non-zero if rcu_read_lock()
was called (only when CONFIG_PREEMPT_RCU is enabled).

> Could you also verify that this patch does not cause bloating of the
> kernel if lockdep is disabled?
>
Sure, I will do the comparison and send the details.

Thanks,
Sandeep.

> thanks,
>
>  - Joel

