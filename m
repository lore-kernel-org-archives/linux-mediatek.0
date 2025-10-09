Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E478CCA470
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Oct 2025 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wf6Al7xIx+g0QdwRJ6XFFvXTruC2UZKq5E4ZpOXpJK0=; b=XrWF8fZJYm6vO0jEHf9a55vB4V
	3SWC0cmLbg9iKZjNsK8Ry5ICqq/T3J7I+olKClkeLrph5FuI5c8PwglwYJkKhgYHV8hpik4/EX4t8
	ExEF75KqBm3twUxGl+of6jHWzusT3GvmO0Gv6+E5xZqs13qZI3W0PlorI1gU4lPPZsRXsMMI23Rkm
	gwi9scw+WSEQPbtZ7aRsI5Kz4GEH3xw8O2dtMfaHQIUVneETOGsjmI30OTWc8L8qLQhXZtGN8whhH
	zYOq/jD+OeWtIcckD2o9Dsqs2f1e8RVkNS5L2HPtNerzz7u8BNA+dB/guhrgPjkFWk04/Fg+R0BLB
	IvQ6J51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nRf-00000005ibu-2gTD;
	Thu, 09 Oct 2025 10:00:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nRd-00000005iam-21gW;
	Thu, 09 Oct 2025 10:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DC3560553;
	Thu,  9 Oct 2025 10:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEDDC4CEE7;
	Thu,  9 Oct 2025 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760004018;
	bh=/FMNOio2kgZUnwe9wv0S7z6c9P9m0/EWaSEG49umOCg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rzuJ//5wTl7wy1YUEkOg8ySHd+ncbSJPP2qmNtruuM/Ld+HAxnWZFCRsYuf/tXRzd
	 4pNcEYB5OscupXk3jFQ2z6iYEz+3yLbn/LAp8zAP/r+rG9ffHaO0AhiKj5rOWRkk8Y
	 t/F4oaloggcoheqEPL6HJJTM6uLKmwUREORd5yX0O1vzc0EXYG5TuHsNUSdA3wYJHL
	 JgTw4DaJXEJkAKpLwlIMR4VnhQzZC1tDYi3nglpSiuHffgyy1K1aPw0akqgVyx6XGv
	 Wnry/VXrox/9CbhUppj3qKK7uXKAmAugkg/w+aFL+u7KWtX9SpEUmakjg+utX6ruG9
	 ZqOPN5OKNU9aA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BC63A549B6;
	Thu,  9 Oct 2025 10:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: Fix loopback mode configuration for
 GDM2 port
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176000400701.3862460.565450618627786510.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 10:00:07 +0000
References: <20251008-airoha-loopback-mode-fix-v2-1-045694fe7f60@kernel.org>
In-Reply-To: <20251008-airoha-loopback-mode-fix-v2-1-045694fe7f60@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

On Wed, 08 Oct 2025 11:27:43 +0200 you wrote:
> Add missing configuration for loopback mode in airhoha_set_gdm2_loopback
> routine.
> 
> Fixes: 9cd451d414f6e ("net: airoha: Add loopback support for GDM2")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Use human readable marcos to configure loopback mode register
> - Link to v1: https://lore.kernel.org/r/20251005-airoha-loopback-mode-fix-v1-1-d017f78acf76@kernel.org
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: Fix loopback mode configuration for GDM2 port
    https://git.kernel.org/netdev/net/c/fea8cdf6738a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



