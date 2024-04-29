Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14342C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 00:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87TPzps5EimM9I/+VsZAI+agu3632dB0wlr0sCIZKgE=; b=KRQ/nTDqIIBr5MDrDGSKLEaGhJ
	DBt7ct5faCLXzempz/5OfGP3bQbqQvbzlz0bjtpp46OeYo0afbsECOyJOs6VZBmUpbpvThH5Faz/t
	a2a0t4T7EtXt29QRQbLxsxJt333tLRGV+ahjmMXntoKEIXrLLk8Q/pU2yu1+m0nPEUj48/LGZFXWe
	MOlqrrEnE0KxN3mQytgLmiDAnvUI0mM7SVM3TDugIWNaVwCiztDrngpupcJqmpb79Yy1IKxoYr/HA
	Ybcey7hF9HNvnv0Q0x7bj/vDZcmdJm13Y4qQp9RF6AJaZ78uzm9v+XSgU+zZoO/olsxwF7VpJ9Ndh
	SNmgdVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Esw-000000013mz-1qfQ;
	Mon, 29 Apr 2024 00:28:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Esr-000000013kE-3hTn;
	Mon, 29 Apr 2024 00:28:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A67CE60915;
	Mon, 29 Apr 2024 00:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75705C113CC;
	Mon, 29 Apr 2024 00:28:39 +0000 (UTC)
Date: Sun, 28 Apr 2024 20:28:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Tze-nan wu <Tze-nan.Wu@mediatek.com>
Cc: <mhiramat@kernel.org>, <bobule.chang@mediatek.com>,
 <wsd_upstream@mediatek.com>, Cheng-Jui Wang <cheng-jui.wang@mediatek.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 <linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] tracing: Fix uaf issue in tracing_open_file_tr
Message-ID: <20240428202837.0cabca17@rorschach.local.home>
In-Reply-To: <20240426073410.17154-1-Tze-nan.Wu@mediatek.com>
References: <20240426073410.17154-1-Tze-nan.Wu@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_172842_111539_479B3441 
X-CRM114-Status: GOOD (  26.03  )
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

On Fri, 26 Apr 2024 15:34:08 +0800
Tze-nan wu <Tze-nan.Wu@mediatek.com> wrote:

> "tracing_event_file" is at the risk of use-after-free due to the race of
> two functions "tracing_open_file_tr" and "synth_event_release".
> Specifically, it could be freed by synth_event_release before
> tracing_open_file_tr has the opportunity to access its members.
> 
> It's easy to reproduced by first executing script 'A' and then script 'B'
> in my environment.
> 
>   Script 'A':
>     echo "hello int aaa" > /sys/kernel/tracing/synthetic_events
>     while :
>     do
>       echo 0 > /sys/kernel/tracing/events/synthetic/hello/enable
>     done
> 
>   Script 'B':
>     echo > /sys/kernel/tracing/synthetic/events

I think you meant:

      echo > /sys/kernel/tracing/synthetic_events

> 
>   My environment:
>     arm64 + generic and swtag based KASAN both enabled + kernel-6.6.18
> 
> KASAN report
> ==================================================================
> BUG: KASAN: slab-use-after-free in tracing_open_file_tr
> Read of size 8 at addr 9*ffff********** by task sh/3485
> Pointer tag: [9*], memory tag: [fe]
> 
> CPU: * PID: 3485 Comm: sh Tainted: ****************
> Call trace:
>  __hwasan_tag_mismatch
>  tracing_open_file_tr
>  do_dentry_open
>  vfs_open
>  path_openat
> 
> Freed by task 3490:
>  slab_free_freelist_hook
>  kmem_cache_free
>  event_file_put
>  remove_event_file_dir
>  __trace_remove_event_call
>  trace_remove_event_call
>  synth_event_release
>  dyn_events_release_all
>  synth_events_open
> 
> page last allocated via order 0, migratetype Unmovable:
>  __slab_alloc
>  kmem_cache_alloc
>  trace_create_new_event
>  trace_add_event_call
>  register_synth_event
>  __create_synth_event
>  create_or_delete_synth_event
>  trace_parse_run_command
>  synth_events_write
>  vfs_write

Thanks for reporting this.

> 
> Based on the assumption that eventfs_inode will persist throughout the
> execution of the tracing_open_file_tr function,
> we can fix this issue by incrementing the reference count of
> trace_event_file once it is assigned to eventfs_inode->data.
> The reference count will then be decremented during the release phase of
> eventfs_inode.
> 
> This ensures that trace_event_file is not prematurely freed while the
> tracing_open_file_tr function is being called.
> 
> Fixes: bb32500fb9b7 ("tracing: Have trace_event_file have ref counters")
> Co-developed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Tze-nan wu <Tze-nan.Wu@mediatek.com>
> ---
> BTW, I've also attempted to reproduce the same issue in another
> environment (described below).
> It's also reproducible but in a lower rate.
> 
> another environment:
>   x86 + ubuntu + generic kasan enabled + kernel-6.9-rc4
> 
> After applying the patch, KASAN no longer reports any issues when
> following the same reproduction steps in my arm64 environment. 
> However, I am concerned about potential side effects that the patch might introduce.
> Additionally, the newly added function "is_entry_event_callback" may not
> be reliable in my opinion,
> as the callback function used in the comparison could change in future. 
> Nonetheless, this is the best solution I can come up with now.
> 
> Looking for any suggestion or solution, appreciate.

Yeah, I do not think eventfs should be involved in this. It needs to be
protected at a higher level (in the synthetic/dynamic event code).

I'm just coming back from Japan, and I'll need to take a deeper look at
this after I recover from my jetlag.

Thanks,

-- Steve

