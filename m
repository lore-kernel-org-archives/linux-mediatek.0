Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1052CD3431
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiwbzPK22pU5AX+O6hCyIPiAI54csNgeo/YNv3wD5J4=; b=L38sGeNbOxuYVvW8pFVwFuY6yd
	Ej9Q+aNuWjr6dAQDlFKOSraVeYai7lY07XScxDMHkDeyae5tb4Zv3R9fQd2ctjQXyzivlpEpDBLXI
	q8yokYN8BplkHvWLp5honTP8sKl/cgi7LD3oFAg/Nck5OiWCH/mAeQXSVrECnouaY3Nw14k27++6l
	oBmU0Tz5djduWkoPBNBTOVcEaZKubTvnQg70h2PQDLAgtRPrrtV8mykqXtBLHK/M/zO+qbkrccyf8
	BOiansHXf7k/6JpjengD03h+j7SZG7xXNd39rMV3DZjvZMdnO8Sh7IViEqyGyFCGanncq2W579Zof
	BDdECrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sloBB-000000048SO-1JSv;
	Wed, 04 Sep 2024 11:28:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slo0D-000000045FC-0fhj;
	Wed, 04 Sep 2024 11:16:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F13245C56F5;
	Wed,  4 Sep 2024 11:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3A8C4CECC;
	Wed,  4 Sep 2024 11:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725448604;
	bh=jnoKCbmPcD1GmESgYWHnWAC+C8551B8aEwnlyDgxp3c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KjHlMtPnOpovnTl90GfKpIuPGs+gwJYi/h9SpXSQSXUdkrLC8x059cyHOUCTVcQOD
	 Eqr9oJu5zIZad+ON1Qmc3Db1zhARkcfmANz8S72acVTG2+sXIuoCP+UGzxD6lMqVxL
	 A344eGn47au8ya+z4zXlx1unlRaMD2HS3bXc2HkfL0x0sLRhbFUWjvxrIfFFXtxORU
	 4qAl+rFufzT6CVtExWQQ+WK9KnpnQZorBxF7zoVKjz+50bzQv32m+7xqpJef5BXpXq
	 p0i1jr9DGm3zmP/+0sQ9VrwCcFGTJnLAvroMUo6N0mCMOO9W5uEmSP7bYwNYcVHMjW
	 LgHv2DTwNjySA==
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
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
Subject: Re: (subset) [PATCH v6 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-Id: <172544859867.19172.9438630691561948517.b4-ty@kernel.org>
Date: Wed, 04 Sep 2024 12:16:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_041645_338875_2CFA55E1 
X-CRM114-Status: GOOD (  13.76  )
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

On Wed, 19 Jun 2024 16:46:36 +0200, Alexandre Mergnat wrote:
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


