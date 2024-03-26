Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B3EC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 15:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYbZQdf50LF8xYkomYqv80dtjkvr6TuP+VcY85Y/QTM=; b=ubvLOTIPQEfvcjLGsbUo9sJGV2
	FITgJzx/PLIW+Ef/4/K4LY5PTmKz8pmtAOQV2tPpMjjHjZ7uyG7taF2cFZQDBU/iRnbbpxnCxMEo6
	8yFx+C7xNfS5LNFfeGNauh6hkpuVpXDJvgMRGF50q/TfKTrKEPepjq1FNI/xMy1mcCmBECIlJEjrx
	P5AFrEQYkhzkn1pj5c+FcBND1em8Bvdy6Y3C+f8F4DXgoS0WKD5LTgXhOIwdZ01J/SUK0Bta1tftN
	x9coBOZA4d0u3OTueY7tV3sNdrBOW9/Ot5NU3BRsl5HoKqtQ342gp6307LJY3ihJ3Qb5cAfRaih3j
	zz14EjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8iu-000000059lS-09fe;
	Tue, 26 Mar 2024 15:28:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8iQ-000000059Tg-49cX;
	Tue, 26 Mar 2024 15:27:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06C16601D9;
	Tue, 26 Mar 2024 15:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166E3C433F1;
	Tue, 26 Mar 2024 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711466873;
	bh=d7mywm5rWXgjpSN3I9ojlV17yktCzrZdNxZNYpgH1yQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hp6Esqla1sjCT4T/dOuLOdPJZJ401oUDnrm2g7ZKzIYsSHuUajnZnSUOxJ+ajTyMC
	 RmXLnvNEpkQi3Avbi9D5focccqQ1CCFjcz7btuhY7Zrykz/t7kC0MPV4AF2VmkPWwO
	 mQplefko5AwG3GGe/5rk+J8Wv2h5jafianOzsF1IsDMBP4+vPT7ZAo3Gj5X7UM91DC
	 Qy2+BaRHT2+GOPn8/8COxnkQylaqCzcNmPWySsBZtZ+j3QycwAWhg0Oj2yyzgNQgE7
	 nNIuQXfDipaZQeQRoZujONjXeJvkictOIygpcA3TdDHmDxu8da7rV7N/9JzZ7nyfr6
	 8nZKG4LEPmu+g==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com, 
 trevor.wu@mediatek.com, maso.huang@mediatek.com, 
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de, 
 kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com, 
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de, 
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com, 
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev, 
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com, 
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com, 
 nfraprado@collabora.com, alsa-devel@alsa-project.org, 
 shane.chien@mediatek.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v3 00/22] SoC: Cleanup MediaTek soundcard
 machine drivers
Message-Id: <171146686681.132239.6648296431652591544.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 15:27:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_082755_234984_72C6748A 
X-CRM114-Status: GOOD (  12.59  )
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

On Wed, 13 Mar 2024 12:01:25 +0100, AngeloGioacchino Del Regno wrote:
> Changes in v3:
>  - Added audio-routing names in enum in all yaml files
>  - Added mention of disallowing old and new properties together in
>    commit message of bindings patches
>  - Fixed validation errors with sound-card-common.yaml inclusion
>    due to missing model property in examples
>  - Removed `else` enforcing headset-codec/speaker-codecs requirement
>    if xxx-dai-link not present to avoid future commit noise as the
>    deprecated statement will disallow deprecated properties as required
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/22] ASoC: mediatek: mt8192-afe-pcm: Convert to devm_pm_runtime_enable()
        commit: 7aaaa22de56ce0dae15fd9f42a69a1d1a7a6e078
[02/22] ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
        commit: 324c603a4efca7d1045e0bf3477ca54970eac72c
[03/22] ASoC: mediatek: Commonize ADDA rate transform functions and enums
        commit: d6c01755805d346a1382d2d81c214b2ca557487a
[04/22] ASoC: mediatek: Assign dummy when codec not specified for a DAI link
        commit: 5f39231888c63f0a7708abc86b51b847476379d8
[05/22] ASoC: mediatek: Add common machine soundcard driver probe mechanism
        (no commit info)
[06/22] ASoC: mediatek: common: Constify struct mtk_sof_priv
        (no commit info)
[07/22] ASoC: mediatek: mt8188: Migrate to mtk_soundcard_common_probe
        (no commit info)
[08/22] ASoC: mediatek: mt8195: Migrate to mtk_soundcard_common_probe
        (no commit info)
[09/22] ASoC: mediatek: mt8192: Migrate to mtk_soundcard_common_probe
        (no commit info)
[10/22] ASoC: mediatek: mt8186: Migrate to mtk_soundcard_common_probe
        (no commit info)
[11/22] ASoC: mediatek: Add common snd_soc_ops .startup() callback
        (no commit info)
[12/22] ASoC: mediatek: mt8195: Migrate to the common mtk_soundcard_startup
        (no commit info)
[13/22] ASoC: mediatek: mt8192: Migrate to the common mtk_soundcard_startup
        (no commit info)
[14/22] ASoC: mediatek: mt8186-rt1019: Migrate to the common mtk_soundcard_startup
        (no commit info)
[15/22] ASoC: mediatek: Add common mtk_afe_component_probe callback
        (no commit info)
[16/22] ASoC: mediatek: Use common mtk_afe_pcm_platform with common probe cb
        (no commit info)
[17/22] ASoC: mediatek: mt8186: Unify mt8186-mt6366 machine drivers
        (no commit info)
[18/22] ASoC: dt-bindings: mt8195: Document audio-routing and dai-link subnode
        (no commit info)
[19/22] ASoC: dt-bindings: mt8192: Document audio-routing and dai-link subnode
        (no commit info)
[20/22] ASoC: dt-bindings: mt8186: Document audio-routing and dai-link subnode
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


