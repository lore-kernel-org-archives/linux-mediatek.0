Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3F3C6FD18
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 00:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beXof11KLsJwQc9g+wXxpJQY31mYc4cXwBC9ep3+JKo=; b=amVg5SB8DjV0LU10ewfgQXnvOg
	pQM/dto7br02ev5ifmDEFvx6ox8E1lgIguIR9TIt+ESm3xqN/WX0M7m65JJVra8cKjd05MKVEMYmf
	+PkHsWVObo3cZMrF6fbDpCMkjpGAUu+tcJihFeXs3JfUqGKPSpdJhZqirv4/Dw+AWFh6MO5DQ1A0X
	VcCnvd4uI8DVkPUcIDzyTVYsyXledMaaWONrYBOsWP+klAW5voaIxXe/PQH3NhZauMYjTo8Xm5twS
	yeHdlVlILemrVo/AFjpHRs0dXPff2QxkD2Ia1m/U3GRvw5ayqe+sGTTmk9vzpjeJJbhZfAUq8aPBz
	EzyMT9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppILZ-006k8O-0K;
	Thu, 20 Apr 2023 00:40:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppILU-006k7C-1I;
	Thu, 20 Apr 2023 00:40:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29385643AC;
	Thu, 20 Apr 2023 00:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89257C4339B;
	Thu, 20 Apr 2023 00:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681951218;
	bh=d3TZbO4+237pZFYOwvrP67MCEB2VLaI8i3CT5Pk9jS0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HZgMPyJCIeocbXYDnQkLhmFT2fyCv2eLeNUk/aU0XPJWXvGN0jZk+ehxmpCc90xSX
	 cAj70Nw4avGQksi6gmzk/pp2U+orQC9RLZsX4cCG2cALe8WD8tmZpr/VRxLn7ddcUe
	 Mcrk9DTGXmDaM64UY4x7ohJAktlIOe4zM23QHfKvvORMdFhjE56KN+1BK3gb9JrHwK
	 5ppyblgLpPnNvEWtHkwji1J4YnpQ6HPwPq8RObaxWP0Ec3AJxxPbxE3cr6a5iMutAK
	 tyFQfDnvvtmGnloPJT4y0HZhdm5vpcmzvMy1Kn5V1woI9JrFN+bx/f9ZblMUmWn62m
	 W5wtDbQadlaBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6E743C395EA;
	Thu, 20 Apr 2023 00:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: fix support for MT7531BE
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168195121844.11748.18224511099245962254.git-patchwork-notify@kernel.org>
Date: Thu, 20 Apr 2023 00:40:18 +0000
References: <ZDvlLhhqheobUvOK@makrotopia.org>
In-Reply-To: <ZDvlLhhqheobUvOK@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 sean.wang@mediatek.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, arinc.unal@arinc9.com, jesse.brandeburg@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_174020_483491_FD86190A 
X-CRM114-Status: GOOD (  12.22  )
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

On Sun, 16 Apr 2023 13:08:14 +0100 you wrote:
> There are two variants of the MT7531 switch IC which got different
> features (and pins) regarding port 5:
>  * MT7531AE: SGMII/1000Base-X/2500Base-X SerDes PCS
>  * MT7531BE: RGMII
> 
> Moving the creation of the SerDes PCS from mt753x_setup to mt7530_probe
> with commit 6de285229773 ("net: dsa: mt7530: move SGMII PCS creation
> to mt7530_probe function") works fine for MT7531AE which got two
> instances of mtk-pcs-lynxi, however, MT7531BE requires mt7531_pll_setup
> to setup clocks before the single PCS on port 6 (usually used as CPU
> port) starts to work and hence the PCS creation failed on MT7531BE.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: dsa: mt7530: fix support for MT7531BE
    https://git.kernel.org/netdev/net-next/c/91daa4f62ce8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



