Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0F9C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jul 2024 09:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ro2Y4NZ6Nc7FTg1SMhlfsQmVH5THjaRwjhZSM0Yrf4s=; b=EA0YLuYIQRxFqe4XucChpnN/V7
	tqSaxSqxHEShoZvM8ZqonNXpPNPmMzO09MMirDwoz/rYvMTAhNaeSiF3FTTN26pw1LSnNuuhpc1Yo
	U0QCAO51ekX3aW4nm2lFBZ/GBNLDB7UPvrz8CnV7YO17jnXwl5UEaACe/2/CNNwsY/ygLbYSasVKX
	w9tOA/h20syPwhQGIJoOmzjyAnULBrQvjwNFb2Hejc9gYFzSrAl3nWLa6xVTmeA3+Ri9pCbU35932
	Y60TIxfQN1iRxmOR1L1T5nzmI0skobn2UAmHALN0C9wpK7DwzxH7LvvAHVQ+tBPPtjcTCOGmJYyge
	Lb37DjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWuoP-00000000U6s-0oJ5;
	Thu, 25 Jul 2024 09:31:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWuny-00000000U0T-3qIo;
	Thu, 25 Jul 2024 09:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1CE17CE12B1;
	Thu, 25 Jul 2024 09:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B45BC4AF0B;
	Thu, 25 Jul 2024 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721899832;
	bh=YkNQ0V1qk2PdVvo308FU3kSLrtEtNftLerz9oE7dXK8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nBUbNtzIgLm5N5gAAgerb10vnpa/HYKzng5SBBkr4VlUT9gG0fod/AsISeOtEfswg
	 hosdut7ZIY+QAeYQbk+x/U6facKkH16opmer0Ba1P/d2ZP9pb7smvd5F6mZTUNarkL
	 6gqN3NS/Z6ct9deaZAjIPFTEIB+VSoDbLHyWMfJrlTw64rVlJuNgjzs5iftAiVYDI4
	 d/EDsT1OCD1rq/7YhiCPn4GZI4LnmLQu1Km3OpMwRyha/xNlBnJBcccc7oibUWyusv
	 NjnNaNfRn54TOzU5TcWj09RuITO7anfc8ga5vMisZy5jeeKDEn/YthPusBbEpBGYV6
	 tWG6em0kRXYhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 00128C54BB2;
	Thu, 25 Jul 2024 09:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: mediatek: Fix potential NULL pointer dereference in
 dummy net_device handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172189983199.31991.12505677109278779843.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jul 2024 09:30:31 +0000
References: <20240724080524.2734499-1-leitao@debian.org>
In-Reply-To: <20240724080524.2734499-1-leitao@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, leit@meta.com,
 dan.carpenter@linaro.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_023035_158922_D643F0BA 
X-CRM114-Status: UNSURE (   8.93  )
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 24 Jul 2024 01:05:23 -0700 you wrote:
> Move the freeing of the dummy net_device from mtk_free_dev() to
> mtk_remove().
> 
> Previously, if alloc_netdev_dummy() failed in mtk_probe(),
> eth->dummy_dev would be NULL. The error path would then call
> mtk_free_dev(), which in turn called free_netdev() assuming dummy_dev
> was allocated (but it was not), potentially causing a NULL pointer
> dereference.
> 
> [...]

Here is the summary with links:
  - [net] net: mediatek: Fix potential NULL pointer dereference in dummy net_device handling
    https://git.kernel.org/netdev/net/c/16f3a28cf5f8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



