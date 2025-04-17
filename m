Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2ADC369BD
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 01:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEBA25GBXNvf+seUWKb3vv8yQAjf5q61VLohScAL30o=; b=IbzK8PAcYWrS1rshhywhn07ors
	q/c99b/sWVZ2kEGmvnBf6FKVv+HZb1RIbkCSNeTkzm5Q8tbKCIPUkotM1bR4JjaGkWupe+De57jAm
	v44rRka8Tgk2+PkTRrxMwBOtHLOfSEwCtZY9TFjT1ppdX/ka66VkhQMaZPetkCtwwZMDCBaOQBJqG
	Dfspp3qEWGHAkgqwst46FzKIWc7P81NZLl64BxZtu3bO/1XDh0eX0G3BD1hKyeipVtLe4HDiTd0dP
	9dXpqX6Z4VR1rhSJoD+xtnscDaL3MPSg2BF9O1/9ZtxpV13u7dQs09GEXEacQeblt+t56aPTfP5ct
	g8Nv2j7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5EJn-0000000BT3f-2I2Z;
	Thu, 17 Apr 2025 01:45:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5EEn-0000000BSSh-2XDN;
	Thu, 17 Apr 2025 01:40:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 059915C567A;
	Thu, 17 Apr 2025 01:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2F6C4CEE2;
	Thu, 17 Apr 2025 01:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744854020;
	bh=ET/4I+nNRcyKeeXS5wbO1KsqaFhtwKBA1fxuw2rYgrA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Mj0GBV6PCqcsXOwQcMHMyGdH76LRzaN2qg5riNQaNW7zhJHiVQJ7wMlYLtzMuZlHS
	 dTmjkMRUZ4Yia463BvC1gUAD6vdhLH8nG6lfvfYP5nfkdbphmNtUrpz0hosD5RNPlk
	 l11S+qiR4dOz/zgaKLvKEa3UJf/V7BpYvj2D51Pmc1WCy0KgQoMQvXhy0LBz8qXe9Z
	 GtlJ6S2rDLW110r7gbjMFaDACDNg/gwXrynXlKKVtGVtXT9d8bPKgG+H+csy3JpU7H
	 S06Nep9enp6PlznQJfsdrG6JJBWxt91S43GLFyznRX+mpRqhAGs7InAalH4FTLqalL
	 K9JSebfprPWZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD2C3822D5A;
	Thu, 17 Apr 2025 01:40:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next PATCH] net: phy: mediatek: init val in
 .phy_led_polarity_set for AN7581
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174485405850.3559972.15890998079426748195.git-patchwork-notify@kernel.org>
Date: Thu, 17 Apr 2025 01:40:58 +0000
References: <20250415105313.3409-1-ansuelsmth@gmail.com>
In-Reply-To: <20250415105313.3409-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 horms@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_184021_695350_B2C8C560 
X-CRM114-Status: UNSURE (   7.88  )
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

On Tue, 15 Apr 2025 12:53:05 +0200 you wrote:
> Fix smatch warning for uninitialised val in .phy_led_polarity_set for
> AN7581 driver.
> 
> Correctly init to 0 to set polarity high by default.
> 
> Reported-by: Simon Horman <horms@kernel.org>
> Fixes: 6a325aed130b ("net: phy: mediatek: add Airoha PHY ID to SoC driver")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: mediatek: init val in .phy_led_polarity_set for AN7581
    https://git.kernel.org/netdev/net-next/c/00868d034818

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



