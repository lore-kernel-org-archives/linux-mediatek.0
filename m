Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B5ECD98F2
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jun 2026 21:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlhG6VVL7e735uRZLwmq98hxfSpDNi0y5BfFxqio2bA=; b=2K5qm7cHpKd/k1xwrPF8gxjOjB
	nzEBod7XZG7h1XeanCxVSjtseCKo5NCl7lZOQcRE35H1iS6ViRC7e34t0r1yjPtolBMvJzelmX6xJ
	ryKu574vU/25HQfelChZF6NK7oF7M8HnGnHsGU6Xv7xoY7sI9+CA1Vqh6NjZomqua67ZVit9g1gNI
	G3z01RrFnB+MeTKvggC5IS6R4SP6VsbiTEbIAlX/45+aOWIFlS1RhCefxvQB8kF9/GxYmC5i44PlR
	zy4VN0l99xVjXp82zPpCI4aId7e07Tezk63BD3ob16a+Dxk1MUiZRhYfCJJGvn00jOC/NVFPr38Hs
	BOme0XkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPtv-00000004AjN-1dpD;
	Sun, 21 Jun 2026 21:40:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPtt-00000004Aj8-0kXf;
	Sun, 21 Jun 2026 21:40:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E8D460051;
	Sun, 21 Jun 2026 21:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95721F000E9;
	Sun, 21 Jun 2026 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782078019;
	bh=dlhG6VVL7e735uRZLwmq98hxfSpDNi0y5BfFxqio2bA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=g5tLnUSLVvAqXwiw9rKtczs152mWsRC3zISrtZI+zsHJyilqlS6HlaS9OuCtaDbH8
	 RzzxRvfmDyjxbHSDM6Uln4KVBknpegvqPB7BpEfDCo2BFRIxQvCsPDdZCDac0xSwsL
	 SXyRp7be76av0rQzm7ZPUMBvcSEb5mzS4Z7MIVHpv5LqOAHOeiIZbuO2gQeCv63pVL
	 x6MCRC9fqLOJROd+48Lr9Ip0st0DgfWtQhm+jcCFELB7l6xPwujM+84CkvQp71IpXw
	 Cq/0XICyEcquqgenXhjbeJC8j+SqPULoO0M0BYvexqoKGykFcaXouncGy5zkpf7815
	 W2vOm5Br/sw7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568D93AAA6E4;
	Sun, 21 Jun 2026 21:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_ppe: Fix rhashtable leak in
 mtk_ppe_init error paths
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178207801105.510072.2195645518730276699.git-patchwork-notify@kernel.org>
Date: Sun, 21 Jun 2026 21:40:11 +0000
References: <178167550101.2217645.14579307712717502425@gmail.com>
In-Reply-To: <178167550101.2217645.14579307712717502425@gmail.com>
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

On Wed, 17 Jun 2026 13:48:13 +0800 you wrote:
> In mtk_ppe_init(), when accounting is enabled, the error paths for
> dmam_alloc_coherent(mib) and devm_kzalloc(acct) failures return NULL
> directly, bypassing the err_free_l2_flows label that destroys the
> rhashtable initialized earlier.
> 
> While this leak only occurs during probe (not runtime) and the leaked
> memory is minimal (an empty rhash table), fixing it ensures proper
> error path cleanup consistency.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_ppe: Fix rhashtable leak in mtk_ppe_init error paths
    https://git.kernel.org/netdev/net/c/41782770be56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



