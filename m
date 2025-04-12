Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EB8C369A2
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Apr 2025 03:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxnRq6VQEcB4oiRE+uRPdtP/rIou7ihBxyJX3duKtV4=; b=c1+g03p/OL9grS+LQTK0Mz3cfQ
	OP267xsGoQLp1HHCVhejnYQCrmTKeljMhN3DPwSw/TSqWNrMOQ4lkd93QXbaLyvgL5vSzwIBAaJLz
	kqqE84FCIWZuQ3NZkPm+ez5yV+0ZareBfCpyfIQ/IMQlZD5/uYaV3f0nao87fTXD3v0DnEwTM0G1a
	GXtRcCXzRRs90FPmEJJrPnKwxdiAL7Wub/Deuss++aIb9wMxjgnEVYW4c70aoFU2T7xWED5FQfkxV
	pRFCIguRog3g+rQIbLqEWNrAwF4qhTEmmezl/2oJunl6aBKXy7cN4YJC3x5YX4F2rseOyGDXPpcU3
	FMwHSGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3RRf-0000000FLIv-1W4p;
	Sat, 12 Apr 2025 03:22:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3RPh-0000000FL9y-06ju;
	Sat, 12 Apr 2025 03:20:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D9B11A41171;
	Sat, 12 Apr 2025 03:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FA5C4CEE2;
	Sat, 12 Apr 2025 03:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744428011;
	bh=P3eMMMTOhVSL/2Y5KGfLC91c7e0DuqVcE96h8ZWmHXU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qUBK7eIinygyDSEvh3NpnYPLwHiF/j/LT0mloVxEiaBVKqwKQz9pYkzOvLtvrl3g/
	 Vwv3BLtKuM5pMwNGRTBQaTwZwdb4aUAbdkdRPx57x/HdvuWX6SDwrRFzfC2/Jg0Sje
	 rDECheOpooP9UeWHrcgWaWnWxCd21XYmCQyJvuhdZpJ0B//tSgfOY/AltCBWoDxlAr
	 yr3aQhFmRA9ebBJnvh5EzZQ9KqTwMhYJ1Yd9UMN3MT5VqoQn735ASvlBL9EcH7Hja8
	 Ry1Zdv00O3R+WjIbXGIrqdos7NX5WLO30pyobpgdCdZENIV6iawAtgNcJJ60L60byN
	 sjyXGfFjD0t6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE1F38111DD;
	Sat, 12 Apr 2025 03:20:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] Add L2 hw acceleration for airoha_eth
 driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174442804876.562152.332810337107180556.git-patchwork-notify@kernel.org>
Date: Sat, 12 Apr 2025 03:20:48 +0000
References: <20250409-airoha-flowtable-l2b-v2-0-4a1e3935ea92@kernel.org>
In-Reply-To: <20250409-airoha-flowtable-l2b-v2-0-4a1e3935ea92@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 michal.kubiak@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_202013_132325_89B629E0 
X-CRM114-Status: UNSURE (   8.37  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 09 Apr 2025 11:47:13 +0200 you wrote:
> Introduce the capability to offload L2 traffic defining flower rules in
> the PSE/PPE engine available on EN7581 SoC.
> Since the hw always reports L2/L3/L4 flower rules, link all L2 rules
> sharing the same L2 info (with different L3/L4 info) in the L2 subflows
> list of a given L2 PPE entry.
> 
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: airoha: Add l2_flows rhashtable
    https://git.kernel.org/netdev/net-next/c/b4916f67902e
  - [net-next,v2,2/2] net: airoha: Add L2 hw acceleration support
    https://git.kernel.org/netdev/net-next/c/cd53f622611f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



