Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B3460A260B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gmuM+v4f;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TgzWdJgq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yy2a0wWxK67WUze20CjtV96ogmtIDQsm4F5crp0cZIQ=; b=gmuM+v4fQKZnHdMKN80eSsYwuZ
	U2/QoOxriHJDaTafgTHPtWv00Co1xw9stvNCI+7l2xpCTRZEoyyitZhl7betmRDh6G4S7j52dXbR2
	Zt5F+CQZ0YrG7o2zyn2ePKxhx0FdoUoZAXVM7RTTQ03MJrr2yjWVspASzt5Xz18P2jvt/UIm0+IsB
	SOAsrzjeNK/ZW8lAyCTuBbdD9bPG5tnahTqWDMXQP+Ciyf1kdYxi1Chtrz1NCUhsdMwBK5aATW/nX
	qqSAXYQVtIwUZ2FXpLN+fal9ZX1zce//gY91HfX2o/fVoDlofpCNQRD8XDiSIjnw8edHoP0bfat87
	UUd6yieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJF4R-0000000AUvE-0dkR;
	Tue, 20 Oct 2026 19:00:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJF4Q-0000000AUua-0BZW;
	Tue, 20 Oct 2026 19:00:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6697543F86;
	Tue, 20 Oct 2026 19:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EBC1F000D0;
	Tue, 20 Oct 2026 19:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792522819;
	bh=yy2a0wWxK67WUze20CjtV96ogmtIDQsm4F5crp0cZIQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TgzWdJgq4kq+DxLpe0hmyuWoCSedEteiL2anRfrDp1Vw8gB33p94K21dsAOsUTNea
	 yecoZiEpQfnCYdIVtS/LnQcAU0sf2Pl3v1VUHiPiqonviOdY8KrkKaps+5IAXDBYJo
	 W/f9CAugqyPvhsXt8Uu3PYAMhR+xT7B5dn8nfuOc4bUboU6JLZ+q9o4zWIY6qndBxV
	 5hoSkivRQmyj4i1KKjYRZzu2hJNR+jz+C3YRwuKQ7594WtngHxvcdTYHE+BVHMsVA9
	 29IdCNKpKyPpOvb2NYQZ1jqfNS9OQYa3HWEf40bJQqA0z4226DZk3P4fMYCYHr5hCe
	 ZzEFG+9x9wMSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3873808209;
	Tue, 20 Oct 2026 19:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: Fix dma_unmap_single()
 size
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179252281778.159319.2896252453326387708.git-patchwork-notify@kernel.org>
Date: Tue, 20 Oct 2026 19:00:17 +0000
References: <20261015140110.41988-2-fourier.thomas@gmail.com>
In-Reply-To: <20261015140110.41988-2-fourier.thomas@gmail.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sujuan.chen@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 15 Oct 2026 16:01:09 +0200 you wrote:
> In mtk_wed_wo_queue_refill(), the entry->buf is DMA mapped with length
> q->buf_size which saved in entry->len. However, in mtk_wed_wo_dequeue(),
> the same buffer is DMA unmapped with length buf_len which is set to
> SKB_WITH_OVERHEAD(q->buf_size).
> 
> Change the size to q->buf_size.
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: mtk_wed: Fix dma_unmap_single() size
    https://git.kernel.org/netdev/net-next/c/ff5a2a7acec1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



