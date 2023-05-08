Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94EEC77B7F
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 05:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXTha2RgsE9YZM9ZrfocBAOfddXKAP7ToFy807tER74=; b=O2p6XhMryjreK10pUS5W+gsGpZ
	QYR5MIxcW82wOWx9YQWO91aq9oNl5tK8I4fGa5QQt/+jh7A6OTJx0z4sH/o9aOlTBn25UavmD7yBH
	NJQ+zVY+NGxc10MpQvo6xn6y90OABk6Bv0OFo0k0vn+M7NCRCgTa04IIkawAnBDr+UkfRFWaCU1x9
	TQsI7Mjnkjpb928MLiAVlsIeLo7Hph+z+LsJ7HG6uHcun0V42P8yj5okPIQqzzsocfFqrrFrsV6FO
	YBYeMSyx6g7ojWXSv+LDx7jQwia3iLMAz1hiFGsMDDxBE8Vmd6t4pkPpoDpAjzkp4ZfDu+a3QdwOG
	GIF3WyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvsz5-00HGpE-3A;
	Mon, 08 May 2023 05:00:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvryu-00H9vF-29;
	Mon, 08 May 2023 03:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hXTha2RgsE9YZM9ZrfocBAOfddXKAP7ToFy807tER74=; b=cFofh0io1c5lgeqGFokCY9/mfd
	c0f5Y1xtuC57IYHvUu5Bpmlsefna6MRugEVovuxRhl6ycBVrIJYONXTOav92WuFwMDYB7jt4gEzow
	IDJP30i+Bbz+usdllZCrKPaoRRdiXKu2B1I6RLXdo/+pcDv/lzKN9Ah3kMKGQxDTuRmKH1l8WEn0Q
	tRR2nR1l2K7boJYKtz063bJ7Cb61FtF9iEbLZ01/G2MTMKlavwgJDzzDygfrDJefjK8WV2iCJ2ZcP
	v9xAA9qeGGtws3B3R3gtCO3V2wRL0fzgssKMhi/44oi/p9eqzyZu2xQjTd8M6bP1FDH68puaauL5j
	6gvxMiow==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvryq-00515G-16;
	Mon, 08 May 2023 03:56:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2058A61E59;
	Mon,  8 May 2023 03:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 017E0C433A1;
	Mon,  8 May 2023 03:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683518162;
	bh=iqxRQMD53u2tbr+scb/mygfA71sAOYFgkZWapjTWLC8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nEjcgk3+n8PYkAocEwDvhmB9jmQVz13X6O5K2hyos1vxLgzNen0Ynbvp4PFTtwysi
	 +BCR/a9mQn1f1BPAE4k0psgkYYi9BqOywL6GkMDTwiUY8GYSL9lYyA1BdBuKzU2hXH
	 dIMT772sNaVuDE9zKYN9NvgT6DxfUYiSp40yp/AmEVnehU+lds/vfVirVunCKpAyLa
	 6GHtWMLiKGxD2l0QV4Eeu747HdERt5Fw9YwxiuyioA/1nUw9YUMaq/ikApjI7ejKWe
	 3t1Ha3yKoi59DNpgdlEAe7bez5m1nP6bIOk3zteJUF1LZ2Qo1c7mFFVQ9iCtduLuP8
	 TS+0FH9YEdnOw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D3B00E26D29;
	Mon,  8 May 2023 03:56:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/30] pwm: Convert to platform remove callback returning void
From: patchwork-bot+chrome-platform@kernel.org
Message-Id:  <168351816186.5651.2096317681881714301.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 03:56:01 +0000
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
X-CRM114-CacheID: sfid-20230508_045608_559181_71EA5EA8 
X-CRM114-Status: GOOD (  11.78  )
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

This patch was applied to chrome-platform/linux.git (for-next)
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



