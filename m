Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4341C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwLG6PugHl4eC21BPc5GkdrbwZ38PLDUGzkbfsZcSnw=; b=jy2vq8QLSEC9vbXgxwJglpX+Mt
	An8vsaAwyF1LbENSATAoAN5fLCx4166aYDiPQQ0RAwId9LXTMd306xtsxb/I/2UqkfWjLnd/S9O6f
	xi9Sr7qqOVCR6f/FTtjsqHIs6lU2nbyVcpaAAPkwEPDWU1Q01hShSmSFWlGsk2urZChIDF5oP8prm
	yLtcD0ka/o6853YfsHsEEkepH7kUwSUs+dcG6K6cOICLpHW+/Ke6xO+9IcLTJCmT50j+D7uN1FSAf
	8iYBjNgiT+35D/bbZk/IWj03GZbU2DxEcAi+SYB6hls8F0E9BsKugwy+2mFLUtH7R0fcMhA+djMD9
	ajI9D6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiCm0-00FLxy-0r;
	Mon, 18 Sep 2023 11:50:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiClt-00FLwX-16;
	Mon, 18 Sep 2023 11:50:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 46CD0B80DE3;
	Mon, 18 Sep 2023 11:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAD37C433C7;
	Mon, 18 Sep 2023 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695037829;
	bh=oT5snbuM6TfIDJhxJsWR/PSxNRbw+iiiuFc7Xp3a8+I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uZ7FGpqOOOW4QGMAG4E31OhORIcesAUkf7+AMd+dsPzh46DiEGuFjAIIhigCjpVJL
	 DwbZLMUVDePIq6nrbjOfTbzXtettFFgIyY2rnnqxkUb/zAQgp+ndayV41JWxb1zLMo
	 AbI3ombnz9obEikffx68Z0fVqGGNkZQKYCDV1P39O8JxfbAfmD/97IyEGrtWpqGfsP
	 5sR9Uc4vWEZJBRM/S+0t5Q8N7s9KRKP6pCpKx6h60qwQV1CKH3ulLO4OQM8TnaNqdb
	 K5zs590+yp6+YrY9ggF3Ph/91j0zolaKDFIYLi5JTOTbhB+mIXrp/jkzKzlYTTCB0Q
	 EXB1uzYcbpgnw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4871E11F41;
	Mon, 18 Sep 2023 11:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/22] convert to devm_stmmac_probe_config_dt
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169503782973.2272.13506822186977436052.git-patchwork-notify@kernel.org>
Date: Mon, 18 Sep 2023 11:50:29 +0000
References: <20230916075829.1560-1-jszhang@kernel.org>
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, vz@mleia.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, kernel@esmil.dk,
 samin.guo@starfivetech.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, thierry.reding@gmail.com,
 nobuhiro1.iwamatsu@toshiba.co.jp, linux@armlinux.org.uk,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_045033_688884_AF970329 
X-CRM114-Status: GOOD (  10.42  )
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
by David S. Miller <davem@davemloft.net>:

On Sat, 16 Sep 2023 15:58:06 +0800 you wrote:
> Russell pointed out there's a new devm_stmmac_probe_config_dt()
> helper now when reviewing my starfive gmac error handling patch[1].
> After greping the code, this nice helper was introduced by Bartosz in
> [2], I think it's time to convert all dwmac users to this helper and
> finally complete the TODO in [2] "but once all users of the old
> stmmac_pltfr_remove() are converted to the devres helper, it will be
> renamed back to stmmac_pltfr_remove() and the no_dt function removed."
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/23] net: stmmac: dwmac-anarion: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/6f799fd9dda7
  - [net-next,v2,02/23] net: stmmac: dwmac-dwc-qos-eth: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/0485825dd6a8
  - [net-next,v2,03/23] net: stmmac: dwmac-generic: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d53b19d2a1a8
  - [net-next,v2,04/23] net: stmmac: dwmac-generic: use devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/14ec0fc582c5
  - [net-next,v2,05/23] net: stmmac: dwmac-imx: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/115c9248b19b
  - [net-next,v2,06/23] net: stmmac: dwmac-ingenic: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/6bb53b2abf30
  - [net-next,v2,07/23] net: stmmac: dwmac-intel-plat: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/abea8fd5e801
  - [net-next,v2,08/23] net: stmmac: dwmac-ipq806x: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/72ab86c27d4e
  - [net-next,v2,09/23] net: stmmac: dwmac-lpc18xx: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d30c08a3b001
  - [net-next,v2,10/23] net: stmmac: dwmac-mediatek: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d7209c056a49
  - [net-next,v2,11/23] net: stmmac: dwmac-meson: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/780b63ae208e
  - [net-next,v2,12/23] net: stmmac: dwmac-meson8b: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/551022d680ec
  - [net-next,v2,13/23] net: stmmac: dwmac-rk: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/8eee20e10d6f
  - [net-next,v2,14/23] net: stmmac: dwmac-socfpga: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/9086d3f2b560
  - [net-next,v2,15/23] net: stmmac: dwmac-starfive: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/6d6c11937359
  - [net-next,v2,16/23] net: stmmac: dwmac-sti: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/c9445e0bd729
  - [net-next,v2,17/23] net: stmmac: dwmac-stm32: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/373845154618
  - [net-next,v2,18/23] net: stmmac: dwmac-sun8i: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/9bdf6909877c
  - [net-next,v2,19/23] net: stmmac: dwmac-sunxi: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/291595337626
  - [net-next,v2,20/23] net: stmmac: dwmac-tegra: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/acf73ccff08e
  - [net-next,v2,21/23] net: stmmac: dwmac-visconti: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d336a117b593
  - [net-next,v2,22/23] net: stmmac: rename stmmac_pltfr_remove_no_dt to stmmac_pltfr_remove
    https://git.kernel.org/netdev/net-next/c/2c9fc838067b
  - [net-next,v2,23/23] net: stmmac: make stmmac_{probe|remove}_config_dt static
    https://git.kernel.org/netdev/net-next/c/b2504f649bda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



