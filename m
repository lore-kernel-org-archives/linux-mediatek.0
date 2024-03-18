Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B522C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/ouslTaGHLCxb1m+bGhdTdK1PrUUCc7ZDIw9C0aeXY=; b=UauYarnDxmdGaS+AnIitM0QLrV
	VRovDvssPlIReBZ1T9bSy5PWqFkyDKyuA8aOTe65v12PaKWMsy5rCsfAGyF31ZHs9v3lEP1AT7GUa
	q7agP3XM5oaD9aacW3jKC+PB5x7iE4FXJ51+rEJYxcYSMBM7PGL6O/IuPIIvDsC2csvCHH9OCOCuS
	73iJ2IrJie/YntLjFcKASX1u8AEw504mZGgzAZUCJkDhJt2pG+Q5qlR3kbbkEVnx5JqHy9BCZwYAp
	/loG9MJxga6TKvVk+Htdnnb75oK9ymhUrwKS9ZKpx1uvU7S8RZJriLvR2ac20xZXEGZfTtnf6+EPo
	3I3LjdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmJAF-00000009wFZ-1ReI;
	Mon, 18 Mar 2024 20:00:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmJAB-00000009wE5-1bWj;
	Mon, 18 Mar 2024 20:00:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C3AC3CE0AF4;
	Mon, 18 Mar 2024 20:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE556C433C7;
	Mon, 18 Mar 2024 20:00:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ceug2BPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1710792045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/ouslTaGHLCxb1m+bGhdTdK1PrUUCc7ZDIw9C0aeXY=;
	b=ceug2BPQdk5IAlFjKlflM+G9KtwVWLB93z8vnCZtBAbfbqZIn5P8Hv+q61AMG9xV1Kulz8
	P7fnBvzrGFm9KRmIKizhg0LM5oOUlWn5xbnKQuSRVTmy9fd8T+1hhQWeNEX2CYzE1Sk7w8
	jD/XacaQSEOhyjssoqUtuaXsFyM35UY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b4eb4cb4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 18 Mar 2024 20:00:44 +0000 (UTC)
Date: Mon, 18 Mar 2024 21:00:42 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Guoyong Wang <guoyong.wang@mediatek.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH] random: Fix the issue of '_might_sleep' function running
 in an atomic contex
Message-ID: <Zfidal8CEZStp3R7@zx2c4.com>
References: <20240318075327.26318-1-guoyong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318075327.26318-1-guoyong.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_130051_849765_9CF59EC8 
X-CRM114-Status: GOOD (  12.10  )
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

Hi Guoyong,

On Mon, Mar 18, 2024 at 03:53:27PM +0800, Guoyong Wang wrote:
> 'input_handle_event' runs in an atomic context
> (spinlock). In rare instances, it may call
> the '_might_sleep' function, which could trigger
> a kernel exception.
> 
> Backtrace:
>   [<ffffffd613025ba0>] die+0xa8/0x2fc
>   [<ffffffd613027428>] bug_handler+0x44/0xec
>   [<ffffffd613016964>] brk_handler+0x90/0x144
>   [<ffffffd613041e58>] do_debug_exception+0xa0/0x148
>   [<ffffffd61400c208>] el1_dbg+0x60/0x7c
>   [<ffffffd61400c000>] el1h_64_sync_handler+0x38/0x90
>   [<ffffffd613011294>] el1h_64_sync+0x64/0x6c
>   [<ffffffd613102d88>] __might_resched+0x1fc/0x2e8
>   [<ffffffd613102b54>] __might_sleep+0x44/0x7c
>   [<ffffffd6130b6eac>] cpus_read_lock+0x1c/0xec
>   [<ffffffd6132c2820>] static_key_enable+0x14/0x38
>   [<ffffffd61400ac08>] crng_set_ready+0x14/0x28
>   [<ffffffd6130df4dc>] execute_in_process_context+0xb8/0xf8
>   [<ffffffd61400ab30>] _credit_init_bits+0x118/0x1dc
>   [<ffffffd6138580c8>] add_timer_randomness+0x264/0x270
>   [<ffffffd613857e54>] add_input_randomness+0x38/0x48
>   [<ffffffd613a80f94>] input_handle_event+0x2b8/0x490
>   [<ffffffd613a81310>] input_event+0x6c/0x98

Thanks for reporting this.

I'm wondering, though, rather than introducing a second function, maybe
execute_in_process_context() should just gain a `&& !in_atomic()`.
That'd make things a bit simpler.

However, I'm pretty sure in_atomic() isn't actually a reliable way of
determining that, depending on config. So maybe this should just call
the worker always (if system_wq isn't null).

Alternatively, any chance the call to add_input_randomness() could be
moved outside the spinlock, or does this not look possible?

Jason

