Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66608C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 02:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azWsN7ddeyUIsruqDWn3qZwVoxqhPLfxvNSM4ni10ZM=; b=wCvM7ihPSZBcwhT5WfPfFV4QTe
	YLP3+W+PZMzdGORxElDO7d4dqDIhDhhqz3ystZOOuIDoT+5dUktYVg92Pw6dCB9bkY7f9F2KO/KSj
	7xrDsdZTdY5Uk86zhbV+pf3N0yh1p9oE0jDHL2A+y2CMlYd8jEyvkdefeEW5CfVnEAcUX7RClcfv5
	sP6YHXw22k0JjtHXkH3E4rnczI84shRYXjsiWjsUjLr6R7J0F/QL8nOK5y3tFZdp0MVqxcsfu/rqO
	WdQ/a8bZoRv8OaMuewRuM6NpAAUu4Jyiw3nm7e2honLXdmBCjgXWBVECpwuwrMZBPLyETwHcGYtNQ
	jNxq46eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxHER-00000000euJ-28jo;
	Thu, 18 Apr 2024 02:10:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxHEN-00000000esu-2Abr;
	Thu, 18 Apr 2024 02:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6020DCE1390;
	Thu, 18 Apr 2024 02:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C11FC32782;
	Thu, 18 Apr 2024 02:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713406228;
	bh=JvPOQX1m6VS2TnDTVCWVo4cYrpLbtbm0fzT/89T9mV0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XhwIp13GS9iJfeIX3StUHnCkvbM709wrE7EVVPGakGd1/Nyu0XXIxBRu6dN6h0JGB
	 nhCE25VSANdmOIfd1BADV0o6UTgN+l7OaJymeatq4XLiKJMXcDNPat0ZeOAdP/xmGj
	 Zs9nFlBIa+oXMp/7HKMf+Ut55ezomdSXyytdU351np0YDJZmU/PZ0mCwW0gXAieHjz
	 sgUPPrXhKkmXvY/T9D2/39OabVc08mnMi31Uik7hUpuWBv2Cvu75bPkhbWUtrc6pa7
	 sUeZ4Sv3vAxmvDWKaW4nFadNCNXBGqFicqDLmPKfSFWHgGVSEuphx3FtbBWu4ql4Ji
	 SeyQk731JEexQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 396DAC43619;
	Thu, 18 Apr 2024 02:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix WED + wifi reset
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171340622823.10413.6361491426499037138.git-patchwork-notify@kernel.org>
Date: Thu, 18 Apr 2024 02:10:28 +0000
References: <20240416082330.82564-1-nbd@nbd.name>
In-Reply-To: <20240416082330.82564-1-nbd@nbd.name>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sujuan.chen@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_191031_834906_7B188B48 
X-CRM114-Status: UNSURE (   8.92  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 16 Apr 2024 10:23:29 +0200 you wrote:
> The WLAN + WED reset sequence relies on being able to receive interrupts from
> the card, in order to synchronize individual steps with the firmware.
> When WED is stopped, leave interrupts running and rely on the driver turning
> off unwanted ones.
> WED DMA also needs to be disabled before resetting.
> 
> Fixes: f78cd9c783e0 ("net: ethernet: mtk_wed: update mtk_wed_stop")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: fix WED + wifi reset
    https://git.kernel.org/netdev/net/c/94667949ec3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



