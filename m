Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE0BC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Nov 2022 03:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXCnLmmfEnDhitVihkLk8kIzUz0WSIhSo7s4LTMea6A=; b=ewEQPsoXQ2BQqFBXXOIUKBTf/U
	G3wJrCDGMYTpwOwV7tCFZHCK9hb3Ja3li/ET8Pl489hNboF0TEo+0NggZxUFREYlzz5nWr598gCqF
	O1z4YHieRUu/aa1kuuKdTvKmZmc8CoguvFcYfwGGGkx+uNJ5ilrXDiE3ILltYoLL78Fo4xkzHjkFV
	QYrw4vmNQB19baMyZB1kWe7HhN/PTbavrwP/KGyqjZyxPq7JeS++Za8CXyN/cPXvvQJNTQDVH7qdl
	gD4CcHJ7m0ZBquIifZhzo0rmZo1R7EVr2hGnCwlU4vamga0fHzbiPF2gJ4CSg7xMNzOMUlww9N1pp
	zV+zi2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owEsN-00AqrD-MQ; Sat, 19 Nov 2022 03:50:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owEs1-00Aqei-Li; Sat, 19 Nov 2022 03:50:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2D596B8268C;
	Sat, 19 Nov 2022 03:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41FB3C4347C;
	Sat, 19 Nov 2022 03:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668829818;
	bh=BSAu+2s2PAYaODqLvKk9kbx/7WwQq7m+WZPP9j73cLc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hxsctMeSELcPjEoZrkpTgT/Usialyu61JzhBTT93qfj9EYmEmxDeIAIf3EEZyIkU+
	 wuNl1+rQj2Fl+9QtheURaw8HRwlkIAlxFQxtfDbtdw18zw/iAZq2bhQitJtweP7qhv
	 seHlHbGCai380XzaczDm+uhLnEv79U4/bOhB0LJvVFNN5hOVOsEEGwDHTU1YtccSaA
	 zpXWQMw9tv+PuL+KyUie52ELGsdOmW1NLZTuh+K6DabueCk+OiqD25hy7pOyY2uCPg
	 XXdcdA3pCT2N+C8cfogsI6PZI9KyzdZvgBI7qpml97z3GPNBikNngpwHBMlTkZZ1wk
	 Dw9T7e1Bpp3lg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D77BE50D71;
	Sat, 19 Nov 2022 03:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix error handling in
 mtk_open()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166882981811.27279.4909635102411295940.git-patchwork-notify@kernel.org>
Date: Sat, 19 Nov 2022 03:50:18 +0000
References: <20221117111356.161547-1-liujian56@huawei.com>
In-Reply-To: <20221117111356.161547-1-liujian56@huawei.com>
To: Liu Jian <liujian56@huawei.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 linux@armlinux.org.uk, opensource@vdorst.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_195021_911971_8A3F4CEC 
X-CRM114-Status: UNSURE (   9.16  )
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

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Nov 2022 19:13:56 +0800 you wrote:
> If mtk_start_dma() fails, invoke phylink_disconnect_phy() to perform
> cleanup. phylink_disconnect_phy() contains the put_device action. If
> phylink_disconnect_phy is not performed, the Kref of netdev will leak.
> 
> Fixes: b8fc9f30821e ("net: ethernet: mediatek: Add basic PHYLINK support")
> Signed-off-by: Liu Jian <liujian56@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: fix error handling in mtk_open()
    https://git.kernel.org/netdev/net/c/f70074140524

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



