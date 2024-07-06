Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D90C3814E
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 00:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIrE9h3XuvM+V/JFI7S1heD4eYLxix3hTAcG/I5QFKA=; b=AKBQDToMTxtwpgIlWBBV4n9IjH
	lIlKPwG3ea4MXqUhAYvxiJzlXJQ4xwFHyy4HYse+XWQ/hbW+6zvQ5zVzNRjjFajgUYWfzymJUmUHB
	/apw4z8eEPzZJ9d/eLot1Xhi1eP0PTvVdAx6p9mbFtuiNKni+nfrf0DXoPTR0yzB2xIFmrw3HIZxE
	qa6u1PX68Y+7KQRrwpOXDd6nzwx75na8cGZ6Qw/8vKAvq/s3EWfMDPhJRUyoHUb79nktB4AklN3IT
	5BO39q/rPz1PCSFJAgLeNz3q/X9/2Fw1I9cgERPCAtXEDdk6MaQ/rRbFdrs2Me2KjuSvXGqXkSaei
	izBQoyTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPtdr-0000000H4pK-2s4C;
	Sat, 06 Jul 2024 00:51:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPtdJ-0000000H4XB-1DOK;
	Sat, 06 Jul 2024 00:50:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED5B862CE4;
	Sat,  6 Jul 2024 00:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A540C4AF0A;
	Sat,  6 Jul 2024 00:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720227031;
	bh=HXI9F2ozN47lIoalS26/JYpw58LCH3Ts4N8MhjcGSRg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JQ13BSAyJAcj+HqE4VITbXvGp5bh5LKDp0SuXKBPhAf5zMn3jB4K8neJAnSfnLNL8
	 q/7kb5fa/dDSTHVTt6WuUGDKJyDL2MR6OIZCX8McdSDURcnFx4hnAxA6m1KoU26uaa
	 /hrHcuwPq13uD7NxXVUdDLJfzqLrJa+8dddVPNpcMdYRkxXAa3iV29eJ/CRtnUN8C8
	 TK94jp6AvNt6dVUIXdQgR04W+cgg34bR1ie9XmNlP0ZZr7hLulTiyCLHQskDIN9+rO
	 14grHr/lJ8AalelomHQfBOchspgmY4Z3FJJSse0x6mvLR4kduK8zf2Kg/dMgLZwYMX
	 NXjkoBZcTzWYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8E7E3C433A2;
	Sat,  6 Jul 2024 00:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: implement
 .{get,set}_pauseparam ethtool ops
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172022703158.32390.5319141379722143709.git-patchwork-notify@kernel.org>
Date: Sat, 06 Jul 2024 00:50:31 +0000
References: <e3ece47323444631d6cb479f32af0dfd6d145be0.1720088047.git.daniel@makrotopia.org>
In-Reply-To: <e3ece47323444631d6cb479f32af0dfd6d145be0.1720088047.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: john@phrozen.org, nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_175034_642117_05386F85 
X-CRM114-Status: GOOD (  10.08  )
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

On Thu, 4 Jul 2024 11:14:55 +0100 you wrote:
> Implement operations to get and set flow-control link parameters.
> Both is done by simply calling phylink_ethtool_{get,set}_pauseparam().
> Fix whitespace in mtk_ethtool_ops while at it.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: implement .{get,set}_pauseparam ethtool ops
    https://git.kernel.org/netdev/net-next/c/064fbc4e9b5a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



