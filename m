Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BBFCD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 11:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ue1W0Tug6wA7pToRtgxP1pmUK47ZJOig2n9QSFPHO2Y=; b=YFfIVT2p8dX5PIPBEhadNBgGgM
	XM58ze4nnrlQUPnI6t8Rt9x93FAldizoJQBYB6bsCt7T3RsYNP6sSzKba/6OWvqQceF4aUYkUkkdT
	ugiRkNKkhsQpUqMGD8VsPpodKn0WGNT0rFXJ0K83ZHQwYR8lwE9tUDdeacj4DWU0O0LALp5Zl9PPy
	vOAT4a7UgjJNJbSnN1FU9t2aAkyGYXfCNPMM4RyrtOc9EkAS17grf6pbPn8BzhnLc+whUoSQhenm+
	pnUM7WwPQwy6PQ1L/xNbc3wHCBscuh6Ov5Ppav45vNpaNoFazoBQftfJuPk3otIqy113/jomOjqhX
	Sy9/rugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZouo-0000000HHqO-0xHl;
	Wed, 17 Jun 2026 11:58:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZoun-0000000HHq0-0F7a;
	Wed, 17 Jun 2026 11:58:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07DB660052;
	Wed, 17 Jun 2026 11:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988E01F00A3A;
	Wed, 17 Jun 2026 11:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781697519;
	bh=Ue1W0Tug6wA7pToRtgxP1pmUK47ZJOig2n9QSFPHO2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MMQQMtNrtCsVmvZLdUNb60STpwfD6xl254UWzJS5WS+xVTb/YigQYySUGLxgseWx8
	 4UIhreRrJBJb+hqaNYds92o6D7edwWugeM7T5rRCraoJ9LU5VwvvNroDpQvdLetoS8
	 BF7skDtroIUymKM5W7ifEQxX2+Sdt7TDkOTyn8TTq7nB1Agos28k5NIdliF4kGbw6H
	 6SiJdvFyRnWobyx3enAU3eUBNTDJlRHAxCenXYb4gfML+Bmq0WrYMzEC20O6hzf2RY
	 5/fTLPsHeuxEoF0TV/0nb+ASNWnVnTso7RSdGFHrNvkHrfdnxz9qvN6cyR97BMwXpA
	 +qwwV82IRjbIA==
Date: Wed, 17 Jun 2026 14:58:34 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Wayen Yan <win847@gmail.com>, netdev@vger.kernel.org,
	lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Fix MODULE_LICENSE to match SPDX
 GPL-2.0-only identifier
Message-ID: <20260617115834.GX327369@unreal>
References: <6a2ded59.63d39acb.391892.7632@mx.google.com>
 <178156440888.329386.11011872053824456703.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178156440888.329386.11011872053824456703.git-patchwork-notify@kernel.org>
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

On Mon, Jun 15, 2026 at 11:00:08PM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This patch was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
> 
> On Sun, 14 Jun 2026 07:52:39 +0800 you wrote:
> > Both airoha_eth.c and airoha_npu.c declare SPDX-License-Identifier:
> > GPL-2.0-only but use MODULE_LICENSE("GPL"), which the kernel module
> > loader interprets as GPL-2.0+ (any GPL version). This mismatch causes
> > license compliance tools (FOSSology, ScanCode, etc.) to misidentify
> > the effective license as more permissive than intended.
> > 
> > Replace MODULE_LICENSE("GPL") with MODULE_LICENSE("GPL v2") to
> > align with the GPL-2.0-only SPDX identifier. Per include/linux/module.h,
> > "GPL v2" maps to GPL-2.0-only, matching the source files' declared
> > license.
> > 
> > [...]
> 
> Here is the summary with links:
>   - net: airoha: Fix MODULE_LICENSE to match SPDX GPL-2.0-only identifier
>     https://git.kernel.org/netdev/net-next/c/b0d62ed16424

Jakub,

This patch doesn't fix anything. License rules are pretty clear.

Documentation/process/license-rules.rst
  444     "GPL"                         Module is licensed under GPL version 2. This
  445                                   does not express any distinction between
  446                                   GPL-2.0-only or GPL-2.0-or-later. The exact
  447                                   license information can only be determined
  448                                   via the license information in the
  449                                   corresponding source files.
  450
  451     "GPL v2"                      Same as "GPL". It exists for historic
  452                                   reasons.

> 
> You are awesome, thank you!
> -- 
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
> 
> 
> 

