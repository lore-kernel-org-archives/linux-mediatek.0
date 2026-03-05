Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB83F33A75
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 14:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dC4AdHv0QYyGquh1fcr0YPCzjOaUif1MG0lxoDw/qwU=; b=4P2rTfpsi6GuiTNV/9xRFhucNL
	jyOvFzriThjKBkbKjosNYT1QI6FywIS9f2mvhaYEbNRQnCQAPZxdrHlzS9DG7QBiPmyKqPJONTtnL
	hmQwNPuNoOrv1XLdQt0fIM23SGAvl+4h2kNBQWlfi4Jjcsxpa2ETXEciRPlnE55Ls3a1i5Hxwaq0P
	7mkS9z8/HPYXkIAXs+2OnNaxykD64IYxVlLvXsfJG1pNB6qwIW3mn/mP6v11A4FZBsvmZZMBSf2PD
	M9hnuKmB0L9OxQ8IFW/1LN1ViqwnyOp8ruFCZIar+SZwau529qDzOMVB33YwwfGQIHJKPl4ni+Vk5
	s+/0ITNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyA1h-000000024CD-37mP;
	Thu, 05 Mar 2026 14:50:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyA1e-000000024Bo-1w6s;
	Thu, 05 Mar 2026 14:50:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6791438D7;
	Thu,  5 Mar 2026 14:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC36C116C6;
	Thu,  5 Mar 2026 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772722205;
	bh=/WZhfj/29xuJ8osr61NntsurluVSN8see7f/hVhr8Co=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SP9Q5uyzcmI8WcYuzR/Z8kBFrPNZ6Uy5on/4zN7Z3Copa0y37o6bxt9XelVOJsyjt
	 8MxWnKFYpmaMIUQu/9YIFMDzeX6ybkG2q5gTIXFiZnGY+bMorwnnDuSYCK//qFTnoF
	 SPlYrKUE9En4fH4dNPVurX1VdnYFeLrDQkhxiXVMnyp1gjOV/i/W0b4v7nNpmiaPRD
	 8n892+bsTNtCsuQ23HAphMmcQliInVzJ+eCdjBb7D5vuzDB3mN64E1Swiq70q3xJnS
	 PnWTgkHnWTmPv7u6+CIpcYMfgq//srGhQwITKfUPFOxomBc3rhw3ImS8Uz0PqfrGds
	 Ttelth+aqwUOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EC73808200;
	Thu,  5 Mar 2026 14:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: Reset prog ptr to
 old_prog in case of error in mtk_xdp_setup()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177272220555.3153977.11048346484291533386.git-patchwork-notify@kernel.org>
Date: Thu, 05 Mar 2026 14:50:05 +0000
References: <20260303-mtk-xdp-prog-ptr-fix-v2-1-97b6dbbe240f@kernel.org>
In-Reply-To: <20260303-mtk-xdp-prog-ptr-fix-v2-1-97b6dbbe240f@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, sdf@fomichev.me, pvalerio@redhat.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_065006_540489_919290F6 
X-CRM114-Status: UNSURE (   7.72  )
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

On Tue, 03 Mar 2026 18:56:39 +0100 you wrote:
> Reset eBPF program pointer to old_prog and do not decrease its ref-count
> if mtk_open routine in mtk_xdp_setup() fails.
> 
> Fixes: 7c26c20da5d42 ("net: ethernet: mtk_eth_soc: add basic XDP support")
> Suggested-by: Paolo Valerio <pvalerio@redhat.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ethernet: mtk_eth_soc: Reset prog ptr to old_prog in case of error in mtk_xdp_setup()
    https://git.kernel.org/netdev/net/c/0abc73c8a40f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



