Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F760C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3M31EWPUmzUM47VgOI+5A3RvUj0lLs1qFVMvUyvhKHM=; b=ykW04EWYFP4ZcoyqE4S2mcedM3
	SCILfIYa+sitw/U+XF1ht4ECHx/IVP+DmnvNPjAo6P9+43VYcwa/BdcDE++hEjFEsDycaTSmCdwTJ
	zODGkwKwZT3NceQBy5FfQchlKpTSwqqHFJOoE/cfZuZmAtgE2TZyp3wm23LijTKfcV+rLbxuolwQv
	pzSYqnJLDEWg3BjQHAwLWI4A2J4Nw4q/dx9R75cH0P8/zBVRbl0aFRiRcoVKPPWrWOJJR2tN9ONy5
	zXOdWF+813cRkvOBDfhYwCluKlnEFn3f19985MSIFIOnbq7zr+Fx9DBc4kKZATVv8KV81L+usdOQP
	GC1hpD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jx7-00000005s0M-37Lr;
	Tue, 30 Apr 2024 09:39:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jx3-00000005ryD-1je0;
	Tue, 30 Apr 2024 09:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714469944;
	bh=MCa5KWw0+OQ7gCxKdfi5S+q/EA68/H4Hfou7pC7eiwg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0rfc9VNmT2Y4LfZiO6mXxHVQyE5U5EZGea1auI8yDl1oi/FxBU5aO6Cs2ZpFiKp5e
	 RsANRBRyLlfpYYrv1pc70yjuqIC2D5RrRZ5rtrQ9BVDVzco0U5BKqzkgYoaghr47QG
	 wLITZRen8Q+LA107fqUb3qhAe/kCUA7xJF/nRl1L2rJ3rI2v7zxJlDaPOqzrj0bEGt
	 yi3RLaYznZ5RkdrhHpfAjeetOIYUQSr+iKN56ZZpRF7vgAjHFavp3dFVPx/6aTfjPy
	 NgyqViqfpIgzAaHJ6dfySRm0L+OtOejANmGFoPp8ZOg7A90dIKxaDMZZqfzXfZOd5/
	 bsIU6RUMx25sQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 37B34378143B;
	Tue, 30 Apr 2024 09:39:03 +0000 (UTC)
Message-ID: <2b46b3c0-f4ad-48e1-964b-128d29bafa9c@collabora.com>
Date: Tue, 30 Apr 2024 11:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: mtk-cmdq: Fix sleeping function called from
 invalid context
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240430083934.26980-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240430083934.26980-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_023905_630199_3976CBC1 
X-CRM114-Status: GOOD (  20.05  )
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

Il 30/04/24 10:39, Jason-JH.Lin ha scritto:
> When we run kernel with lockdebug option, we will get the BUG below:
> [  106.692124] BUG: sleeping function called from invalid context at drivers/base/power/runtime.c:1164
> [  106.692190] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 3616, name: kworker/u17:3
> [  106.692226] preempt_count: 1, expected: 0
> [  106.692254] RCU nest depth: 0, expected: 0
> [  106.692282] INFO: lockdep is turned off.
> [  106.692306] irq event stamp: 0
> [  106.692331] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> [  106.692376] hardirqs last disabled at (0): [<ffffffee15d37fa0>] copy_process+0xc90/0x2ac0
> [  106.692429] softirqs last  enabled at (0): [<ffffffee15d37fc4>] copy_process+0xcb4/0x2ac0
> [  106.692473] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [  106.692513] CPU: 1 PID: 3616 Comm: kworker/u17:3 Not tainted 6.1.87-lockdep-14133-g26e933aca785 #1 6839942e1cf34914b0a366137843dd2366f52aa9
> [  106.692556] Hardware name: Google Ciri sku0/unprovisioned board (DT)
> [  106.692586] Workqueue: imgsys_runner imgsys_runner_func
> [  106.692638] Call trace:
> [  106.692662]  dump_backtrace+0x100/0x120
> [  106.692702]  show_stack+0x20/0x2c
> [  106.692737]  dump_stack_lvl+0x84/0xb4
> [  106.692775]  dump_stack+0x18/0x48
> [  106.692809]  __might_resched+0x354/0x4c0
> [  106.692847]  __might_sleep+0x98/0xe4
> [  106.692883]  __pm_runtime_resume+0x70/0x124
> [  106.692921]  cmdq_mbox_send_data+0xe4/0xb1c
> [  106.692964]  msg_submit+0x194/0x2dc
> [  106.693003]  mbox_send_message+0x190/0x330
> [  106.693043]  imgsys_cmdq_sendtask+0x1618/0x2224
> [  106.693082]  imgsys_runner_func+0xac/0x11c
> [  106.693118]  process_one_work+0x638/0xf84
> [  106.693158]  worker_thread+0x808/0xcd0
> [  106.693196]  kthread+0x24c/0x324
> [  106.693231]  ret_from_fork+0x10/0x20
> 
> We found that there is a spin_lock_irqsave protection in msg_submit()
> of mailbox.c.
> So when cmdq driver calls pm_runtime_get_sync() in cmdq_mbox_send_data(),
> it will get this BUG report.
> 
> Add pm_runtime_irq_safe() to let pm_runtime callbacks is safe in atomic
> context with interrupts disabled.
> 

I see. The problem with this is that pm_runtime_irq_safe() will raise the refcount
of the parent device "forever", which isn't the best and partially defeats what we
are trying to do here (keeping stuff off unless really needed).

At this point I wonder if it'd be just better to really fix this instead of working
around the problem.

I'd say that one of the options would be to perform a change to msg_submit() so
that it will take into account that a .send_data() callback might be using RPM
functions.

Ideas? :-)

Cheers,
Angelo

> Fixes: 8afe816b0c99 ("mailbox: mtk-cmdq-mailbox: Implement Runtime PM with autosuspend")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index ead2200f39ba..3b4f19633c83 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -694,6 +694,7 @@ static int cmdq_probe(struct platform_device *pdev)
>   
>   	pm_runtime_set_autosuspend_delay(dev, CMDQ_MBOX_AUTOSUSPEND_DELAY_MS);
>   	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_irq_safe(dev);
>   
>   	return 0;
>   }




