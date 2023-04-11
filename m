Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C357BC77B6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 16:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zrg/TOaIiFsc/suyI10+fn8TAAssxRzE/7Q1Lt+MH/4=; b=ihjdyuLk2YKeq85j32NCTFaK7w
	eDcGBO6pbb6v8ANhe4Tpi5CgDRlhGniioY+BeIDsP5O7+XPY5iofbOilagEZQxTjtngIpDiyVbTMN
	CRficXTcs/o8zULKl9CmvFn1JTPjrkXyAdpMyUobAWI38WO908Z8SqzX8v+91Udr41iYf7KlZE/8I
	86k5y32qwc2e/G7p0m7uZOXBqgOiSLT9FRo/B911OtX8s6EElNqDz83lgfR1dUlxwv8Yrf7YgxEAL
	/dg3I36fsU9u4dDwQbku5ahheCfW8vTZTvrrVVEPiYEuBpfa6jtx+0NWV8luYZDyIDJoVg9cv0GL2
	HIzDTGHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmH6K-000b1R-1l;
	Tue, 11 Apr 2023 16:44:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmH6G-000b08-0X;
	Tue, 11 Apr 2023 16:44:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 170CE6241E;
	Tue, 11 Apr 2023 16:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C903C433D2;
	Tue, 11 Apr 2023 16:44:05 +0000 (UTC)
Date: Tue, 11 Apr 2023 12:44:03 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
Cc: <mhiramat@kernel.org>, <bobule.chang@mediatek.com>,
 <wsd_upstream@mediatek.com>, <cheng-jui.wang@mediatek.com>,
 <npiggin@gmail.com>, <stable@vger.kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3] ring-buffer: Prevent inconsistent operation on
 cpu_buffer->resize_disabled
Message-ID: <20230411124403.2a31e12d@gandalf.local.home>
In-Reply-To: <20230410073512.13362-1-Tze-nan.Wu@mediatek.com>
References: <20230409024616.31099-1-Tze-nan.Wu@mediatek.com>
	<20230410073512.13362-1-Tze-nan.Wu@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_094408_300975_49991998 
X-CRM114-Status: GOOD (  35.54  )
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


Please have each new patch be a new thread, and not a Cc to the previous
version of the patch. As it makes it hard to find in INBOXs.

On Mon, 10 Apr 2023 15:35:08 +0800
Tze-nan Wu <Tze-nan.Wu@mediatek.com> wrote:

> Write to buffer_size_kb can permanently fail, due to cpu_online_mask may
> changed between two for_each_online_buffer_cpu loops.
> The number of increasing and decreasing on cpu_buffer->resize_disable
> may be inconsistent, leading that the resize_disabled in some CPUs
> becoming none zero after ring_buffer_reset_online_cpus return.
> 
> This issue can be reproduced by "echo 0 > trace" while hotplugging cpu.
> After reproducing success, we can find out buffer_size_kb will not be
> functional anymore.
> 
> Prevent the two "loops" in this function from iterating through different
> online cpus by copying cpu_online_mask at the entry of the function.
> 

The "Changes from" need to go below  the '---', otherwise they are added to
the git commit (we don't want it there).

> Changes from v1 to v3:
>   Declare the cpumask variable statically rather than dynamically.
> 
> Changes from v2 to v3:
>   Considering holding cpu_hotplug_lock too long because of the
>   synchronize_rcu(), maybe it's better to prevent the issue by copying
>   cpu_online_mask at the entry of the function as V1 does, instead of
>   using cpus_read_lock().
> 
> Link: https://lore.kernel.org/lkml/20230408052226.25268-1-Tze-nan.Wu@mediatek.com/
> Link: https://lore.kernel.org/oe-kbuild-all/202304082051.Dp50upfS-lkp@intel.com/
> Link: https://lore.kernel.org/oe-kbuild-all/202304081615.eiaqpbV8-lkp@intel.com/
> 
> Cc: stable@vger.kernel.org
> Cc: npiggin@gmail.com
> Fixes: b23d7a5f4a07 ("ring-buffer: speed up buffer resets by avoiding synchronize_rcu for each CPU")
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
> ---

This is where the "Changes from" go. And since this patch is not suppose to
be a Cc. But since it's still good to have a link to it. You could do:

Changes from v2 to v3: https://lore.kernel.org/linux-trace-kernel/20230409024616.31099-1-Tze-nan.Wu@mediatek.com/
  Considering holding cpu_hotplug_lock too long because of the
  synchronize_rcu(), maybe it's better to prevent the issue by copying
  cpu_online_mask at the entry of the function as V1 does, instead of
  using cpus_read_lock().


Where the previous version changes has the lore link to the previous patch,
in case someone wants to look at it.


>  kernel/trace/ring_buffer.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 76a2d91eecad..dc758930dacb 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -288,9 +288,6 @@ EXPORT_SYMBOL_GPL(ring_buffer_event_data);
>  #define for_each_buffer_cpu(buffer, cpu)		\
>  	for_each_cpu(cpu, buffer->cpumask)
>  
> -#define for_each_online_buffer_cpu(buffer, cpu)		\
> -	for_each_cpu_and(cpu, buffer->cpumask, cpu_online_mask)
> -
>  #define TS_SHIFT	27
>  #define TS_MASK		((1ULL << TS_SHIFT) - 1)
>  #define TS_DELTA_TEST	(~TS_MASK)
> @@ -5353,12 +5350,19 @@ EXPORT_SYMBOL_GPL(ring_buffer_reset_cpu);
>  void ring_buffer_reset_online_cpus(struct trace_buffer *buffer)
>  {
>  	struct ring_buffer_per_cpu *cpu_buffer;
> +	cpumask_t reset_online_cpumask;

It's usually considered bad form to put a cpumask on the stack. As it can
be 128 bytes for a machine with 1024 CPUs (and yes they do exist). Also,
the mask size is set to NR_CPUS not the actual size, so you do not even
need to have it that big.


>  	int cpu;
>  
> +	/*
> +	 * Record cpu_online_mask here to make sure we iterate through the same
> +	 * online CPUs in the following two loops.
> +	 */
> +	cpumask_copy(&reset_online_cpumask, cpu_online_mask);
> +
>  	/* prevent another thread from changing buffer sizes */
>  	mutex_lock(&buffer->mutex);
>  
> -	for_each_online_buffer_cpu(buffer, cpu) {
> +	for_each_cpu_and(cpu, buffer->cpumask, &reset_online_cpumask) {
>  		cpu_buffer = buffer->buffers[cpu];
>  
>  		atomic_inc(&cpu_buffer->resize_disabled);

Anyway, we don't need to modify any of the above, and just do the following
instead of atomic_inc():

#define RESET_BIT	(1 << 30)

		atomic_add(&cpu_buffer->resize_disabled, RESET_BIT);


> @@ -5368,7 +5372,7 @@ void ring_buffer_reset_online_cpus(struct trace_buffer *buffer)
>  	/* Make sure all commits have finished */
>  	synchronize_rcu();
>  
> -	for_each_online_buffer_cpu(buffer, cpu) {
> +	for_each_cpu_and(cpu, buffer->cpumask, &reset_online_cpumask) {
>  		cpu_buffer = buffer->buffers[cpu];

Then here we can do:

		/*
		 * If a CPU came online during the synchronize_rcu(), then
		 * ignore it.
		 */
		if (!atomic_read(&cpu_buffer->resize_disabled) & RESET_BIT))
			continue;

		atomic_sub(&cpu_buffer->resize_disabled, RESET_BIT);


As the resize_disabled only needs to be set to something to make it
disabled.

-- Steve

>  
>  		reset_disabled_cpu_buffer(cpu_buffer);


