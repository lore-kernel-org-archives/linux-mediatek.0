Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B22D3C92D
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 16:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBCGrXmLqeqbwmyMbK0LG0RuhCufhe/yeF9xGI9LMvU=; b=h2HgVLsOP1GwrVDqG40WIZGz9E
	aZH8j/6n/JosodyK31skG17OoIl2n2N7HYiHawPJPe+/bCuCtef5ezGcGPopq8eXLwxgYsdg8qPZI
	VNgujBMygv3n+H+Vg/muim8WyJPVHSLb3qqledHmWfPXxtedzLdN/BjSU1EAn0GSV0XkKSwr70Iqe
	3OB7MsEU8+MnJGlqxOBPEuwq3kf2+Jv/nUdJ+qM5wYDP2naijRFdXLysZs1TeYv9gRv/IR00F9ZLq
	OPs+f1qEL3voC8+EOspycHJ1A86O2Y/SihfS7gqS/4InAKj0bhcbqRfTJQaU2XasZ5HCZr8N7qn9B
	ynC5y9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2YXA-000000056Aj-3jUw;
	Sun, 20 Oct 2024 16:12:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2YVf-000000055qd-0jNX;
	Sun, 20 Oct 2024 16:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 661FDA418A0;
	Sun, 20 Oct 2024 16:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19691C4CEC7;
	Sun, 20 Oct 2024 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729440625;
	bh=i/w/Ikg5srtLKQmcdWO2THgNjJN21VBQ36TzWecTZfg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GuPcQDIAuHExaaj9b7S31rC/XhaRsN3iJss2glmIfrY3Zbm9KS/DGRi06R/Jr3cTq
	 ngp/uTY5Q2rPSQTE/1LhEql2vfK90U2i736MDjykID3j4MTCuC6yTMXsweU60Cnimh
	 6O8wVVM8tnm96rGbSkf7viYpzf2c9js54KzvwgHwI5h1omBzSC+DFoinBjJ4QbRbim
	 RnFikBRww3dWG99KGy/ic5md5wcoZkQm3LJBD7Bwv8AUrmRr/zsfgsSWBncKC7Fi+9
	 Dtve6TUbaQGUrw2iSueTTvn9+5D9Gpo0lp2tERHmL7bcOXMsj0Dl/GOCKy5RGB5QRA
	 WuCrYl3RnlyDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BF63805CC0;
	Sun, 20 Oct 2024 16:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] net: phy: Refactor mediatek-ge-soc.c for
 clarity and correctness
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172944063101.3604255.4238646255355667605.git-patchwork-notify@kernel.org>
Date: Sun, 20 Oct 2024 16:10:31 +0000
References: <20241017032213.22256-1-SkyLake.Huang@mediatek.com>
In-Reply-To: <20241017032213.22256-1-SkyLake.Huang@mediatek.com>
To: Sky Huang <skylake.huang@mediatek.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 horms@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Steven.Liu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_091027_305531_C3943874 
X-CRM114-Status: UNSURE (   9.51  )
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
by Andrew Lunn <andrew@lunn.ch>:

On Thu, 17 Oct 2024 11:22:10 +0800 you wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch is derived from patch 8/9 of Message ID:
> 20241004102413.5838-9-SkyLake.Huang@mediatek.com.
> This patch does some simple clean-ups, however, this is necessary
> because the rest patches in
> "20241004102413.5838-9-SkyLake.Huang@mediatek.com" rely on this.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: phy: mediatek-ge-soc: Fix coding style
    https://git.kernel.org/netdev/net-next/c/b544223bec9f
  - [net-next,v2,2/3] net: phy: mediatek-ge-soc: Shrink line wrapping to 80 characters
    https://git.kernel.org/netdev/net-next/c/b0f90a863ca5
  - [net-next,v2,3/3] net: phy: mediatek-ge-soc: Propagate error code correctly in cal_cycle()
    https://git.kernel.org/netdev/net-next/c/93a610c00ffd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



