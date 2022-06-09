Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DBEC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 12:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=gIF/yvAHTgDYJDFPadA/NvX55x/Nh/puHhDalhCE10c=; b=ZDHsoSjk3cGN+N
	Jwcw6qU7GaTAQxe6/Aw3Y4EUVcBFs7wxpNrSLIzlUph/SjRQCc+iZr6nGh3VAMspbbd/nD9qtcdrI
	9UP4dGGrtfqEXiras+3d83bbIaERJRM4SMMKR4zIkPzQqRIVmLHNP8tjxzHVpCLUol2UWX9oPZzOt
	7efle0j6FmN7cpvrYFXRsgbECgY/YktW4IddvdjTS1+TDIkxjWrzN3OGqJtoCNry1PLtbM2SYwdQW
	0QFRUV3+nJSX3V5wcjYREFOyQIs/uJ0T6DuyDygMCVAzNTSyNI7RDkoldwUl2Um8op1UFpPNeSEoK
	i2ieSO9E82mMlYhaR2QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzH30-001dN6-Ai; Thu, 09 Jun 2022 12:13:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGmy-001Wge-RO; Thu, 09 Jun 2022 11:57:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E35B60C49;
	Thu,  9 Jun 2022 11:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A599CC3411B;
	Thu,  9 Jun 2022 11:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654775843;
	bh=OypU/OgmdIE82Czce754wZSkPYqIeHYmcc3YDTKRUCc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hg036Jq6tRQxbSfxhePXWNh7rY1YzBQji8mWHKwFIQkvGjHhuwsmB/YWuUaE+RGVg
	 BYl8F9kOHSiSypJJ/VxYobtGaBQB9K9M6afPa4qniGj8e8jF/RrAeNLfI317N1so7a
	 iP/n92kuorohBLVa820HErpOembgsRzutaoIPLhaaKiWLmsQq5lC2UJVwG/QFpfDfC
	 2gp+Shnp0pzmcBnid61jngmuFxnZiP7cB6wkLQhQsv0LSGEzgyVHr8azCJYBHwlrT3
	 pi5bukGinvsaPmnK9Ym+RabGc+Gxpn3LlRnxH8fJO4LA9W+3sqArBlAUW7ETyIUBWZ
	 1yQJc88RqXzBw==
Date: Thu, 9 Jun 2022 12:57:17 +0100
From: Will Deacon <will@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, yj.chiang@mediatek.com,
	Marc Zyngier <maz@kernel.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, jean-philippe.brucker@arm.com
Subject: Re: [PATCH] arm64: Clear OS lock in enable_debug_monitors
Message-ID: <20220609115716.GA2427@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609033322.12436-1-mark-pk.tsai@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_045724_985796_608C8E16 
X-CRM114-Status: GOOD (  16.27  )
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

On Thu, Jun 09, 2022 at 11:33:18AM +0800, Mark-PK Tsai wrote:
> Always clear OS lock before enable debug event.
> 
> The OS lock is clear in cpuhp ops in recent kernel,
> but when the debug exception happened before it
> kernel might crash because debug event enable didn't
> take effect when OS lock is hold.
> 
> Below is the use case that having this problem:
> 
> Register kprobe in console_unlock and kernel will
> panic at secondary_start_kernel on secondary core.
> 
> CPU: 1 PID: 0 Comm: swapper/1 Tainted: P
> ...
> pstate: 004001c5 (nzcv dAIF +PAN -UAO)
> pc : do_undefinstr+0x5c/0x60
> lr : do_undefinstr+0x2c/0x60
> sp : ffffffc01338bc50
> pmr_save: 000000f0
> x29: ffffffc01338bc50 x28: ffffff8115e95a00 T
> x27: ffffffc01258e000 x26: ffffff8115e95a00
> x25: 00000000ffffffff x24: 0000000000000000
> x23: 00000000604001c5 x22: ffffffc014015008
> x21: 000000002232f000 x20: 00000000000000f0 j
> x19: ffffffc01338bc70 x18: ffffffc0132ed040
> x17: ffffffc01258eb48 x16: 0000000000000403 L&
> x15: 0000000000016480 x14: ffffffc01258e000 i/
> x13: 0000000000000006 x12: 0000000000006985
> x11: 00000000d5300000 x10: 0000000000000000
> x9 : 9f6c79217a8a0400 x8 : 00000000000000c5
> x7 : 0000000000000000 x6 : ffffffc01338bc08 2T
> x5 : ffffffc01338bc08 x4 : 0000000000000002
> x3 : 0000000000000000 x2 : 0000000000000004
> x1 : 0000000000000000 x0 : 0000000000000001 *q
> Call trace:
>  do_undefinstr+0x5c/0x60
>  el1_undef+0x10/0xb4
>  0xffffffc014015008
>  vprintk_func+0x210/0x290
>  printk+0x64/0x90
>  cpuinfo_detect_icache_policy+0x80/0xe0
>  __cpuinfo_store_cpu+0x150/0x160
>  secondary_start_kernel+0x154/0x440
> 
> The root cause is that OS_LSR_EL1.OSLK is reset
> to 1 on a cold reset[1] and the firmware didn't
> unlock it by default.
> So the core didn't go to el1_dbg as expected after
> kernel_enable_single_step and eret.

Hmm, I thought we didn't use hardware single-step for kprobes after
7ee31a3aa8f4 ("arm64: kprobes: Use BRK instead of single-step when executing
instructions out-of-line"). What is triggering this exception?

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
