Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0060AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gisSaAm0gvcp/zPnatYKyXjwoqlXLwV1QMpfnv7ze8Y=; b=OJsTPhcVUvc0lNYi15UOwDEYn7
	nUWgpfcn7Rk9rU+npsna+zyr7Sv7JupiseGm3spNTOvCDlkWzH8kNJOb3PvkwislY+d/1USOCfvlG
	pkN0YhKc5QIipEo9lBlZCzbQI5ad/GHV+8DTxmc0pGrregWuzDuMEDzq/dTzQmQeZQR65vXHDZaU0
	UaGfNOa8q1vfZWFTdoxpwlMZth/gzYTtZDx8wpKXEas/n4HD2hnh0yYVehfxBi6ffAigG3F4hZQIx
	y/o0OYVEqjT6fwY1wAUYKsSR4wZAi12ZxVFzFRfMSjQYKk+oT/rDnEh5d2L51kdEPcgFQd7ayddC4
	1fRZ91Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFy0R-009xe0-5e; Mon, 25 Jul 2022 13:20:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFy0P-009xcq-1M
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 13:20:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 950F4B80EBA;
	Mon, 25 Jul 2022 13:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B261DC341CE;
	Mon, 25 Jul 2022 13:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658755213;
	bh=PxSmYHyAtKoiBMEfhuVUj4+GoPAWpUAOWgcXKXqf5f4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JRNPksy9YGWkWH2b5daWjQmJ8pWGbfEIB3FNq10lUcC17AyY27fY/ISb9fO0QmSxC
	 lIIkNrsmQGhFqGehrld2LyCiMHf250/ODzoMc5SvSBWNE9o1lVkfABK6BVGjV5wgmm
	 ZUBGys1M1x3bRpBG+FcKk+yVhIHrzYoD4dvTr37kuBjDk75ztkQHNy1WmrUh00lLK5
	 SX8Q+Ckk9ifgMdqsgeBGA3ucBt84C8HAbYKZDsDJwKbPLtkaEBCNtO+u/ZdufPgpTr
	 6KPpgVD+PBXK0dZfdNbDLrVZBI+B8begi+ceytMcgfFOfxgX7+MvfN0g2B823CdBhP
	 yRczoRCPQ2GkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 96670E450B8;
	Mon, 25 Jul 2022 13:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next] net: ethernet: mtk-ppe: fix traffic offload with
 bridged wlan
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165875521361.10499.12473781719497627426.git-patchwork-notify@kernel.org>
Date: Mon, 25 Jul 2022 13:20:13 +0000
References: <c79ed39af42540a6ce2cd145c4ddbcb98491630b.1658473427.git.lorenzo@kernel.org>
In-Reply-To: <c79ed39af42540a6ce2cd145c4ddbcb98491630b.1658473427.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, pablo@netfilter.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, Ryder.Lee@mediatek.com,
 Evelyn.Tsai@mediatek.com, pvalerio@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_062017_253514_3A04094C 
X-CRM114-Status: GOOD (  11.52  )
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

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 22 Jul 2022 09:06:19 +0200 you wrote:
> A typical flow offload scenario for OpenWrt users is routed traffic
> received by the wan interface that is redirected to a wlan device
> belonging to the lan bridge. Current implementation fails to
> fill wdma offload info in mtk_flow_get_wdma_info() since odev device is
> the local bridge. Fix the issue running dev_fill_forward_path routine in
> mtk_flow_get_wdma_info in order to identify the wlan device.
> 
> [...]

Here is the summary with links:
  - [v2,net-next] net: ethernet: mtk-ppe: fix traffic offload with bridged wlan
    https://git.kernel.org/netdev/net-next/c/2830e314778d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



