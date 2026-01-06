Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADEDCD0428
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jan 2026 00:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6EsJBuPaTQ8n4gqdOjxukw8oUUsgcs/dSV9NPRhYEY=; b=LNABAOLbKsTwqvFk6f929BzUzd
	xSY9+PBA687+OUs/6lariA0K2ZNATZFOj0AWi2yteZVm0FGijbvHj+DXAJQgvFtrw2bKw+9M/srYY
	xl2L9rgZnzOa5oHfO1hvZS3bKjltvN2kDWpi7OXyiFYmkDfbiNOv4T07xWW+btroiOVwb9eHkY932
	dGryQO3NL0siqidC8ZLFLopmPueY7oamDXnYLBacpHcOlcPSAFPVi6sAwGE5+VQbrQ+6LpDiSUMcR
	eOOZKgM2NZAIQKLB8MLPPPpq/Gwr9soQo+zCEw3VQwAR6mrP9YdIH/OpyyFOLLxt+3Q3asBVP0QJW
	HO6Iexcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcurQ-0000000CGBO-21pQ;
	Tue, 06 Jan 2026 00:23:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcurO-0000000CGAi-1U9g;
	Tue, 06 Jan 2026 00:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36EA36011E;
	Tue,  6 Jan 2026 00:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68F3C19424;
	Tue,  6 Jan 2026 00:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767659019;
	bh=mo5R6mKrz2vthuRvZIdV31+9mqo3e6GoV8tjx0DpTFQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fig9GE94J7e2SX1VlKMk+mLNb2lr7mY8m9YpX1oWPYtzDHUOuo3n+QLO5XjJWG9SJ
	 I+2DcuT6W5tN26ab/949WutRpK71uzdgVA5FLNdJt1FcPnPTjigLJMbZ8Abq9tj9Lt
	 BJCSLfD2U33s08vz88NQ4DhEBN6FI17+qbRECzn4ZpF3+pJAKpEeF3BsM+nvdr9vRt
	 GC3BZeTRvU9tybLGqUj0mNeBvgavwUdDanmVUEIJduC9/Gz59IcmL0ZSLO8FbrwYnk
	 +YP3N+jTBlJxY2cKg0yHzrQgI68CXgOfJhLsMujn2kBc9+NWaOBMwrK9Umi183A3mH
	 4NeowFODVcDAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B7BC380A966;
	Tue,  6 Jan 2026 00:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: phy: mediatek: enable interrupts on AN7581
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176765881803.1339098.2859731628279711762.git-patchwork-notify@kernel.org>
Date: Tue, 06 Jan 2026 00:20:18 +0000
References: <20260102113222.3519900-1-olek2@wp.pl>
In-Reply-To: <20260102113222.3519900-1-olek2@wp.pl>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 benjamin.larsson@genexis.eu
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

On Fri,  2 Jan 2026 12:30:06 +0100 you wrote:
> Interrupts work just like on MT7988.
> 
> Suggested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  drivers/net/phy/mediatek/mtk-ge-soc.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - [net-next] net: phy: mediatek: enable interrupts on AN7581
    https://git.kernel.org/netdev/net-next/c/2e229771543b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



