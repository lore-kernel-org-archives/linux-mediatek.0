Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05682C36002
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpzCjdQnjd/IjT8gbX1JZvl5nyFl6eESQ0DQ2VxeV88=; b=1NsZN2SA7zCAxXuJYKpNJRHJQV
	VUSBpaoyIbn+rKFgPbph6sJGZXdCZJkr7TuydnfJVvTzFe4Eb3qA/Hemwqs9t7UnrkSx0Jmx4mf5A
	pkRCgR8gV9v8g9X6c9FbYMN/qhdHg6MpuYsIUSXEI8+G13HklhxO1Tw3iXKcf3nMvUGoF4wOFp551
	C/LO+vV8rfn3tNOLNKxYLCWjG30x7/uhNNnVIhtcN1u4oVKO8Vpm7ZIrpBZMjX87TvhKXiXFFswiR
	0I7V3KkeHS0y1A8+VrkmYW3X8HYQrNNGdx4gYRPWaZNwt7hkQ6WefmDAD2StNUIEvBAJNop8s+dkB
	gFDimZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgX3-0000000FlId-0ioj;
	Fri, 21 Mar 2025 17:51:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgVL-0000000Fkwr-05z1;
	Fri, 21 Mar 2025 17:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFFF35C6C7F;
	Fri, 21 Mar 2025 17:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67466C4CEE3;
	Fri, 21 Mar 2025 17:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742579397;
	bh=j356g8WAU6v1QH11K3lIyQnqCv8MFer8e/TaMU1xpwo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tFh4hR10DEiD2INJJjzxGevIyq3J0H2j3GhhmKi34mCEcVitpydi3fKsgm6v1sdE/
	 Qo1mF0x03kcg2hD3sEvgKgcxOQy15ijeKE1i3oa2DDOnci1H1fhey8C/IovxR4zS4I
	 1rlYsr2sywcYTG2IztgKd2NTgraViN9wux0HoDxoszCiBSw6cBTEcgwJi/ToXKlVdO
	 elacdMVZmKfwx/Jsr5bS9qFLCH/grbPkij/muHEtaf2m3EleHSkJYHHwhWbgG6VEa1
	 RFDEKYdJlO3uHSqWP3QJ64pQ15T/aTXpszsTjKxJO6FLn6SX/ljKuIp6aXXJgguABa
	 AcXDYsC+fJSdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFA43806659;
	Fri, 21 Mar 2025 17:50:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: airoha: fix CONFIG_DEBUG_FS check
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174257943352.2572031.8416368231944213281.git-patchwork-notify@kernel.org>
Date: Fri, 21 Mar 2025 17:50:33 +0000
References: <20250314155009.4114308-1-arnd@kernel.org>
In-Reply-To: <20250314155009.4114308-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, arnd@arndb.de,
 horms@kernel.org, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_104959_101624_84772250 
X-CRM114-Status: UNSURE (   9.59  )
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

On Fri, 14 Mar 2025 16:49:59 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The #if check causes a build failure when CONFIG_DEBUG_FS is turned
> off:
> 
> In file included from drivers/net/ethernet/airoha/airoha_eth.c:17:
> drivers/net/ethernet/airoha/airoha_eth.h:543:5: error: "CONFIG_DEBUG_FS" is not defined, evaluates to 0 [-Werror=undef]
>   543 | #if CONFIG_DEBUG_FS
>       |     ^~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - net: airoha: fix CONFIG_DEBUG_FS check
    https://git.kernel.org/netdev/net-next/c/08d0185e36ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



