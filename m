Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BE2E77170
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ncfm0Ew70GznYLi9T8bLVToud6oZGWFWMd1HWmPX364=; b=t3qLhtk3q512Lbv3/9MFkYDJbx
	9IkFcwllnN/7QuyBew0trZ+eFHQhuO/MGg4G4/Q4Xhn1T492NWz+G48XQymEFbAHLrmjzoRGRXd3A
	hdFXzhpSvtkf2w/zQ0tMYcUZiLGSgKzRuNVnVV4vuXztiTNfAlDsgKrwWUyRCZ6DONTl8AMNZy6lB
	cCyi2EKTkh6N/95XqCvRTOQfwa1EKu0n5MAZrpi6YeYwK3AbltNCLuIkSmgFDCSLfwfGluJGJD89N
	fCIrnQIZ9dpwSKNJP03BKccDpOGA6nKdnebYunLJXETiW7lFoCblCUbChOveUFteRzUsqawnEcfyo
	kQf/RiLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEum-0000000Gmes-0ASo;
	Thu, 05 Dec 2024 16:41:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEqT-0000000Glzl-2LAM;
	Thu, 05 Dec 2024 16:36:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73ACCA411BF;
	Thu,  5 Dec 2024 16:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7724C4CED1;
	Thu,  5 Dec 2024 16:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733416612;
	bh=EUDRNIf91DhCpv7VcoEeYf3W/mYyiI1JzzqOUbN9pO8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h6dqKZikrt4op81i1+61l9XQXVpzuJPRawHLRrzCWkJ7gFEVCYEshUV0L/Y9SdcAW
	 R9b1aavozOx57jBDQ95JUFMd9Q399Rfz/nktY2ihiuJu5L859KoVVJLLcf9HcCM1ma
	 xsfbm4rbK9E4plkWE74RXYs8zzIdSOuVbC1BgTP+k5fxHKpE6U5OTOj8S3AKSNhqUy
	 NbzMHrBdIGy4OXhbhAh/ieGXetRmr3iIY4J72m0H9fMeXC+sa8qleevKAWHx42gbEu
	 HJwcNk0XGtYpnTMpv8FLS/p8MmFUINiZFs9xl5gZiGEAVzQgQ/ziLR6cmk5A5BCNHe
	 t4tAYe1QrSi2g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic
 codec
Message-Id: <173341660960.157362.16366009839095486342.b4-ty@kernel.org>
Date: Thu, 05 Dec 2024 16:36:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_083653_664637_10C870A9 
X-CRM114-Status: GOOD (  14.18  )
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

On Tue, 03 Dec 2024 16:20:58 -0300, Nícolas F. R. A. Prado wrote:
> Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiring
> a dmic codec to be present for the driver to probe, as not every
> MT8188-based platform might need a dmic codec. The codec can be assigned
> to the dai link through the dai-link property in Devicetree on the
> platforms where it is needed.
> 
> No Devicetree currently relies on it so it is safe to remove without
> worrying about backward compatibility.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic codec
      commit: ec16a3cdf37e507013062f9c4a2067eacdd12b62

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


