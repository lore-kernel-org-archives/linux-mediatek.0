Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2114C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vY/SiU87/XCvyDvdbbxIBNK/PO5ojmkPAUYB3KlERQ=; b=08+IIJ8ZHN/E8w9unTDuAmt27H
	AGC3IOK6k+L703MiVTwl2qOQUemzDj4519fJwJHbfayxDFNkg104Dj4TmD7ellwAvGacZK/PEJpdB
	48DkHIcWfxbVxf9heTxst55ioNc1HiGBnd1FpMLw7WqQx9AvPGvFM0ayDf3lIqBVB0PMVZaU7npni
	QCVerISTD7OMP06lxRyz+7dVJuCFNenpYeVh64eoM40+LUhsnyZ65FKrTiRnlRFY0TLiMycW53/A6
	gzVt+T5ohL9MFdyEnGKdm9EAnP395959qubS+Yzc14WtJV0PQDmNKEYhEm2HbF37nrFs+Wf86zaI0
	KH8O0xSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwegD-0000000BWkk-1gKD;
	Tue, 16 Apr 2024 09:00:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweg4-0000000BWiC-0ua2;
	Tue, 16 Apr 2024 09:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E0513CE0F74;
	Tue, 16 Apr 2024 09:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EBFFC3277B;
	Tue, 16 Apr 2024 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713258029;
	bh=JT2kl89B7YEZauTYwcGBd4POvEKs049v9Yc67561Z58=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s+amS6Lkj8L+Kzw29S2vu8mSIur2HxKy7pmhXUe5ypdj4SYCp2PPgBQf8rU9RDOEd
	 xVuDk20VEwFyQ+KQKDBIjDhe3/VS65xvy4+ib5k+M1B0diuVoXWKMxPrzn/G0LPP2b
	 GdOxZybNAykkOaxHWkUdu+QszE2GfI/tLjAClzo7FLDsGoPr0LnRqRGXjTcZ1SxnrY
	 GnJyBnlByniRM0nHlknuo7/u+zcPSNllOgZPwUS/4vUsViqC18YJWSEwAIL6urBo2G
	 G+5JGVEIT6WRJaLMI820oDyPa6JVyvjRWNNz+jMPCc1vHFRsK63WuCgAt96aPoLqDp
	 WNNTJvmD27yTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C5F5C395F3;
	Tue, 16 Apr 2024 09:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: dsa: mt7530: provide own phylink MAC operations
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171325802904.5697.14592728708310075025.git-patchwork-notify@kernel.org>
Date: Tue, 16 Apr 2024 09:00:29 +0000
References: <E1rvIco-006bQu-Fq@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1rvIco-006bQu-Fq@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, olteanv@gmail.com, arinc.unal@arinc9.com,
 daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 f.fainelli@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_020032_462410_762D8585 
X-CRM114-Status: UNSURE (   8.13  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 12 Apr 2024 16:15:34 +0100 you wrote:
> Convert mt753x to provide its own phylink MAC operations, thus avoiding
> the shim layer in DSA's port.c
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/dsa/mt7530.c | 46 +++++++++++++++++++++++++---------------
>  1 file changed, 29 insertions(+), 17 deletions(-)

Here is the summary with links:
  - [net-next] net: dsa: mt7530: provide own phylink MAC operations
    https://git.kernel.org/netdev/net-next/c/62d6d91db98a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



