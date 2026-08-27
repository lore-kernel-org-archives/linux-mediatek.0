Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D9BC61DB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4wXp4SMnAsjShMyy1yXo/6OnVjOFCZNRDYWqRA8YH4=; b=lnVx055EI7e3P0MWeutSl2Avlg
	tXXcCnKWgfXjOr/NMJW7VNBLbdzmNDbrCmH1aCGU3tiU0P0wBAyoHSRAIS8RXBQNnkPr7JoOcs5JG
	2m+/ZFresXRUuwuKQX65oJF9zY3k281Bqg0wf+zqnd5sGkn/rIyOeWHKtKlHNYn7RIl0xQBIjgfsz
	4W3+AjDedX9bYcJhhB5kYkyVYgYzbGvudQ+kH00K/oAn/5aomqoDGXWDLJJcrfPoe2uN0qT4JPA19
	h+6gHq6HSHMosFHnas31giLFirXzjnQ2z+iMFLV2NaUsCQyzFd/YVZ/3U2Nxu+8VODGZKmlqTABhJ
	/7MF9H0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcDv-00000004GXD-2R8s;
	Thu, 27 Aug 2026 15:41:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcDt-00000004GWe-0fBX;
	Thu, 27 Aug 2026 15:41:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1E3B4398B;
	Thu, 27 Aug 2026 15:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69E21F000E9;
	Thu, 27 Aug 2026 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787845260;
	bh=p4wXp4SMnAsjShMyy1yXo/6OnVjOFCZNRDYWqRA8YH4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iKfB4+Jku2apizg0iJQ7k8xS39erHnid2NYigmfO/q+T/BUXaZ7F+SpTxnHERxzWC
	 zLyGc4wm+QCk0g0tcBKwwrTDlMY8KSn3Mr6sfkJPm32TOJ2gUANHo4UkqP1K2GyDfB
	 RDE+jczfHHiVjfW4MctxUSO+Dlt+CIlUVE//vgXRJ+9+KDmG/77+hMuhyFKQMHch2Q
	 exsS8MQApbYwz9rpiFo3rT78/AOBFirKWJsbuwS2UCHHIaKlEMIqIuYfwbNmxkJlti
	 GIeP+p4+IgBbSqcEeP5e5DfI5NUx9VhQmpE4nsNfHGnA5w2Q2tJSnv2k6U1M1f4kTf
	 mEq+ucR0RkJnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938E83809A3B;
	Thu, 27 Aug 2026 15:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v10 1/2] net: airoha: npu: fix missing streaming DMA mask
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178784520615.1711054.16936700320913913242.git-patchwork-notify@kernel.org>
Date: Thu, 27 Aug 2026 15:40:06 +0000
References: <20260820085941.380401-1-pawlik.dan@gmail.com>
In-Reply-To: <20260820085941.380401-1-pawlik.dan@gmail.com>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kuba@kernel.org, lorenzo@kernel.org,
 nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, yangshiji66@outlook.com
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 20 Aug 2026 10:59:40 +0200 you wrote:
> The driver calls dma_set_coherent_mask() but never dma_set_mask(),
> leaving the streaming DMA mask at the bus default. On the non-coherent
> EN7581 platform (Cortex-A53), this causes the NPU mailbox to hang
> after approximately 41 calls when using streaming DMA mappings.
> 
> Replace dma_set_coherent_mask() with dma_set_mask_and_coherent() to
> set both the streaming and coherent DMA masks, matching standard
> driver practice.
> 
> [...]

Here is the summary with links:
  - [v10,1/2] net: airoha: npu: fix missing streaming DMA mask
    https://git.kernel.org/netdev/net/c/6fe7e31a45e3
  - [v10,2/2] net: airoha: npu: use cacheline-sized buffers for mailbox DMA
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



