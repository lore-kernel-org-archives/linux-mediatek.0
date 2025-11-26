Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12263D11192
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCsO/Nsbka1ldntG+T+8tVsZbJQlp5WWWZK1eiUSa7U=; b=RygHZmcV+7YOxK6syevB1KfgpO
	fZBdbAIXz4BFx5BNVcygGMVweM2Z6TGohcOqnGNigLHCnNnJG5vXpGU0tu50jS6uwjo9BGzmFVZq5
	nWEUGSpDce0EyocKjNkwxRLd7cQh1QfrO8z/O18hV4GCKY5Sfl6S7C2QLT3erfMyO6s/86XSFx4L9
	+Nhr+MeKZSzTgHOHOxAM+GTzuL7xKT1XidG3bE8CWIuU7moTP+wbvzkOe+HTeCWRG/XMgdPPvazQj
	FiTh0C4G5Gv80u0k/lSesKDTc27E5U3d2OdOF0NcKAHKfBr/O+1Q2jgY6Q/9b8MIzPmmWPjOSQtDn
	M4Q/Yyrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKwa-0000000FXYB-1URC;
	Wed, 26 Nov 2025 19:12:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKwY-0000000FXXv-1w52;
	Wed, 26 Nov 2025 19:12:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69B1B60240;
	Wed, 26 Nov 2025 19:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9736C4CEF8;
	Wed, 26 Nov 2025 19:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764184365;
	bh=sWWXp3sv6vfsWvCEZUjz8CmJ0VK8ViosU6u8p8WK57w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ju2pT6Azp7yo6k1D5f0cG+rlRn5zuLUrevCfMZNmQuf+hzPNgPcMbQwwKwNSgiwc5
	 UaBtW2k2+qFOkRTCxJImD00d+gDOQDBLj4pS67mxN9hNnQ2/Er1zx+dwhJfVJejMtY
	 Q0qODMulspHUVxNjpAYZi2Dc0s91nKUxFPHO5lXbJyAyDcdty9L395tp6j6okow+Qc
	 DBD4ox4lV9U+BMwC4nNIpuwU8Fnnap7QuG7mWXrJj2wdjYb1c8Nunlo2PcmKunIwaH
	 jtUJVfMWIX2oqJhnYkipmt4PWd+BY5h4dFRWml/jEe/OtjlvWzqXd4BxYKCImlvJZd
	 Zrq37EJ3X5RTA==
From: Mark Brown <broonie@kernel.org>
To: Cyril Chao <Cyril.Chao@mediatek.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aScUKqCEhSIZoOmg@stanley.mountain>
References: <aScUKqCEhSIZoOmg@stanley.mountain>
Subject: Re: [PATCH] ASoC: mediatek: mt8189: remove unnecessary NULL check
Message-Id: <176418436269.117076.14309249489407966858.b4-ty@kernel.org>
Date: Wed, 26 Nov 2025 19:12:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
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

On Wed, 26 Nov 2025 17:52:26 +0300, Dan Carpenter wrote:
> Smatch complains that the call to snd_soc_component_get_drvdata(component)
> will dereference "component" so this NULL check is too late.  The probe()
> function will never be called with a NULL component pointer so just
> delete the check.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8189: remove unnecessary NULL check
      commit: 9d3fcd0ebe91c2079b4aeaffc7493a0bb2ad45f2

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


