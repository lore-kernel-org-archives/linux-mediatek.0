Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94874C27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 01:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ggA9LAjRyprqbqjqDTuEEiLBVGccx7FYgIyTOH0/I8=; b=FIY7GsC6JuI3Eu/zxv0qTPggDO
	6uLk16gnWOB5Ub5UPdkRmxLsbd6FTlOjI3azU6rXdYJgrME3QkUG8GTODapQXtU23Kv+Gm0LnBf9D
	BnfZfjQsCZVu7GJmL/iF2elu2BbN1IY41lsC8gabkLEGeqYcZekJEnFIJbksXZTD0DZeFTEK4AnL+
	aNM1GhfgdvX2gR+9mJl8pfctCwpE2SOTy8Z6b//tKnOfJ23kXGS7H6KpNtKN6MkerVyOuM835MOiH
	UAOnNF0lgLo16RD0n14WEEw6dahikh974ihkCjVmhJrDZldnH0byQlQrOIVq1hJKehkMgOmZvxHyF
	QHqeyHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHYpR-0000000EeOu-2XEF;
	Thu, 13 Jun 2024 01:00:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHYpN-0000000EeNz-0Okp;
	Thu, 13 Jun 2024 01:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E55976181E;
	Thu, 13 Jun 2024 01:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51F7CC4AF54;
	Thu, 13 Jun 2024 01:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718240431;
	bh=A90udtY5N2r40p7F+o+B46r7+DdZME9ofup2TjtLCow=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cIV9YnqU0Fetft+Iy7/EqPcRFVN5LthTleLM43LfB6NqCWVVR7AENsWDgUYeG78pN
	 v4Dk9iQoywLI0WfkVlzStU4Xmt03+6viYsWaiDa32FzBi+SoksJcFfxHE+YFav9tS0
	 Inh/67YRR2tirdiNV+1snTGe9eis941fvfkNm6ewKMcQhDgPxspNlLHdoi/Xbm1Q4h
	 AwP8kWs1V0QN0gkDRm3Cprqs+oENyZd4tMTNNvbdh77s82r25ZiBZS9m4zpWQKLDEa
	 +lsHWG6LtFp+GEtv7kFLekOpT4XjAepYAiFyCOPiGNjm8HJK/XL+NXUvJ51+VyReKc
	 E+tzQjqHYHMJQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 452EEC43613;
	Thu, 13 Jun 2024 01:00:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6] net: ethernet: mtk_eth_soc: ppe: add support for
 multiple PPEs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171824043128.29237.10490597706474690291.git-patchwork-notify@kernel.org>
Date: Thu, 13 Jun 2024 01:00:31 +0000
References: <20240607082155.20021-1-eladwf@gmail.com>
In-Reply-To: <20240607082155.20021-1-eladwf@gmail.com>
To: Elad Yifee <eladwf@gmail.com>
Cc: daniel@makrotopia.org, nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_180033_203460_CDFB78B5 
X-CRM114-Status: GOOD (  10.34  )
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

On Fri,  7 Jun 2024 11:21:50 +0300 you wrote:
> Add the missing pieces to allow multiple PPEs units, one for each GMAC.
> mtk_gdm_config has been modified to work on targted mac ID,
> the inner loop moved outside of the function to allow unrelated
> operations like setting the MAC's PPE index.
> Introduce a sanity check in flow_offload_replace to account for
> non-MTK ingress devices.
> Additional field 'ppe_idx' was added to struct mtk_mac in order
> to keep track on the assigned PPE unit.
> 
> [...]

Here is the summary with links:
  - [net-next,v6] net: ethernet: mtk_eth_soc: ppe: add support for multiple PPEs
    https://git.kernel.org/netdev/net-next/c/dee4dd10c79a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



