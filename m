Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81769CD612E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 19:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHTADdCXpMsbT+L9Tkl0zBVgM7yoUgZG2DD+Q2K+dMI=; b=Fb6UJBdKrJOyIL6yiPMkdgo9He
	su7LCWqvvlNTAfC9ilLGE5IlGHda8D+wzS/zfgBEhN0tWpQqrMWuidzuBy3G+vmzM3zLF2KNJ3kOa
	G5225r1vkl57VMvaiUWeCiuAYA+ab9IxaIv1vqnGdcioGUJjV4vN3YbVnyAYcTLdNhAO+u2g/src2
	bpLunWM9fflSZrxKFVgvkIzgE1C5qlmpcGFuJN48PjtISNyMfpgKWXTcn71e3dgpujwQR4tcR7fwZ
	QXBRgj3P2SQ4/Pqg+luyVkJLIIP1tZXCrmIT6YSbvmVxdYmy7Dx3QYeUDWkDDJXC6LQrcJm/q9puF
	m9Cqajiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpw0p-00BVE9-18;
	Mon, 09 Oct 2023 19:33:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpw0l-00BVDe-03;
	Mon, 09 Oct 2023 19:33:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D8F76124E;
	Mon,  9 Oct 2023 19:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7C2C433C7;
	Mon,  9 Oct 2023 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696880028;
	bh=3vSQGl8AKGsrfujKMh0CxRfl2/dxm1puOS4ZfrVqiOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kqFhJBLbV57LCCJaaGa4Cb6xeE1pwKxBLjp1vrm0M8gC8Jmygrgbw44uVuMC1xJcL
	 iIwWM0BMCU0VDZ97wHTtrGSr9jBN9zS4XQKyptleasbRpyzlDxP8vuq0ds579CS79q
	 9cqIOB4W+MAevB2BsAgJy5UyEcK1qYoCJZNFIZEzN1XFgDcWNN9l4v4+htQbiULn9x
	 3A489kPRl5cgnkrkQuOGQ2QFmbovWkMf0fjokrDYa6EW5lxFKXV5dfHCd5cv660Pqa
	 P2da3GVyqDBCKdGJLaM+b0/ybnr+3q4r45vgAyV29YJUXP0zigXz5NjG6XRsVovFdq
	 gzFlhg72cEHTQ==
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 alsa-devel@alsa-project.org
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
Subject: Re: [PATCH 0/8] Convert Mediatek ASoC codecs to use GPIO
 descriptors
Message-Id: <169688002562.148554.2449511739055608946.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 20:33:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_123351_125071_D1CE0255 
X-CRM114-Status: GOOD (  12.43  )
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

On Fri, 06 Oct 2023 15:46:23 +0200, Linus Walleij wrote:
> Convert over the Mediatek codecs to use GPIO descriptors.
> 
> One few-liner affects gpiolib-of.h, I don't think there
> will be conflicts so I suggest that all of this can be
> merged through ASoC after review.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
      commit: 9e189e80dcb68528dea9e061d9704993f98cb84f
[2/8] ASoC: mediatek: mt2701-cs42448: Convert to GPIO descriptors
      commit: 654a23724072f37c0d07b31395e1d9f45f5563ab
[3/8] ASoC: mt8173-max98090: Drop unused include
      commit: b1306c3b6140f0c299f727edc9bb90ec79700614
[4/8] ASoC: mt8173-rt5650-rt5514: Drop unused includes
      commit: 94a7f618211652235f3e4b88aca477391078dba6
[5/8] ASoC: mt8173-rt5650-rt5676: Drop unused includes
      commit: cb1c18e8a7337c7f3ee461b613a52a45c3f723d5
[6/8] ASoC: mt8173-rt5650: Drop unused includes
      commit: 6dffd1f38ad76660e7fff8e269889284e892603d
[7/8] ASoC: mt8186-mt6366-rt1019-rt5682s: Drop unused include
      commit: 73e1f8a05bd8289ab5154c703a0592729267e979
[8/8] ASoC: mt8192-afe-gpio: Drop unused include
      commit: 3b5d22bdf33c4e44016fdcfc8904a0b0bf218e75

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


