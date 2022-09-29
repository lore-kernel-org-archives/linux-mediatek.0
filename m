Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D0FC54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 02:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROxuqkmx8PIyBQOLfufjrrKYgkndbdTkb7K6HQimQWk=; b=OO0GrhyS7YmE/3piL+4j+uPqL6
	Jrnh7z4jixg2gNJLX4zM8TQnHqAHWFBZAzqwQIeVmXlOxYivCZ6z6G51VX3UR78A8c9qyzPgcUInD
	rN0MoQTaJ2R4Ag4nHbYo8V7vTwHj7/p8Sx+CCuz2UenewVyVhHgLGFcofU87jcHJU1wopOnvwjKea
	cSo7DfAfSYI1v12NuS84qFkQqeXfgoJeHw6B7+w44bSnEyr1S5jkwv/SbB5CBJrWM5gAc8B5iFNKC
	lkFRJ7F3SEG1TcFOJzUmO/h0+DLqyUozKLuy4bZDqt4p8YnVRiXMRrbJzlSWsTgiLiy7Ky9sb+RNu
	afcQM9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odjA1-000xtC-Fk; Thu, 29 Sep 2022 02:20:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odj9y-000xrY-9j
	for linux-mediatek@lists.infradead.org; Thu, 29 Sep 2022 02:20:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC09E61D0E;
	Thu, 29 Sep 2022 02:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 910BCC43470;
	Thu, 29 Sep 2022 02:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664418017;
	bh=iOpHJ2QENss2jRAqS8WGZFmX39Qc0OWU2wFiM/Sj+60=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UnldsmSlUqdJIXSeWKCyldFI7KN67H+NHlT0QobrY1hLjNzd7mAaAYbNBeNVKEVmm
	 xShgrvnQs6/dRXUjws0GYJYftp8FKfab1GP+ElS3RZ4mZ2KB0lfA36PFGKDk1+lud3
	 0JHvq5lX7KDQQYNhRmXRBD15tbEuhZo5yf6QH/0jN45pLVQthCR2hG6aE/DRlsgkhs
	 X8/e7jST5K8lhti/nA5YoW28hhQd9bCV9UBoywbyk2VJYkh5uCeuvC6ELGCk+35l2N
	 EbW1ib46luMiDWqyKcJqnNrtIY7y2FEn/WFaxd2b361Jt8FXII9BNLChNquQIP26T7
	 DN4CYSUkOKOAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 71F99C395DA;
	Thu, 29 Sep 2022 02:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: fix mask of
 RX_DMA_GET_SPORT{,_V2}
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166441801746.18961.5553365683455368502.git-patchwork-notify@kernel.org>
Date: Thu, 29 Sep 2022 02:20:17 +0000
References: <YzMW+mg9UsaCdKRQ@makrotopia.org>
In-Reply-To: <YzMW+mg9UsaCdKRQ@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 lorenzo@kernel.org, sujuan.chen@mediatek.com, Bo.Jiao@mediatek.com,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, ptpt52@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_192022_416259_56B8FCD7 
X-CRM114-Status: UNSURE (   9.43  )
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

On Tue, 27 Sep 2022 16:30:02 +0100 you wrote:
> The bitmasks applied in RX_DMA_GET_SPORT and RX_DMA_GET_SPORT_V2 macros
> were swapped. Fix that.
> 
> Reported-by: Chen Minqiang <ptpt52@gmail.com>
> Fixes: 160d3a9b192985 ("net: ethernet: mtk_eth_soc: introduce MTK_NETSYS_V2 support")
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - net: ethernet: mtk_eth_soc: fix mask of RX_DMA_GET_SPORT{,_V2}
    https://git.kernel.org/netdev/net/c/c9da02bfb111

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



