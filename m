Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D559C87FCB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Aug 2025 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVDqTQkWRvs+VsDEwe5bifWicO5KdITd3j+JwjIPmo4=; b=S4iW6BRkfvgLgrpYvZiorDpBh/
	dQ0KFvMR1l1DCQ9+67KnleyBOrrPlH7vyRQiGt1bj26by2CFyssRY8qACXu274TwdcCPK0RS5//xu
	MthT+DLTECTiiXrcpUDp9ovq02nKYflezZoBDMeeuq4gM7uKKeJlk6tZs9yJQ4yHDsGln6aZBu47S
	NblG1kzKwulnBtwADq5QZ3utdwU0ljtLYUPcyK++rnWvv/WehhZT8Zh+2GSwsliOukzZzZ/5Foaou
	k2a7YhcE8u7i+AJwU/HBD9dFblF79ueCPS4e6X+wHArOWAjhLuvxD5KGkMgptkHqOzvagcHoxwWH2
	6o4qNz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirSk-0000000A4l4-44ZB;
	Mon, 04 Aug 2025 09:26:35 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uir31-0000000A1kZ-17oY
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Aug 2025 09:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1754297992; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=kVDqTQkWRvs+VsDEwe5bifWicO5KdITd3j+JwjIPmo4=;
	b=dTlkf4BJMw4THa2d89eV/aOR/WFecVrM79GNkF43kcksrhGAon/9oZ8/eQkposgpmSf+FvTeqZS6O+IUUU3zjIDrr3LMa+G4z19S/ldz6LRnc4Ih0NUpkXR02zFSeYMXeKxqCRSwEFx/u6E6FggY6Ds9zMF+APihEKizfYS8daQ=
Received: from 30.221.131.110(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WkxxuDS_1754297987 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 04 Aug 2025 16:59:48 +0800
Message-ID: <4978e947-f68f-455a-a318-5f365d686496@linux.alibaba.com>
Date: Mon, 4 Aug 2025 16:59:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] erofs: Fix detection of atomic context to prevent
 sleeping in invalid context
To: Junli Liu <liujunli@lixiang.com>, linux-erofs@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, gao.xiang@linux.alibaba.com,
 linux-mediatek@lists.infradead.org, chao@kernel.org, xiang@kernel.org,
 yangsonghua@lixiang.com
References: <20250804082912.242580-1-liujunli@lixiang.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250804082912.242580-1-liujunli@lixiang.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_015959_999289_7EA510F9 
X-CRM114-Status: GOOD (  24.59  )
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

Hi Junli,

The patch format is broken, please check your email client (you
could just use a simple `git send-email` to submit) and (if
possible) send to yourself first.

I think the subject can just be

subject: erofs: fix atomic context detection when !CONFIG_DEBUG_LOCK_ALLOC

On 2025/8/4 16:29, Junli Liu wrote:
> From: Junli liu
> 
> The current atomic context detection is insufficient and can lead to
> sleeping function calls in invalid contexts, causing kernel warnings
> and potential system instability. See the stacktrace [1]

Yes, the issue is still valid, and it was discussed before in:
https://lore.kernel.org/r/58b661d0-0ebb-4b45-a10d-c5927fb791cd@paulmck-laptop

I prefer to apply to CONFIG_PREEMPT_COUNT cases only since
I don't see any real Android user uses !CONFIG_PREEMPT_COUNT.

But the commit message can be further improved as:

"Since EROFS handles decompression in non-atomic contexts due to
uncontrollable decompression latencies and vmap() usage, it tries
to detect atomic contexts and only kicks off a kworker on demand
in order to reduce unnecessary scheduling overhead.

However, the current approach is insufficient and can lead to
sleeping function calls in invalid contexts, causing kernel
warnings and potential system instability. See the stacktrace [1]"


Also shorten the commit message to 72 chars per line at maximum.

> 
> The current implementation only checks rcu_read_lock_any_held(), which
> behaves inconsistently across different kernel configurations:
> 
> - When CONFIG_DEBUG_LOCK_ALLOC is enabled: correctly detects RCU critical
> sections by checking rcu_lock_map
> - When CONFIG_DEBUG_LOCK_ALLOC is disabled: compiles to "!preemptible()",
> which only checks preempt_count and misses RCU critical sections
> 
> This patch introduces z_erofs_in_atomic() to provide comprehensive atomic
> context detection:
> 
> 1. Check RCU preemption depth when CONFIG_PREEMPTION is enabled, as RCU
> critical sections may not affect preempt_count but still require
> atomic handling
> 
> 2. Always use async processing when CONFIG_PREEMPT_COUNT is disabled,
> as preemption state cannot be reliably determined
> 
> 3. Fall back to standard preemptible() check for remaining cases
> 
> The function replaces the previous complex condition check and ensures
> that z_erofs always uses (kthread_)work in atomic contexts to minimize
> scheduling overhead and prevent sleeping in invalid contexts.
> 
> ==============================================
> [1] Problem stacktrace
> [ 61.266692] BUG: sleeping function called from invalid context at kernel/locking/rtmutex_api.c:510
> [ 61.266702] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 107, name: irq/54-ufshcd
> [ 61.266704] preempt_count: 0, expected: 0
> [ 61.266705] RCU nest depth: 2, expected: 0
> [ 61.266710] CPU: 0 UID: 0 PID: 107 Comm: irq/54-ufshcd Tainted: G W O 6.12.17 #1
> [ 61.266714] Tainted: [W]=WARN, [O]=OOT_MODULE
> [ 61.266715] Hardware name: schumacher (DT)
> [ 61.266717] Call trace:
> [ 61.266718] dump_backtrace+0x9c/0x100
> [ 61.266727] show_stack+0x20/0x38
> [ 61.266728] dump_stack_lvl+0x78/0x90
> [ 61.266734] dump_stack+0x18/0x28
> [ 61.266736] __might_resched+0x11c/0x180
> [ 61.266743] __might_sleep+0x64/0xc8
> [ 61.266745] mutex_lock+0x2c/0xc0
> [ 61.266748] z_erofs_decompress_queue+0xe8/0x978
> [ 61.266753] z_erofs_decompress_kickoff+0xa8/0x190
> [ 61.266756] z_erofs_endio+0x168/0x288
> [ 61.266758] bio_endio+0x160/0x218
> [ 61.266762] blk_update_request+0x244/0x458
> [ 61.266766] scsi_end_request+0x38/0x278
> [ 61.266770] scsi_io_completion+0x4c/0x600
> [ 61.266772] scsi_finish_command+0xc8/0xe8
> [ 61.266775] scsi_complete+0x88/0x148
> [ 61.266777] blk_mq_complete_request+0x3c/0x58
> [ 61.266780] scsi_done_internal+0xcc/0x158
> [ 61.266782] scsi_done+0x1c/0x30
> [ 61.266783] ufshcd_compl_one_cqe+0x12c/0x438
> [ 61.266786] __ufshcd_transfer_req_compl+0x2c/0x78
> [ 61.266788] ufshcd_poll+0xf4/0x210
> [ 61.266789] ufshcd_transfer_req_compl+0x50/0x88
> [ 61.266791] ufshcd_intr+0x21c/0x7c8
> [ 61.266792] irq_forced_thread_fn+0x44/0xd8
> [ 61.266796] irq_thread+0x1a4/0x358
> [ 61.266799] kthread+0x12c/0x138
> [ 61.266802] ret_from_fork+0x10/0x20
> 
> Signed-off-by: Junli Liu
> ---
> fs/erofs/zdata.c | 14 ++++++++++++--
> 1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index 792f20888..1883781c9 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -1432,6 +1432,16 @@ static void z_erofs_decompressqueue_kthread_work(struct kthread_work *work)
> }
> #endif
> 
> +/* Use (kthread_)work in atomic contexts to minimize scheduling overhead */
> +static inline bool z_erofs_in_atomic(void)
> +{
> + if (IS_ENABLED(CONFIG_PREEMPTION) && rcu_preempt_depth())
> + return true;
> + if (!IS_ENABLED(CONFIG_PREEMPT_COUNT))
> + return true;
> + return !preemptible();
> +}
> +
> static void z_erofs_decompress_kickoff(struct z_erofs_decompressqueue *io,
> int bios)
> {
> @@ -1446,8 +1456,8 @@ static void z_erofs_decompress_kickoff(struct z_erofs_decompressqueue *io,
> 
> if (atomic_add_return(bios, &io->pending_bios))
> return;
> - /* Use (kthread_)work and sync decompression for atomic contexts only */
> - if (!in_task() || irqs_disabled() || rcu_read_lock_any_held()) {
> +
> + if (z_erofs_in_atomic()) {

Please avoid the unnecessary new line in the next version.

Thanks,
Gao XIang

