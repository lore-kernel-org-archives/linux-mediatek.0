Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9BFC7EE2E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dqLqw8WBo0ZUjvQsOU05IkBE5lw87rKvzOutKSkmFA=; b=d1MlxLih/niVYr5cts/cP+U8Im
	usyMU6I19cfzPnE8j8px45jtrKIoMrmlKKNkCvutJzgJp2fK0nHBUkgmlSCYJJp06a5Xi5U/+jYs7
	VLtAQzT7EnTqnAjctBn2pHpZD3XQCP4i6MJogt53knejt0BXzWRB64ypXH+3BWT8AxGvCJ4c64oIs
	mAwAzkrqKU7ohO+zhfxF+F8eJr7RMG1T9k0APhrfxzmFaMGgbr+mI05JQTghHor9N4shiSrdBluFE
	3BLpQaY+6R9MsSke/49n3k8UdVoiquduruVCXyX6W8SNADTkUJS/1VWBKnnNpcFm5iJEUL64ySN2+
	GTZ2YTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6E2S-00GHBk-0A;
	Mon, 05 Jun 2023 17:30:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6E2N-00GHAz-2U;
	Mon, 05 Jun 2023 17:30:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5983261719;
	Mon,  5 Jun 2023 17:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35EAC433EF;
	Mon,  5 Jun 2023 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685986234;
	bh=WdV07oy/o91QEHR/yUMXPJbDhkHpn84JHUxwqIBH/a4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WV4/J8LxaHbnn83o/tFnncB95q1CEMouX8J6cEuJJ8BqIw+HxGKjSw4SggwJCclmh
	 bnjh16AvaQ+oXOk/C2vdQJGn1GFxuKQmc1VpkASsn8yAii3JkrBkBAuCWx+ctWSvGu
	 gt0Wog/LH9xfYCD5PsdFl3k5fIzFI5ZR7PIZw5mSkX+yMxSo5wUOHvGk3ZiCs2m7YD
	 sONooxx9S7MoWNN43+spGjmJwv+bC+aRgusr/ZmSoHbfAPAs7p1qAj2D86ugm2indf
	 wV3HvFI+N8Kt4VB73e7JiGcVPHCJYokX7vCk8UclcXKmq2AqPB5BMdTqAucGNrMvPq
	 Y6nAGTf53zMbg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: amergnat@baylibre.com, alsa-devel@alsa-project.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20230526093150.22923-1-trevor.wu@mediatek.com>
References: <20230526093150.22923-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v3 0/7] ASoC: mt8188: add new board support
Message-Id: <168598623165.103672.7353425800916087713.b4-ty@kernel.org>
Date: Mon, 05 Jun 2023 18:30:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_103035_866658_73D2259D 
X-CRM114-Status: GOOD (  15.30  )
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

On Fri, 26 May 2023 17:31:43 +0800, Trevor Wu wrote:
> In the series, we extend the capability of mt8188-mt6359 driver.
> 
> The following changes are included.
> 1. Divide ADDA BE dai into two dais for SOF.
> 2. Register hdmi/dp jack pins.
> 3. dai_fmt can be configured from device tree.
> 4. Add some I2S codecs support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: mediatek: mt8188: separate ADDA playback dai from capture dai
      commit: 2a7a1ae95c84d4199736872bfbc39d01f4b6b0ab
[2/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: remove ADDA_BE from link-name
      commit: 9fba0d3ec0a074d1a7c094b2cb722f135215fab0
[3/7] ASoC: mediatek: mt8188-mt6359: register hdmi/dp jack pins
      commit: 73cf2b3f2b45fa4c231e8e84ae5d8cc80947d799
[4/7] ASoC: mediatek: common: soundcard driver add dai_fmt support
      commit: c0e7390e6d3f42b9a15a0e72add21facb8e17790
[5/7] ASoC: soc-dapm.c: clean up debugfs for freed widget
      commit: 8ad13cdc92f66333ae475251ae7722313f84e496
[6/7] ASoC: mediatek: mt8188-mt6359: support new board with nau88255
      commit: 9f08dcbddeb307793bbfff036db213d2cdf03a50
[7/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: add NAU8825 support
      commit: ee02b869dcad7ba3772b58e93dd90ab4f932fac5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


