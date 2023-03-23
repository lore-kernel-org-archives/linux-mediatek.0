Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77FFC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 05:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0W7r/yNzKxJcbmR06y0FUerdUMDMEvZ9g/Yifo45VE=; b=Foe/ZyGxJGooFqYBoiPqTraysL
	ShoeBlTHyjLEsvVKSQHe6T1Fuoe03cJfWyOKhuPbsFCgck1DdClG/2MyDYz3dSE6cfqlhFqtPHfgM
	1R+UuftsrbRoJv4vBDSn+2wlF3xH28bv1uC8NTCR9w3GTdi9Mm++n+i7NpnXn79Q1gtff57/xmSZA
	LyvCDsDEClH4qaxcPP0qPvPMF+QtziN6hW48fOORq1NZTo7KqsLZ8BuAKQi0gddIo9im+6XlrAltk
	yhZ3aPD1pH/oiCi+o5S+riwR09MmArB8IqarIEktboEwq9mPHQkxSA2u0B+KnNbs7DPMM5vuaN7Xu
	y8ChFdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfDNI-000pVd-1x;
	Thu, 23 Mar 2023 05:20:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfDN6-000pRr-31;
	Thu, 23 Mar 2023 05:20:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5E87FB81F2C;
	Thu, 23 Mar 2023 05:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11346C433D2;
	Thu, 23 Mar 2023 05:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679548818;
	bh=gHiDkwY3P3FOscx7QJ+Z452hyjh1QaOF11LfbEWAQvA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tBTNq9OLxSy4VeVhNHuq5TeDen9mkf0B0fF4/AUcqXroaQaItTdg+BCzYkAATyzAs
	 ar+tJG188n7K6RsNcNJHToVJl2pbLKvmZybCNG9v6sWzKgemTveuL+SBPIn3ousRix
	 zkIKJCgOTfE96TOqBfgSRVa/wnvOfwboXsqEmLALM5apvQ1aHsd2aITnZHSF5mrMsW
	 CYXgT8qRsZXIE5vmaqU7ndYw3iUsyuuPvfBYK0XpZklxw2kxJtbqW3BfHxLWXSes2I
	 QlBvOw4E0iAjxi/Oyp30VOjWUt0xwnqCvbjf7J5ULNfNVtJIvxH8stOZRGs0ZuyPNQ
	 Tg308aIdYp4CQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E5FAEE61B85;
	Thu, 23 Mar 2023 05:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 1/3] net: dsa: mt7530: move enabling disabling core clock
 to mt7530_pll_setup()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167954881793.1221.14531504351601272496.git-patchwork-notify@kernel.org>
Date: Thu, 23 Mar 2023 05:20:17 +0000
References: <20230320190520.124513-1-arinc.unal@arinc9.com>
In-Reply-To: <20230320190520.124513-1-arinc.unal@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCA8YXJpbmM5LnVuYWxAZ21haWwuY29tPg==?=@ci.codeaurora.org
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 arinc.unal@arinc9.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_222021_118886_ECA8A85D 
X-CRM114-Status: GOOD (  10.92  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 20 Mar 2023 22:05:18 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Split the code that enables and disables TRGMII clocks and core clock.
> Move enabling and disabling core clock to mt7530_pll_setup() as it's
> supposed to be run there.
> 
> Add 20 ms delay before enabling the core clock as seen on the U-Boot
> MediaTek ethernet driver.
> 
> [...]

Here is the summary with links:
  - [net,1/3] net: dsa: mt7530: move enabling disabling core clock to mt7530_pll_setup()
    https://git.kernel.org/netdev/net/c/8f058a6ef99f
  - [net,2/3] net: dsa: mt7530: move lowering TRGMII driving to mt7530_setup()
    https://git.kernel.org/netdev/net/c/fdcc8ccd8237
  - [net,3/3] net: dsa: mt7530: move setting ssc_delta to PHY_INTERFACE_MODE_TRGMII case
    https://git.kernel.org/netdev/net/c/407b508bdd70

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



