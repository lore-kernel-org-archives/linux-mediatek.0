Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF71C531F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 17:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rphcCipWfccBTZwSCGFY5Mukuhl0M7FWvUTO6fZQYhc=; b=3ywp0avIe8SLP03uf5rbH4xaJk
	76g7OSNbfj+zma9n8/8CFXn/GZ/WKIwSbX0rlLJfbMlPUVi/r95IZb3iPhdpbBq85x1jbcL6qszMG
	BkKbyhvVnE6qqC3MOuSxGd+BoFyENkTtvOtDRdMzgSciqOoAZWm+WkBpD4cGXKkOIKYNlxSBqwgd1
	Hsw/n2TuFQuuZy1YFvi4fDPoO80prqfzljTDGGsD3LuN6U1/LdwLlhrfmU9jI3pr+Vr/I0RvPx0oo
	pb8NIR/Jr+EPcXdzVJ9blMexgK6VNA50CLtuXEDMsr7QEC4reRaxkjwsGy81kz4XmH3RFVEYF7TPl
	wQo5AnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwx7-0000000Emxe-39P7;
	Thu, 23 Jul 2026 17:11:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwwu-0000000EmnK-1ExS;
	Thu, 23 Jul 2026 17:11:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71AA0406CF;
	Thu, 23 Jul 2026 17:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DFB1F00A3A;
	Thu, 23 Jul 2026 17:11:07 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93BEA39244CA;
	Thu, 23 Jul 2026 17:10:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: fix ETS channel derivation in
 airoha_tc_setup_qdisc_ets()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178482661833.2789426.13319789723330809436.git-patchwork-notify@kernel.org>
Date: Thu, 23 Jul 2026 17:10:18 +0000
References: <20260720-airoha-ets-handle-fix-v2-1-6f7129ddc06f@kernel.org>
In-Reply-To: <20260720-airoha-ets-handle-fix-v2-1-6f7129ddc06f@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, horms@kernel.org
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

On Mon, 20 Jul 2026 13:22:28 +0200 you wrote:
> Derive the hardware QoS channel from opt->parent instead of opt->handle
> in airoha_tc_setup_qdisc_ets(). The ETS qdisc handle is either
> user-specified or auto-allocated by qdisc_alloc_handle() and bears no
> relation to the HTB leaf classid that identifies the hardware channel.
> HTB derives the channel from TC_H_MIN(opt->classid), and ETS is always
> attached as a child of an HTB leaf, so its opt->parent matches that
> classid. Using opt->handle instead can cause two ETS qdiscs on different
> HTB leaves to collide on the same hardware channel, corrupting scheduler
> configuration and stats.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: fix ETS channel derivation in airoha_tc_setup_qdisc_ets()
    https://git.kernel.org/netdev/net/c/649ea07fc25a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



