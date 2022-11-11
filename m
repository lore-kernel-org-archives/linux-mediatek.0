Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0077FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 08:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsjmyHi4r6Myvb+rHZSLHaboidJA8/ijSf2F5q7vcyc=; b=z/hgXeNo5MKXvdgeAj+TenWuvr
	IVYFNenNUibNdtXAeFV2xhjAJYk5XYBv0g7A9V12y0d37kWaBMGYoei94h/4VOKdWvvA7KQYw+LOv
	2UjbEaky0JivlqPwLrxglu/GY1iAaBA0/XqgxY8z4eI2pKGi7jTP+hn89Yo6Pv/F+PUQ7hj9FLN3A
	U1pHglo6mIKxZaV/gRP0ytAEGagc+PIkKXWcSG8nVvvV3YdbJe5vifytbMA7WKYlIeISA5TgcfBBV
	J0d7z+dAvt2Be9x5BXh+2yCM4bYfRrDiXNiMbNLrn93ZPiZ2q0cokK9H7BPNePmj/pnjElXCw2yyS
	EcUvBmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPH5-00ECLi-1U; Fri, 11 Nov 2022 08:20:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPH0-00ECJz-7I
	for linux-mediatek@lists.infradead.org; Fri, 11 Nov 2022 08:20:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5B950CE25AB;
	Fri, 11 Nov 2022 08:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89E42C433D7;
	Fri, 11 Nov 2022 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668154816;
	bh=H0z/gyJf8Kdl7Ragj8yN9726qsQnh7OwQ4laCsBomPA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cYO3UeuNtcn8uUAEtwLchU82CVyKc4fat54bFG0CWqLX1oah7554Tpg8dSmhhmram
	 M518saSIfdtoHA5nXxDxXQCF6t+oQBbFyV+crogdLPbDb8H8o/evwxLogRhsPfCMNi
	 tHArM5BbZyFQ18x5Hgqs436sphkrOelsYArvXEbCscooWANDrlkvUjuNz7vFbdqiHv
	 OLT5uZlJaALPwzfxZJuhiWeRhthgjnRPGn/69BgTPVLWQRiAfde1GBtVYeu93x779w
	 kmka2amA51crkMnXcN189RAqL2hY7krT8Gw7FEpbYOYb6q0HBrBbjXZwn7OokRyrRp
	 i+W/nsUiR8L4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65710E270C4;
	Fri, 11 Nov 2022 08:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 net-next 0/8] introduce WED RX support to MT7986 SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166815481641.32563.14048666303133746703.git-patchwork-notify@kernel.org>
Date: Fri, 11 Nov 2022 08:20:16 +0000
References: <cover.1667687249.git.lorenzo@kernel.org>
In-Reply-To: <cover.1667687249.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
 ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com, devicetree@vger.kernel.org,
 robh+dt@kernel.org, daniel@makrotopia.org, krzysztof.kozlowski+dt@linaro.org,
 angelogioacchino.delregno@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_002027_433669_0CF6F185 
X-CRM114-Status: GOOD (  11.52  )
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

This series was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Sat,  5 Nov 2022 23:36:15 +0100 you wrote:
> Similar to TX counterpart available on MT7622 and MT7986, introduce
> RX Wireless Ethernet Dispatch available on MT7986 SoC in order to
> offload traffic received by wlan nic to the wired interfaces (lan/wan).
> 
> Changes since v3:
> - remove reset property in ethsys dts node
> - rely on readx_poll_timeout in wo mcu code
> - fix typos
> - move wo-ccif binding in soc folder
> - use reserved-memory for wo-dlm
> - improve wo-ccif binding
> 
> [...]

Here is the summary with links:
  - [v4,net-next,1/8] arm64: dts: mediatek: mt7986: add support for RX Wireless Ethernet Dispatch
    https://git.kernel.org/netdev/net-next/c/eed4f1ddad8c
  - [v4,net-next,2/8] dt-bindings: net: mediatek: add WED RX binding for MT7986 eth driver
    https://git.kernel.org/netdev/net-next/c/ceb82ac2e745
  - [v4,net-next,3/8] net: ethernet: mtk_wed: introduce wed mcu support
    https://git.kernel.org/netdev/net-next/c/cc514101a97e
  - [v4,net-next,4/8] net: ethernet: mtk_wed: introduce wed wo support
    https://git.kernel.org/netdev/net-next/c/799684448e3e
  - [v4,net-next,5/8] net: ethernet: mtk_wed: rename tx_wdma array in rx_wdma
    https://git.kernel.org/netdev/net-next/c/084d60ce0c6c
  - [v4,net-next,6/8] net: ethernet: mtk_wed: add configure wed wo support
    https://git.kernel.org/netdev/net-next/c/4c5de09eb0d0
  - [v4,net-next,7/8] net: ethernet: mtk_wed: add rx mib counters
    https://git.kernel.org/netdev/net-next/c/51ef685584e2
  - [v4,net-next,8/8] MAINTAINERS: update MEDIATEK ETHERNET entry
    https://git.kernel.org/netdev/net-next/c/90050f80509c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



