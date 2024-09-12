Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EACAEED60D
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 14:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdG0/FFYiQLN6E5NF0Gm/tc3qD/WfTcboQgDt/J6TO8=; b=Zrgnet4vtNe4+XP+a9JrJ+amlD
	6+7C1JpxAjjiFMzQT7aa3+zOaYMwh9w5ihR7Q8P1GjGDWlC+pygEHGaDom/HevolM+M9uxdZX2G+0
	pZbGEtJZ5g3iAPwYQnJkdflyYor8zhCn3Izh3LW0gOsTVxY25D2hxgYBNzquw7/XktqTYn4QO1z8v
	NPdS3wndbQUt7T/sGUQgRYWWxMnuLm7VM4eDVQlf5/+6PcFOIDq0kFM0b6PS5aHtPPRF70A5YRWEF
	nvt58UHkSjJ1Hy+xbJWyIzkWpHLUcxO63TAap/o2NpN3PhPFbTvH+bNOanlFQBu/WTTdXvLHksEdq
	nJDOY14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1solBC-0000000DRSe-16qo;
	Thu, 12 Sep 2024 14:52:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1solA5-0000000DRD3-48vY;
	Thu, 12 Sep 2024 14:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60A815C5B77;
	Thu, 12 Sep 2024 14:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84085C4CEC3;
	Thu, 12 Sep 2024 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726152668;
	bh=YzlriyEKn+i3JtEOOQGPkP98c79C4k//CQThjLlVVc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HrxG7s+4gt4QkbKM94COqUg/lsJfAnNxvZG4sakPtakRVd8xz6ynsRhLd72JCnXPg
	 QAzGWtP+eCsqYPIzj1wR02E4WW9qULYbKYk0+WGJ2u6/fe/JHnp/VOVtXzohpkQn4h
	 oa/Du/8mrhank/o0dL7v71V05rNZvL+1swetRDqm18bfFB2dfPuaEVuADcW2uOO7+v
	 IZiwkqPeN1hPhQRce4OF5+y3kjru3mbfQY0tleSF0kq/09kfYfowjzt+IPiGVxWtmw
	 CXYmCQ7oJGZ58rITCVxchFy4RaxlEEOwJZz2bLV6SqlkJOpJo84iIFqAoibzyjo5bA
	 MapFVCGcHYUkw==
Date: Thu, 12 Sep 2024 15:51:00 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-ID: <20240912145100.GE24460@google.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_075110_181047_50C6DB7D 
X-CRM114-Status: GOOD (  22.21  )
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

On Wed, 04 Sep 2024, Mark Brown wrote:

> On Mon, 22 Jul 2024 08:53:29 +0200, Alexandre Mergnat wrote:
> > This serie aim to add the following audio support for the Genio 350-evk:
> > - Playback
> >   - 2ch Headset Jack (Earphone)
> >   - 1ch Line-out Jack (Speaker)
> >   - 8ch HDMI Tx
> > - Capture
> >   - 1ch DMIC (On-board Digital Microphone)
> >   - 1ch AMIC (On-board Analogic Microphone)
> >   - 1ch Headset Jack (External Analogic Microphone)
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [01/16] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
>         commit: ceb3ca2876243e3ea02f78b3d488b1f2d734de49
> [02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
>         commit: 76d80dcdd55f70b28930edb97b96ee375e1cce5a
> [03/16] dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
>         commit: 761cab667898d86c04867948f1b7aec1090be796

Did you mean to hoover this up?

> [04/16] ASoC: mediatek: mt8365: Add common header
>         commit: 38c7c9ddc74033406461d64e541bbc8268e77f73
> [05/16] ASoC: mediatek: mt8365: Add audio clock control support
>         commit: ef307b40b7f0042d54f020bccb3e728ced292282
> [06/16] ASoC: mediatek: mt8365: Add I2S DAI support
>         commit: 402bbb13a195caa83b3279ebecdabfb11ddee084
> [07/16] ASoC: mediatek: mt8365: Add ADDA DAI support
>         commit: 7c58c88e524180e8439acdfc44872325e7f6d33d
> [08/16] ASoC: mediatek: mt8365: Add DMIC DAI support
>         commit: 1c50ec75ce6c0c6b5736499393e522f73e19d0cf
> [09/16] ASoC: mediatek: mt8365: Add PCM DAI support
>         commit: 5097c0c8634d703e3c59cfb89831b7db9dc46339
> [10/16] ASoc: mediatek: mt8365: Add a specific soundcard for EVK
>         commit: 1bf6dbd75f7603dd026660bebf324f812200dc1b
> [11/16] ASoC: mediatek: mt8365: Add the AFE driver support
>         commit: e1991d102bc2abb32331c462f8f3e77059c69578
> [12/16] ASoC: codecs: add MT6357 support
>         (no commit info)
> [13/16] ASoC: mediatek: Add MT8365 support
>         (no commit info)
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 

-- 
Lee Jones [李琼斯]

