Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE969FED9F0
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwQ1Tj/5fxwXOKenXlPq85WoWCXbsQhDWZrqEkDauDM=; b=HT5en+A0OxCyuS3MQQCKiRd4J7
	vfFM1LfBgunIVf832Iv5rgs/JxKPK7qJVka6Vilvhp0MOKvRdhJ+aT1g45FRN77EyaDCiEooHHiB0
	AE65wcPuGXyZji1axsMuDfGnCiiNHq3641F3a4I/6sEcFEMKAPcxQUjbjwnrXxzcr8h1isRTpmOgw
	UyasTVDMBTepIZ2Y/WzSidJrpxQDvUoY6c8cK0Li4GVJ/QaB+FQpkmuO7C6CjNZpP8q6/VDvmLMPo
	2zqjbLl7haLc52hxHUhDMJ9pQXBsoNuvSpVE7WY3mkadRC4we3gqW1XCxIoMfQ7xgq5dWh1IU0HVw
	X6N7SEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XxH-00000006tf3-1DJH;
	Tue, 17 Mar 2026 17:11:43 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XxC-00000006tdq-3ONc
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 17:11:42 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260317171131euoutp01f0a072d60d675b14403eb474b5a88074~dsCLZr2cm1291112911euoutp019
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 17:11:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260317171131euoutp01f0a072d60d675b14403eb474b5a88074~dsCLZr2cm1291112911euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773767492;
	bh=pwQ1Tj/5fxwXOKenXlPq85WoWCXbsQhDWZrqEkDauDM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=MYWnpHbEr3ciYUqKxZ6yIU+QrhAKa00vRYesIqH3QOFrGXdKqb5MUJooCBD0goO1m
	 oOEgWYGxbL95r4onomXj8ywWt125YhIj4aMN+9SUCW5sIzaFIPUe82ZVZfqzLBReV0
	 ukglRzTlXeJTuKeksp2cf5xbS+Ewwbv1jF4h7W1c=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a~dsCLI5OAD2221222212eucas1p2N;
	Tue, 17 Mar 2026 17:11:31 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260317171130eusmtip2df6d625da7072fe080e4a257996d4b9f~dsCJurUtG1242212422eusmtip2P;
	Tue, 17 Mar 2026 17:11:30 +0000 (GMT)
Message-ID: <1f88b91c-59e6-4347-84c2-50b7cf106c47@samsung.com>
Date: Tue, 17 Mar 2026 18:11:29 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] ufs: core: Avoid IRQ thread wakeup during active UIC
 command
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, avri.altman@sandisk.com,
	alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
	chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
	eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
	bvanassche@acm.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260306054419.3816557-1-peter.wang@mediatek.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a
X-EPHeader: CA
X-CMS-RootMailID: 20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a
References: <20260306054419.3816557-1-peter.wang@mediatek.com>
	<CGME20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_101139_541860_B2985130 
X-CRM114-Status: GOOD (  16.49  )
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

Hi

On 06.03.2026 06:43, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
>
> Only return IRQ_WAKE_THREAD when MCQ and ESI are not enabled
> and no UIC command is active. The default UIC command timeout
> is 500ms, Using threaded IRQs during an active UIC command
> increases the risk of timeout due to possible preemption
> by other system IRQs.
>
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

This patch landed in linux-next as commit 6475cfb81fc4 ("scsi: ufs: 
core: Avoid IRQ thread wakeup during active UIC command"). In my tests I 
found that it causes the following regression on QCom RB5 board 
(arch/arm64/boot/dts/qcom/qrb5165-rb5.dts):

=============================
[ BUG: Invalid wait context ]
7.0.0-rc4-next-20260316 #16535 Not tainted
-----------------------------
swapper/0/0 is trying to lock:
ffff000089f58048 (shost->host_lock){....}-{3:3}, at: 
ufshcd_sl_intr+0x3c0/0x6b4
other info that might help us debug this:
context-{2:2}
no locks held by swapper/0/0.
stack backtrace:
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.0.0-rc4-next-20260316 
#16535 PREEMPT
Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
Call trace:
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x90/0xd0
  dump_stack+0x18/0x24
  __lock_acquire+0xa40/0x2254
  lock_acquire+0x1c4/0x3fc
  _raw_spin_lock_irqsave+0x60/0x88
  ufshcd_sl_intr+0x3c0/0x6b4
  ufshcd_intr+0x7c/0x90
  __handle_irq_event_percpu+0xa0/0x4c4
  handle_irq_event+0x4c/0xf8
  handle_fasteoi_irq+0x108/0x198
  handle_irq_desc+0x40/0x58
  generic_handle_domain_irq+0x18/0x24
  gic_handle_irq+0x4c/0x110
  call_on_irq_stack+0x30/0x48
  do_interrupt_handler+0x80/0x84
  el1_interrupt+0x3c/0x60
  el1h_64_irq_handler+0x18/0x24
  el1h_64_irq+0x6c/0x70
  cpuidle_enter_state+0xf8/0x41c (P)
  cpuidle_enter+0x38/0x50
  do_idle+0x170/0x2ac
  cpu_startup_entry+0x34/0x3c
  rest_init+0xf8/0x188
  start_kernel+0x818/0x8ec
  __primary_switched+0x88/0x90
scsi host0: ufshcd


Reverting $subject on top of linux-next fixes this issue.

> ---
>   drivers/ufs/core/ufshcd.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 9908375b2f98..6554e1db3343 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -7200,8 +7200,12 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
>   	struct ufs_hba *hba = __hba;
>   	u32 intr_status, enabled_intr_status;
>   
> -	/* Move interrupt handling to thread when MCQ & ESI are not enabled */
> -	if (!hba->mcq_enabled || !hba->mcq_esi_enabled)
> +	/*
> +	 * Handle interrupt in thread if MCQ or ESI is disabled,
> +	 * and no active UIC command.
> +	 */
> +	if ((!hba->mcq_enabled || !hba->mcq_esi_enabled) &&
> +	    !hba->active_uic_cmd)
>   		return IRQ_WAKE_THREAD;
>   
>   	intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


