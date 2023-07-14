Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529FCEB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 07:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuptVM5sFe1FZ61Ot2mzNZzZ3F6wSsyA29N3WZH8xgE=; b=bnp9ctGcdDSEcV3klcWjc06vR5
	DGe26FeW4KIEQBWsp+0p8KSINIVIauiwXfe0qfM4EL51OO2WpaXlX7dkzS4XVDdUh1bnYkR5O4U61
	7pUZEUNDQOtFuwLm7/L0TsO82yVglZ4eHCugXuJD/bbjN3PV2mlqDAC5YF/LIR64RRhjTZic71Hud
	7ppihxu8b8Y8vYM6NboZg4eIqelNESywtrC4+wJL/rYJZcLNUGiKDN84FA1heVswT1T4b7tY6plf2
	wiml920iRw0JolJX/6I6/YxS5+ZQBvAWyXPy8c7ewCygUBte76rxqvqCFmJVG/h47+B7VfgIN23bh
	Ckc1jCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKDZJ-005Mpz-0J;
	Fri, 14 Jul 2023 07:50:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKDZG-005Mow-12;
	Fri, 14 Jul 2023 07:50:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CED0161C3A;
	Fri, 14 Jul 2023 07:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38620C433C9;
	Fri, 14 Jul 2023 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689321021;
	bh=cwHRXo/wW2oWNu56lQpWumfN9yIRdiC3B4zek6vqFec=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vPwcgOZyxDwpM34uramttyAkJZPb9WG+KRYmXwhhnI8u9UNgZkvtX/vKp6+o2Vo1y
	 toH97iB2AdbR1UpRzpbkruQi9ilVVO2JmGOQrPqGvrHtULzmFGsfEtYAnDicRo681l
	 kJFvTLCYaUK126+6IrOqemh00oEGkQudQNnc86ftIDvVOGbNTs7HedAwyOPxL578AZ
	 OFDs3jemP8Fo2OVRaOUFDru+its8yfF3MflfS99KDov4ZHGrjusaLobaMS1LqmtCGp
	 cXHTmAPVWB9CettzqZ1ReS1c7houLKId2fAlp22a6OD4bv5e8v70r6BHq+LL+8G3OD
	 WDK0gebedr3XA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1F4FDE4508F;
	Fri, 14 Jul 2023 07:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: handle probe deferral
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168932102112.13275.16065030882031894328.git-patchwork-notify@kernel.org>
Date: Fri, 14 Jul 2023 07:50:21 +0000
References: <ZK9klTi7XoZZDMeE@makrotopia.org>
In-Reply-To: <ZK9klTi7XoZZDMeE@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 igvtee@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_005022_401693_6DBA8CEE 
X-CRM114-Status: GOOD (  13.10  )
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

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 13 Jul 2023 03:42:29 +0100 you wrote:
> Move the call to of_get_ethdev_address to mtk_add_mac which is part of
> the probe function and can hence itself return -EPROBE_DEFER should
> of_get_ethdev_address return -EPROBE_DEFER. This allows us to entirely
> get rid of the mtk_init function.
> 
> The problem of of_get_ethdev_address returning -EPROBE_DEFER surfaced
> in situations in which the NVMEM provider holding the MAC address has
> not yet be loaded at the time mtk_eth_soc is initially probed. In this
> case probing of mtk_eth_soc should be deferred instead of falling back
> to use a random MAC address, so once the NVMEM provider becomes
> available probing can be repeated.
> 
> [...]

Here is the summary with links:
  - net: ethernet: mtk_eth_soc: handle probe deferral
    https://git.kernel.org/netdev/net/c/1d6d537dc55d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



