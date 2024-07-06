Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC643C3814E
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 00:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDwrWxqZw/WPbX1elaRTm0/ucnwMZOGaWCePerbz7O0=; b=ZEG5iCzApyJ7fGDOY2qK+w9qyW
	qY0yR9nbS38WrKL6JIC7dEz/iPfLOv/J+Aft8v+rwmNIJf6z1nU756sX7VhvbhsRDOArOqCezCgTN
	pfBuFJOlweu493wXtdwKDtH9QGDjVC1zO7W4I/piF+l4tbT2eAzWN5mJE4Q5Y/OSO+srI42tS7GCI
	xIeyHFf67o4Ob5qbEg48eCfVFJJW4UY4JLjoeb1OAIn6gfcYT/ce/aH4BopjGaTanwxyMf5NtKgBn
	ZREkA/4CFJz5qfZYYQzeL1mpmFNgtMdYG6/n56an0ICHc6rIOcrx6GIaYwHBmR6VPJphuWMuB+ZaP
	SChwLTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPtdf-0000000H4ik-1Dwh;
	Sat, 06 Jul 2024 00:50:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPtdJ-0000000H4XC-1Daj;
	Sat, 06 Jul 2024 00:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1197B62CE6;
	Sat,  6 Jul 2024 00:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8DD8C116B1;
	Sat,  6 Jul 2024 00:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720227031;
	bh=qZUYt9aCrtldBy4xJcQnybZR0D/11ePWcBIs/S9zoq4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bChjxcYBXUcPHYz06ycy3d1LQZn8aauBp9d1ElSFa7FB1mPQKpnIzq+kyQNfV/iau
	 k3IGfjAsfejpxbK912m6LNif2H3Hi41qPgj1+aMh2wWB/OMPMvX9BxhT5v5g2l/4vg
	 TYY8q76b1AjJpMuhQJws5yd34CS816/m3xVEAHPjcgD1hLs3AgYTp1aNYBEeId+Jte
	 I3mLeFsSAl75WoiSw21zRvqZBGuXvRpz6/s7bD17xjUHibXcQ9Wh3pa70dgvVBvpWm
	 AQ1uMRjMToL/f4l35Gj1u0U0BRNo4JhfB21ibNg+zFY6ylvvdr874E091zCXdLI0u7
	 vRRNGCjwL+syA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 990A6C43612;
	Sat,  6 Jul 2024 00:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] net: ethernet: mtk_ppe: Change PPE entries number to 16K
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172022703162.32390.6364958633398952266.git-patchwork-notify@kernel.org>
Date: Sat, 06 Jul 2024 00:50:31 +0000
References: <TY3P286MB261103F937DE4EEB0F88437D98DE2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TY3P286MB261103F937DE4EEB0F88437D98DE2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, eladwf@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_175034_642165_A9F272A0 
X-CRM114-Status: UNSURE (   7.21  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  5 Jul 2024 01:26:26 +0800 you wrote:
> MT7981,7986 and 7988 all supports 32768 PPE entries, and MT7621/MT7620
> supports 16384 PPE entries, but only set to 8192 entries in driver. So
> incrase max entries to 16384 instead.
> 
> Signed-off-by: Elad Yifee <eladwf@gmail.com>
> Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
> 
> [...]

Here is the summary with links:
  - [v3] net: ethernet: mtk_ppe: Change PPE entries number to 16K
    https://git.kernel.org/netdev/net-next/c/ca18300e00d5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



