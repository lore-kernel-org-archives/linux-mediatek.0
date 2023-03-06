Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49771C64EC4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 22:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkGPzzbzpHNXvZfylIYVAfGm5ncHmMM0Yxt7tc+9uoo=; b=L9t2E1jR164BGYGTq3hWfxJYmK
	g/bBSS/Iqgz9prIk6ekwQBGRhqmRCz9o5/a4N+ryUxtklmUwZmV1dXJuAXFSwjG/Ys4MG8SkQiVt9
	ZRtDa03JJWB84fOgLPGtMYS/EuW8U8BFsq3xRWOaavHDuyXQZO2xCC/C3S/iXHNZWcUgucdZ/MCqd
	t2DQOr6xe7UnYM5V+TKMUWx66UKKJF9q8lzKNJZRJyBVkjFTW+X4MA0uqkd3gfVDQaTzionLP+qEc
	Dh6wIsB6xxUH+VIxrco8ARZWjIg+20uly1yYo1f/T8ye9xyWa19FWWzuFMDFFPqUEQ8DU9E9EiF1A
	4d1Mo8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZIsm-00FA7Z-EP; Mon, 06 Mar 2023 22:00:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZIsb-00FA3G-CL; Mon, 06 Mar 2023 22:00:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5AEA4CE17D4;
	Mon,  6 Mar 2023 22:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16414C433D2;
	Mon,  6 Mar 2023 22:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678140019;
	bh=E6ffbDOM6Vr/OgGspczlxERJkY+WFlvEdjkFwcftpQw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rJN7rE4aaA9TioixAKhoHBb0CRiUTciC7N+X1m/02PBt2jFveDXLnIZHimDmEvoaH
	 M+nYJ/U4OEv9zj90vsCZxFNz75yXAik2pFDDBHAAs+lMHofqm53pC3AYzccfzPe3wH
	 xVyowdOpBCCzP28EFeD/zrEhY1dyxU4ub+DPdZmW+FtcQqW/MTJ/t7i4nHvSA85JGu
	 XhI7iGrnchipdCguLUrUEZYf32EbZz7tvFC7ATwdHQIaRwPHBHx2QyX6/Pdw2oGTx0
	 uD2DJ6Gds57vozeHolfcot6qZtJPzyPxDXICBdukeEMpSiAeI4pYbO6bIPd7S0jaWI
	 AP2Ac3CQwxx+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E83CDE68C35;
	Mon,  6 Mar 2023 22:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix RX data corruption issue
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167814001894.23313.3204096836474065574.git-patchwork-notify@kernel.org>
Date: Mon, 06 Mar 2023 22:00:18 +0000
References: <138da2735f92c8b6f8578ec2e5a794ee515b665f.1677937317.git.daniel@makrotopia.org>
In-Reply-To: <138da2735f92c8b6f8578ec2e5a794ee515b665f.1677937317.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, hkallweit1@gmail.com, lorenzo@kernel.org,
 Mark-MC.Lee@mediatek.com, john@phrozen.org, nbd@nbd.name,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 dqfext@gmail.com, Landen.Chao@mediatek.com, sean.wang@mediatek.com,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 olteanv@gmail.com, f.fainelli@gmail.com, andrew@lunn.ch,
 vladimir.oltean@nxp.com, bjorn@mork.no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_140025_650987_0E5D065C 
X-CRM114-Status: GOOD (  11.24  )
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

On Sat, 4 Mar 2023 13:43:20 +0000 you wrote:
> Fix data corruption issue with SerDes connected PHYs operating at 1.25
> Gbps speed where we could previously observe about 30% packet loss while
> the bad packet counter was increasing.
> 
> As almost all boards with MediaTek MT7622 or MT7986 use either the MT7531
> switch IC operating at 3.125Gbps SerDes rate or single-port PHYs using
> rate-adaptation to 2500Base-X mode, this issue only got exposed now when
> we started trying to use SFP modules operating with 1.25 Gbps with the
> BananaPi R3 board.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: fix RX data corruption issue
    https://git.kernel.org/netdev/net/c/193250ace270

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



