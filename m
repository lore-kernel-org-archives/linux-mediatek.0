Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C053BD21274
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m45cveGsvYgJKU8lYwyu0PJLjw9HdMs66SpK2cDnSTc=; b=Vuk0u6UhVdyVOyszu40+hvWkMk
	NpV/LFuSukUs0M78a+EwWEWeoQXvhSWg2Z7dXrbOA0Alk9CpJoXvV3rvN4lza0C53SPQMnEMFwhbc
	BzidOiQhNH6CSizisBIadsxra/Db19MLYsj+qTe1ISgZqedz26pILUeN6HVODNaghEDp9nbDSfpbD
	8Gkokt341Qn78/oD6y9Lcv/HkRQPV7J2CuhNzETG5HwH4fxglBicrTN3tzFopTKbNEbOEwF0k0mq3
	5CvW6YgVrWWP5OEJYlBQGn607pUdg9W0Vb1F5L7pMwPfS3I8Gn6DD+lTf8wdXZbTwRl35Y+Cr04NQ
	TNVAQ6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1OFF-0000000EZ0I-1o8S;
	Thu, 17 Oct 2024 11:00:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1NSc-0000000ETiF-04BL;
	Thu, 17 Oct 2024 10:10:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE1685C60C6;
	Thu, 17 Oct 2024 10:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6080C4CEC3;
	Thu, 17 Oct 2024 10:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729159824;
	bh=qK9if0V62/LzQWBlKRcpC6PM3ji6S+P+acYeI9Zd+NQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HTN0+hZMAlW8S/EK0ddqXSUNYFqS6jkagxKBaGkgWkORYq4wAIKDNFokgX3kw2pAh
	 vRuu7QhDyDsdm1VfsbzFz+fTR3bh/zLIe8eD8lvF2GonjujhYEgY48KKRK1wFdH197
	 oeaatIKnXIdslu8lzCT0qtmKOVmVBkEEHeWQv2QcKCF2sKMKIM0G5xgZFMoqDRbld1
	 Xund5j1ZE1QwhX2R5HPI47tcYPjWdARJtTNsi0zFvVXhw6h+/QL5SlBsjK/+sUpWa6
	 LrwMl5rtHRqs5stcTO8DxIlkhbZu50KZT4SuRz+n95VjvSm4kqDuq5oNbMuqVqodpD
	 BMF3NdiYBet9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C123805CC0;
	Thu, 17 Oct 2024 10:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix memory corruption during
 fq dma init
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172915983028.2422040.9005274302836584755.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2024 10:10:30 +0000
References: <20241015081755.31060-1-nbd@nbd.name>
In-Reply-To: <20241015081755.31060-1-nbd@nbd.name>
To: Felix Fietkau <nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_031026_124606_01C9691C 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
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
Cc: jacob.e.keller@intel.com, netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, Mark-MC.Lee@mediatek.com, andrew+netdev@lunn.ch, edumazet@google.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 15 Oct 2024 10:17:55 +0200 you wrote:
> The loop responsible for allocating up to MTK_FQ_DMA_LENGTH buffers must
> only touch as many descriptors, otherwise it ends up corrupting unrelated
> memory. Fix the loop iteration count accordingly.
> 
> Fixes: c57e55819443 ("net: ethernet: mtk_eth_soc: handle dma buffer size soc specific")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: fix memory corruption during fq dma init
    https://git.kernel.org/netdev/net/c/88806efc034a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



