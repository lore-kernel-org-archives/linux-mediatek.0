Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A08AFCD0D0
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 08:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvFMvZTQXMKdyazswCtjEI004Xa7gBYHWW3UOLfDwIg=; b=IW+j/5gjcvKpB+xbPdLVFxKG0v
	j6VLb6A9Mw+30CL8lACY5XLjMsNY6q37JBJfFIKWVIlrdjK3BM4gT3kl8AAr+UvGtdeUopv9jVnd8
	WuWU+iGKvpdNS0ZgVJE50M3kzTLsYBz+P5P/CMsscBJ1rrysQlf06EOSq7lhKlDRL/HYGZzkgEEGE
	Gg0v/bnf1imQU8jrRmYCN9rJdBhbqOj7//8doBpf2M5gCqPv8EMbER4xjN8gthbFCARSrvzjzNWep
	Okv4p5yLtovTtgEJ4SwYr1dezydGzQo+i12QnOO70uOiHX4cKnLs8pF52/kyD9eVGXFWcwdKeCABi
	2yVqv4Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2m2v-000000081NC-30ds;
	Wed, 18 Mar 2026 08:14:29 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2m2r-000000081LW-2AMs
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 08:14:27 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260318081421euoutp018940492bcb5b6b9a4a08ac11f95647ee~d4WcWOP0z1524415244euoutp01W
	for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 08:14:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260318081421euoutp018940492bcb5b6b9a4a08ac11f95647ee~d4WcWOP0z1524415244euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773821661;
	bh=yvFMvZTQXMKdyazswCtjEI004Xa7gBYHWW3UOLfDwIg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rgJYDwvRIwDt/FaftXWmG/5FBlUnztGMNle/opQZuhMYJ0thyVz59GqnttropbAeE
	 Mw+9GwURV8SlXLsgDx7BkCkJS0OsyxD/yCV8p1fi3XKSDEp8cb8/hM90nGSduLriAw
	 hPhKGzsdDkIOLptGVjdTA9KUVpPZoLuVO34lu4YM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260318081420eucas1p2d63a59ae8d570c6723710071d3372859~d4WcI4HPW1653316533eucas1p21;
	Wed, 18 Mar 2026 08:14:20 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260318081419eusmtip13f76841a77bec5816040238bbba36941~d4WaxSZ4S0399803998eusmtip1q;
	Wed, 18 Mar 2026 08:14:19 +0000 (GMT)
Message-ID: <473ecf74-1907-42a2-a785-6164720cb641@samsung.com>
Date: Wed, 18 Mar 2026 09:14:18 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] ufs: core: Avoid IRQ thread wakeup during active UIC
 command
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>, "avri.altman@sandisk.com"
	<avri.altman@sandisk.com>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>
Cc: "bvanassche@acm.org" <bvanassche@acm.org>,
	=?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
	=?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	=?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
	=?UTF-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	=?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
	<Chun-hung.Wu@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
	<Naomi.Chu@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <a341a70943ffb8b8c5bbc9b4e19c017fe664fdf1.camel@mediatek.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260318081420eucas1p2d63a59ae8d570c6723710071d3372859
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a
X-EPHeader: CA
X-CMS-RootMailID: 20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a
References: <20260306054419.3816557-1-peter.wang@mediatek.com>
	<CGME20260317171131eucas1p25dd55bf1aad6d5b310526d51885b3b7a@eucas1p2.samsung.com>
	<1f88b91c-59e6-4347-84c2-50b7cf106c47@samsung.com>
	<a341a70943ffb8b8c5bbc9b4e19c017fe664fdf1.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_011426_176237_0FDAB861 
X-CRM114-Status: GOOD (  17.03  )
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

Hi Peter,

On 18.03.2026 07:57, Peter Wang (王信友) wrote:
> On Tue, 2026-03-17 at 18:11 +0100, Marek Szyprowski wrote:
>> This patch landed in linux-next as commit 6475cfb81fc4 ("scsi: ufs:
>> core: Avoid IRQ thread wakeup during active UIC command"). In my
>> tests I
>> found that it causes the following regression on QCom RB5 board
>> (arch/arm64/boot/dts/qcom/qrb5165-rb5.dts):
> Hi Marek,
>
> If this issue can always be reproduced with this patch?

The issue I've observed is 100% reproducible. I've checked again by 
compiling the kernel directly from commit 6475cfb81fc4:

=============================
[ BUG: Invalid wait context ]
7.0.0-rc1+ #16536 Not tainted
-----------------------------
swapper/0/0 is trying to lock:
ffff000080bdc048 (shost->host_lock){....}-{3:3}, at: 
ufshcd_sl_intr+0x3c0/0x6b4
other info that might help us debug this:
context-{2:2}
no locks held by swapper/0/0.
stack backtrace:
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.0.0-rc1+ #16536 PREEMPT
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
  do_idle+0x208/0x290
  cpu_startup_entry+0x34/0x3c
  rest_init+0xf8/0x188
  start_kernel+0x810/0x8e4
  __primary_switched+0x88/0x90
scsi host0: ufshcd



> I have doubts because, in your log, it seems to be ISR trying
> to acquire the spinlock (shost->host_lock), but cannot obtain
> it in time, causing a timeout.
>
> ufshcd-qcom 1d84000.ufshc: uic cmd 0x1 with arg3 0x0 completion timeout
> ufshcd-qcom 1d84000.ufshc: dme-get: sttr-id 0x41 failed 0 retries no
> locks held by swapper/0/0.
> ufshcd-qcom 1d84000.ufshc: ufs_wcom_check_hibern8: unable to get
> TX_FSM_STATE, err -110 stack backtrace:
> ufshcd-qcom 1d84000.ufshc: No active UIC command. Maybe a timeout
> occurred?
> ufshcd-qcom 1d84000.ufshc: ufshcd_threaded_intr: Unhadled interrupt
> 0x00000000 (0x00000400, 0x00000400)
>
> Regardless of whether it runs in IRQ or thread IRQ context, the
> outcome is the same (host_lock cannot be acquired in time).
> So, could you check why this spinlock cannot be acquired first?
> Additionally, ufs_wcom_check_hibern8 does not appear in the
> current code base, so there might be some other unknown code
> that has already acquired host_lock in your code base?

You have probably mixed my report with this one 
https://lore.kernel.org/all/abmNkRC_vSVaP2sC@mail.iam.tj/

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


