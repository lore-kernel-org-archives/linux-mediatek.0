Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FCCCDB47C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 02:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFRvaNN957BKinEjtYyb+MFHmqdiS2LpJw69b6EOj+s=; b=zPs81iCJxo/Pi2h3hLIlyzlZJO
	0wbiQnMA+8ZesqFNmJL1XkrrUGlQ1MOU78x2YJbNAPaHzAc2D3X9nPZ5oWHWcfXF6Sgw//s2lSXrK
	8Cn+wkxWyGspALSNb4Ke7wEkxhHVhx9u5x/gHUPuK/+svPzp5NseD96zsBu3gt8cHNJe+UtKxVPho
	2tZ3/kiTrM4FO2BSwyOIMjI99pDv+tFYGsvdJOWtTSbW6dXR3JHiQ5aJhlAnCzoErdqjcyo+AjcZ9
	kH1A4xaVEvkU5VYioFdv7pcKkg98MAVYxP8fyqWFnKvhHdKq01fSmptTB3eV3nkVAu77+XP0ubO/h
	hP+sWPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZOL-00000008Y9v-1xZl;
	Thu, 25 Jun 2026 02:00:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZOK-00000008Y9V-0NaI;
	Thu, 25 Jun 2026 02:00:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73E48600FC;
	Thu, 25 Jun 2026 02:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F0F1F00A3A;
	Thu, 25 Jun 2026 02:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782352831;
	bh=AFRvaNN957BKinEjtYyb+MFHmqdiS2LpJw69b6EOj+s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Q/wJ/J7+zgvVnhDluJT0DRc+fakfEO32e9R/YJkUAQPTTzlNdLD6TVdtjNODjldUh
	 IqPtZYyiUKCa8woU4VcURtexFIHW3b60HhPWg87ivNzcZvD00gEYut8XpnGnK6/BYL
	 A0DmHwY9WQEbhsS0StEBlTWrZLFRy1HNlwc8VmexilUpjkMdlICATD7TO8+vi186ZM
	 +vfE/207Cz3m9NxcAcjechrmrcGo/sM1kBH8JgRpBCYKogW/+t7hZY2KaFtCH17Z3+
	 LF55wQ8tis90/2qKxCCkpvgdKNzK4O9ANSpFpdGXMJAfBLDBeTTt7GdA0LYiPJ3L70
	 wXyclq4cJrjWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B523AAA6D4;
	Thu, 25 Jun 2026 02:00:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: airoha: fix BQL underflow in shared QDMA TX
 ring
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178235281922.3078979.12001514996584548357.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jun 2026 02:00:19 +0000
References: <20260620-airoha-bql-fixes-v3-1-76b95374e63e@kernel.org>
In-Reply-To: <20260620-airoha-bql-fixes-v3-1-76b95374e63e@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, win847@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
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

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 20 Jun 2026 17:04:51 +0200 you wrote:
> When multiple netdevs share a QDMA TX ring and one device is stopped,
> netdev_tx_reset_subqueue() zeroes that device's BQL counters while its
> pending skbs remain in the shared HW TX ring. When NAPI later completes
> those skbs via netdev_tx_completed_queue(), the already-zeroed
> dql->num_queued counter underflows.
> 
> Fix the issue:
> - Remove netdev_tx_reset_subqueue() from airoha_dev_stop() so pending
>   skbs are completed naturally by NAPI with proper BQL accounting.
> - Rework airoha_qdma_tx_cleanup() to disable TX DMA, flush BQL
>   counters, DMA-unmap and free all pending skbs while skb->dev
>   references are still valid. Use a per-queue flushing flag checked
>   under q->lock in airoha_dev_xmit() to prevent races between teardown
>   and transmit. Call airoha_qdma_stop_napi() before
>   airoha_qdma_tx_cleanup() at the call sites.
> - Move DMA engine start into probe. Split DMA teardown so TX DMA is
>   disabled in airoha_qdma_tx_cleanup() and RX DMA in
>   airoha_qdma_cleanup().
> - Remove qdma->users counter since DMA lifetime is now tied to
>   probe/cleanup rather than per-netdev open/stop.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: airoha: fix BQL underflow in shared QDMA TX ring
    https://git.kernel.org/netdev/net/c/611709830945

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



