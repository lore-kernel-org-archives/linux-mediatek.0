Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE46ECCD184
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Oct 2025 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0UUnE8hvutWEOThX3OBWXxYwshb3rNnfFNASsInLZ4=; b=PO/v5tCQbfb9In6X7s4KiScuaX
	6aDrAwNPoqd5byl5DJtTloxh3f17rw7vsBHIgXBvURjxVVW9x9RBNpt1FegfAqOWfoiKOzWZkUI32
	DAzZqHbBiiYy2GUbpac2/1joFH8YL0vodngvndSrjE3uz5BO/gvbvIDl5yrPG69QWeWjISAj24amm
	OfcDtO2Umip86waP2F/YZ9ZVEoDdTfcf3EfbmHW98Zmo8+xMOhGnP+WNvjSocnOvsYES6OgW/KeBw
	CD0OHUzBHRUqyhq3384KnS3Y9qJ9IiGGu/BkXnbu8djYEv0dFeHLfj52h2TO4fKnGwNzhcqdLJ8Hn
	LpjYAeVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ztm-0000000Ba0Y-2Jv1;
	Sun, 12 Oct 2025 17:30:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ztk-0000000Ba0J-3RL0;
	Sun, 12 Oct 2025 17:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41D0660566;
	Sun, 12 Oct 2025 17:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE140C4CEE7;
	Sun, 12 Oct 2025 17:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760290219;
	bh=P1HwP/Fb9RkqCJbBLA1lnCoPo9BNl8lS8geUgz4BCRA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DlnSJSnnc13aXhV8wwyqyi43nAQ3XBVqHH7ynzmy9lzbgUEWP7meZk8YmzBmihcO/
	 O6HeuopMZyIzqDCMZ7aaHMMClkGOuT+241GgWFcxCTDPbWpfIMe9dbvkHLypbqtaEn
	 aIDRKH1NJQ+cb3nKnzJ/CNUUmgJQrG5tGzQS66wNfaglDpq+IB8oEqxRAu2IerkIsi
	 svpdoslXZmZVzy9x0k5RQrCiuP/3PemMhxvLjXG2HmPBXrGCOvkGLkd+RPftRt1vpJ
	 ghIsc9VuFZ1nRLtZ673aDiHYaGEFPN6Ks4KUuN3u/njV5gVYBWWN2owmi8G2DZo5xi
	 1b5Kd553GYjbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EAD3809A1C;
	Sun, 12 Oct 2025 17:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: mtk: wed: add dma mask limitation and
 GFP_DMA32 for device with more than 4GB DRAM
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176029020625.1704433.18289911461490913074.git-patchwork-notify@kernel.org>
Date: Sun, 12 Oct 2025 17:30:06 +0000
References: <20251009-wed-4g-ram-limitation-v2-1-c0ca75b26a29@kernel.org>
In-Reply-To: <20251009-wed-4g-ram-limitation-v2-1-c0ca75b26a29@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sujuan.chen@mediatek.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 rex.lu@mediatek.com, pawlik.dan@gmail.com, teknoraver@meta.com
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
by David S. Miller <davem@davemloft.net>:

On Thu, 09 Oct 2025 08:29:34 +0200 you wrote:
> From: Rex Lu <rex.lu@mediatek.com>
> 
> Limit tx/rx buffer address to 32-bit address space for board with more
> than 4GB DRAM.
> 
> Fixes: 804775dfc2885 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
> Fixes: 6757d345dd7db ("net: ethernet: mtk_wed: introduce hw_rro support for MT7988")
> Tested-by: Daniel Pawlik <pawlik.dan@gmail.com>
> Tested-by: Matteo Croce <teknoraver@meta.com>
> Signed-off-by: Rex Lu <rex.lu@mediatek.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: mtk: wed: add dma mask limitation and GFP_DMA32 for device with more than 4GB DRAM
    https://git.kernel.org/netdev/net/c/3abc0e55ea1f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



