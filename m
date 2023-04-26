Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5B0C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 01:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzRy8vhERH49sREyk+B141jJEamPT9q87dQNVowKvt4=; b=kDiuRseNanfbyP4xIfSetO8+6C
	Ydk6C8JII6cUDQ8lpPrwF1hB2DOhP/wzovE955jBAkVBXV6Ix785zkkYJc3WhT9+flfLxuJUJ4+ER
	DXrAy/wx8e8m8ml3tDjH9QpAg1SSzBlrlsL2LwdvaIKdNEdOZpP0Ls2trbbP+7nqEWeQP/ZG7gZe9
	GBITBSuxEoO/KHxHNpT0hp9/Wgz7lhYf77vL0z+tW+ugf3t6RS3tRGUhxsXzbdxUey9U1HNvsncwD
	5rBiOoMAYFEfY7YleoLkqdHs9uiagvzNs6nxQOvsSXQqS6H6u4tixDW9zCmpZWZvgASGJQvbeiss9
	tZih9p2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prTmz-002YTf-2A;
	Wed, 26 Apr 2023 01:17:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prTmw-002YSI-0R;
	Wed, 26 Apr 2023 01:17:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E85C86255E;
	Wed, 26 Apr 2023 01:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC61C433D2;
	Wed, 26 Apr 2023 01:17:38 +0000 (UTC)
Date: Tue, 25 Apr 2023 21:17:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Tze-nan.Wu" <Tze-nan.Wu@mediatek.com>
Cc: <mhiramat@kernel.org>, <bobule.chang@mediatek.com>,
 <cheng-jui.wang@mediatek.com>, <wsd_upstream@mediatek.com>,
 <stable@vger.kernel.org>, <npiggin@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, John 'Warthog9' Hawley
 <warthog9@kernel.org>
Subject: Re: [PATCH v5] ring-buffer: Ensure proper resetting of atomic
 variables in ring_buffer_reset_online_cpus
Message-ID: <20230425211737.757208b3@gandalf.local.home>
In-Reply-To: <20230426010446.10753-1-Tze-nan.Wu@mediatek.com>
References: <20230426010446.10753-1-Tze-nan.Wu@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_181742_277473_CC2D2C3C 
X-CRM114-Status: GOOD (  27.36  )
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


For some reason, this email did not make it to
linux-trace-kernel@vger.kernel.org, and therefore did not make it into
patchwork?

John?

-- Steve


On Wed, 26 Apr 2023 09:04:44 +0800
Tze-nan.Wu <Tze-nan.Wu@mediatek.com> wrote:

> From: "Tze-nan Wu" <Tze-nan.Wu@mediatek.com>
> 
> In ring_buffer_reset_online_cpus, the buffer_size_kb write operation
> may permanently fail if the cpu_online_mask changes between two
> for_each_online_buffer_cpu loops. The number of increases and decreases
> on both cpu_buffer->resize_disabled and cpu_buffer->record_disabled may be
> inconsistent, causing some CPUs to have non-zero values for these atomic
> variables after the function returns.
> 
> This issue can be reproduced by "echo 0 > trace" while hotplugging cpu.
> After reproducing success, we can find out buffer_size_kb will not be
> functional anymore.
> 
> To prevent leaving 'resize_disabled' and 'record_disabled' non-zero after
> ring_buffer_reset_online_cpus returns, we ensure that each atomic variable
> has been set up before atomic_sub() to it.
> 
> Cc: stable@vger.kernel.org
> Cc: npiggin@gmail.com
> Fixes: b23d7a5f4a07 ("ring-buffer: speed up buffer resets by avoiding synchronize_rcu for each CPU")
> Reviewed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
> ---
> Changes from v4 to v5: https://lore.kernel.org/lkml/20230412112401.25081-1-Tze-nan.Wu@mediatek.com/
>   - Move the define before the function
> ---
>  kernel/trace/ring_buffer.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 76a2d91eecad..253ef85a9ec3 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -5345,6 +5345,9 @@ void ring_buffer_reset_cpu(struct trace_buffer *buffer, int cpu)
>  }
>  EXPORT_SYMBOL_GPL(ring_buffer_reset_cpu);
>  
> +/* Flag to ensure proper resetting of atomic variables */
> +#define RESET_BIT	(1 << 30)
> +
>  /**
>   * ring_buffer_reset_online_cpus - reset a ring buffer per CPU buffer
>   * @buffer: The ring buffer to reset a per cpu buffer of
> @@ -5361,20 +5364,27 @@ void ring_buffer_reset_online_cpus(struct trace_buffer *buffer)
>  	for_each_online_buffer_cpu(buffer, cpu) {
>  		cpu_buffer = buffer->buffers[cpu];
>  
> -		atomic_inc(&cpu_buffer->resize_disabled);
> +		atomic_add(RESET_BIT, &cpu_buffer->resize_disabled);
>  		atomic_inc(&cpu_buffer->record_disabled);
>  	}
>  
>  	/* Make sure all commits have finished */
>  	synchronize_rcu();
>  
> -	for_each_online_buffer_cpu(buffer, cpu) {
> +	for_each_buffer_cpu(buffer, cpu) {
>  		cpu_buffer = buffer->buffers[cpu];
>  
> +		/*
> +		 * If a CPU came online during the synchronize_rcu(), then
> +		 * ignore it.
> +		 */
> +		if (!(atomic_read(&cpu_buffer->resize_disabled) & RESET_BIT))
> +			continue;
> +
>  		reset_disabled_cpu_buffer(cpu_buffer);
>  
>  		atomic_dec(&cpu_buffer->record_disabled);
> -		atomic_dec(&cpu_buffer->resize_disabled);
> +		atomic_sub(RESET_BIT, &cpu_buffer->resize_disabled);
>  	}
>  
>  	mutex_unlock(&buffer->mutex);


