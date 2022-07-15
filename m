Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA4EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 11:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AQTrqTns7PLr3y6dEzM23zubNv8kqkEJctE4FYD8tE=; b=303OpEOPQRvHm/vC1HvB35Zt8h
	3GhSWHFi9Cfrr8tZh7eBr9kz13qk+aZn3g89QSGVHaObf2zApfGmE9XWriy3lQtPWwxHPxedhg2HH
	8doVfZBmG4NQ5LH3n9xAGQni4oDFPg8m3hqDXxmZhni9tIeYpF50SD0vb+Onx20u6AgEfTE+64qjc
	Zk0UmRJo1cPRhABHg7eruE5H9+p+6H4/MbshTGWd8VQPYIycqYV24dgLsjMcefVraBV/5EBHChNhs
	LJAp5CDPacQWyZT5wbKD2lbZz7z5MOJyoLYOgKp8WjOCHSabUlpgZeOf5hwc6sUj7lXIlF9IAzQ0T
	UpTx7gIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJgd-006fte-2c; Fri, 15 Jul 2022 11:40:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJg9-006fiI-NO; Fri, 15 Jul 2022 11:40:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0F951B82BAB;
	Fri, 15 Jul 2022 11:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 954B3C3411E;
	Fri, 15 Jul 2022 11:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657885214;
	bh=gPzsRiE5QwZ1jIMh1d6tdWaf8Lar3t+oij2C1a3b6XU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nbVOdS9a2sYOEsZ7Qc1vRcC5hfckjv6exNyLtnyb2yGN1JFGmtIwh7TDf//bvoWGY
	 jRqNA0ApxsCiPB1pBU0C8ZGj5aHcHXc97IG5twUrQlQEFFHFUikEhyGf6fiD6Bjgds
	 SQnxRlKQRa7J8LpilOcPnVWsvnbfmzzhO30+wOtXnsK64Uqy/6DIxr2Yb4zK/4bnfe
	 oHwzLkYsd5zad13UN4iPvAkMXPSG4kQ6S8KuhQZAFNKANhkqRM1zku/8HAQ/4KcdZU
	 yHSKrdeeYENNLl53r3zUHiM1Gm5bzOq2wI+Ex8hjOLgXP1OgyDSXQkDwGyIN+wbOEU
	 G/U+M9hEVn9Yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 721ECE45227;
	Fri, 15 Jul 2022 11:40:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5 0/3] stmmac: dwmac-mediatek: fix clock issue
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165788521446.32301.11367784374221397861.git-patchwork-notify@kernel.org>
Date: Fri, 15 Jul 2022 11:40:14 +0000
References: <20220714060014.18958-1-biao.huang@mediatek.com>
In-Reply-To: <20220714060014.18958-1-biao.huang@mediatek.com>
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, matthias.bgg@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 jszhang@kernel.org, mohammad.athari.ismail@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_044017_969139_178204C2 
X-CRM114-Status: UNSURE (   9.25  )
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

This series was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 14 Jul 2022 14:00:11 +0800 you wrote:
> changes in v5:
> 1. add reivewd-by as Matthias's comments.
> 2. fix "warning: unused variable 'ret' [-Wunused-variable]" as Jakub's comments
> 
> changes in v4:
> 1. improve commit message and test ko insertion/remove as Matthias's comments.
> 2. add patch "net: stmmac: fix pm runtime issue in stmmac_dvr_remove()" to
>    fix vlan filter deletion issue.
> 3. add patch "net: stmmac: fix unbalanced ptp clock issue in suspend/resume flow"
>    to fix unbalanced ptp clock issue in suspend/resume flow.
> 
> [...]

Here is the summary with links:
  - [net,v5,1/3] stmmac: dwmac-mediatek: fix clock issue
    https://git.kernel.org/netdev/net/c/fa4b3ca60e80
  - [net,v5,2/3] net: stmmac: fix pm runtime issue in stmmac_dvr_remove()
    https://git.kernel.org/netdev/net/c/0d9a15913b87
  - [net,v5,3/3] net: stmmac: fix unbalanced ptp clock issue in suspend/resume flow
    https://git.kernel.org/netdev/net/c/f4c7d8948e86

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



