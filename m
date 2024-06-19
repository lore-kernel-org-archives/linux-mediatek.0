Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B992C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 12:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amjl5qYbF7z+bK6k/fbwxYB/ayZ3Rz5Isf17DXCccqo=; b=I15zN2ykLFSRVpDk3BTz6eAwo6
	su5n+olfc1Hu5pmQhtDoBbTdZHUeu5kXR9q6vut4mKOkePCC+iEI0HfiJaeLMB/FQlV75hbDFZUXT
	mFfAJjz3PN2pmfklJ3w7B70h38BVYa05KkMfj7smLOsLnyAFCbOVQay1Sm1NuoSSAHzsuKiYZ5XY9
	J1xEFg/qSE1xj4cEOcwd5ryOUZ+e4rnMt9ZyVuA1YvomE73GTYkgpT1SAffHw40Wp6Czw+s3oHWYZ
	c8KXCtc7zQIPwey3dJnmy+bDIwdOknPQguIf/5vdZ6unVow5pr7uj29WyQIa4cnVRtJoTn4CAb96R
	wBKtrizQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJuIk-000000018w3-3ip3;
	Wed, 19 Jun 2024 12:20:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJuIg-000000018td-31rz;
	Wed, 19 Jun 2024 12:20:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EDAB61DD1;
	Wed, 19 Jun 2024 12:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9ED9C2BBFC;
	Wed, 19 Jun 2024 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718799628;
	bh=4GBBm4WNPljSNrgz6eD06a7GENpvd4uQxJij5l6zFIQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UhUB9kh6ttUPx7czD1D6jwLnx8NLqHADgrv3ZvoItRGMi3a2BAFZ2WTDDgUOcmclO
	 gsiiYwqZ7Rxw67eFPtreWsZBYkiBFy/I8cyonvHHBwCKBBDPff4fdvobey9gIB7Kwt
	 9vghKIMwsJVdht3iLwKXC7xrfd6Q9VMMA/X6FGZDcydSYEMbLgEgHAiiVp0oyP3zll
	 /arlulQwTwqGcq5MJYtt0NKLDGQ8SxWcUf+5oMiwl2x5BGHlfnvssxDpcRX0OHW4aH
	 FahI8N8P9ijOS3U3+AayySrBM8raeU+R+CVZpTiCCLCCvKxiQahqvuSHgZdI/4nC1F
	 yVK0sSmM00cpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CE0D2C4361A;
	Wed, 19 Jun 2024 12:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 1/2] net: dsa: mt7530: factor out bridge
 join/leave logic
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171879962883.21133.13473416587347020687.git-patchwork-notify@kernel.org>
Date: Wed, 19 Jun 2024 12:20:28 +0000
References: <15c28e5ed5fa02ca7904c71540e254617d571eb8.1718694181.git.mschiffer@universe-factory.net>
In-Reply-To: <15c28e5ed5fa02ca7904c71540e254617d571eb8.1718694181.git.mschiffer@universe-factory.net>
To: Matthias Schiffer <mschiffer@universe-factory.net>
Cc: arinc.unal@arinc9.com, daniel@makrotopia.org, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_052030_857395_88EC9E66 
X-CRM114-Status: GOOD (  10.94  )
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
by David S. Miller <davem@davemloft.net>:

On Tue, 18 Jun 2024 09:17:12 +0200 you wrote:
> As preparation for implementing bridge port isolation, move the logic to
> add and remove bits in the port matrix into a new helper
> mt7530_update_port_member(), which is called from
> mt7530_port_bridge_join() and mt7530_port_bridge_leave().
> 
> Another part of the preparation is using dsa_port_offloads_bridge_dev()
> instead of dsa_port_offloads_bridge() to check for bridge membership, as
> we don't have a struct dsa_bridge in mt7530_port_bridge_flags().
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] net: dsa: mt7530: factor out bridge join/leave logic
    https://git.kernel.org/netdev/net-next/c/c25c961fc7f3
  - [net-next,v3,2/2] net: dsa: mt7530: add support for bridge port isolation
    https://git.kernel.org/netdev/net-next/c/3d49ee2127c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



