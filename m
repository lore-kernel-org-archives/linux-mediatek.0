Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA33C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVlDBEY5ECilhSO08P7ytVL4yTvNDVBDVdgzQQf+Q6k=; b=ZAZsp1lAtbbfZaAz1qyoWQHvL+
	fnI7M0bq69jBZMo/h3+3YvGhxjjFQ2npLOfEb3rQ13IWTx0gXzhMFtAtV6SKaqwGf25WabMUydBql
	pEHZ/asLKrxccr8L0or5hLLr66r4AsFpmwm9Y2QYeZ29nDEXopuL+L9HNoHPnwwr1dcHK29GecS/n
	+t9jkzJwRD3igMWEgHSzw5zvzipyS0UmGp+9NbobSye7r1WAB6lqyGLO1nPvGg6+PG9Dy5Ks6A3IU
	fuuo2vZSK3GQfHyzrMSbfTD5tyJYzu3CHDjpIMqCYB+XkvjZ3AXt3DhOskGLQObZXBLKTF82tGENt
	XfDJMEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUyR-007GBM-1T;
	Thu, 03 Aug 2023 09:50:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUyM-007G9M-21;
	Thu, 03 Aug 2023 09:50:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A0A061D27;
	Thu,  3 Aug 2023 09:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3011C433CA;
	Thu,  3 Aug 2023 09:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691056220;
	bh=5teddj2SN5uHH7Si3IIw2pyAJaD+T63Hwxfu9DgEaIw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jcjK8+6o+Bt0eL5T4UTMwErmFKD3og+MJ/jhFjWE/ceH3PYJn56d4zSgbKprnxigL
	 I5BSPLypjS8Hscsg06NWdc/WffxROyC5HWHyJiHjbtCGds57XapIKG6640RDWRToZv
	 vcddMEwzlMY+QPzQWeoEcFd39RR7T1G4D9SNrT6UxG1qYH6Pcgzn8QFVMYzm3C303T
	 XNyGRF5iQ4S+VJsQPEYbC+jodebQR+w0D4FFaFnKJP6keneFqa1m4KOKAQYjlDETG/
	 ozCotrUNcZuEDtvdH7srcaEc85DYqd1TvfTmf0SivxpF/dxeEzE60k9SgTj6Ot9Fnn
	 VL/fsX0lxGsNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B3E4FC43168;
	Thu,  3 Aug 2023 09:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: ethernet: mtk_eth_soc: support per-flow
 accounting on MT7988
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169105622073.28699.8955916123146908854.git-patchwork-notify@kernel.org>
Date: Thu, 03 Aug 2023 09:50:20 +0000
References: <37a0928fa8c1253b197884c68ce1f54239421ac5.1690946442.git.daniel@makrotopia.org>
In-Reply-To: <37a0928fa8c1253b197884c68ce1f54239421ac5.1690946442.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_025022_728374_F7E7999D 
X-CRM114-Status: GOOD (  10.56  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 2 Aug 2023 04:31:09 +0100 you wrote:
> NETSYS_V3 uses 64 bits for each counters while older SoCs are using
> 48/40 bits for each counter.
> Support reading per-flow byte and package counters on NETSYS_V3.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v3: correct calculation, local variables
> v2: fix typo bytes_cnt_* -> byte_cnt_*
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: ethernet: mtk_eth_soc: support per-flow accounting on MT7988
    https://git.kernel.org/netdev/net-next/c/571e9c496887

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



