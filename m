Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FDAEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 04:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXHs8bhCvWtjqd9WqQboeIuh+bIVvlQDyyWemDhYKy8=; b=x1zZ7gUkL2kqc7BeX1bj1GI60n
	Ph50DjUy90x6KXBpReWH09ItpAbpdTREYTki9HM0a1c2qqsUffgAhk48nOYoqSqxNEj28Buw7OPna
	NxLF4cgxN5tF01OdlUQctV1KpdiKq7sJOKSOHQRfJPkP+9S4Gh+oO9B4FGdrz9+aCgECobNFPfVrg
	Vt6nnnWcxWEd/XMETjA20dMNogGwUYrW1eU99re1lfsDjKezNtzm3j5fOD8JIFZbvArg79ha1D6rm
	m/MUtInCiHEZMcZ2JnPjp4G5NElCKV6V6zmroi7LUX5mbD3R+/De350w2rGiYxHa/PuR4VssW1zrg
	D4GJQbdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qML9P-009jNo-1r;
	Thu, 20 Jul 2023 04:20:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qML9L-009jMr-0l;
	Thu, 20 Jul 2023 04:20:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAF3C6126D;
	Thu, 20 Jul 2023 04:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81328C433CA;
	Thu, 20 Jul 2023 04:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689826821;
	bh=zrcWXvlGwF0/Gsyotaj6bAKjRzyfWdgaY8YfW205qtw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kBDyWnEX5LUI3u9/GVS37fs2MtVK4he5svjAiu96vw+SOyJfmlG/rsTi92KPZLDoW
	 OLUFmcNeUl3+VCcufonriYQKNYci4Uf8b0Of3CO3AGtebrNF0yFe7dEfza9tX0Dm4H
	 hgBokhuMz5EjoaQBK30dudEbKonD2SGiKBxSmmOWxb2QK5Tb1RPDQf5QErzb3AGkjf
	 GMVQiZ1RRpXnbEolur9yd3mjtrhUGYTozIXg7gjPArAMHB0JCio1IJeFTWFPDnCfY+
	 O/V1GrPCppri3mzDgANlB7daHectf9EOIm4ykxKykkSJPfyrt/Ccaq/wEqqa2kDGdH
	 JH/Rzpez7Ybmw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 62AC9E22AE2;
	Thu, 20 Jul 2023 04:20:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: always mtk_get_ib1_pkt_type
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168982682139.14645.4950996915143284587.git-patchwork-notify@kernel.org>
Date: Thu, 20 Jul 2023 04:20:21 +0000
References: <c0ae03d0182f4d27b874cbdf0059bc972c317f3c.1689727134.git.daniel@makrotopia.org>
In-Reply-To: <c0ae03d0182f4d27b874cbdf0059bc972c317f3c.1689727134.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sujuan.chen@mediatek.com, Bo.Jiao@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_212023_316720_AC018BF5 
X-CRM114-Status: GOOD (  10.23  )
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

On Wed, 19 Jul 2023 01:39:36 +0100 you wrote:
> entries and bind debugfs files would display wrong data on NETSYS_V2 and
> later because instead of using mtk_get_ib1_pkt_type the driver would use
> MTK_FOE_IB1_PACKET_TYPE which corresponds to NETSYS_V1(.x) SoCs.
> Use mtk_get_ib1_pkt_type so entries and bind records display correctly.
> 
> Fixes: 03a3180e5c09e ("net: ethernet: mtk_eth_soc: introduce flow offloading support for mt7986")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: always mtk_get_ib1_pkt_type
    https://git.kernel.org/netdev/net/c/9f9d4c1a2e82

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



