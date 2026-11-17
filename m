Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1EE606A329
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 02:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f0eEKGI4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SEi6DRYr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p9Z/0BbQGaDyQcSu1mdVf3G0+dswEC4x+xTDwChbKX4=; b=f0eEKGI4v9dEYi
	lOivqugugkzKIbBOOH0PD6468GCBlRwpH7nJB0rGKruCr4SliMKQpcWEQrmf/ALZSD6ZFjlbVTzqB
	GryZ/huBMB8yZ/K6RQchVW+H37adDniDeWJKMbCPN3j6/hkyAZrudPB66+PYhMT0GadVfqzKIJo/H
	RO4xYHRQDlhWLmBy5O6Vot8Phad84AH2mUNCGUKh3u058Ls//KN26V60JXMWyJgcwyojh2CZbklPW
	mIf1THAhZfy69sTexL9PyaVSxBMRtLwD4oSGC8xQofqmKk0sjnxpXVkBLWqAv+f6uMgdnHXioLkys
	zlLUSkwGBubIUhp644Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT97N-00000004Qff-3DZW;
	Tue, 17 Nov 2026 02:40:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT97D-00000004QdQ-48Na;
	Tue, 17 Nov 2026 02:40:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6828040E0A;
	Tue, 17 Nov 2026 02:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463431F000CB;
	Tue, 17 Nov 2026 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794883211;
	bh=p9Z/0BbQGaDyQcSu1mdVf3G0+dswEC4x+xTDwChbKX4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SEi6DRYrhBNE6Tl0Oo5WFx+6/UZ+yhSjc7VRQCI9YcG/cWn/GErLeVTtIdfQlMOM2
	 hKSC6rPIXDG/RXjHvz6cjSo3UTrLW5KA5b91YlaGIlpMTmGRW9PXs5XdCkyXzwFtLE
	 +BB/iZGPTcVblqcIx41toyP6bmfQipdsAzLv4eJl4PsmRa3PLDmFumYFfxOSDs6gvm
	 C5MkzF8O9n15ANciTKY5CTkL6UFMVr3PNOxhlLykuFaRCAHL1GoBoWIrkeqvJz8Oqy
	 aivs7VQ5bn9dQP2Uo7RHqkw4qjOoCOLbApAhuiRRXx+KPtNQEZiFU/GAa1wq3oWAPf
	 z6uVkPO7hTItQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A39F391B088;
	Tue, 17 Nov 2026 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 00/10] net/stmmac: Add Mediatek MT8189 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179488320977.300516.9034533489988553857.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 02:40:09 +0000
References: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, biao.huang@mediatek.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, edumazet@kernel.org, kernel@collabora.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 krzysztof.kozlowski@oss.qualcomm.com, andrew@lunn.ch
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Nov 2026 13:08:47 +0100 you wrote:
> This series adds the Ethernet support for Mediatek MT8189 SoC and its
> variants (MT8371, MT8391). These SoC integrate a Gigabit Ethernet MAC
> with RGMII/RMII/MII interface, with a similar design than previous SoCs
> such MT8188 or MT8195.
> 
> This series is based on net-next tree (sha1: d26955e57475).
> It has been tested on Mediatek Genio 520-EVK (MT8371) and 720-EVK
> (MT8391) boards, which both integrate an Airoha AN8801R Ethernet
> PHY, with hardware enablement series ([1]).
> It has been also tested on Mediatek Genio 510-EVK (MT8370, variant of
> MT8188) and 1200-EVK (MT8395, variant of MT8195).
> 
> [...]

Here is the summary with links:
  - [net-next,v5,01/10] dt-bindings: net: mediatek-dwmac: fix unit in rx/tx delay property description
    https://git.kernel.org/netdev/net-next/c/5fc5d2095256
  - [net-next,v5,02/10] dt-bindings: net: mediatek-dwmac: deprecate rx/tx delay vendor properties
    https://git.kernel.org/netdev/net-next/c/51c06131816a
  - [net-next,v5,03/10] dt-bindings: net: mediatek-dwmac: add support for MT8189 SoC
    https://git.kernel.org/netdev/net-next/c/97c7a711dac1
  - [net-next,v5,04/10] net: stmmac: mediatek: simplify TX/RX delay handling in mt8195_set_delay
    https://git.kernel.org/netdev/net-next/c/8eac6d45af9c
  - [net-next,v5,05/10] net: stmmac: mediatek: simplify TX/RX delay handling in mt2712_set_delay
    https://git.kernel.org/netdev/net-next/c/c837fa3a7612
  - [net-next,v5,06/10] net: stmmac: mediatek: use standard internal delay properties
    https://git.kernel.org/netdev/net-next/c/ec09a48fdaf3
  - [net-next,v5,07/10] net: stmmac: mediatek: add RX/TX delay stage divider in platform data
    https://git.kernel.org/netdev/net-next/c/e6d6f4b67511
  - [net-next,v5,08/10] net: stmmac: mediatek: add PERI_ETH_CTRLx register offset in platform data
    https://git.kernel.org/netdev/net-next/c/2c0c0890f9f1
  - [net-next,v5,09/10] net: stmmac: mediatek: add support for TX clock output enable feature
    https://git.kernel.org/netdev/net-next/c/3b2120af0091
  - [net-next,v5,10/10] net: stmmac: mediatek: add support for MT8189 SoC
    https://git.kernel.org/netdev/net-next/c/46d8e770222f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



