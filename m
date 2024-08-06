Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1080BC52D6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 19:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDrs6vNUxdTCaWcmtCe09iGOF9uzwOM2loOME1McZEk=; b=nU6L1HfmSzJWKV2Jy1cKy2Rsd5
	PKBnYC3wIYrpuetekvYnI7wgnIPLPO6dTLde+e9MObznp7Y3FiI1HwgDtOs1j/jubpscvvyTBxo0B
	R6npTB/arbEPwTp2T/2JqKGirO7co7oGM8u1I9AZYcQIEgB8+5hw90kIAzhRkWd/sswcW/bquy4G0
	7iF7/YgVPHcPhjTCgF2cLTOqlimUryiMdni2bsX9yVgsA4lc6+XYVSqKsyx5hAbOcmgVW+G+8EeHi
	OHOSf/xGow5owjC6Hc8K1cINKnGKWv/5fPHSFHk8bhKWtNA7WDAOWg3i8zoCpePpeOtEMJwWJ4JON
	1a+kYVTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQ1m-00000002jB6-2NAR;
	Tue, 06 Aug 2024 19:39:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQ1j-00000002j9e-1ZCu
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Aug 2024 19:39:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0E02CE0ED1;
	Tue,  6 Aug 2024 19:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCDAC32786;
	Tue,  6 Aug 2024 19:39:19 +0000 (UTC)
Date: Tue, 6 Aug 2024 15:40:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <bobule.chang@mediatek.com>, <eric-yc.wu@mediatek.com>,
 <wsd_upstream@mediatek.com>, Cheng-Jui Wang <cheng-jui.wang@mediatek.com>,
 Tom Zanussi <zanussi@kernel.org>
Subject: Re: [PATCH RESEND] tracing: Fix overflow in get_free_elt()
Message-ID: <20240806154008.502b6c7d@gandalf.local.home>
In-Reply-To: <20240805055922.6277-1-Tze-nan.Wu@mediatek.com>
References: <20240805055922.6277-1-Tze-nan.Wu@mediatek.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_123923_814379_C8012186 
X-CRM114-Status: GOOD (  26.91  )
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

On Mon, 5 Aug 2024 13:59:22 +0800
Tze-nan Wu <Tze-nan.Wu@mediatek.com> wrote:

> "tracing_map->next_elt" in get_free_elt() is at risk of overflowing.
> 
> Once it overflows, new elements can still be inserted into the tracing_map
> even though the maximum number of elements (`max_elts`) has been reached.
> Continuing to insert elements after the overflow could result in the
> tracing_map containing "tracing_map->max_size" elements, leaving no empty
> entries.
> If any attempt is made to insert an element into a full tracing_map using
> `__tracing_map_insert()`, it will cause an infinite loop with preemption
> disabled, leading to a CPU hang problem.
> 
> Fix this by preventing any further increments to "tracing_map->next_elt"
> once it reaches "tracing_map->max_elt".
> 
> Co-developed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
> ---
> We have encountered this issue internally after enabling the
> throttle_rss_stat feature provided by Perfetto in background for more than
> two days, during which `rss_stat` tracepoint was invoked over 2^32 times.
> After tracing_map->next_elt overflow, new elements can continue to be 
> inserted to the tracing_map belong to `rss_stat`.
> Then the CPU could hang inside the while dead loop in function
> `__tracing_map_insert()` by calling it after the tracing_map left no empty
> entry.
> 
> Call trace during hang:
>   __tracing_map_insert()
>   tracing_map_insert()
>   event_hist_trigger()
>   event_triggers_call()
>   __event_trigger_test_discard()
>   trace_event_buffer_commit()
>   trace_event_raw_event_rss_stat()
>   __traceiter_rss_stat()
>   trace_rss_stat()
>   mm_trace_rss_stat()
>   inc_mm_counter()
>   do_swap_page()
> 
> throttle_rss_stat is literally a synthetic event triggered by `rss_stat`
> with condition:
>  1. $echo "rss_stat_throttled unsigned int mm_id unsigned int curr int
>     member long size" >> /sys/kernel/tracing/synthetic_events
>  2. $echo
>     'hist:keys=mm_id,member:bucket=size/0x80000:onchange($bucket).rss_stat_
>     throttled(mm_id,curr,member,size)' >
>     /sys/kernel/tracing/events/kmem/rss_stat/trigger
> 
> The hang issue could also be reproduced easily by calling a customize
> trace event `myevent(u64 mycount)` for more than 2^32+(map_size-max_elts)
> times during its histogram enabled with the key set to variable "mycount".
> While we call `myevent` with different argument "mycount" everytime.
> 
> BTW, I added Cheng-jui to Co-developed because we have a lot of discussions
> during debugging this.
> ---
>  kernel/trace/tracing_map.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/trace/tracing_map.c b/kernel/trace/tracing_map.c
> index a4dcf0f24352..3a56e7c8aa4f 100644
> --- a/kernel/trace/tracing_map.c
> +++ b/kernel/trace/tracing_map.c
> @@ -454,7 +454,7 @@ static struct tracing_map_elt *get_free_elt(struct tracing_map *map)
>  	struct tracing_map_elt *elt = NULL;
>  	int idx;
>  
> -	idx = atomic_inc_return(&map->next_elt);
> +	idx = atomic_fetch_add_unless(&map->next_elt, 1, map->max_elts);

I guess we need to add (with a comment):

	idx--;

>  	if (idx < map->max_elts) {

Otherwise the max elements will be off by one.

>  		elt = *(TRACING_MAP_ELT(map->elts, idx));

And the index will skip position zero.

-- Steve

>  		if (map->ops && map->ops->elt_init)
> @@ -699,7 +699,7 @@ void tracing_map_clear(struct tracing_map *map)
>  {
>  	unsigned int i;
>  
> -	atomic_set(&map->next_elt, -1);
> +	atomic_set(&map->next_elt, 0);
>  	atomic64_set(&map->hits, 0);
>  	atomic64_set(&map->drops, 0);
>  
> @@ -783,7 +783,7 @@ struct tracing_map *tracing_map_create(unsigned int map_bits,
>  
>  	map->map_bits = map_bits;
>  	map->max_elts = (1 << map_bits);
> -	atomic_set(&map->next_elt, -1);
> +	atomic_set(&map->next_elt, 0);
>  
>  	map->map_size = (1 << (map_bits + 1));
>  	map->ops = ops;


