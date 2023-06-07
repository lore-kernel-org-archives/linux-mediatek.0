Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EE7C7EE25
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 17:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGky2cJwDk2cpjX8uZ6wDRJ0r1MtvSG159h5SpAaGbE=; b=M23whaAzux6xb8MwzBT0EIRV4Q
	LXOEyTl2CnOH4v+nYKdx5DcRfYL7GxSgpB+dJ0xsQ9WAsBJijrZO3Y6zQI0alT7Am/3zpnyRtZAkV
	ky9V6UluDpCtV+gQqI+p2rqHvXuqY24v3Ao+H/l/1raiM2KUQRCjekoAEjQjm7PZoGcyxrn0/y0n7
	kGdHUBViItYzbIV3MqM9NAtRMgAvzQ+0iD/TpUVckOVjLrkkalcvRTTLZqhWFTj6E9dvaWY/wMMpL
	7dAcmpiYXLpnrlkVhUGFbql24db4y2T5Q7gr2bQmxtvwJvrVyXE5Tn6GuyMV7Par2GqUM2RrCuySv
	wg2zB+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6wt0-006hAP-2q;
	Wed, 07 Jun 2023 17:23:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6wsx-006h9p-1R;
	Wed, 07 Jun 2023 17:23:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 38C4A63DEC;
	Wed,  7 Jun 2023 17:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11B0C4339B;
	Wed,  7 Jun 2023 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686158629;
	bh=DXFobuRLa5VJEYRkra8Yv2W5Fag/nn80UUPhzCO37/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p9nzJqhdievT3cH7sdFgcIONCpvuxD8owzg6hRkrjZd0OL6tPCLciW64eWZO5mMg0
	 sSx+jhvZNZ9crQzrNhpmkeUemXISN7HHUv/D/NmIIvJ/LCbimo4iuCOlJOykgeWXuQ
	 0kckTA81K5cmSPFB6+nKB4/vYFNvcRg9wuULRE+XVjBn51EUZlTHrOsKgmii9ivnlQ
	 hblqGMos5ZPcOqWHfRL/+DnW2wZpYk11Qw7k3+35NfX5n76tR9V6TAKqgGwV79E1gK
	 aVgii1F/QLjWZv1ndoz2FzWOVd59MmrXS6lIhACOZ0d/767G1j9a7dlNmTiAtr4iiQ
	 TCRlb9u2CEb0w==
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20230607120831.3587379-1-arnd@kernel.org>
References: <20230607120831.3587379-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: add i2c dependency
Message-Id: <168615862657.61571.8647819742396271999.b4-ty@kernel.org>
Date: Wed, 07 Jun 2023 18:23:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_102351_548141_560BA137 
X-CRM114-Status: GOOD (  14.13  )
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

On Wed, 07 Jun 2023 14:08:15 +0200, Arnd Bergmann wrote:
> The newly added driver is missing this dependency, causing a possible
> build failure:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_MAX98390
> WARNING: unmet direct dependencies detected for SND_SOC_NAU8825
>   Depends on [m]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=m]
>   Selected by [y]:
>   - SND_SOC_MT8188_MT6359 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_MT8188 [=y] && MTK_PMIC_WRAP [=y]
> aarch64-linux-ld: sound/soc/codecs/max98390.o: in function `max98390_i2c_probe':
> max98390.c:(.text+0x514): undefined reference to `__devm_regmap_init_i2c'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188-mt6359: add i2c dependency
      commit: 484ede9bcb031a98880817480b685cac0ec96f2b

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


