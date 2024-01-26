Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316DBC47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 22:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omoVhA+pE38rBBIP7OtKLi1X88evCYSCF9C8oKe3Q0c=; b=sbgebEbBxvsaLYQgxd3RBxcA5v
	AAlyfJrqgmVCkIsxJj8RgdrE07jzz8afTKSrdB+szKmIDyUyObnKHQSLCfwgRdekyk55ZH8xFUxbX
	k9wlMUQ3EXYuC/m/9NfWBaftHrf9K2P3x0OxHNcwCIcbalNt0DboyWgdrQRa4JeKQuVkveaID9dkk
	RvNGsYV9x41NMEEl0RuXS5eD7ug7rMqH1UmBZlh+KWP4uqYgMWQQkyrXWLtwAXzzApEwC9WgJwr1M
	00ovZ4dHb4NakxtY5Pu/IQxlUgO9AtrgFYHKK/v4xhbJN0GXeY5ctk7bHB3+DNTpgMiY7fgyvzQui
	7v9UkT0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTUix-00000005czx-3qwX;
	Fri, 26 Jan 2024 22:30:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTUiu-00000005czS-2QKI;
	Fri, 26 Jan 2024 22:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFC6C6260D;
	Fri, 26 Jan 2024 22:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C66EC43390;
	Fri, 26 Jan 2024 22:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706308225;
	bh=jNbmp8YEA445pIRhuvsH6MW9zescGh1Hj65YFJ4341Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SKclpH/q1/lseqlASPMIga1pozrXpQY7lZqwR5ajR0HSvNOqjr4BDqXi05rIaMv1V
	 lNAPBPqnA9DWqmEMCZmBQk1yP2Cblw2Yql3x1pa8PPbndVQjb7UmBHotv7tyn9itDw
	 JkWbfsGvPAFILnU6/uF8lQbhr8paecIDdA28UZcfUSoLUhcKf3BCzBKeAorA+8kT5M
	 1DdJ/NS5wFt5OF0LdIWZTQdAhBjX88k7Fz6IgrU3UL+y6z8AVQ2iB4wX1GosfKF00P
	 SC5bDS5AnWGQ+suegGSWaBl5kBq2DKUpxX8XZLUTEkWGaLuEANcUbC2xlGYcAQ/vEB
	 htDowzZsU/R/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 71881D8C962;
	Fri, 26 Jan 2024 22:30:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: dsa: mt7530: fix 10M/100M speed on MT7988 switch
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170630822546.5179.9954095426642384849.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jan 2024 22:30:25 +0000
References: <a5b04dfa8256d8302f402545a51ac4c626fdba25.1706071272.git.daniel@makrotopia.org>
In-Reply-To: <a5b04dfa8256d8302f402545a51ac4c626fdba25.1706071272.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: arinc.unal@arinc9.com, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 john@phrozen.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_143056_666964_FD79A69F 
X-CRM114-Status: UNSURE (   8.45  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 24 Jan 2024 05:17:25 +0000 you wrote:
> Setup PMCR port register for actual speed and duplex on internally
> connected PHYs of the MT7988 built-in switch. This fixes links with
> speeds other than 1000M.
> 
> Fixes: ("110c18bfed414 net: dsa: mt7530: introduce driver for MT7988 built-in switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: mt7530: fix 10M/100M speed on MT7988 switch
    https://git.kernel.org/netdev/net/c/dfa988b4c7c3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



