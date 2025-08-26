Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD18C8303F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 00:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAEgL/s+4AyLw1xIsmMOQ9Y2qv8NFMBF/S+j10ZgIl8=; b=t74lYQjUOxMMf2CNdBKrsuPa+R
	nxJA6/iPzNDMiAz9DFtJty8Hk7orbahympAn6dV1mwFi5LCSUYHCwUFLbOIC+yFryodD+kJ6mmFAd
	BHKfd0t/nELGRwqOoXr3djoyGxth6b6+5a0p+K/L9/MltUNdVxkUM7SM/ronHAR/hiaTl7C4nc1eA
	uCX6E/WK8/pYjBFl7yT4f+bJpGFUGwD/SHf65aifoKjPuLL40cc5khzg9SKN/gH4Jn4K+Ra2KqKM0
	4JofUwVG1HjZxfCM/mv+5RozjrnPIsQAwuYRXTO5VMcosY4YgGi1UxM127z5B+Zmq+b0g4hNo5JOx
	B2DZtPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqhve-0000000AEYE-3gzG;
	Tue, 26 Aug 2025 00:52:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqhsx-0000000AEO2-0koJ;
	Tue, 26 Aug 2025 00:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33EA860275;
	Tue, 26 Aug 2025 00:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC85DC4CEED;
	Tue, 26 Aug 2025 00:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756169401;
	bh=nDRA1Tds71oq7lboJgaRNpeXobXorqZWQAvxAvuigEM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OcoSPHfIUBQl1xIRHVsfjzVLMeBmlwrSw2M72DHtRntuR55A/fglMAL/P3jtCWzxQ
	 Z2HsvCnspVf67NJfcoF1ez4WWwyZJHUYKK4gamEOKHp6JrJ2WDnCnXaSNTzyQw04w2
	 XOn4ArDBxO/rndR26G+Dwum8jUnIJFu0+RBWM0llQyJf5G/0D0ZbX4xnDdE18UGeG9
	 iwZqLMOUUWIuTuJ/FN0a4OTPLbKY5PdRdurORn15q49APCu5lfrfxht5fgtOm/WHbg
	 vWoScC5/UvND+wSVyZQiLHbw1e72ZCnP720xt6r/By44hvBAdfb6mk4d1Q3i/EcncM
	 lhUTrhKiFAY0A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1C0383BF70;
	Tue, 26 Aug 2025 00:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/3] net: airoha: Add PPE support for RX wlan
 offload
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175616940975.3610531.11567535063308274967.git-patchwork-notify@kernel.org>
Date: Tue, 26 Aug 2025 00:50:09 +0000
References: <20250823-airoha-en7581-wlan-rx-offload-v3-0-f78600ec3ed8@kernel.org>
In-Reply-To: <20250823-airoha-en7581-wlan-rx-offload-v3-0-f78600ec3ed8@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 23 Aug 2025 09:56:01 +0200 you wrote:
> Introduce the missing bits to airoha ppe driver to offload traffic received
> by the MT76 driver (wireless NIC) and forwarded by the Packet Processor
> Engine (PPE) to the ethernet interface.
> 
> ---
> Changes in v3:
> - Fix compilation error when CONFIG_NET_AIROHA is not enabled
> - Link to v2: https://lore.kernel.org/r/20250822-airoha-en7581-wlan-rx-offload-v2-0-8a76e1d3fec2@kernel.org
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] net: airoha: Rely on airoha_eth struct in airoha_ppe_flow_offload_cmd signature
    https://git.kernel.org/netdev/net-next/c/524a43c3a0c1
  - [net-next,v3,2/3] net: airoha: Add airoha_ppe_dev struct definition
    https://git.kernel.org/netdev/net-next/c/f45fc18b6de0
  - [net-next,v3,3/3] net: airoha: Introduce check_skb callback in ppe_dev ops
    https://git.kernel.org/netdev/net-next/c/a7cc1aa151e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



