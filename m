Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9708CEDDA9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 02:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZcN/Qujs5Cq8ZumKFpo6k2deu6EUSw7mTXA7sUO1jk=; b=0w7JdSbz1cVCfnqssjkO5XXXTH
	2ER2951/VXcKv95VRal2XcgHbfssa+wMBxl0mHrhIVZsZuc9GdzRBhGgfKvTlqP9KxTtMS8yKfMRN
	k7x+zm/REmD3XBEKrTHC/NbHDQxDVLFE3l1q+ytCUzsY25zuErsWd1mzdkwuZecgbtKnVLS3/dNyy
	RXRnQ/W/uZH7Z5QNbdXXwigsSzcn8kFtvfTMNcwaebMIm5tlU5qnoNnkG6P4+KmPm8so+6K5p6CVJ
	x35ctOBSeLFb3mgH7MZIuHcpdmdGyj8PSB9tIf0OZF9auyIaUDy/A+WgP7ECq638+ttC7onWUaX5o
	Vo7yk7Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syjHW-0000000BKW9-47Rw;
	Thu, 10 Oct 2024 02:52:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syjGB-0000000BKE9-0LAZ;
	Thu, 10 Oct 2024 02:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF8CE5C5857;
	Thu, 10 Oct 2024 02:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D58C4CEC3;
	Thu, 10 Oct 2024 02:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728528637;
	bh=Jjo5Ww34UdYuFR9+yMdowifDaIwcyco/vTXfFwnF5gk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=A9gKFu3kYLDeI8dldhXG0r16EY7YPYWAKcz72rpZi6Otp1cne2Fv3E1mxmmw4Iehx
	 zFax9ctxv4apkc3BO9MkuM551sc7kwOrXhftJ8421kTw9WzO6A8rV0Dpsiq5+WCk1o
	 F1WjchmIpVx876vqdxuKZKO9ShyVXXl2y2Qjf69wUlTwFdiwIA/IH9Y4bzgr41n5de
	 D3M+3Lzs5/F4iGbQ7NFFNZL4NwtTHGMUHiv2/jlR4dUdr819SZvvFcIRytuQ4t8kGe
	 mTZTEUTwLXcqbF/OPsJZKA0/W+r25Ane+0mbMKrNttqAAHN6V7IcAaW6Jx168Weur/
	 GVhbhdnbTIMwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C533806644;
	Thu, 10 Oct 2024 02:50:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: airoha: Fix EGRESS_RATE_METER_EN_MASK
 definition
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172852864173.1545809.3295404172539567877.git-patchwork-notify@kernel.org>
Date: Thu, 10 Oct 2024 02:50:41 +0000
References: <20241009-airoha-fixes-v2-1-18af63ec19bf@kernel.org>
In-Reply-To: <20241009-airoha-fixes-v2-1-18af63ec19bf@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, jacob.e.keller@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_195039_296159_285720E8 
X-CRM114-Status: UNSURE (   8.33  )
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

On Wed, 09 Oct 2024 00:21:47 +0200 you wrote:
> Fix typo in EGRESS_RATE_METER_EN_MASK mask definition. This bus in not
> introducing any user visible problem since, even if we are setting
> EGRESS_RATE_METER_EN_MASK bit in REG_EGRESS_RATE_METER_CFG register,
> egress QoS metering is not supported yet since we are missing some other
> hw configurations (e.g token bucket rate, token bucket size).
> 
> Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet support
> for EN7581 SoC")
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: airoha: Fix EGRESS_RATE_METER_EN_MASK definition
    https://git.kernel.org/netdev/net-next/c/2518b1196391

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



