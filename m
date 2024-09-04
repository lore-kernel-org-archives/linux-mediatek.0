Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3575CD3431
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcwPYqg37yLR4NK23neDFZR3aZZwObB1TbdlKu3ptcA=; b=0r1GrFCD64ec/vF1BCxpDG/tQh
	XSZl9TZjDKwQA9iZR3qjMFN+OGEjuRzsb65SbbERb1CErA6rVzRF+fP6pklxvuD+FF85C3N7SqmnC
	louEGKmgehN/fjEb3uR9PMvAMNWU22VJyg1D4hbA9GwZR9oa85Bi81LGA9OpEKLEqFKwL66ixczV4
	fkbk0KW+7k/hma+0nPNEhdMUqoDDfE1xD9PqJlepI1SwnGJjx0d7UrOj96hWWkt7sTzcZ2/2ot9J3
	3FZZMvwDJCfbKT1TNaEwxDeh/aGCLNIDbERDq7U8nZM9lIrR2lNwmou5edDUKV5LPAkxp1KwucMu0
	nZE/8Zrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sloDN-000000049cd-2ISq;
	Wed, 04 Sep 2024 11:30:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slo0M-000000045Jn-2vu1;
	Wed, 04 Sep 2024 11:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A975C5C54AF;
	Wed,  4 Sep 2024 11:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D711FC4CEC9;
	Wed,  4 Sep 2024 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725448613;
	bh=SFWQxwybbR05p/JSlu2vfeQxyFVILJVtOStppUEw+xw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KRVtWdg9D4xhd/xX3u5CgZSN5Sm0NZWjAaFc8R5UIZOvKvw7KgThuvHywHeB3MdGE
	 kgA2xop/P1gXyrNDSdt9rkNvIKmYiSEpIzrKdCqUSl1RczLm9zXv5zRl4J+FummyAt
	 Xi8bvs1g+F47UlxXsHpphN5OeHmq6pxpp0RWjA95epvKzdjasyrp2JgHw8t8e3Nosp
	 VBomlo31XSnwYb0Cem8rEVFMAlnnrfrfSCfiFncF8c/X9VoNBp67c3eqHtvOrCoNxj
	 q2KL+vVp0YtBLxLoISr+raawo46JGCCLhCqUxMAaeLNlbLagNf7BrjjDV86zzRJKmH
	 Fw24bheSYB6OQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Nicolas Belin <nbelin@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-Id: <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
Date: Wed, 04 Sep 2024 12:16:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_041655_243922_1F0159C7 
X-CRM114-Status: GOOD (  13.91  )
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

On Mon, 22 Jul 2024 08:53:29 +0200, Alexandre Mergnat wrote:
> This serie aim to add the following audio support for the Genio 350-evk:
> - Playback
>   - 2ch Headset Jack (Earphone)
>   - 1ch Line-out Jack (Speaker)
>   - 8ch HDMI Tx
> - Capture
>   - 1ch DMIC (On-board Digital Microphone)
>   - 1ch AMIC (On-board Analogic Microphone)
>   - 1ch Headset Jack (External Analogic Microphone)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
        commit: ceb3ca2876243e3ea02f78b3d488b1f2d734de49
[02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
        commit: 76d80dcdd55f70b28930edb97b96ee375e1cce5a
[03/16] dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
        commit: 761cab667898d86c04867948f1b7aec1090be796
[04/16] ASoC: mediatek: mt8365: Add common header
        commit: 38c7c9ddc74033406461d64e541bbc8268e77f73
[05/16] ASoC: mediatek: mt8365: Add audio clock control support
        commit: ef307b40b7f0042d54f020bccb3e728ced292282
[06/16] ASoC: mediatek: mt8365: Add I2S DAI support
        commit: 402bbb13a195caa83b3279ebecdabfb11ddee084
[07/16] ASoC: mediatek: mt8365: Add ADDA DAI support
        commit: 7c58c88e524180e8439acdfc44872325e7f6d33d
[08/16] ASoC: mediatek: mt8365: Add DMIC DAI support
        commit: 1c50ec75ce6c0c6b5736499393e522f73e19d0cf
[09/16] ASoC: mediatek: mt8365: Add PCM DAI support
        commit: 5097c0c8634d703e3c59cfb89831b7db9dc46339
[10/16] ASoc: mediatek: mt8365: Add a specific soundcard for EVK
        commit: 1bf6dbd75f7603dd026660bebf324f812200dc1b
[11/16] ASoC: mediatek: mt8365: Add the AFE driver support
        commit: e1991d102bc2abb32331c462f8f3e77059c69578
[12/16] ASoC: codecs: add MT6357 support
        (no commit info)
[13/16] ASoC: mediatek: Add MT8365 support
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


