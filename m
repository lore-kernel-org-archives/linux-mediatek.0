Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BD5C38A2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 19:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XL1Yh8qNWHb+QXDOVHveDQwjmMefg/hx9d1xznUtfNk=; b=ZaX75zImFZ5YrwfDyvogcuvHVn
	ah/FI40UnyNVmpRtO8aE8Ig6xZgQvb9e2vAqR6fKdhkOdU77LIhVxNzsXbmGykpPudm2nTQrbxPSD
	VMnz1JH1YMq9VhUKNRgdIXrfLADKwde7Vw00x6FEXFrXoEg3kVvaVzSl8eRsZJqWWY3VozTKYKzoN
	bHaHDtBN09TThJBVgJqovGS2bDpU7SZhlrbWqJIMafb5zKCaD63lbR/OH3h3+QKUgxs7l0kskWgkP
	qlIc4rIExqfZzv4QUdKKhk1ALl/GhW7YrQP+Bjx1GznpC/PaHP1rbXaIGJ8fcZyI+Q1zGC9CTbEmN
	FBX1tI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onlu8-00Ajtm-OG; Wed, 26 Oct 2022 19:17:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onlhc-00AfGF-0Y; Wed, 26 Oct 2022 19:04:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 88A6EB8241D;
	Wed, 26 Oct 2022 19:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6D4C433C1;
	Wed, 26 Oct 2022 19:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666811073;
	bh=Rbn89WhWEbhJuX5225g1SZSIWz53Ni7UUmS8FPZYaIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dbJTMmFVz+Q8+h9P3Lb5piXFPbmJcgqly3Af5Xv5f3adQnppBIY1iXmip9TUT4rdb
	 we/EEY9LIqhI70r/A79oUeMrsI18AtXD+XGiIpVCK+Un0G/VafPsleEpXKlyyH8ZQw
	 SEm6UmfJLJNbKh2WNHt/hQKdhqaeuGL0nxiwE4i4heYjcr+xFmboKHkI8KdYBkKKUY
	 kLB59ARgoTt8pc+vuGmtoiHxGjxeaUPj/DD09Y6DfPZNDEWbXnxt+AUVtaavSvFB9U
	 +bxKBLXxLqNyzBdzmmS5OWwnL/a5q2e15qMlaErZ26/Bq5PFQuXR6quhPF/DMijNpv
	 BJh9iDn3KPnKA==
From: Mark Brown <broonie@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, alsa-devel@alsa-project.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Shane Chien <shane.chien@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20221024230658.1772907-1-nfraprado@collabora.com>
References: <20221024230658.1772907-1-nfraprado@collabora.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mt8192-mt6359: Set maxItems, not type, for sound-dai
Message-Id: <166681107036.960840.8469668580584323500.b4-ty@kernel.org>
Date: Wed, 26 Oct 2022 20:04:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_120436_233698_36DDCDF8 
X-CRM114-Status: GOOD (  16.06  )
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

On Mon, 24 Oct 2022 19:06:57 -0400, Nícolas F. R. A. Prado wrote:
> sound-dai is a standard property whose type is already set to
> phandle-array by sound-dai.yaml, so there's no need to set it (and
> wrongly so for headset-codec) in this binding. What should be set
> however is the maximum number of items, which for headset-codec should
> be 1.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mt8192-mt6359: Set maxItems, not type, for sound-dai
      commit: 555e6f573a0a08b66b9543a0e098c5d6adf8e8af

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

