Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3B8E77188
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2025 00:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9oSjmEyVGvYaUkgSQI9XHvXpIGRPVeP/puJHuHCRMQ=; b=feWJ5pdYw8TvpH0ZQzQhrF2t2c
	saaHHPwhfAiQh0W8Q9zpcH5t6JsorV6rcPYKZ/Z6JP5YqZeMkzctjHUNsQE8Wf20wZP6Dw32pdMmJ
	uIfoImkTkkKZSPD6sRPgHwE4Px7Zu82/+kQDVLLQ+JCfZHIaQe2OETJ230j9M14eaJQ5q4in1/TLj
	8ckT5MmwyV0oI4t5N4JoL0hy57SwnLHklL3ZohWtJmYefJleVE1s6t+LnsQWyAXOC8PBPi5zzOjLC
	FMcyRvhU4BlSwSGWYZOMMzz6AlzZpw2caeB6ie+ApiawYTarM43L00in3Jnicb7PdaVW5kxhDfCOY
	fm3DiHsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxf1-000000033aB-405l;
	Tue, 07 Jan 2025 00:41:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxdo-000000033Uz-20hi;
	Tue, 07 Jan 2025 00:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CE3FEA41EAF;
	Tue,  7 Jan 2025 00:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502A9C4CED2;
	Tue,  7 Jan 2025 00:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736210415;
	bh=gA77aVxWP4yB6mTAj9/XUFdKsilOeWCCebwMj3rx0Fk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gmGoR9vuoiw6sebJ+fwBnazOUfuvK8S0tuKXsD71kr1wWFy2Dp9ImCGbR4O7Ekwmi
	 vJDu/QuooT68RZpGDQijJK/PhuOaUBCvp0NY3uceqzI8znnLMtaVAGkaO3QIDuTacX
	 pGPUwfV/YGOxe14GwE39N4ZG6RRM9MtgGKiSgxqARlH0kBlVnzRTKcUROVZz960qR0
	 aOCtHqErjH372qkU0lhjMdNgAxSer0LAxDyugxCb0pLqYxeGuI670f/2mhLiu6ixDw
	 341VmaUBeam6E2o9BoGGU1So3AMHvqqMv9/aXHEv9Q1OU46RzpypKl4nPgOjDwcefO
	 onDzioS5VA/4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE127380A97E;
	Tue,  7 Jan 2025 00:40:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/6] net: pcs: add supported_interfaces bitmap for
 PCS
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173621043648.3661002.8813298484787541928.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jan 2025 00:40:36 +0000
References: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
In-Reply-To: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, lynxis@fe80.eu,
 alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
 davem@davemloft.net, edumazet@google.com, ioana.ciornei@nxp.com,
 kuba@kernel.org, joabreu@synopsys.com, Jose.Abreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, matthias.bgg@gmail.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_164016_582414_C5952146 
X-CRM114-Status: UNSURE (   9.69  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 3 Jan 2025 11:16:06 +0000 you wrote:
> Hi,
> 
> This series adds supported_interfaces for PCS, which gives MAC code a
> way to determine the interface modes that the PCS supports without
> having to implement functions such as xpcs_get_interfaces(), or
> workarounds such as in
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: phylink: add support for PCS supported_interfaces bitmap
    https://git.kernel.org/netdev/net-next/c/fbb9a9d263a6
  - [net-next,2/6] net: pcs: xpcs: fill in PCS supported_interfaces
    https://git.kernel.org/netdev/net-next/c/906909fabb81
  - [net-next,3/6] net: pcs: mtk-lynxi: fill in PCS supported_interfaces
    https://git.kernel.org/netdev/net-next/c/b87d4ee16bb4
  - [net-next,4/6] net: pcs: lynx: fill in PCS supported_interfaces
    https://git.kernel.org/netdev/net-next/c/b0f88c1b9a53
  - [net-next,5/6] net: stmmac: use PCS supported_interfaces
    https://git.kernel.org/netdev/net-next/c/d13cefbb108e
  - [net-next,6/6] net: pcs: xpcs: make xpcs_get_interfaces() static
    https://git.kernel.org/netdev/net-next/c/2410719cdd49

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



