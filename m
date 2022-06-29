Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997EEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bm7bQKO0LW3PVJjnG5oiP44wehf0KZhPcmKChUwyt9Y=; b=bWWm9E37lS24Ro6ATsd9gfMUD4
	DBqDZAU1tbnTX6q3OhfwaKgikMF29gvS3ln1SAC57JXk19v5IoF0DxEtdPZ9+/tdJ3ICR6e5fTdTG
	AtQhQB8AgMT9hAE/VuMV71P3XPco+tG3lM5qgib8wGz7fyfRCB2kJw2tM8DGb13CZTdn4CmPudQJ/
	/jLF1ioxgoF9FHtG9Ezb15DS0+ovCv/IO4CazH7NoQYn8n2Om2gUCu6f2+M20kcBk5trOl4DEI8Ss
	1dSttF/stc8BgYu4Xx3wX1kX5DoFGK1rH1DJ6+0nttG2fbSeLjsrFHFL0Gh0fq8D9sXVph2VmJmnC
	01AWgHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6X9W-00Bx7A-PY; Wed, 29 Jun 2022 12:50:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6X9E-00Bwxc-FW; Wed, 29 Jun 2022 12:50:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6BDA4B82429;
	Wed, 29 Jun 2022 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B5E9C36AEB;
	Wed, 29 Jun 2022 12:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656507020;
	bh=22qbZjl+tGNRO/TXIBShg7yeUCuIna+Zbm1sCVa288s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pmYPMa5AmhgzWtFVALexiat96BVZmsO7B7kq77lmXZmB8fW7x7+9GuVPfNC7iC2Wd
	 KRvYFQ4fs0XDAlzIIzta2dBQxi0PF1QPl5VbIQtmSGq5he+8e8Ie09GZgZCqHImwUY
	 qaZupQXWStSFj5ZYIHN7Ly98YpjrJZ9qjSpEQW+8+VQCMCr3IDcb6Sc4qg54M1KMtA
	 vV5udrfEDEraUr+QwduI1n0ReExOXf47chKlOrjhMzz4cjO5fbqG6Z8XXjyK7w1VXj
	 xKJhSdM0po6eafMtrVCPGan9OATjf5+tB8xAyvYnlhdRyb9X6V5T0xuw2yT6dS+Brz
	 CAGReuXMW3BQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B39CE49FA0;
	Wed, 29 Jun 2022 12:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 00/10] add more features for mtk-star-emac
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165650702016.9231.359699610048975854.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jun 2022 12:50:20 +0000
References: <20220629031743.22115-1-biao.huang@mediatek.com>
In-Reply-To: <20220629031743.22115-1-biao.huang@mediatek.com>
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org, brgl@bgdev.pl,
 fparent@baylibre.com, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 ot_yinghua.pan@mediatek.com, macpaul.lin@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_055024_869761_3AB76FF1 
X-CRM114-Status: GOOD (  10.98  )
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

On Wed, 29 Jun 2022 11:17:33 +0800 you wrote:
> Changes in v5:
> 1. correct spin_lock usage which are missed in v4.
> 
> Changes in v4:
> 1. correct the usage of spin_lock/__napi_schedule.
> 2. fix coding style issue as Jakub's comments.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,01/10] net: ethernet: mtk-star-emac: store bit_clk_div in compat structure
    https://git.kernel.org/netdev/net-next/c/c16cc6a06672
  - [net-next,v5,02/10] net: ethernet: mtk-star-emac: modify IRQ trigger flags
    https://git.kernel.org/netdev/net-next/c/9ccbfdefe716
  - [net-next,v5,03/10] net: ethernet: mtk-star-emac: add support for MT8365 SoC
    https://git.kernel.org/netdev/net-next/c/6cde23b3ace5
  - [net-next,v5,04/10] dt-bindings: net: mtk-star-emac: add support for MT8365
    https://git.kernel.org/netdev/net-next/c/43360697a276
  - [net-next,v5,05/10] net: ethernet: mtk-star-emac: add clock pad selection for RMII
    https://git.kernel.org/netdev/net-next/c/85ef60330d37
  - [net-next,v5,06/10] net: ethernet: mtk-star-emac: add timing adjustment support
    https://git.kernel.org/netdev/net-next/c/769c197b097c
  - [net-next,v5,07/10] dt-bindings: net: mtk-star-emac: add description for new properties
    https://git.kernel.org/netdev/net-next/c/320c49fe31b0
  - [net-next,v5,08/10] net: ethernet: mtk-star-emac: add support for MII interface
    https://git.kernel.org/netdev/net-next/c/0027340a239b
  - [net-next,v5,09/10] net: ethernet: mtk-star-emac: separate tx/rx handling with two NAPIs
    https://git.kernel.org/netdev/net-next/c/0a8bd81fd6aa
  - [net-next,v5,10/10] net: ethernet: mtk-star-emac: enable half duplex hardware support
    https://git.kernel.org/netdev/net-next/c/02e9ce07d8b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



