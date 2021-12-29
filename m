Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB907C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 23:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPIEs1Ek6NbvnQQWVaiC6JkBvi5hk158iP6tMSQlDr8=; b=vJgwFSn1zN6WyJ
	O79sHzGD7+3wcGoCZLfolzb2J8KNlRcNPPxa3+DXtKddunYdV/NJ42p4Z7Y3czWugrFQn4Ri07HHQ
	LqDQptaGNaJGbiRpPI8B408TPWWwNQoJGgO0XwfPpG/7Nrrw7GZbAJrOfLo+kdcS1hX1dydk8WtvV
	GRczcDUYUNDZ7W3qmIaYfevG2Rzhn6xwGcvJ40jRI9fGgsbRWnvA3WjDi0s3MPfO4UOWmPQPUGrjB
	Y/E234DH6fsAqnYnjitQux7gzewo4kilPY+cNto20e27X1v4t3sjQTdsjz823CY04NcXWt93ZYZ1u
	Th3cUaG5klvQC/jFoBwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2ikz-003VJu-7H; Wed, 29 Dec 2021 23:53:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2ikn-003VHf-Qv; Wed, 29 Dec 2021 23:53:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4032B811F5;
 Wed, 29 Dec 2021 23:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D812CC36AEA;
 Wed, 29 Dec 2021 23:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1640821986;
 bh=Va1wahRPO8vBMlP2UabmSRApv7q4Gzh6J6565PyyoAU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0Q0sEk4WN67trJ2hf1/NT/kCV37G5Y/Cu3IyZ6/dTQ56fm0xGj1+4a+e6rj6qXPUe
 AncqRnyinYMk+r6N6vtvNBZDp6iM7HyoQ1AZvRmKcjCzio6FxJxQM1g8E7dCAGTfHN
 UnFK/5pY9+X5UkhqQr98fle4JsiubxMJh9mC7ooY=
Date: Wed, 29 Dec 2021 15:53:05 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Calvin Liao <calvin.liao@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, "Eric W . Biederman"
 <ebiederm@xmission.com>, "Peter Zijlstra" <peterz@infradead.org>, Christian
 Brauner <christian.brauner@ubuntu.com>, Jens Axboe <axboe@kernel.dk>,
 Alexey Gladkov <legion@kernel.org>, Mike Christie
 <michael.christie@oracle.com>, "David Hildenbrand" <david@redhat.com>, Rolf
 Eike Beer <eb@emlix.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, "calvin.liao" <calvin.liao@mediatek.com>,
 Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: [PATCH 1/1] seccomp: release seccomp after killing terminate
 clone/fork
Message-Id: <20211229155305.eb4e3cf76fc9e811bb2b3bfc@linux-foundation.org>
In-Reply-To: <20211228053421.26825-1-calvin.liao@gmail.com>
References: <20211228053421.26825-1-calvin.liao@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_155310_072063_14357B78 
X-CRM114-Status: GOOD (  15.56  )
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

On Tue, 28 Dec 2021 13:34:21 +0800 Calvin Liao <calvin.liao@gmail.com> wrote:

> From: "calvin.liao" <calvin.liao@mediatek.com>
> 
> Add to release seccomp after killing terminate clone/fork to avoid
> memory leak when enabling CONFIG_SECCOMP.
> 

Help us out here - where was this filter allocated?  Please describe
the code flow which led to this leak.  Rather than simply saying "there
is a leak".

> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1698,6 +1698,13 @@ static void copy_seccomp(struct task_struct *p)
>  #endif
>  }
>  
> +static void release_seccomp(struct task_struct *p)
> +{
> +#ifdef CONFIG_SECCOMP
> +	seccomp_filter_release(p);
> +#endif

ifdefs aren't needed?

> +}
> +
>  SYSCALL_DEFINE1(set_tid_address, int __user *, tidptr)
>  {
>  	current->clear_child_tid = tidptr;
> @@ -2405,6 +2412,7 @@ static __latent_entropy struct task_struct *copy_process(
>  	return p;
>  
>  bad_fork_cancel_cgroup:
> +	release_seccomp(p);

Why not simply call seccomp_filter_release() here, without ifdefs?

>  	sched_core_free(p);
>  	spin_unlock(&current->sighand->siglock);
>  	write_unlock_irq(&tasklist_lock);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
