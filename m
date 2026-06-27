Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2C4C43458
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2026 22:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUBEoH15RqIo4oFjBLLuDYUfLC4Rqnn2RSE89hLfxZc=; b=o5JhLGXDGuoH8Bmfv8ypiwHSwu
	kltR/bx7qGmwrWCeZTdb9b53MhjggYuMd53yrEG6iCQ+nwERYLlgQcBoXMzCmTTcrBRk3wSDXQ/QI
	Af2oPlhPLdiUas2e1K6JxZ8RjRGPMCib8d+AQZmCDmtGIzd7bymCrRSGe2gV11e8972BoDCKJISgY
	Q61tByGZ+zqkCwVDDDcpMkF5UTzoG6tBbcoPkB3NTEPyJVR09/HY/13B+i097JndgMxdKFVKdNkxJ
	csufE2QbkDDfC/DK9Es9aEZ7VnZ5/pPLLTq/kI9pZ5Oyr9M8NuZIAsDoYw/Ox4qnrCO0u6iUXef1r
	FQI18Jqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdbrT-0000000Co46-2t7Q;
	Sat, 27 Jun 2026 22:50:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdbrR-0000000Co3s-3rjH;
	Sat, 27 Jun 2026 22:50:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98FAF60125;
	Sat, 27 Jun 2026 22:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501881F000E9;
	Sat, 27 Jun 2026 22:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782600651;
	bh=WUBEoH15RqIo4oFjBLLuDYUfLC4Rqnn2RSE89hLfxZc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ICJ2pavMSOSnqjG0tMQMLjrvwApy9T1MWm1vKfispbXS/6zXo1O2uzFS0Ugdm1T7M
	 j7ie0vtRfWX09Xq+e4B6fYE929MksJZ6/JMPFyjepVLZJnjG/cCc8dwu2LvA1+Io2A
	 Igyl6symkXW6vGiMiBDRYYkQF8qye/9TBzIygVCGCmlFCcSBWOnwxt6V/DDMuTGVp3
	 hdnhqP8dUJBtPe97jSsi50nOyMYD2csRMs3STAecLEZi0XSHym9QbrZGoPTgPIYh38
	 Zm8mJL6ZtKiMoty26gRKkUqBEPU5aex4/dfPRNO0KhXEuYOrrrVmVYj6ycClvkUClX
	 4k8Nu2efuw5BA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5686D3938452;
	Sat, 27 Jun 2026 22:50:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: dma map xmit frags with
 skb_frag_dma_map()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178260063683.1451849.7063958705946574115.git-patchwork-notify@kernel.org>
Date: Sat, 27 Jun 2026 22:50:36 +0000
References: <20260625-airoha-eth-skb_frag_dma_map-v1-1-31d9e460aae6@kernel.org>
In-Reply-To: <20260625-airoha-eth-skb_frag_dma_map-v1-1-31d9e460aae6@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

On Thu, 25 Jun 2026 11:42:46 +0200 you wrote:
> Map xmit skb fragments using skb_frag_dma_map() instead of
> dma_map_single(skb_frag_address()). skb_frag_address() relies on
> page_address() to obtain a kernel virtual address, which is not
> guaranteed to work for all page types (e.g. highmem pages or
> user-pinned pages from MSG_ZEROCOPY).
> skb_frag_dma_map() maps the fragment directly via its struct page and
> offset through dma_map_page(), avoiding the need for a kernel virtual
> address entirely.
> Introduce an enum airoha_dma_map_type to track how each queue entry was
> mapped (single vs page), so that the matching unmap function is called
> on completion and in error paths.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: dma map xmit frags with skb_frag_dma_map()
    https://git.kernel.org/netdev/net/c/32f1c2bbb26a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



