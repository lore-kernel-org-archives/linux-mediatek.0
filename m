Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2CBC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 05:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNhIKZdl5jv+6TQTGsSiWy+zkV6/nxzo9pk4cZmMea4=; b=XcJBHsSRH998kTzNeBlzq+PADl
	3nnFuEdyGmTe/dBzaKUSVp+m/q9ghXNYvigv9UdpDJxWFzx/hddggXQBjf7reWrPWpDmeQwbPaRs5
	6br1KMlWceiEwKDDs5d2v7ucq4pBJCLX/RTQ7RKZqwUtOs5OjTdDksLnli5lG5BxD6rBkZDA+6V9w
	dbAM6qagPatWCysD5IvuEfkFR4TinS8+YsmrsgMB65sSer3gefdgknHPgWu2UQS/5cS7ngSHUFTEQ
	n4AVRllxGUuCyJQHUFRT9wQX2r4lVZpoVsXw+4vVurkH4wT3M2IHhstW263fyaKlEPOmT9Yt+aJ5Q
	YL5KAmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxhsB-00E6mU-Tp; Wed, 23 Nov 2022 05:00:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxhry-00E6fb-CR; Wed, 23 Nov 2022 05:00:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB0D161A6C;
	Wed, 23 Nov 2022 05:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDDD3C43470;
	Wed, 23 Nov 2022 05:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669179620;
	bh=ZDJPaxlx5Y2h4EP8//tqBocHHjbuAxhC7dW5z2Pj1iY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Kqkb4QxOvZP5jo0g54jDoSIH2GVl8rVwyoS64D5+fmuqeE4z1xMJuOiMUdP663PzK
	 y1EZJC2D01zlbl/DH8LV5MKEI4UT4INovrcwc7Kh5yBsC9q1dQwzBlzxdm4PSZMD5g
	 nx0Ip0gEZD/xD4YuZlysbZzzEx1Wtaw1zRj2YMW807u9GCXVl0JPFW//uQon+o8guC
	 /xMQ5tJ0mfpsGV/dZXwRmlG0B2l7gvfBC0w1iF2D0xCn6CQ3y+MirXuB9+EyinwDbA
	 Z9tiqXQIqAQYXr5ZrS4EtuUYScbQn/d94nnvffRFNrwH7TOMigQ2d/1cTjB/jPDbk9
	 kx0NvZXEttGeg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BD645E524E0;
	Wed, 23 Nov 2022 05:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix potential memory leak in
 mtk_rx_alloc()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166917961977.4515.16047808004376352912.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 05:00:19 +0000
References: <20221120035405.1464341-1-william.xuanziyang@huawei.com>
In-Reply-To: <20221120035405.1464341-1-william.xuanziyang@huawei.com>
To: Ziyang Xuan (William) <william.xuanziyang@huawei.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, lorenzo@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_210022_481114_1FDC7B5D 
X-CRM114-Status: GOOD (  10.44  )
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

On Sun, 20 Nov 2022 11:54:05 +0800 you wrote:
> When fail to dma_map_single() in mtk_rx_alloc(), it returns directly.
> But the memory allocated for local variable data is not freed, and
> local variabel data has not been attached to ring->data[i] yet, so the
> memory allocated for local variable data will not be freed outside
> mtk_rx_alloc() too. Thus memory leak would occur in this scenario.
> 
> Add skb_free_frag(data) when dma_map_single() failed.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: fix potential memory leak in mtk_rx_alloc()
    https://git.kernel.org/netdev/net/c/3213f808ae21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



