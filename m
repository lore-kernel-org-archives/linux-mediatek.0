Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C996CCD98CF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 01:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zp5+HYnmzAY3tecF9x+rV8jHXOZQyFIfnYkXXcKefps=; b=jXQIFNMrTgkok/DtkeZmETndFX
	LXJi6SAgjhIwaTjNUdg5OU19A0yEtrqHAOBErPNfafnQm5F1bTS/Joz04P4jvS+hDFs+Z4LE0qgxD
	CrykT3XcyWqVuqAsZ+sRY/De+aWmbrjPq8mPXuzG4XMYBD45LNwzOB1NdNtvPHiee1bmCD4skg/DT
	PYLi8VbQQc89i+2Jci0YkthyJumq7XVcMjQkfvcRIr4jhU52L6kbC8hj3XMnUlSCrM4eNZZuGYat+
	H5s/JJqZa8Ykw/6Y6cOG5Bq+KlxgqQU6xXzrqCgMPlu/HZ9viEZPYY6mYZS/m3Wo+Uy4Hl9mN+HYD
	+bR9Q19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCjU-0000000BrYo-2uWA;
	Sat, 13 Jun 2026 01:00:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCjS-0000000BrYg-427n
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 01:00:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15FFA600AF;
	Sat, 13 Jun 2026 01:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF33A1F00A3A;
	Sat, 13 Jun 2026 01:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781312417;
	bh=Zp5+HYnmzAY3tecF9x+rV8jHXOZQyFIfnYkXXcKefps=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DX5UeNZJgYaBt57lyZUy1EK3OUJwCEawJTO3ggGaq3rk+K2hoOsi5sRQUsPLzVBr9
	 EJDqDzL5fnyDDOyPkhJmAAs8rgcwOqcAoGfOoBlO+9zk/fvCFq5k/szeC0oe9AbK+w
	 +xayE6sFwjb+o6qwJyTbQrbmxJUw7I96fdTQyEtylmDdvWoj35UZqtzvnq262yhcXK
	 IhWmW/hooFM/lyMhJbayXl41/eEoNKkWFx4J/w8hpZRvSG3c5FHkGBRg85OqFhuqvq
	 k+r8vc5k267G5kamB78S7XfCCQcJrp1JR5yFE7+osDElWFCQdtHYPsWSso1ZKaJ6/4
	 HBYjMPiofrCxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939AB39E9607;
	Sat, 13 Jun 2026 01:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: mtk_wed: fix loading WO firmware for
 MT7986
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178131241413.1315131.4770836958517180576.git-patchwork-notify@kernel.org>
Date: Sat, 13 Jun 2026 01:00:14 +0000
References: <20260611150051.586-1-hujy652@gmail.com>
In-Reply-To: <20260611150051.586-1-hujy652@gmail.com>
To: Zhi-Jun You <hujy652@gmail.com>
Cc: lorenzo@kernel.org, nbd@nbd.name, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org
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
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 11 Jun 2026 23:00:51 +0800 you wrote:
> MT7986 requires a different mask for second WO firmware.
> Without this, WO would timeout after loading FW.
> 
> The correct mask was removed when adding WED for MT7988.
> Add it back and add a WED version check to fix it.
> 
> This can be reproduced with a MT7986 + MT7916 board.
> 
> [...]

Here is the summary with links:
  - net: ethernet: mtk_wed: fix loading WO firmware for MT7986
    https://git.kernel.org/netdev/net/c/9192a18f6de2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



