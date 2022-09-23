Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A58C6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 17:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLvv0tsHtn4cEun/3W/OHzwlNDMGqIIsN/s0X7iFmA8=; b=YLFtm5ouvPHiZmPSDuc0Th6ofQ
	YeeQ/hQ7UmmClwmTMl+jnX2ShVf2TiyRo2KsuM/5GkzynK2FOeVhkEiGyIJMF18yWDF9OyjIUz+IA
	lpI79sGmDXLsPWF2myp4ICmnBY6UaYqWju+ydfzjthps9SyVICh0yX01/lWbPoug79FmTC6R2yNbG
	Zx7l7mAvEYwDWUVHSz27OwHz4uTXZ4Li5RL089ra4iDK/JxHemhEU6t4QFuy/bkOLKrRLjA3dac7j
	yhBXx3zqY+RUG+bCXSB5MNNJACuw3DUzlmmsgVXneVFwwPTi7NZFxj0In39rRwtK+tjVTbd8mhGjq
	V4ot1VHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obm9J-0053RI-61; Fri, 23 Sep 2022 17:07:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obm8p-0053Gm-Nm; Fri, 23 Sep 2022 17:07:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 316D3B826F2;
	Fri, 23 Sep 2022 17:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65C3C433C1;
	Fri, 23 Sep 2022 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663952824;
	bh=n9U15dwNcqXRZYJJDDbUQQ/3fEHzPd/5huqs2XJRWFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hwLvkPsTn9T8ARxKa65H+/JwEbAIqLC3+UuPJf7jeFTgMlpCLrStMaNRbZJiRl0ZL
	 8rcgvrYtTgeEXFv57sAs21Rql0Wj/tbrcU3gWCWAgAApU67BqDzOw4PIjzii6J7uCC
	 4etFrLo2Nyd2SONb57AUxdXIIIlJ1zS0eJOEf8oybNhnahH4GwJaezAYQLl56rerLu
	 GLGK/V8ywiqbaf7Zk2HIOj487YkqVw2gEia/qI2LlZZSxZrToAvl5HOcimsbVpxfxS
	 jCqsREFX1mqdYLDO2DP7BjL0SJCoNc9sGAXGE+bu/xdsszXxlQ2fJyNbvMFuT9PRYm
	 3wCvCAZxmCI7A==
From: Mark Brown <broonie@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Cc: "chunxu.li" <chunxu.li@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Miaoqian Lin <linmq006@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220922235951.252532-1-nfraprado@collabora.com>
References: <20220922235951.252532-1-nfraprado@collabora.com>
Subject: Re: [PATCH 0/6] ASoC: mediatek: Allow separate handling of headphone and headset mic jack
Message-Id: <166395282139.610218.7941761781105073129.b4-ty@kernel.org>
Date: Fri, 23 Sep 2022 18:07:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_100708_099363_5F83FA13 
X-CRM114-Status: GOOD (  13.21  )
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

On Thu, 22 Sep 2022 19:59:45 -0400, Nícolas F. R. A. Prado wrote:
> This series allows the headphone and headset mic jack status to be
> handled separately by userspace on MT8192, MT8195 and MT8186.
> 
> Changes based on commit d0508b4f1604 ("ASoC: rk3399_gru_sound: Add DAPM
> pins, kcontrols for jack detection"). Found while searching for an
> alternative for JackSwitch [1].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: mediatek: mt8192-mt6359: Expose individual headset jack pins
      commit: 194ff8db03782d1dae41b7b42ea65da5748884c2
[2/6] ASoC: mediatek: mt8195: Expose individual headset jack pins
      commit: aa51e3c127a43cf4862db5f0081da281f1aa6429
[3/6] ASoC: mediatek: mt8186-da7219: Add headset widgets with switches
      commit: 13bee4a16ac5c5f0e3a5db868df991be57e74aa5
[4/6] ASoC: mediatek: mt8186-da7219: Expose individual headset jack pins
      commit: 8e986748680629a82398c65da0c5bda4c6a01b3d
[5/6] ASoC: mediatek: mt8186-rt5682: Add headset widgets with switches
      commit: d888e7afa03f06d8091ecdd43f87d5396dfbf907
[6/6] ASoC: mediatek: mt8186-rt5682: Expose individual headset jack pins
      commit: 42de42c22453064ffc9b72c259b2ab901dd766dc

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

