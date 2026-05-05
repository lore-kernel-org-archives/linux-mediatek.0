Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B8CCD342C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 02:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9C4YQiTr1heKLzM5wcYC994nNBRKDFtPuR7TzCPolqc=; b=uZjTQ3kANWGAEpDjGIcTPfa6Jq
	lQ/lcKZ7s+4GcSbnlY00dlq7uhJD/AkqNfUfoM78cIS+2jVdoHCgBtV3ue0dvEfMg/vvTGxgdLnKm
	jTocGtRQik+Kjx7Uh2rWpubFprdjqKzSQXTttK+GtSVIozhbWNMF9TGyDWezV+/SBvYedvDRFUEAi
	jAB/rBJfJDidn/PYou/0fo5i3ptulOZtX1NKsyifjHy7pwcWtc914xbYT81vy0BKKTWQUT8IW/FWh
	UTcgr7xRgOl1DUTT3KuTWDsZDBAXU8FUz9DwrvNysazcE53H/RUcWwJ/tL14eK60kHmRYd7dMhF9i
	PM+02XNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK5ij-0000000Evve-3hCp;
	Tue, 05 May 2026 02:41:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK5ih-0000000Evu6-2Yw1;
	Tue, 05 May 2026 02:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D11344516;
	Tue,  5 May 2026 02:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6A5C2BCC4;
	Tue,  5 May 2026 02:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777948870;
	bh=cz9PCzZLbGqRc2okSEJXwOQyt7dx65kZ5KjOSudA1Jk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cU/GhPcLoOamlka9r0DQet3iRt8gZ2zjfr+DAQcwSdM6y2VkMIX5H2zjx1a4TJYVc
	 7vq2t+OFrD/+inDWqWn2COiXLLa6SzGymBBQe+q/Zkj55C2LRHkGaVSe5ufnNPW044
	 m6y7gVs9zb2UOTph6bL+t/3HF8vfx0jqwqUGCbSnQFY3Cj3ZS/dvsOm5X312KroaTT
	 fMH0i7KdUf++XpERCNAjtdl3AIZ6dig5q6kV8dVVrBWgOBNiaZm5xPLsXPKbnu4Amb
	 OtH2KyKUr2e3/UcATnuIyigbBwL+0RhQ0iOAvz1WWa48ApFevmvnmFMIosFejVaAnP
	 jlbE1Q9WLe1yA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE7739301A2;
	Tue,  5 May 2026 02:40:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: airoha: Introduce
 airoha_fe_get()/airoha_qdma_get() register read helpers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177794882129.1397274.6642429130537078994.git-patchwork-notify@kernel.org>
Date: Tue, 05 May 2026 02:40:21 +0000
References: <20260501-airoha_fe_get-airoha_qdma_get-v3-1-126c6f647ccb@kernel.org>
In-Reply-To: <20260501-airoha_fe_get-airoha_qdma_get-v3-1-126c6f647ccb@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_194111_671432_B92737A2 
X-CRM114-Status: UNSURE (   8.91  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 01 May 2026 09:49:11 +0200 you wrote:
> Add airoha_fe_get() and airoha_qdma_get() as utility routines for reading
> a masked field from a specified register.
> This is a non-functional refactor, no logical changes are introduced to
> the existing codebase.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: airoha: Introduce airoha_fe_get()/airoha_qdma_get() register read helpers
    https://git.kernel.org/netdev/net-next/c/98e490930de3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



