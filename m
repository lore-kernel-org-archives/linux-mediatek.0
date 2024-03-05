Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA07BC54798
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Mar 2024 11:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3esC+LuqtUsYxxSajK660sP30Y0zz/w3lgW0ufQEIIA=; b=C3ymuy2F+qdNHM5wuRHkNWTpJw
	0aU906Si4alR2Nkp1SgRCt1G3i6PY7CzV7gqWd06yn2i6KUOZKIMJiZUbTRR9uRN+cP+qWetE0IcE
	7n17JYZtl4qzkV697GF0aac2Fdvmvv2qK22u95M85n4lQQ+pQcKCybRMuVNj/osk4saD9fmdsQFms
	mjL7ekewbKpcI2D2ZhEwHFtKaodqPfyG/a+oG2DcQpywcgSw49UhIxbjv/MrPvQ2L+tuxu2/ns8cw
	E7ivU0cXWOvgV4fLB1boHvcCqawx4L6pr2NF1jU9edFRNb8L0mBjDjwnWyNXIsdXbZ/TXV4T8R23k
	8VH57h6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhT0L-0000000DMmR-0wOT;
	Tue, 05 Mar 2024 11:30:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhT0B-0000000DMgj-3CmT;
	Tue, 05 Mar 2024 11:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D856ECE19FB;
	Tue,  5 Mar 2024 11:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E37DC43390;
	Tue,  5 Mar 2024 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709638229;
	bh=EpD9Di9FVmc5SbLTT9/ApRiFR+/80ke9uLaAp5KtFRk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ilYCxJ2A1C1M+7cJ95lI6fiGam9N7P2kHMcDlcJgmFgXs5tgq3hufzZTOINWuJpfV
	 KR/7erFe1ku/Dw2j8Hbnwzjgc3qaT1KxrY9mZsZwzZ+M2moPpc0dJ271hRhh0CKY5F
	 t3QFszw6cGtEJz5jeHVAgRvc3lfJYWme9NWLXubifgFh0k+Qtac775GGEK+mSwpKTw
	 6lBX29dE6bFb8zAkU7Ws+xNmmdTBIcRzz6xpjewq6y3iGPnOIc9mg8TjyPHqoYzlOC
	 VhDCNDR1cs85GNNLN7ObyEm8r/SHb8x0vOQ33Ofe1ZXUjVKatdf2vayz2NCZNTfW5X
	 R0XfTXI/3o3yA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0044BC3274B;
	Tue,  5 Mar 2024 11:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6 0/5] remove page frag implementation in vhost_net
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170963822899.25227.16966361429378501531.git-patchwork-notify@kernel.org>
Date: Tue, 05 Mar 2024 11:30:28 +0000
References: <20240228093013.8263-1-linyunsheng@huawei.com>
In-Reply-To: <20240228093013.8263-1-linyunsheng@huawei.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_033032_006247_6F6BC2F8 
X-CRM114-Status: UNSURE (   9.88  )
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 28 Feb 2024 17:30:07 +0800 you wrote:
> Currently there are three implementations for page frag:
> 
> 1. mm/page_alloc.c: net stack seems to be using it in the
>    rx part with 'struct page_frag_cache' and the main API
>    being page_frag_alloc_align().
> 2. net/core/sock.c: net stack seems to be using it in the
>    tx part with 'struct page_frag' and the main API being
>    skb_page_frag_refill().
> 3. drivers/vhost/net.c: vhost seems to be using it to build
>    xdp frame, and it's implementation seems to be a mix of
>    the above two.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/5] mm/page_alloc: modify page_frag_alloc_align() to accept align as an argument
    https://git.kernel.org/netdev/net-next/c/411c5f36805c
  - [net-next,v6,2/5] page_frag: unify gfp bits for order 3 page allocation
    https://git.kernel.org/netdev/net-next/c/4bc0d63a2395
  - [net-next,v6,3/5] net: introduce page_frag_cache_drain()
    https://git.kernel.org/netdev/net-next/c/a0727489ac22
  - [net-next,v6,4/5] vhost/net: remove vhost_net_page_frag_refill()
    https://git.kernel.org/netdev/net-next/c/4051bd8129ac
  - [net-next,v6,5/5] tools: virtio: introduce vhost_net_test
    https://git.kernel.org/netdev/net-next/c/c5d3705cfd93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



