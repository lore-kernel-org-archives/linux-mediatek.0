Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC57C282D0
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Mar 2025 01:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Surm9+hcGmk30FB05ScvfdAHGiGmD3ZD/Vyjzc7rm0E=; b=KiTJBPtgTIM5pqj9AYyCKnmcCq
	HYXsQHzKkqvLx95T2XwFYtocbXvwqdwyLO2hSpaSr3lVudDYuzSrz0ApPoOiS6UI+ftKitv7KEKOV
	PR8MPzCgAuuiqnlItb87zHhYzW5QXrkUfEnXgCg86/Tv2MApDfdG1IXaJv9mAAoUezSGR9zpC7frV
	InDDTL3XQMskGHpPubJXylwHfVkKrgoEudO6+TB+8CRkSCk7NJh2uln6dKfzUP+hvZNiuDLFwlB6U
	jjhLqqv/tsK1a+v8mrrCQKOO41zkDCeT6RaBmj2gBQhPoyiiQRaN0/VrZZJxEk2zDTbf9ClJlwYQJ
	sl3zsx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdTp-00000006iEr-27Bc;
	Wed, 05 Mar 2025 01:23:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdQi-00000006hu2-43Cg;
	Wed, 05 Mar 2025 01:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Surm9+hcGmk30FB05ScvfdAHGiGmD3ZD/Vyjzc7rm0E=; b=GuFPckQFgai4eWXlSSBrTsGy/7
	umCbO0pj27zpXM4YVqIKuVcjoKQoh1Jiq0PLqCNBqMn8zAm9QwHO1uRk4jp42HMS6BQEZa48Ki9Qg
	U03aZ0GlVs2K+2pTCCQtOjDfdEEASkGfb6ITZww0HFS3UTcVXDu1v68g64xpgOabHgbKYQ+2AcV7q
	0FQUbona7EiJhP3UBRJF8VzAoq5wRnXABvTTnkCJH9TGmv27jQqyzPWPpt4ez0hcsie6Lu1B3OH94
	xm1Cjh9JU3O/Lz1k2S5K7kMR7dDBQq2L4lCvYHHlt7h9o1FXD6YLtsjFgI/YkVTjsR9FgDF5+4oB3
	5F1rTBOw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdQe-00000000IYy-34Vk;
	Wed, 05 Mar 2025 01:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6DF8A4626E;
	Wed,  5 Mar 2025 01:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0E0C4CEE5;
	Wed,  5 Mar 2025 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741137606;
	bh=2bT41wOgGM0dQY3OubedrgWzZBbizLWRIDcVaoWa1lg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NHZXLhlqV2FZ8NrAdRgjM82HkvqKolZa4JFy4QB5PSzzs5aaJpQiecoOSgRwGW38q
	 B4bu4yvythoB7gTM4YprLOs4mIgjzfbTnLTc1ALqHZGzoGghS+6DcYA/C4rISH5MjJ
	 bNU//xfJQncvlpMtFpWU5GnUMv6sjxd5Muc9e35OWoAwkbC03B2Bfg+GjaiUdtA9nV
	 mq2EjCDwX15NnBjUwzAZwvrPvolyY9Jv20pX7PgVWJn7w5bGzTYkTfrGe7UjqbNyrk
	 2ye1i7rQ2tlXV+zRsCw6uwqdyyKkldyeBDJ5niswKYSz/N2Hrgn3UK7dTPFrWPZ4l8
	 mtCN7dQ5GhG5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F26380CFEB;
	Wed,  5 Mar 2025 01:20:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] dsa: mt7530: Utilize REGMAP_IRQ for interrupt
 handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174113763901.356990.6788752081470910551.git-patchwork-notify@kernel.org>
Date: Wed, 05 Mar 2025 01:20:39 +0000
References: <221013c3530b61504599e285c341a993f6188f00.1740792674.git.daniel@makrotopia.org>
In-Reply-To: <221013c3530b61504599e285c341a993f6188f00.1740792674.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_012009_492079_7E41D2F1 
X-CRM114-Status: UNSURE (   9.79  )
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
Cc: andrew@lunn.ch, olteanv@gmail.com, SkyLake.Huang@mediatek.com, dqfext@gmail.com, netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, ansuelsmth@gmail.com, chester.a.unal@arinc9.com, edumazet@google.com, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 1 Mar 2025 01:41:18 +0000 you wrote:
> Replace the custom IRQ chip handler and mask/unmask functions with
> REGMAP_IRQ. This significantly simplifies the code and allows for the
> removal of almost all interrupt-related functions from mt7530.c.
> 
> Tested on MT7988A built-in switch (MMIO) as well as MT7531AE IC (MDIO).
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] dsa: mt7530: Utilize REGMAP_IRQ for interrupt handling
    https://git.kernel.org/netdev/net-next/c/254f6b272e3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



