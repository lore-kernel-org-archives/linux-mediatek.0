Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A10CA0EEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Aug 2025 11:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhjqU2JrRoeB3BGs8yjc/GGox5X/UrAVevlMVjHB3jw=; b=g+24ll9KZwrc1Ba0osLZINoeYO
	wzKjyZU3IHCFabm5YR8yZL3pqS5iZSoi0anyFBm/hjVsONsMeluEDzIPGoZ4482a3KPoMVxOqDXat
	MMHQZ4NMzNbtBA9EuiGsKLlbRNSDfm0A1zs6TNKK92ZaxWJ+Eco3WoWT0ffH0owD0d1n8EhJ2zfxO
	cLhrcC59Pa7v+3SQX/IYjTUiIwMJIoAvDXOqo3v/e3J2JKnwNDAUYWNCwGls7/d9Xxk2KzHPxbMs3
	OuX6bGqRlxCQGS0FZ1a9j4RTJE8SJEfuw/wnH66Kt+2kzEwGbuCNMq1X6p9EZbd3GiRBqW+ov3AP7
	5Bo4GKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKSa-0000000AGTR-2oBJ;
	Tue, 19 Aug 2025 11:25:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIow-00000009zox-32en;
	Tue, 19 Aug 2025 09:39:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58B8A601F9;
	Tue, 19 Aug 2025 09:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0950DC4CEF1;
	Tue, 19 Aug 2025 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755596397;
	bh=FEhAvhKTnQv5y2x3NKpeGdvP2hJtDaCHfPqTZIZ6rvQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RdmPfdaGFo3120XMVXRqL52U4kuz0dp7frs5+C8PZWnDwffgZgBflKn+XIAG/+wi8
	 4sebaePZve5Ro63A95ayj0R9tTNBoDfpvexahTi64qUkP8V5VGl1jYW3We58y7IJxe
	 dbP2JN/7ZAFosq6J1eIyBeF9ysSh1vhvITuPoJxuFtFCyUlhlVUTmv93OwY1CXbV06
	 pnjYX4QVYBUy11txgeuMeyFdjQjdYolcJrdsXxKVWbdPeUb4PzvMFby6R5TEsmvN/L
	 6FDEULBjHGdHLTwGHPR34J52xFGvAnVXRkapDysNrx5WYdvQAzlZyO/ziPnVomg7xc
	 rl/tXJD5Eb5UA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D6A383BF58;
	Tue, 19 Aug 2025 09:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 1/2] net: ethernet: mtk_ppe: add RCU lock around
 dev_fill_forward_path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175559640702.3468407.17117186051389632839.git-patchwork-notify@kernel.org>
Date: Tue, 19 Aug 2025 09:40:07 +0000
References: <20250814012559.3705-1-dqfext@gmail.com>
In-Reply-To: <20250814012559.3705-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kuniyu@google.com
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 14 Aug 2025 09:25:57 +0800 you wrote:
> Ensure ndo_fill_forward_path() is called with RCU lock held.
> 
> Fixes: 2830e314778d ("net: ethernet: mtk-ppe: fix traffic offload with bridged wlan")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v3:
>  Reorder the patch to be first.
> v2:
>  New patch
>  drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - [net,v3,1/2] net: ethernet: mtk_ppe: add RCU lock around dev_fill_forward_path
    https://git.kernel.org/netdev/net/c/62c30c544359
  - [net,v3,2/2] ppp: fix race conditions in ppp_fill_forward_path
    https://git.kernel.org/netdev/net/c/0417adf367a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



