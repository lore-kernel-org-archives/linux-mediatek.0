Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA03C88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 01:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itwfnddppYts/aNh14NQXudZ+g/qHKM1ljo2Odl43j8=; b=0xdWpGhJJixYmfwIdmtPWNCEVl
	vqG6zuFj4aN0vTddR6XacnEujzYIlpcqiHdBisrQt/X6ZyMUy0H53+lvRR5/Q4cJE/hp8es4Ohn6q
	xENLZYASliRvECehpljUoyjh0GBgpPtj+4+czjBLgaXCKSf8wO84cqb4GjKffBeLUmEMLifpzCis8
	eHHYFmQ1Q4Tp5gBdWYbLPIws86fty9rdyOkbN1Zo5EEvesncJP64X4FauHne/twArdST12D5OM3Xc
	o3eTy5HK4mCU85BbINZ1paGROvV9c+e4wur0G73zVTQ6NQ1VaP0EcvvX7OF06h7JlLWMjUaWdc3r3
	DK1iv03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6IKM-00000004zBW-0LXQ;
	Tue, 15 Sep 2026 01:51:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6IKK-00000004zB6-1aym;
	Tue, 15 Sep 2026 01:51:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 83ABE602C4;
	Tue, 15 Sep 2026 01:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342DF1F000FF;
	Tue, 15 Sep 2026 01:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789437075;
	bh=itwfnddppYts/aNh14NQXudZ+g/qHKM1ljo2Odl43j8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dLPeftJ1fhcJ7f7zNyFpCvlPdmwLHBDm94aFvbpa7aCd/H+6CqHV0lyNOTcMv0zhz
	 KrQ9O1WAFq/wdYNhKPAhfoGcX6ZjMQoz8aAjRG39k0C7BfBXmokMLHZBsg10nKlFde
	 dOBsbjUw2CWv8Ndk2i29itlGPTTGv8VJF4HSbJJV7enkRylCtTDoA/XXeYNGETYKto
	 8qhQEDU57gt3sX0J7EZvdqVuKHlL9KS6ogV+pEB5wSN4ez2F980imFrAlgZbSzx2lE
	 hrq6E5UuikRzgvdHyk3585algHMWdLzkHmD3K7tmpDJW1G2GUhW8Mg0HzF5OvIuque
	 YpCdNSf8DcMOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56E4E3924FFE;
	Tue, 15 Sep 2026 01:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v7] net: airoha: add LRO offload support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178943700988.1306524.1515972440197677223.git-patchwork-notify@kernel.org>
Date: Tue, 15 Sep 2026 01:50:09 +0000
References: <20260909-airoha-eth-lro-v7-1-e6317be79067@kernel.org>
In-Reply-To: <20260909-airoha-eth-lro-v7-1-e6317be79067@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, aleksander.lobakin@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, madhur.agrawal@airoha.com, horms@kernel.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 09 Sep 2026 21:06:05 +0200 you wrote:
> Introduce LRO offload support to the airoha_eth driver, leveraging
> the EN7581/AN7583 SoC's 8 dedicated LRO hardware queues mapped to RX
> queues 24-31. LRO offloading does not support Scatter-Gather (SG) so
> it is required to increase the page_pool allocation order to 2 for RX
> queues 24-31 (LRO queues).
> 
> Since LRO is configured per-QDMA and shared across all devices using
> it, LRO is mutually exclusive with multiple devices bound to the
> same QDMA block. NETIF_F_LRO availability is re-evaluated whenever the
> QDMA user count changes (device registration and runtime QDMA
> migration): airoha_update_netdev_features() drops the feature when the
> QDMA has more than one user, while airoha_dev_set_qdma() re-enables LRO
> on the destination QDMA after a migration so that a running device
> keeps it active on the new QDMA block.
> 
> [...]

Here is the summary with links:
  - [net-next,v7] net: airoha: add LRO offload support
    https://git.kernel.org/netdev/net-next/c/a952507ca094

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



