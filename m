Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBE2C54E67
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 15:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+5ZjVyKekScKBXTfn8fA7KQTtjJoKCcSaLP5mLvDPk=; b=25qBX0IRXGGXtuw4Lf38rkWBN1
	UYd1f/JC74Y4e0D4I5/rbaJS3c8k1B17ollyU6fndVQDVMoCYtFfm6CcNESGga3TxbG9jKQ/dIJuL
	W2LetdnxZDJDvvrnMeQ/CzlzQtIen/YBrx8kGgxqZxGDXBwHaXi2hzfWMvw0RZuEri50wWmbqw5fq
	bEytenP8Q2Gnru0Q2qzksdio3asWW3n+sTWbm8mAXeW8hMjbzrGPchDGAUPuftMIb3JcWiTFf8U3K
	7ljfkRVmglYCIvX6l30y/ByDFMF3jraQduUSaVitJ0OCjWG6HzB6RGrvxZtRaFSwG72Orr3Hg0/7P
	Q3BahXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8ih-000000059eW-3V7N;
	Tue, 26 Mar 2024 15:28:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8iG-000000059O1-0tJC;
	Tue, 26 Mar 2024 15:27:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 991FD612B8;
	Tue, 26 Mar 2024 15:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53104C43390;
	Tue, 26 Mar 2024 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711466855;
	bh=grkKelQsX82GN+mhakvoaLl2QHI3vzpYxQLvknB0Fys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bkSh8KkyQWCpYTjYjiV5w7aPLtY6PlZzfO8tu7CEQMCojpC+6L/fSddCc/szf6zWy
	 7utiKBAxT3cXcuRO6bPzWe11nNiYduIA97VJERqbXwxhD3gbxluTEaGW/ZG5q6t8pJ
	 UzRhYTsIIEmdZK0Uai96XjdNN60WXMXyH9vR/kbu6A5DfHr0LU4WxmfcapsbMP3RB1
	 6oEJJxWl1ITNy/kW7SoBpJCZFTLX9eSMj9iHDr3/4aKft7Tyk824MtX/IjYck0PHsO
	 hkjNwfflzpyiRRHAkrYid4RBQ3+rldNeqjvvd7bbq/m7rz8Z0Vgpekpi1ZeWfT+sSs
	 EM1M4N6s3BtmA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 ribalda@chromium.org, nicolas.ferre@microchip.com, 
 u.kleine-koenig@pengutronix.de, kuninori.morimoto.gx@renesas.com, 
 nfraprado@collabora.com, alsa-devel@alsa-project.org, 
 trevor.wu@mediatek.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 0/7] ASoC: mediatek: AFE drivers cleanups
Message-Id: <171146685206.132239.17987201870136073859.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 15:27:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_082744_561343_7227C065 
X-CRM114-Status: GOOD (  11.01  )
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

On Thu, 11 Jan 2024 11:52:40 +0100, AngeloGioacchino Del Regno wrote:
> This series converts MediaTek AFE drivers' probe functions to use
> dev_err_probe() and devm functions where possible and, in some
> cases, dropping the .remove_new() callback, reducing the size.
> 
> Cheers!
> 
> AngeloGioacchino Del Regno (7):
>   ASoC: mediatek: mt8173-afe-pcm: Convert to devm_pm_runtime_enable()
>   ASoC: mediatek: mt8173-afe-pcm: Use devm_snd_soc_register_component()
>   ASoC: mediatek: mt8183-afe-pcm: Convert to devm_pm_runtime_enable()
>   ASoC: mediatek: mt8183-afe-pcm: Simplify with dev_err_probe()
>   ASoC: mediatek: mt8192-afe-pcm: Convert to devm_pm_runtime_enable()
>   ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
>   ASoC: mediatek: mt8195-afe-pcm: Drop .remove_new() callback
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: mediatek: mt8173-afe-pcm: Convert to devm_pm_runtime_enable()
      (no commit info)
[2/7] ASoC: mediatek: mt8173-afe-pcm: Use devm_snd_soc_register_component()
      (no commit info)
[3/7] ASoC: mediatek: mt8183-afe-pcm: Convert to devm_pm_runtime_enable()
      (no commit info)
[4/7] ASoC: mediatek: mt8183-afe-pcm: Simplify with dev_err_probe()
      (no commit info)
[5/7] ASoC: mediatek: mt8192-afe-pcm: Convert to devm_pm_runtime_enable()
      commit: 7aaaa22de56ce0dae15fd9f42a69a1d1a7a6e078
[6/7] ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
      commit: 324c603a4efca7d1045e0bf3477ca54970eac72c
[7/7] ASoC: mediatek: mt8195-afe-pcm: Drop .remove_new() callback
      (no commit info)

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


