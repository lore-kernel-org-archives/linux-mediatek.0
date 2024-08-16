Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEABEC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 18:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=at27fxPVrZ2xoDsFjO9aY5nVRNvXzDngs4EF5t73+LE=; b=AbU3Qv9+PQ/roDgGqdoCwKOrdb
	6qoFmhSufuU9v238wTwvJCNu0BLEQ6tKs2f+dZoBGWvw07DFDI5gofHa946vZet3IUK+/TWQOuiH3
	5oGIQO3LZr2jVK13I4aRZNWenbxGHww72fjb5j6NzC+AsZpIESIGlCd1f4daIBlasBKp9LxMmdkWN
	duzaPgwXnoSY8nnW9+hrNoXsGmCex7e3WetIWGzFcO5ZxUSJu38C4VeBTcsVrFXHMkKh0W5Hv1Mdw
	C409ZRwjONuCY6PqgCmTNvbboOIMoVNVxeWztX4MxuxJ/rOXyAxEREi2VvWBiexLRE7hDgGzVE2th
	25gZBZrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf1Q3-0000000Dnmo-2JAc;
	Fri, 16 Aug 2024 18:11:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf1PM-0000000DnbM-36Qf;
	Fri, 16 Aug 2024 18:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACFB76224B;
	Fri, 16 Aug 2024 18:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7118DC32782;
	Fri, 16 Aug 2024 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723831839;
	bh=zVSWKO5JPnWSE1h3k2VU/7U4V5+RPNpKwGivKePi7Gc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CuP/0Xi6vX4U6E6tp+w9+9Dg0wi6ahKiXoXN+o45b9ib6vZXa97dLrSTPjNR9IHsN
	 8fZdjWxa3ccMh/I7uSmwjQ3T6nC78E2ugltTVnj55GZX2CA7bPIzyOY+OmAl4ewEWm
	 07RwRlYmE7awiiG5VnYcYms7XNqEqbH7qNykSYzs73xwLLzKnqGNnFob7zSG4qtNMV
	 QUyaMVDe2q3seV93IkjZGISEbGmJkQUsRi9et+CRoTT+ZOWDz5LfN/sBI9tP7jkpLE
	 qB/BrQilacCpUcFlGlXI2syedHw+829WXhK1a5Zvcoh7IEFtVhsEIKVV/M2imxdAU2
	 F90rqy7cBNKow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1D938232A9;
	Fri, 16 Aug 2024 18:10:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] ipv6: Add
 ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172383183868.3593066.6873916327349164311.git-patchwork-notify@kernel.org>
Date: Fri, 16 Aug 2024 18:10:38 +0000
References: <20240813-ipv6_addr-helpers-v2-0-5c974f8cca3e@kernel.org>
In-Reply-To: <20240813-ipv6_addr-helpers-v2-0-5c974f8cca3e@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: andrew@lunn.ch, davem@davemloft.net, dsahern@kernel.org,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nbd@nbd.name,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 yisen.zhuang@huawei.com, salil.mehta@huawei.com, shaojijie@huawei.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_111040_938717_0BD46C2D 
X-CRM114-Status: UNSURE (   9.48  )
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

On Tue, 13 Aug 2024 14:33:46 +0100 you wrote:
> Hi,
> 
> This series adds and uses some new helpers,
> ipv6_addr_{cpu_to_be32,be32_to_cpu}, which are intended to assist in
> byte order manipulation of IPv6 addresses stored as as arrays.
> 
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] ipv6: Add ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
    https://git.kernel.org/netdev/net-next/c/f40a455d01f8
  - [net-next,v2,2/3] net: ethernet: mtk_eth_soc: Use ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
    https://git.kernel.org/netdev/net-next/c/b908c722133e
  - [net-next,v2,3/3] net: hns3: Use ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
    https://git.kernel.org/netdev/net-next/c/c7be6e70d20c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



