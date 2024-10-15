Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA96BD1D88D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTDl1Kvv1wbMBSfUvRHiYwHeSV4yn1KHUYhtLU6XJnY=; b=LnUDeSdHM6PkiW9gdv38+Z8aPn
	OmnrbF6nvFll2asjVyaHnSb3znUsub2zc5MnqhVHSm9YFyDiYPMl6uJBAKBasddRAKWVkIPWgCOOZ
	brZTthmxMxLlOb2e+7rCRKcg7iZQF1SpTIo35elV2AuK0t6KWX8/ELBbqIRDhuTO+cfmeLKq7Y/j8
	ivf5sUTnbqqJSBg6Bl7Xl4HMvX6wp7V5WzLMl6g/H7jie3xbIw2lBpKaUnm95j6R2qGyZcG6G6ISQ
	C+myw44DJ7eATAIOX28qZnLGRgOTLnb2dYuTGCmbjadEiyzpe3gpUBIkx3sIws3hkkQNDjsKxNNyO
	Zq+urTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l5Y-00000008zSW-3dlx;
	Tue, 15 Oct 2024 17:12:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l47-00000008zHa-3HgI;
	Tue, 15 Oct 2024 17:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 710A5A43360;
	Tue, 15 Oct 2024 17:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB7CC4CEC6;
	Tue, 15 Oct 2024 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729012234;
	bh=jK+UohJxLuIk48WbZMpUliCXxqKAiRUrE9MC0InD/r0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qtBi+PAz0mo40r3E/9D1gY7L/DMtAlJkbXM8yyloh8OSkITxk/C2B7sF/ZkO0v7dZ
	 2yVSMmoFeOPeKXnzoy4TO3Q0h3UFr/2WdGXoT8oioJ+APshnbNGwxLRe5OjI+rSF2k
	 anS//R7/x5rSW3OOjazXWfNKT1sTWfGnOYUDzUiOzDyZz+MImZyP7Rr4oiNXWXIVZ/
	 EZOiqJdM70oL2f03jcGWYVcn4usl2bySmQ0ZOxTqST6tzoFJIxJFR0Ld0YAao0/lU1
	 M0bkajF3uVSLvtGUkP897lGVDSCCnB+jNVexbTJgNW2+7Za93sXBcMir0sg5wxU96N
	 wRiKQ3vBQhcZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E5E3809A8A;
	Tue, 15 Oct 2024 17:10:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: airoha: Implement BQL support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172901223901.1230547.8692511851110957359.git-patchwork-notify@kernel.org>
Date: Tue, 15 Oct 2024 17:10:39 +0000
References: <20241012-en7581-bql-v2-1-4deb4efdb60b@kernel.org>
In-Reply-To: <20241012-en7581-bql-v2-1-4deb4efdb60b@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, upstream@airoha.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_101035_903744_10F3EB92 
X-CRM114-Status: GOOD (  10.45  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 12 Oct 2024 11:01:11 +0200 you wrote:
> Introduce BQL support in the airoha_eth driver reporting to the kernel
> info about tx hw DMA queues in order to avoid bufferbloat and keep the
> latency small.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - simplify BQL support and rebase on top of net-next main
> - Link to v1: https://lore.kernel.org/r/20240930-en7581-bql-v1-1-064cdd570068@kernel.org
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: airoha: Implement BQL support
    https://git.kernel.org/netdev/net-next/c/1d304174106c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



