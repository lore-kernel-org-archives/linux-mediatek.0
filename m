Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F6C77B73
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Apr 2023 12:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AnNBXk3AZDPdvId2vFvC5gakmJE6N0aXsoxnXzo2hw=; b=N2ET+rbznDEzO7HLsawTQnskhE
	JAM04XoHzlL8UgKmEgH+QoTdeA6NtygLu97tbDZZMF94xVcylU6oKsdT0iWNAjXW+DGHd9l4XdAC5
	HV6xe5vfAlgwGUiTW++ot1nnxRAyf5ooC0wbdB1204wPnPXE4I2dNcX8j/9ag49/w10Lq4ClM7Ogh
	QezDS53rgZMc7pLUvrXFJNYT+wRkRiU3FGLZ20roOz/sFDo0I1UKgDpEaJcAr2M9Luu4wh4xH1lMM
	R9an3nLPNx74jX2bBmpWXJTzIfYSo+v89J8xRoyAMgslXMQSAxqKcprVFeXSrVBgcaq614duYSe12
	jBbK5QjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqYrH-00EI1H-0g;
	Sun, 23 Apr 2023 12:30:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqYrD-00EI0Y-2c;
	Sun, 23 Apr 2023 12:30:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 127A660F6E;
	Sun, 23 Apr 2023 12:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 673D6C4339B;
	Sun, 23 Apr 2023 12:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682253018;
	bh=x3u0o4CRVGoUpTOcZqcBpH3LsucNfjILoz6/opJTae8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a39wzx2PLQSP+XYGNFoLqNiK0NnciJyggIxNn8dKzcfAO23vSLJ+RY6n3YkL1p2Ns
	 LMm8g82DD6NErlwTkWeC71sLLkSvcV96SzxrCDwHPI87hwX/zli0wj6JYtLmDycQg7
	 qYnuOwL6XgfJP+fWCrr5gcte/KF8gwBMPdqsnBvBFF77BlwS4IEI04BIPrYrbhb6uo
	 m8C6KhFsSsmTX7DHlWYAGO57/12aCw73xhhdTq8pM2L49ppWWLBO6xJ1WcruuGCI+C
	 fhCS1qo21R39aGQ2NGWDa9fRmnZRtjcO3vgmxMyQxfO+JCxs0On+FrVjYQM9ynzNoq
	 sO+1BAItIcsvA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 406ACC395EA;
	Sun, 23 Apr 2023 12:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: mtk_eth_soc: mediatek: fix ppe flow accounting
 for v1 hardware
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168225301826.6341.12919802141863070642.git-patchwork-notify@kernel.org>
Date: Sun, 23 Apr 2023 12:30:18 +0000
References: <d8474a95a528a4bec5121252205d179f357c7124.1682024624.git.daniel@makrotopia.org>
In-Reply-To: <d8474a95a528a4bec5121252205d179f357c7124.1682024624.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_053019_895159_232C6205 
X-CRM114-Status: GOOD (  11.12  )
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
by David S. Miller <davem@davemloft.net>:

On Thu, 20 Apr 2023 22:06:42 +0100 you wrote:
> From: Felix Fietkau <nbd@nbd.name>
> 
> Older chips (like MT7622) use a different bit in ib2 to enable hardware
> counter support. Add macros for both and select the appropriate bit.
> 
> Fixes: 3fbe4d8c0e53 ("net: ethernet: mtk_eth_soc: ppe: add support for flow accounting")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: mtk_eth_soc: mediatek: fix ppe flow accounting for v1 hardware
    https://git.kernel.org/netdev/net-next/c/4eaeca1fc43a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



