Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F56BC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Nov 2022 03:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cK2nm0rvWVA5x/0UtKu1K4S2Lk7QYbh5LC9jtTlEv0M=; b=rlrT6zbVbf44EDohTtspqiLQx5
	IKVwRMA7uOXL5F1GlSZZl9lkmoi4TwQtCtKTXqVV9mgRZEmp7S5POStSVhnuBblam4pBG60WuQyZx
	MEuAS8//6ORfIwlgnJYWMYMl/l1UOu8gFJA319Zo2aXZnM34W/IxUuvOfXqnIrDfLrD/n1NIq9MYn
	S3SQc65eSFIsM6wTQn5QngoT4RyOp4fJt48aka/WSHQszGO3fNNpQAGyRduPqa6TgDg62PkFOtIv7
	xl9vy05lSi/zoHNhOsixrg4j32nXE+HlWV6N9VkkDcEJ8oAeVGkDKnOc6p93XJ9T/ftv3bbZzWkzH
	Grqs0fSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owEsM-00AqqO-E2; Sat, 19 Nov 2022 03:50:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owEs1-00AqeH-EB; Sat, 19 Nov 2022 03:50:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A3BB62858;
	Sat, 19 Nov 2022 03:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A02AEC43147;
	Sat, 19 Nov 2022 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668829819;
	bh=soW1Kc5f4meOkpm3t6Ttp/wLShmdkeEAIerUQU/e8Bw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WFHmBqsCcaWUQpBcjaxEl7FzbNsgrl4owLQq1Ab6qnLqwXpluT39QoLhqlFzDuD1r
	 KWfCQA9EH3WF0W9mTYo97ZbtaJ2OxeEuNTpbUhMj3ST0SAZ0AaJeVCfl/DMxpZoW2G
	 QwGTCFeY9fhWaPssqRwYiXZOm6nLcJ0b5JMUkQswW5dQhQClK6eA/8shs+LQELFqza
	 D/R9lB9W2EHw7QtRRWdWfEsV3nguYv4vetkMOe0YMTHZZAsO726eWmkwoA5G2cmMO8
	 cUZcNj3cB/ykTEcdyl/fw/8Gh/RwwgXqwLpHtmJtohpgQ3TCgBpEvD1OQPT5LO98pY
	 +XSBzmDr3aB8g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8E84AE4D017;
	Sat, 19 Nov 2022 03:50:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 1/6] net: ethernet: mtk_eth_soc: increase tx ring
 size for QDMA devices
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166882981958.27279.4643312403329696059.git-patchwork-notify@kernel.org>
Date: Sat, 19 Nov 2022 03:50:19 +0000
References: <20221116080734.44013-2-nbd@nbd.name>
In-Reply-To: <20221116080734.44013-2-nbd@nbd.name>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_195021_621487_6D932BA0 
X-CRM114-Status: GOOD (  11.16  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 16 Nov 2022 09:07:29 +0100 you wrote:
> In order to use the hardware traffic shaper feature, a larger tx ring is
> needed, especially for the scratch ring, which the hardware shaper uses to
> reorder packets.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 38 ++++++++++++---------
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  1 +
>  2 files changed, 23 insertions(+), 16 deletions(-)

Here is the summary with links:
  - [net-next,1/6] net: ethernet: mtk_eth_soc: increase tx ring size for QDMA devices
    https://git.kernel.org/netdev/net-next/c/c30e0b9b88b3
  - [net-next,2/6] net: ethernet: mtk_eth_soc: drop packets to WDMA if the ring is full
    https://git.kernel.org/netdev/net-next/c/f4b2fa2c25e1
  - [net-next,3/6] net: ethernet: mtk_eth_soc: avoid port_mg assignment on MT7622 and newer
    https://git.kernel.org/netdev/net-next/c/71ba8e4891c7
  - [net-next,4/6] net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues
    https://git.kernel.org/netdev/net-next/c/f63959c7eec3
  - [net-next,5/6] net: dsa: tag_mtk: assign per-port queues
    https://git.kernel.org/netdev/net-next/c/d169ecb536e4
  - [net-next,6/6] net: ethernet: mediatek: ppe: assign per-port queues for offloaded traffic
    https://git.kernel.org/netdev/net-next/c/8bd8dcc5e47f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



