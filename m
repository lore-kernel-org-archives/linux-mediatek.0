Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F3DC04FFE
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 02:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6O0UrGQGf3PZeEAOqvKoEUpaY5f7WZsyIYUPW/PtQwg=; b=xy8Canw1oyiMpzOFLmMNmLiIs4
	Di764Zkuw2eAxq3Qu8eYr1zN2muV56Wixrne4+Um7C0BOzgYmIbBo7YwI+fX+YYhEI4RoCQD8U1xw
	EUHt1dusiWj8OqcJdDf3nC2U1UdLCklQjUDrGKPl7E7ROqJYKYg8sC25UdZSYDlxX0Jq8uQvj/RCB
	u8n3I9bdqjvG1e3lTQKlbb0wZVzG6OyAocupiUIFo+QmC+rHDfKEsRbX7sRMekAGtVhlaEp4hP5UO
	YA06ylhgpxvQMFwenFO9tVZQyftKiZdGdhof402xDXtRDE50yk9LlKg1yrl0qJzDhcPLQhdBAVfDt
	Dv+hUH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4t5J-000000000o2-2dCP;
	Thu, 09 May 2024 02:00:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4t5F-000000000n5-1FwF;
	Thu, 09 May 2024 02:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B5AC5CE1AD5;
	Thu,  9 May 2024 02:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DDE7C3277B;
	Thu,  9 May 2024 02:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715220029;
	bh=5uUBO7EpVJSHQ9Pq0QpAYzMRCljyCpo7HxEVbl3AQe4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Eed7ld8hwrxI+x/T/ZpvQ1aapIhxqzGTSeKKGvSfAPD+r6j88dZTRsbrxoYXgS8W9
	 aOGFFQjx4+xC3v868EtWoPa8uE/Y7qH8nowYVfmaTrIqFpTO5eLeMAvjzCMNpJI9LD
	 f71OkBU55l4JgTETe9VTZhQI8rbfgZGDbjFBgDLgInFgr6wp+LaSSxiHUXQ3gJVPKN
	 HUTI8pbJx42b13hquh50QmxVKehNY79s62PmZIZlcJsB8VWUOfS5z7MTqxviWXx2Fp
	 ii+QXDq4pAKgGc4tYbG3LIO3YGIbAJZjwJwl4JOfeUyZMG4f5CukaGRBguY3E/Hq8J
	 XH8P+koiZwd6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B8E3C43335;
	Thu,  9 May 2024 02:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dt-bindings: net: mediatek: remove wrongly added clocks
 and SerDes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171522002917.32544.14758011676552549517.git-patchwork-notify@kernel.org>
Date: Thu, 09 May 2024 02:00:29 +0000
References: <1569290b21cc787a424469ed74456a7e976b102d.1715084326.git.daniel@makrotopia.org>
In-Reply-To: <1569290b21cc787a424469ed74456a7e976b102d.1715084326.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 lorenzo@kernel.org, nbd@nbd.name, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_190033_587920_31B55D3E 
X-CRM114-Status: GOOD (  12.06  )
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

On Tue, 7 May 2024 13:20:43 +0100 you wrote:
> Several clocks as well as both sgmiisys phandles were added by mistake
> to the Ethernet bindings for MT7988. Also, the total number of clocks
> didn't match with the actual number of items listed.
> 
> This happened because the vendor driver which served as a reference uses
> a high number of syscon phandles to access various parts of the SoC
> which wasn't acceptable upstream. Hence several parts which have never
> previously been supported (such SerDes PHY and USXGMII PCS) are going to
> be implemented by separate drivers. As a result the device tree will
> look much more sane.
> 
> [...]

Here is the summary with links:
  - [v2] dt-bindings: net: mediatek: remove wrongly added clocks and SerDes
    https://git.kernel.org/netdev/net/c/cc349b0771dc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



