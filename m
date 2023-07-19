Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9250CC001DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxBn/dTGCb+MCRIOqhikmXyJ+JJGDYtgJCLdUjIdYhA=; b=hH/h+60Wul07+zjv5O+pL0EW/6
	OTV9yHa3UlalZwU4pBQZvk90XiNeNmnvAiTgsjVgJNCpIo47roamhT+iuYn5a4MlPlZnB5QF5LVGB
	Zq1I3MuoqY7pWAIjOC44ThPLYrP6WB2kM+HitIquezeuY/lkpwvGyUQR4TAba4GBjZAFDahbti4dw
	GNh0mPdaUa2s/4lYWr0Mrq2DYj1F50ZY+OSnDLojTarA5yDjVo1iCqpH1chmfHPYJfP4dPWHrNvkk
	ayPcLoj3nEKcKZWBlShzNPAm32/Wg74ORBcDwNn3RQEuceOQhIIO/CnDYOGBkSAGxuZOtsXaa9Tpk
	vN7+lUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMBGq-008Oro-1Q;
	Wed, 19 Jul 2023 17:47:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMBGm-008OoG-34;
	Wed, 19 Jul 2023 17:47:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 95CBB617A2;
	Wed, 19 Jul 2023 17:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC17C433C8;
	Wed, 19 Jul 2023 17:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689788834;
	bh=eCinvZYUH/JC1KKDwH42gcUrbZIde3UQTwfcSlixCaE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Jj9gx+ckIzm7lTs3PzLxN4ngYBtS/+aKA4qtJcxa54BzJjaxIF7eYH9XaoENcQMO/
	 ghb7JBRhRu1eOkix/LTK+y8IV7ZdCfxQkUjsTFopKVygyPcKZNLKn7N0e8KJ6lDY+S
	 yuQcC164lNTw58l6WPFuWUe0HOonS/cSDM9F83N057ekEp+RUTFdsDxJTBR3UV76uA
	 87/Hwkr+NH3liqvCALC53Tc3cTMH1Dkhca2bF40CgBgIpHal7H8BhtKozTVVdC3xjM
	 trcLMeZXhswfc+YkFnnqAqXEtciSAOvKpWY1B239fRXg08QsY+esMGTHl8W97WLuPS
	 COPvfKGzmG5xw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230706064123.29790-1-trevor.wu@mediatek.com>
References: <20230706064123.29790-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: DPCM used FE and BE merged
 parameters
Message-Id: <168978883184.125745.10740530088863632779.b4-ty@kernel.org>
Date: Wed, 19 Jul 2023 18:47:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_104725_037170_9785A332 
X-CRM114-Status: GOOD (  15.51  )
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

On Thu, 06 Jul 2023 14:41:23 +0800, Trevor Wu wrote:
> To ensure that DPCM takes into account the backend hardware limitations
> when user space queries the hw_params of a device, we need to add
> dpcm_merged_format, dpcm_merged_chan, and dpcm_merged_rate to the FE
> dai_links.
> 
> This patch includes only stereo FE dai_links, since multi-channel FEs
> may be reserved for specific purposes. Therefore, it may not be
> appropriate to consider BE conditions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188: DPCM used FE and BE merged parameters
      commit: 30019d220cf9ec4df4e5f5d9082baf5519516018

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


