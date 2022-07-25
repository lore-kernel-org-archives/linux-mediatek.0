Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D27C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 09:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Zxzn2JKNy30IUeeOZfeZy2HKF5tn0G6rsehLMrAPdo=; b=kYq3hiQWOZGt8rSgdg7YnyTI1Z
	QoOmkvv7zjg+mstD3ZpnUDWWXjdQtGnmca9XHHNF4HZZhFuG7tR6MrraFZ/igXQWZ5ajvWJ1LdM3n
	S12ZljbK5+hqQgqRF/7deC8xub1D11h/co1UNTEGEzDiopsZkNW/31ZUHfj0Kh5WK21Vm9jrvqTPv
	lmOWWvSs7ySmfbu5YH6Y5VNtlsWMrUB8dT0jwXWd1WewsJqDrPqim/oPhTt3uotodtJfBU5A/8wrW
	DUMsVEwtl/3p/lDN2SVhEYGG9kh756mc4q/sTAi1t2S5we0+zxaWNawosFcJPspD7vZP209RRkZVP
	KYDOBGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFujE-007mkG-BF; Mon, 25 Jul 2022 09:50:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFujB-007mik-Ml
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 09:50:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6EDCCB80DFB;
	Mon, 25 Jul 2022 09:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10EB5C341C7;
	Mon, 25 Jul 2022 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658742614;
	bh=7KgDUam99vWAh7RjWX40VFff7LVefNo5IqM99eHy+co=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SfrkY7ptB8ytcxOVKXXq9/r+2u9pjGXlILX3FKmyK7+bhyLkmNE9X2v4PMxJFbCkW
	 Grh65bC/v3ZYZWn0p/2mZmQvTqcOQhOI4cJXEhIzrLMJ7nS4thfuzpuYJ8+ca/NUqV
	 LAhhe6OedCZZ0egMkzJKkWvq/KswBg/8yU7vbBJ1Iyp7Pjfrv1LqX62RAj3Z0y/Gnb
	 3SkJ27+HeGHgAae7WVwP+fw1kqBdokca6qeO29t5hP2Sh+FNOqiO89t/8mKyCoskM7
	 r5cxsOfC8ugt8cUvXg4bru7khgGoMsI+JntAueaoTpA88h98Hx/ccOhObJvpy52R/C
	 HFSF+CXftcC5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E9BFFE450B5;
	Mon, 25 Jul 2022 09:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 net-next 0/5] mtk_eth_soc: add xdp support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165874261395.3948.10032831276100096007.git-patchwork-notify@kernel.org>
Date: Mon, 25 Jul 2022 09:50:13 +0000
References: <cover.1658474059.git.lorenzo@kernel.org>
In-Reply-To: <cover.1658474059.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 ilias.apalodimas@linaro.org, lorenzo.bianconi@redhat.com, jbrouer@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_025017_929748_FF39B060 
X-CRM114-Status: GOOD (  10.82  )
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

This series was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 22 Jul 2022 09:19:35 +0200 you wrote:
> Introduce XDP support for mtk_eth_soc driver if rx hwlro is not
> enabled in the chipset (e.g. mt7986).
> Supported XDP verdicts:
> - XDP_PASS
> - XDP_DROP
> - XDP_REDIRECT
> - XDP_TX
> - ndo_xdp_xmit
> Rely on page_pool allocator for single page buffers in order to keep
> them dma mapped and add skb recycling support.
> 
> [...]

Here is the summary with links:
  - [v4,net-next,1/5] net: ethernet: mtk_eth_soc: rely on page_pool for single page buffers
    https://git.kernel.org/netdev/net-next/c/23233e577ef9
  - [v4,net-next,2/5] net: ethernet: mtk_eth_soc: add basic XDP support
    https://git.kernel.org/netdev/net-next/c/7c26c20da5d4
  - [v4,net-next,3/5] net: ethernet: mtk_eth_soc: introduce xdp ethtool counters
    https://git.kernel.org/netdev/net-next/c/916a6ee836d6
  - [v4,net-next,4/5] net: ethernet: mtk_eth_soc: add xmit XDP support
    https://git.kernel.org/netdev/net-next/c/5886d26fd25b
  - [v4,net-next,5/5] net: ethernet: mtk_eth_soc: add support for page_pool_get_stats
    https://git.kernel.org/netdev/net-next/c/84b9cd389036

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



