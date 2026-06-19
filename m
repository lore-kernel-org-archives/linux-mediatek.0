Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07A6CD98FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 01:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOln0UvL59U9cbeSPAanWAvcaPgZHKFV7CV3bDFVz6w=; b=T3RHTzgVSdjra9g4Wpn/Ia8U/i
	zv9FeNMtklh34PF+jGaJV4a/inOcoz49aa1r0wsYIWchwv0o9QqOC2dpM3njnPZ6z6rVTFGROEvDG
	OgcdldU0rvphb9HrmdvvYxpK9PCi8loJ3pGJ7EqsNkGSAB6YAjw0dQPCfo0iX5qFsH6lprdoIqKoi
	W6K9u2GMoUYShHQ/02yt/DGOw3+WOVOELC46s5b+221DsKh9V8hMt+ZCl+eYXqJLWCFF1nuyYIDQZ
	sXQd1/CvCsj9QZfhQIHV89Tw5zvkh/TJ/MJLbbsD3Qz9Z2rvpC9wYZkhJxoioGiRmV4XWtVJKw8Qt
	UgN079Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waNkY-00000001uWG-1bn7;
	Fri, 19 Jun 2026 01:10:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waNkW-00000001uW1-3oJH;
	Fri, 19 Jun 2026 01:10:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3651C43E54;
	Fri, 19 Jun 2026 01:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165311F000E9;
	Fri, 19 Jun 2026 01:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781831424;
	bh=JOln0UvL59U9cbeSPAanWAvcaPgZHKFV7CV3bDFVz6w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PUrONHy+tIpQSiAZ/nV+RG94J+DrZh4UdL/3d5zY0yPex06I5FeHzOkgSmiA0Gueu
	 LpMfRfaIDgZ0UHqMxm6UCUul0hBvOa40UuzSAec61Y66I0unfzbW+GBFbNE6n4lWbw
	 PLoHKD+x7qExsuVTdagliZ4Fr/KbGdx9wZZvpGQhhcGhXXge0+hYXIxcg0RhlS/IUM
	 cI5A9QMUGOGtIViQnQb5G4hbp/fEK59YZJpQmdmEjSw8byjPXGhpvdNNgYGjauRDf1
	 5hBlQRLBBjdZHZFm0ow2I7emoNrpig3kAiZk51PZAiAOMmJjIl6TlqW50udhC71NzX
	 TYmizxXY2Iezw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939D43A78A7C;
	Fri, 19 Jun 2026 01:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] [net] net: airoha: fix foe_check_time allocation size
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178183141720.3148637.275902636532056591.git-patchwork-notify@kernel.org>
Date: Fri, 19 Jun 2026 01:10:17 +0000
References: <178161119471.2163752.14373384830691569758@gmail.com>
In-Reply-To: <178161119471.2163752.14373384830691569758@gmail.com>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
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

On Tue, 16 Jun 2026 19:52:36 +0800 you wrote:
> foe_check_time is declared as u16 pointer but was allocated with
> only ppe_num_entries bytes instead of ppe_num_entries * sizeof(u16).
> 
> When airoha_ppe_foe_verify_entry() is called with hash >= ppe_num_entries/2,
> it writes beyond the allocated buffer, causing heap buffer overflow and
> potential kernel crash.
> 
> [...]

Here is the summary with links:
  - [v2,net] net: airoha: fix foe_check_time allocation size
    https://git.kernel.org/netdev/net/c/5c121ee63568

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



