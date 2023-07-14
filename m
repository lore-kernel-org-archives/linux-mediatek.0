Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CFBEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 04:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wmue1SH2/R9qW0mwYc0mTOxeW3dt1WkcK+uDaD9lAjM=; b=ip3pa+Mj1h2x1r1D1DePVTM9JE
	PjqqwGz/WnusSsPDyc/XlfYjm0oxiDzlXFbv9XfGDSnYgFnG6R1Gv4niocDTCXj4fvTeLsB5Dgn0U
	UnI5n5Yqpe7Uba7nKQ1NTD/nsJgg3pzTM2lkix3MBQTdirIfw9I9K4DJdDkPRKahY730K4IUuqAR8
	GhpkVAqZDF4yri9avuPUG5AtWUbYqWgR1I8o7yH04wGfqa1SUpcE5e0S8Ge02mFyqnZbOUjBwlKaT
	7XZvDB4t+/eVZpFRR0QbAHbrDBl0xrI8qqnNANuZTpSEgRAqXZ9WqkPCFOOKY8m68Oprl2DVJ7f2t
	61BYwvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK9ys-004wNW-1Q;
	Fri, 14 Jul 2023 04:00:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK9yn-004wLt-26;
	Fri, 14 Jul 2023 04:00:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4709861BE9;
	Fri, 14 Jul 2023 04:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 988B2C433D9;
	Fri, 14 Jul 2023 04:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689307223;
	bh=6bPJwDcuSz1rKBjG/24ejrCn4JBeXx8kMtEpTwCEv2U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AAU+8ZLPWahRElzfzmALzyJASlYHee9u0PGrejGSQIwx5fo25CRbvg4uxgfJ6rEqf
	 RXL16BSxfG7kART5wIhq3dxChc2wTsmVl1yAfGiMPHb3codCrZYAX0ElN6vp+qwTlM
	 O/vWd7nokniqxUVN2Ve9HbEZl610bfjNAMMvnbqt2xq+i5O76kpNZjvj4blQKgYT4z
	 xiCmnj/LiVwqBddhhniXy5srW7jbbEpN2AvTNNC3bXILfPUCFP+EJAqvSCiergccsW
	 YS5ywkC9aI11si9SNweKTYwHKYWoz4FVlUcu8tkTNN1QQy1gCJ2Y42r2IpQiHzb2Wk
	 Bu54B8qkv5xRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7FF81E29F45;
	Fri, 14 Jul 2023 04:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 00/12] net: stmmac: replace boolean fields in
 plat_stmmacenet_data with flags
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168930722351.11211.15860000420900768155.git-patchwork-notify@kernel.org>
Date: Fri, 14 Jul 2023 04:00:23 +0000
References: <20230710090001.303225-1-brgl@bgdev.pl>
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 vkoul@kernel.org, bhupesh.sharma@linaro.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, richardcochran@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, bartosz.golaszewski@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_210029_780392_B2D79CB5 
X-CRM114-Status: UNSURE (   9.16  )
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

On Mon, 10 Jul 2023 10:59:49 +0200 you wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> As suggested by Jose Abreu: let's drop all 12 boolean fields in
> plat_stmmacenet_data and replace them with a common bitfield.
> 
> v2 -> v3:
> - fix build on intel platforms even more
> - collect review tags from Andrew
> 
> [...]

Here is the summary with links:
  - [net-next,v3,01/12] net: stmmac: replace the has_integrated_pcs field with a flag
    https://git.kernel.org/netdev/net-next/c/d26979f1cef7
  - [net-next,v3,02/12] net: stmmac: replace the sph_disable field with a flag
    https://git.kernel.org/netdev/net-next/c/309efe6eb499
  - [net-next,v3,03/12] net: stmmac: replace the use_phy_wol field with a flag
    https://git.kernel.org/netdev/net-next/c/fd1d62d80ebc
  - [net-next,v3,04/12] net: stmmac: replace the has_sun8i field with a flag
    https://git.kernel.org/netdev/net-next/c/d8daff284e30
  - [net-next,v3,05/12] net: stmmac: replace the tso_en field with a flag
    https://git.kernel.org/netdev/net-next/c/68861a3bcc1c
  - [net-next,v3,06/12] net: stmmac: replace the serdes_up_after_phy_linkup field with a flag
    https://git.kernel.org/netdev/net-next/c/efe92571bfc3
  - [net-next,v3,07/12] net: stmmac: replace the vlan_fail_q_en field with a flag
    https://git.kernel.org/netdev/net-next/c/fc02152bdbb2
  - [net-next,v3,08/12] net: stmmac: replace the multi_msi_en field with a flag
    https://git.kernel.org/netdev/net-next/c/956c3f09b9c4
  - [net-next,v3,09/12] net: stmmac: replace the ext_snapshot_en field with a flag
    https://git.kernel.org/netdev/net-next/c/aa5513f5d95f
  - [net-next,v3,10/12] net: stmmac: replace the int_snapshot_en field with a flag
    https://git.kernel.org/netdev/net-next/c/621ba7ad7891
  - [net-next,v3,11/12] net: stmmac: replace the rx_clk_runs_in_lpi field with a flag
    https://git.kernel.org/netdev/net-next/c/743dd1db85f4
  - [net-next,v3,12/12] net: stmmac: replace the en_tx_lpi_clockgating field with a flag
    https://git.kernel.org/netdev/net-next/c/9d0c0d5ebd63

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



