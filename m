Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C288BC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 09:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLQUta32qN5z9qK6CZm6mtIzqAOntNJLMlM4kX6YO0c=; b=nfCIKhMvb/gXwe3SaigIce4oBm
	A4DzQp3M25bri9vXOOjfJevAofG0honPcwG3YhrG4kr73f5IsQ9mAuWYfKViX1k+pWVYCtGmMnUrt
	HZHdi5MDtC2EqNGXtuKNhejFryisj8awedxjZ04vXwkN/MmyKP3lrApHWRmec9Ul6Ihbg+WnuZKBd
	/pD7ofZUEbJsQSrsVTTtydweoR2YGylhwTFzUO4mSP9NNpsFmz07MylHH0ff3Yrh7nbmEZ2RUkJGg
	34d7Wy+X3HyCzFqHW/XfG7nXfE346Q06aDqzj3Eb3KdW20+vs7JFzU73EGOlkgWzIGr9dsJrNzGs3
	luLabnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paClI-008rJE-PD; Thu, 09 Mar 2023 09:40:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCl4-008r8E-0N; Thu, 09 Mar 2023 09:40:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 47002B81EBD;
	Thu,  9 Mar 2023 09:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01D04C433EF;
	Thu,  9 Mar 2023 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678354819;
	bh=Mm7vjJuCjPksuPI/SCzqU1/CD4qW+sVNOhnbWN2J/nA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ms4qVvZrJSYjju+jgFSP4PoasOtU+KI2GM1kP6vYSRHJqQi32KNMvp/uKn7a62EQ7
	 vcoSLrhf83K2/ycpHkX2HB/KCDBYxtuIsVMHwVLybJ5yzsC7qtIregHVlwBVJWlYHg
	 XyrvqMws0nEqIVxEqhHaAPTW5Vi9owrG/g8Ypb2Vz4in+UPgzTXuSI+unUmP1Jrlb/
	 yatY+oQp9USgQ5A5kr0k1eLelmMbJeZIWqxmtI7ry01RiZ6fqtVLOYwqgvvAbGSCU0
	 n1m1P2gND99ErSJkB1CXPKRwegf2NDwGPbJINus2thNmEo4XMhbXX40isLIovba8fz
	 2vA1hjP0j7b3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7D0DE61B60;
	Thu,  9 Mar 2023 09:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/4] Various mtk_eth_soc cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167835481887.13872.13425175568351731683.git-patchwork-notify@kernel.org>
Date: Thu, 09 Mar 2023 09:40:18 +0000
References: <ZAdj9qUXcHUsK7Gt@shell.armlinux.org.uk>
In-Reply-To: <ZAdj9qUXcHUsK7Gt@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: daniel@makrotopia.org, nbd@nbd.name, john@phrozen.org,
 Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com, sean.wang@mediatek.com,
 angelogioacchino.delregno@collabora.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, lorenzo@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_014022_259248_7700AFB7 
X-CRM114-Status: GOOD (  13.16  )
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 7 Mar 2023 16:19:02 +0000 you wrote:
> Here are a number of patches that do a bit of cleanup to mtk_eth_soc.
> 
> The first patch cleans up mtk_gmac0_rgmii_adjust(), which is the
> troublesome function preventing the driver becoming a post-March2020
> phylink driver. It doesn't solve that problem, merely makes the code
> easier to follow by getting rid of repeated tenary operators.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] net: mtk_eth_soc: tidy mtk_gmac0_rgmii_adjust()
    https://git.kernel.org/netdev/net-next/c/04eb3d1cede0
  - [net-next,2/4] net: mtk_eth_soc: move trgmii ddr2 check to probe function
    https://git.kernel.org/netdev/net-next/c/7910898e1b2a
  - [net-next,3/4] net: mtk_eth_soc: remove unnecessary checks in mtk_mac_config()
    https://git.kernel.org/netdev/net-next/c/c9f9e3a3289f
  - [net-next,4/4] net: mtk_eth_soc: remove support for RMII and REVMII modes
    https://git.kernel.org/netdev/net-next/c/8cd9de08ccf6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



