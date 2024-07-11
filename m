Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6ABC3DA47
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3onBeNRsqCo+5kO9nHXJojYO8KpGY1qUlIqMWJXXdhk=; b=AT4UolPbcq7LXxs8oF4JliDHhs
	Rti5mip75SXZ+iVVDLvHC5PQc0f5PF2duWV+jJPJlyhq1Q7nXv32nmbqNW8St1TASYZOkKZ93h+uw
	8+4oe/d+14EmiRwy0AwrP8tX3Bp9qiuwiyAS0QpiMNSlZM6AjvKfjr1NiZHVoQz3ldeksXJnmbwzd
	m/dkTuftOk/tsu1W1Tf61y3t+wDiWRHeo6XlmxUgVqw1Q1eF1aN8vvydVtU+M5MNyZer8vySpf174
	r7u5PQerG7Os6iWxe4bmDOEhPEAwVSGT9x+w9IjMNZy0vUyq2kjSQL81XMiCn9ebh0rqLN0+//LGY
	+PbO7r7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpDU-0000000DCDO-3bQO;
	Thu, 11 Jul 2024 08:31:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpCu-0000000DBr4-1t7U;
	Thu, 11 Jul 2024 08:31:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7824CCE1801;
	Thu, 11 Jul 2024 08:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5D0FC4AF0A;
	Thu, 11 Jul 2024 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720686673;
	bh=aC3Xr9tS22ND23vxAONRN3pa/zO5+j1Y/oCN8be4Ids=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KKe0I3923FdDqHvWUh6oX1FOOD0dAUqy3ws6sX7bdqT35X6RXXENDNezfvhpMpy1f
	 l3wQILHmbnyV+LlHM/enz2pMHEiuPFzgKF/Lz0ai3Y7hFXbjeELAdIzf00WVueKWWX
	 bQyxoAObhQDriQ/U+8dAQ695ia3III3rJZwJ/3bBEmc4jlJUcgT0mjt9CkdemnqKWw
	 Nen4ezEB1djRqweqe/S/tLmZ6zj8NnjsezDXXgvK245mjiCoSBCF/EZdjGOx3gw5a/
	 hrP2rkD/32xnFY4XRHDVDdOGpTKyJB+5vrAqeZ1pGKUX/jwhDn1z4RaxnK8Eq60elK
	 fN4xRQX0lqubQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9200BC433E9;
	Thu, 11 Jul 2024 08:31:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net] net: ethernet: mtk-star-emac: set mac_managed_pm when
 probing
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172068667359.28697.10752199531087262735.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jul 2024 08:31:13 +0000
References: <20240708065210.4178980-1-jianhui.lee@canonical.com>
In-Reply-To: <20240708065210.4178980-1-jianhui.lee@canonical.com>
To: Jian Hui Lee <jianhui.lee@canonical.com>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, f.fainelli@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_013116_689505_3262D144 
X-CRM114-Status: UNSURE (   8.99  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon,  8 Jul 2024 14:52:09 +0800 you wrote:
> The below commit introduced a warning message when phy state is not in
> the states: PHY_HALTED, PHY_READY, and PHY_UP.
> commit 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")
> 
> mtk-star-emac doesn't need mdiobus suspend/resume. To fix the warning
> message during resume, indicate the phy resume/suspend is managed by the
> mac when probing.
> 
> [...]

Here is the summary with links:
  - [v2,net] net: ethernet: mtk-star-emac: set mac_managed_pm when probing
    https://git.kernel.org/netdev/net/c/8c6790b5c25d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



