Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E401DC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 03:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMs+rfl3DIFKjTTYWDnQ5u9VEiQBEbN9UhoF7SmtLZU=; b=kD65d194UnlfjM83eAyuUyzZKI
	SjHHR6KbzoYok1F9zDPpwC92vqe2NPdnK5RbkwUxM6NYGacDd4OSkngPHB0YO4VI4bUsRnoM1fI+r
	ghXfQhs9j3fOZqoNKFX9QwfiHi/TvHrDCif06U4j11L9IBG0VOUtM5gmiVeVChRufJO58wwmWeCQF
	cnbMNr1w5eYmkc38d12JvAyID4k2WkIYqcZYtI0Sw6I5KCytyn8TAV1Pwut5O7y8trxVlbPbDMpbx
	ElS1qDyU3H6bgx1R/wQ/pe2Er9A3pexmqF2xi3AdtNAecUxF4Rouw+wMvm1waUCM9+GCO/EHfD5sf
	4XeFAfGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDe5z-004ZB2-DR; Tue, 19 Jul 2022 03:40:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDe5o-004Z8s-Hi; Tue, 19 Jul 2022 03:40:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D204B614D5;
	Tue, 19 Jul 2022 03:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B206C341CF;
	Tue, 19 Jul 2022 03:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658202014;
	bh=ikQzpN8MCLg1lqxUB80odOxAzCBnExBDPr8pxjL5ywM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QKfb7r7wlMw9lNv81IcoXBmMhd0RxOz/BSm+wXuXUfC23aRJazPvSQniwvEpuvxX/
	 K/gbRHK77fIquHeAMNIrwhoZfu+vcobvpVoj6fGYMOLTYJ25J/ImosfYgWIU7Eo+6G
	 8Msbo8urtjmNCfXqItruqcprNzMyBZIe5CKagZL3dNl6IXpre+5eqwesyxgm7IJhed
	 AZyvtjtQQnFd0zHLiWL7J12QWpigKUxzNwZ01IWccPVF1bws00pS5bRzRz0V/rMRF4
	 0xBmz1Ff+GFgaDXarHfGGHjFtOOzKM1pDntJdnVTKHNewUItsIivuDVXTbFpB96ooq
	 MfTTX0LCgjSKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2156AE451BA;
	Tue, 19 Jul 2022 03:40:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: fix off by one check of
 ARRAY_SIZE
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165820201413.29134.11488522402561841559.git-patchwork-notify@kernel.org>
Date: Tue, 19 Jul 2022 03:40:14 +0000
References: <20220716214654.1540240-1-trix@redhat.com>
In-Reply-To: <20220716214654.1540240-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_204016_645440_B020BAAE 
X-CRM114-Status: GOOD (  11.03  )
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

On Sat, 16 Jul 2022 17:46:54 -0400 you wrote:
> In mtk_wed_tx_ring_setup(.., int idx, ..), idx is used as an index here
>   struct mtk_wed_ring *ring = &dev->tx_ring[idx];
> 
> The bounds of idx are checked here
>   BUG_ON(idx > ARRAY_SIZE(dev->tx_ring));
> 
> If idx is the size of the array, it will pass this check and overflow.
> So change the check to >= .
> 
> [...]

Here is the summary with links:
  - net: ethernet: mtk_eth_soc: fix off by one check of ARRAY_SIZE
    https://git.kernel.org/netdev/net/c/3696c952da07

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



