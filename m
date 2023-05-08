Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70F1C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 03:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1pRlgY6ExLToc78N/bz3he83bwNMQOxenLeh06oVUA=; b=gAxO4wqRyTLBwIHfFP8C+vLEnk
	yteIfvax5EkQc76qS87fXKr0JfzUIAKL2g6ZofWi/GQKP5OxQ21NX9X8a7+sYRXGfDHP4LgozBm16
	KZjisEmXqQm5hLvIKKFJQDiZx2fLOMo8p+n1eaRzrXxECAErGv6QFrlG5w7Bo1kle2+V1kSE+kMip
	5QxF5nNiJ2OZPpPkeHNffdx8AMmSAv/fNLF2MLntsARIB2BIpSLiK2QkX9LY8isqzBzx0a0UZL9oa
	f4mF4rrZ55WAVebZLlJAXqJBMTWq+uNBkkyfp/zqP3kUySRIdM5RYYnEleFRo5uIX+de02CbdIpnW
	nw7N8Utw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvroR-00H8sq-0z;
	Mon, 08 May 2023 03:45:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvroL-00H8qV-0s;
	Mon, 08 May 2023 03:45:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B776361E5A;
	Mon,  8 May 2023 03:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BDE1C433A1;
	Mon,  8 May 2023 03:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683517514;
	bh=B107g9Lt1qqRc8zGMhAvO5F9KOo7vdHb61jTMsoTnGM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hkMTnw/raTjwK8dXNNlAE97OKveUSkIvTENObtPpXmS/b16Zo99WrTSP7cywcVOaz
	 2+XnilGdG5W9CxLf21CBgwIE3dr+BS7eeWVfHE2NnInr3cCuU07cmXjcdUiylXBODh
	 rlNP3mWO5sv2ub5TQwGiSAwmfFrT56h1gR1UEdK9KiPWbygV7PLvqSJFb0Bn/t5IPY
	 tOW3rn8pjHLIK17yRFrplFPu32Bd4Kid59zpQP1Hqnns7ZgLQGXjoHeKLpqWF0FShM
	 CS13qoXkg1I2NfqjGaO5WOeMIk3l1Pc07ZvdP+PzhTx1ikCP9qq88EvckL12EFrnQc
	 6GLTtN5goJPrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D73BE26D27;
	Mon,  8 May 2023 03:45:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/30] pwm: Convert to platform remove callback returning void
From: patchwork-bot+chrome-platform@kernel.org
Message-Id:  <168351751444.5651.16443197694918881526.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 03:45:14 +0000
References: <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: thierry.reding@gmail.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
 rjui@broadcom.com, sbranden@broadcom.com, f.fainelli@gmail.com,
 bleung@chromium.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 vz@mleia.com, matthias.bgg@gmail.com, heiko@sntech.de,
 krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, jonathanh@nvidia.com, sean.anderson@seco.com,
 michal.simek@xilinx.com, kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev, festevam@gmail.com, linux-imx@nxp.com,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_204517_372357_930E071E 
X-CRM114-Status: GOOD (  11.84  )
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

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Thierry Reding <thierry.reding@gmail.com>:

On Fri,  3 Mar 2023 19:54:15 +0100 you wrote:
> Hello,
> 
> this patch series adapts the platform drivers below drivers/pwm to use
> the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak.
> 
> [...]

Here is the summary with links:
  - [09/30] pwm: cros-ec: Convert to platform remove callback returning void
    https://git.kernel.org/chrome-platform/c/159a61a7b5b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



