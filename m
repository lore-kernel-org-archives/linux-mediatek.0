Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7FB606A32C
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 09:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OTRqlTpz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icEMk76I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o6RrZWPrk39SJFV7nccgRDGcI4thVjBKp4xf5aZUbKM=; b=OTRqlTpzRs8CwME0Gibs2TFeL9
	A/88g+J0cQpzaN70wi0vykkU3ueFiCmF167TYNdyuBP8z03gkj229UgjzokLaBqGsleOf0vzCWkdO
	Bf1gzMyLDAzzMLaOV8WPUHSfGTcZADU5nsa80hcS8Be2p+YSS3+xghFL7BuLEn2VTA4xRUOkH8Fez
	851LAOEWvJIr/UaUp9W3tTePUzWtQN9DvBZD3PmFsPodPOA01ONFTfo5of+Z+2zvWd2lK0JgcWhqV
	7WBI6Olyri900TVr49EtcOB/mRw0f74e//EToc2gPYCKw/5aHu8Doc4ZkjyDpewftjpXJKo4BKwzp
	WRi8UDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKwN-0000000ESgw-0nLw;
	Fri, 20 Nov 2026 09:29:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKwM-0000000ESgg-0zpv;
	Fri, 20 Nov 2026 09:29:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F66C612A9;
	Fri, 20 Nov 2026 09:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5001F000CF;
	Fri, 20 Nov 2026 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795166993;
	bh=o6RrZWPrk39SJFV7nccgRDGcI4thVjBKp4xf5aZUbKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=icEMk76INok54GpfpwYSsF8W4KmFJtWVKXn/CQd9Ip+s0+1LGvE2pcQZkSS8cUu/T
	 1WJypxnIhWeyAkdgpo7rwl6G7ejQuuF1cNkcEhE2HC6h8gW1hDJabpoUnog5k5dSXG
	 hgrfoQ/1yi/VtxlUcEtecxi6xLY1WDJZMZ9aDeNJMM7hbFaS+RP7jrOHqa5rjI15fU
	 8PVOewdoLOOKVQG73vGIugWnzd6wIudw+zU/e/sQws7LziCwpLXWNofbIjZiEhrfNI
	 H8YGZwCfX0Z9ikhtnSP2JSr22B7zt36EI7jBoL0l/XgrelxImnZkvccpF0ZLM9qTDl
	 j+I/V0gpgszjQ==
Date: Fri, 20 Nov 2026 14:59:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Ginger Li <ginger.jzllee@gmail.com>
Cc: sean.wang@mediatek.com, Frank.Li@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: milbeaut-hdmac: Fix deadlock with the channel
 IRQ handler
Message-ID: <awATDbG0Cl95eKWL@parshuram>
References: <20260923094426.67872-1-ginger.jzllee@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923094426.67872-1-ginger.jzllee@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23-09-26, 17:44, Ginger Li wrote:
> milbeaut_hdmac_interrupt() is a hardirq handler and takes mc->vc.lock with a
> plain spin_lock() for the whole time it runs.  interrupts are disabled locally
> in that context, so the handler itself is fine.
> 
> milbeaut_hdmac_chan_config(), milbeaut_hdmac_chan_pause() and
> milbeaut_hdmac_chan_resume() are called from process context and take the same
> lock with a plain spin_lock() as well, so interrupts stay enabled while the
> lock is held.
> 
> If a channel interrupt is delivered on the CPU that is inside one of those
> critical sections, milbeaut_hdmac_interrupt() spins on a lock that the
> interrupted code is holding and can never release, and the CPU hangs.
> 
> Take mc->vc.lock with spin_lock_irqsave() in those three functions, as
> milbeaut_hdmac_issue_pending() and the other process context users of this
> lock already do.

Have you seen this deadlock in reallife, any logs?

-- 
~Vinod

