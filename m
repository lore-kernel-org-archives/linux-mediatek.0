Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CA31077609
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 19:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IFXzogKubWdLI3XWVv4ALzt88W3L4Gj8JjMLCnR0Ro=; b=hsIPOqzrabwlsWxl/8qgUwV0L5
	ErnaPHtLQMQpfahleFcAdYoeZgDkX6vWzilTr7+rs4s8zn74g6psnS4OTnuYabTo/2hsqjzfknvwK
	9T39czbYLqXa6YYGbeHaDUvZcUeQUF+bStg/37wpGZ2NYGwOGnStj8Nry++SAacTF6maAAvDXKIya
	VWoOB1mRfoea33ok6GPwa4sgCgY/IXtrh9D+grEmkhl+5LNZtjoVxaL5z3zTbfGuJRETXcEFIwX1E
	sG5aVchdx9w3kyx73j2qKy63Bt1WqFFv572UAezJNKBwvcGbRmDcNJ+W68AZ5AXnTgHOqAxcMXyHL
	d7kbZ4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wcy-00000009Ey4-1G2a;
	Wed, 18 Mar 2026 19:32:24 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wct-00000009Exg-3tj9
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 19:32:22 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260318193212euoutp01fd6959d0f8d3f4ddb415999024c11462~eBmScr2N80322203222euoutp01Y
	for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 19:32:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260318193212euoutp01fd6959d0f8d3f4ddb415999024c11462~eBmScr2N80322203222euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773862332;
	bh=6IFXzogKubWdLI3XWVv4ALzt88W3L4Gj8JjMLCnR0Ro=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=o1zs8GrKWY/zERyfeKXWrRacdfChFmR26NnCgvzDRgCbVVN5CovGgVq3jjMQKfxHR
	 4FcIpuLIqLQMowGXvrTEdT+d0JdfJXgDuEdqN0ECHdzJzf7k+E1scI9Au0NomkgiAg
	 EKn0TOW7J8HXXOlgw9DPJRrsIREXjz0A5qKGDHEA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260318193211eucas1p15a3ea20acd532ad8553948323b0eb96c~eBmRmVbY71058410584eucas1p1e;
	Wed, 18 Mar 2026 19:32:11 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260318193210eusmtip2a4bf1016c544542de84a481a384d1e86~eBmQ2K1rY0576205762eusmtip2b;
	Wed, 18 Mar 2026 19:32:10 +0000 (GMT)
Message-ID: <c9b421aa-baa7-4609-b665-226f894f5114@samsung.com>
Date: Wed, 18 Mar 2026 20:32:09 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] ufs: core: Avoid IRQ thread wakeup during active UIC
 command
To: Bart Van Assche <bvanassche@acm.org>, peter.wang@mediatek.com,
	linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
	avri.altman@sandisk.com, alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
	chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
	eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <364d15bf-8d11-46af-bbc6-b4ae45618bf5@acm.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260318193211eucas1p15a3ea20acd532ad8553948323b0eb96c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a
X-EPHeader: CA
X-CMS-RootMailID: 20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a
References: <20260306054419.3816557-1-peter.wang@mediatek.com>
	<CGME20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a@eucas1p2.samsung.com>
	<1f88b91c-59e6-4347-84c2-50b7cf106c47@samsung.com>
	<df1d0b3f-6822-4c49-aeea-fc513e2b05cb@acm.org>
	<1b9db59c-f736-4c59-b37a-15a60cfa4f3e@samsung.com>
	<364d15bf-8d11-46af-bbc6-b4ae45618bf5@acm.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_123221_389076_7DDB7B80 
X-CRM114-Status: GOOD (  15.95  )
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

On 18.03.2026 18:32, Bart Van Assche wrote:
> On 3/18/26 10:13 AM, Marek Szyprowski wrote:
>> On 18.03.2026 16:50, Bart Van Assche wrote:
>>> On 3/17/26 10:11 AM, Marek Szyprowski wrote:
>>>> This patch landed in linux-next as commit 6475cfb81fc4 ("scsi: ufs:
>>>> core: Avoid IRQ thread wakeup during active UIC command"). In my 
>>>> tests I
>>>> found that it causes the following regression on QCom RB5 board
>>>> (arch/arm64/boot/dts/qcom/qrb5165-rb5.dts):
>>>>
>>>> =============================
>>>> [ BUG: Invalid wait context ]
>>>> 7.0.0-rc4-next-20260316 #16535 Not tainted
>>>> -----------------------------
>>>> swapper/0/0 is trying to lock:
>>>> ffff000089f58048 (shost->host_lock){....}-{3:3}, at:
>>>
>>> This line is a mystery to me. Are there perhaps any local changes in
>>> your kernel tree on top of linux-next? I haven't been able to find the
>>> text "shost->host_lock" in the UIC completion path.
>>
>> I don't have any local changes, code is at commit 6475cfb81fc4. After
>> looking at the code this 'shost' indeed looks a bit mysterious, but
>> maybe it got that name after some inlining or code optimization.
>>
>>> Instead, this is
>>> what I found:
>>>
>>>      guard(spinlock_irqsave)(hba->host->host_lock);
>>>
>>>> ufshcd_sl_intr+0x3c0/0x6b4
>>>
>>> Can you please help with translating this information into a line
>>> number? Tools like addr2line, llvm-addr2line or llvm-objdump -d -l -S
>>> can be used to perform such a conversion.
>>
>> ufshcd_clk_scaling_allow() in drivers/ufs/core/ufshcd.c:6492 (code
>> checkout at git commit 6475cfb81fc4)
>
> Hi Marek,
>
> I haven't been able to find any call chain from ufshcd_sl_intr() into
> ufshcd_clk_scaling_allow(). Am I perhaps overlooking something?

I must have mixed something while calculating offsets for addr2line. I 
checked again and I found that there is already a script doing that. 
I've recompiled kernel with -Os (assuming that this way less code will 
be inlined) and this is the result:

=============================
[ BUG: Invalid wait context ]
7.0.0-rc1+ #16537 Not tainted
-----------------------------
swapper/0/0 is trying to lock:
ffff000080a04048 (shost->host_lock){....}-{3:3}, at: 
ufshcd_sl_intr+0x50/0x598
other info that might help us debug this:
context-{2:2}
no locks held by swapper/0/0.
stack backtrace:
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.0.0-rc1+ #16537 PREEMPT
Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
Call trace:
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x6c/0x94
  dump_stack+0x18/0x24
  __lock_acquire+0x3f8/0x10ac
  lock_acquire+0x29c/0x2ec
  _raw_spin_lock_irqsave+0x58/0x78
  ufshcd_sl_intr+0x50/0x598
  ufshcd_intr+0x64/0x78
  __handle_irq_event_percpu+0x1d4/0x354
  handle_irq_event_percpu+0x18/0x4c
  handle_irq_event+0x48/0x90
  handle_fasteoi_irq+0xc4/0xe8
  handle_irq_desc+0x48/0x58
  generic_handle_domain_irq+0x18/0x24
  gic_handle_irq+0xa4/0x108
  call_on_irq_stack+0x30/0x48
  do_interrupt_handler+0x88/0x94
  el1_interrupt+0x3c/0x60
  el1h_64_irq_handler+0x18/0x24
  el1h_64_irq+0x6c/0x70
  cpuidle_enter_state+0x1c0/0x2f0 (P)
  cpuidle_enter+0x38/0x50
  do_idle+0x23c/0x260
  cpu_startup_entry+0x34/0x38
  kernel_init+0x0/0x12c
  start_kernel+0x7e4/0x7f0
  __primary_switched+0x88/0x90


# ./scripts/faddr2line vmlinux "ufshcd_sl_intr+0x50/0x598"
ufshcd_sl_intr+0x50/0x598:
ufshcd_uic_cmd_compl at drivers/ufs/core/ufshcd.c:5570
(inlined by) ufshcd_sl_intr at drivers/ufs/core/ufshcd.c:7144


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


