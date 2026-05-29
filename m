Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDC3CD6E43
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2026 01:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOaKOCR8muSZegpxRQTwrSb3xsHi/hx1Esr98dOCWEg=; b=O1+zbqT+Xta+ObyLrJY1KjKV9m
	f8aocMUB8DLuCahOYg0Ido2oN9QnBL3HMvHb7Kc59mT7mVjgkOguhunbWTtom13OOpb9QR0rwIs8p
	JLAAnnZBXVuFUwzST4rTmODIhDh8TczM+5Y7yzQaU8dn95NuAaw3oRQ/32H6QWKNSTWeTQAlV0MKF
	xJ7nMhD/glDe7artHhc6c/rtTbkF4RKgPJieavH0hIEohwr0IT2CNTQ24qRJyEViH/3Ya8FwadGV9
	Ibx7jvciR+t2rCxB8sebcYl4mQWGtkllawSI0Vge2mlYcAWHKlKgHkT3CUyxqBYfE32Upb170O5oJ
	gmRfOMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSltM-00000006bU2-07if;
	Fri, 29 May 2026 01:20:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSltK-00000006bTW-0dha;
	Fri, 29 May 2026 01:20:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5706560565;
	Fri, 29 May 2026 01:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5AF1F000E9;
	Fri, 29 May 2026 01:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780017601;
	bh=lOaKOCR8muSZegpxRQTwrSb3xsHi/hx1Esr98dOCWEg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Pdv+apmykyR9FKD9yA0LR52fMkOlE2aYqQBtEe+5OTPwusSkk7Og9EDqgOuc4wTji
	 OJ9YNb8nmTGNZHLdbcyF9nkhcRcRr19QfloteOjPjn/vV0zYhUlmzuxX8409XgBxil
	 xInGNVfO8i9QW7VcOdMTJ1S8mDhCvu1HcmRMi5gy0K0PJQ/ShZc1m94JmbvE9V/8Bs
	 LyM/U8NR0ydSZIrcj4wDGus2fHmnnq3nlG0ZDwIFUmr5s0lnvYTRp5zovbVtwhMkuv
	 PZuJmIpZX2tGECNTwhZgjxDyw4O8rhe6kNX2qrgHpE0UrNEUSX6QXxz3cJFN0SAo+a
	 ZtDA7YEKvve7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568C3392FFFE;
	Fri, 29 May 2026 01:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net v2] net: pcs: pcs-mtk-lynxi: fix bpi-r3 serdes configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178001760515.1584301.241177425272173045.git-patchwork-notify@kernel.org>
Date: Fri, 29 May 2026 01:20:05 +0000
References: <20260526153239.30194-1-linux@fw-web.de>
In-Reply-To: <20260526153239.30194-1-linux@fw-web.de>
To: Frank Wunderlich <linux@fw-web.de>
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
Cc: andrew@lunn.ch, angelogioacchino.delregno@collabora.com, vladimir.oltean@nxp.com, linux-mediatek@lists.infradead.org, linux@armlinux.org.uk, daniel@makrotopia.org, edumazet@google.com, lynxis@fe80.eu, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net, linux-kernel@vger.kernel.org, hkallweit1@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 26 May 2026 17:32:38 +0200 you wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Commit 8871389da151 introduces common pcs dts properties which writes
> rx=normal,tx=normal polarity to register SGMSYS_QPHY_WRAP_CTRL of switch.
> This is initialized with tx-bit set and so change inverts polarity
> compared to before.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: pcs: pcs-mtk-lynxi: fix bpi-r3 serdes configuration
    https://git.kernel.org/netdev/net/c/422b5233b607

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



