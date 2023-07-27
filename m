Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAA9C001E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 05:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1EIFBLmBuuSfaDp1X8OUQYGghsrpllDIspktd8YwJA=; b=34Ihl/VLYumrTBLL0qEjct9Cog
	vqN5is65BF7IfJqMMO/jRgsl9a8teUPQiG7ce8iBdHEvRJ0fzxmTvdEqiTO7GoG4vvFz4Q1/tQLUf
	PODWQHZnvpevXz2zrGZDVTCctUinkwur3D/sr2XaEzinAN0npLUis2vpMhHAuhu9IZvLPvo+4f89O
	ApBiBRejcizOYpveh6Z+LsOTw3DJZZpsbedxi8QPzSpKlL7OJ+FNhKEeooCVDwLOgDuY7Wkfiljw2
	KmMHvE4DwoRKJ/bbTbe2inPGxkG2QRknkoFn6eIcufL63tdhrEBbkJMMhcoqK8OET7eBJOfGgX5aU
	aRSVc3HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOtGe-00CA0R-1T;
	Thu, 27 Jul 2023 05:10:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOtGa-00C9yY-2Y;
	Thu, 27 Jul 2023 05:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 400BD61D41;
	Thu, 27 Jul 2023 05:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9376DC433D9;
	Thu, 27 Jul 2023 05:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690434623;
	bh=4y6u2oRadKe4rbPOWeXyCffpFw8g8kqrXrl7kOvqkVE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dKypFyKn4AmKaTtTpFdOTikQKNZ6A9ORXpAjff81NHaCac9RWvUunjuYfm8xx2Kbr
	 qwRcroPY3TGbL0XtTYDZ4knj5ERhuVNyjvs+1l3ZzFfc/Koc9aJCGp5+ToTxOOMrSy
	 QxnmHBa+3usJ4uhUal604dWTp5rcRxvfgmDhiC7rpb9sQ280JiTavAro877GUSsCIr
	 pan1QV8yCkcfmz6qzyzuy0YWZDQhVaUzg+thcJpiO/gd1zD/yWqS2wVIebNcg8yvpi
	 oULVtPj5Pe36TzjYrNNLQ4FibO1NOD47CQwUsKtJKscnX01rqbQhG71eVp4QorenWZ
	 bmqoeNUmo2y5g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7C945C595D0;
	Thu, 27 Jul 2023 05:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6 0/8] net: ethernet: mtk_eth_soc: add basic
 support for MT7988 SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169043462350.30073.405534761855593169.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jul 2023 05:10:23 +0000
References: <cover.1690246066.git.daniel@makrotopia.org>
In-Reply-To: <cover.1690246066.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 gerg@kernel.org, bjorn@mork.no, f.fainelli@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_221024_917876_6D0A3EF0 
X-CRM114-Status: GOOD (  11.95  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 25 Jul 2023 01:51:00 +0100 you wrote:
> The MediaTek MT7988 SoC introduces a new version (3) of the NETSYS
> block and comes with three instead of two MACs.
> 
> The first MAC can be internally connected to a built-in Gigabit
> Ethernet switch with four 1000M/100M/10M twisted pair user ports.
> 
> The second MAC can be internally connected to a built-in 2500Base-T
> Ethernet PHY.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/8] dt-bindings: net: mediatek,net: add missing mediatek,mt7621-eth
    https://git.kernel.org/netdev/net-next/c/1cbf487d7d3a
  - [net-next,v6,2/8] dt-bindings: net: mediatek,net: add mt7988-eth binding
    https://git.kernel.org/netdev/net-next/c/c94a9aabec36
  - [net-next,v6,3/8] net: ethernet: mtk_eth_soc: add version in mtk_soc_data
    https://git.kernel.org/netdev/net-next/c/a008e2a84e6b
  - [net-next,v6,4/8] net: ethernet: mtk_eth_soc: increase MAX_DEVS to 3
    https://git.kernel.org/netdev/net-next/c/6ca265571b9e
  - [net-next,v6,5/8] net: ethernet: mtk_eth_soc: rely on MTK_MAX_DEVS and remove MTK_MAC_COUNT
    https://git.kernel.org/netdev/net-next/c/e05fd6274ee6
  - [net-next,v6,6/8] net: ethernet: mtk_eth_soc: add NETSYS_V3 version support
    https://git.kernel.org/netdev/net-next/c/1953f134a1a8
  - [net-next,v6,7/8] net: ethernet: mtk_eth_soc: convert caps in mtk_soc_data struct to u64
    https://git.kernel.org/netdev/net-next/c/51a4df60db5c
  - [net-next,v6,8/8] net: ethernet: mtk_eth_soc: convert clock bitmap to u64
    https://git.kernel.org/netdev/net-next/c/c75e416ccfd2
  - [v6,net-next,9/9] net: ethernet: mtk_eth_soc: add basic support for MT7988 SoC
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



