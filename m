Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A709C54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 14:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uRKvb8m11op0+rGdVcLnfI7fF9LhnOeCQ0v4lmvDKg=; b=bvygnqHdSsLq41z5GIpX66fAOa
	S+82xj8G8jtvcIqNcWNUM4fg24+N6n6iQW83XC48lhnlUfQ5TksONZzdeZn11nHjhxayYEa536d8D
	QJ9sXzAafiLdrmBAfRrRs1MwJjHvXe85su7Tp+uqREAZ138bHzty56RLWU/m30IaK3IMsa54ewO0E
	RvuuUx8Y/230rzOs2rTZabtTZ8YGNPIKE7tKdMedSqaAAEfNkShuqfQazR6bZGBEKKw/ni/59vYdQ
	d3aAnUXX0rf0MYSU7XRL9vtpzE7FG2NkSocactWc0RR/nG2+441Gcxivwlis5XIpTINOpBH5UQ6Mr
	NcjaaPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl8HP-00000000RIx-38t4;
	Fri, 15 Mar 2024 14:11:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl8HL-00000000RIA-0QxU;
	Fri, 15 Mar 2024 14:11:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D36B561705;
	Fri, 15 Mar 2024 14:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B3E3C433C7;
	Fri, 15 Mar 2024 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710511880;
	bh=xYmAthB11ki5pMUzbtNCl+cG0dk3Pap42GLMQ8EMeTE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ez//vUQcHaqHkEqhM6yLs7YMZlPo6c0DDwBTf9E+yHYUIWQXuKguB38bnOad5lIhy
	 hxU+leTls8Orl24viNxHKwj4sJ0Vo8cUvH/9be1E4/tcAoMy3MEpldRdr1cspoRJXT
	 7admbgk48qVAZBV1NTJWZE0UFatpFnm4CxRw+dB356fhWtP6G5gH14/ZCqXQXk1Nxj
	 Hame8Fca1TzsQaCGVw8G6pgCSls14Ktg0u8hh6HFFXdckG1jp3VSP0SkpDjskreVxb
	 9aI4ReDcgWX0hK9KrX9JkmhKca+AqOecORaXecS/2UqM5P9mU2qw+1L4WMxbajGLQV
	 870rV7iF79NCA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F037D84BA8;
	Fri, 15 Mar 2024 14:11:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 1/2] net: mediatek: mtk_eth_soc: clear MAC_MCR_FORCE_LINK
 only when MAC is up
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171051188051.5784.14743841618605304663.git-patchwork-notify@kernel.org>
Date: Fri, 15 Mar 2024 14:11:20 +0000
References: <7205ca7d3c5433214256df4672f7c1a49815a5a5.1710367570.git.daniel@makrotopia.org>
In-Reply-To: <7205ca7d3c5433214256df4672f7c1a49815a5a5.1710367570.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, opensource@vdorst.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chad.monroe@adtran.com, steven.liu@mediatek.com, john@phrozen.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_071123_314218_A9A4EB69 
X-CRM114-Status: UNSURE (   9.75  )
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

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 13 Mar 2024 22:50:18 +0000 you wrote:
> Clearing bit MAC_MCR_FORCE_LINK which forces the link down too early
> can result in MAC ending up in a broken/blocked state.
> 
> Fix this by handling this bit in the .mac_link_up and .mac_link_down
> calls instead of in .mac_finish.
> 
> Fixes: b8fc9f30821e ("net: ethernet: mediatek: Add basic PHYLINK support")
> Suggested-by: Mason-cw Chang <Mason-cw.Chang@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: mediatek: mtk_eth_soc: clear MAC_MCR_FORCE_LINK only when MAC is up
    https://git.kernel.org/netdev/net/c/f1b85ef15a99
  - [net,2/2] net: ethernet: mtk_eth_soc: fix PPE hanging issue
    https://git.kernel.org/netdev/net/c/ea80e3ed09ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



