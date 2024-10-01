Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39C6CE7D0D
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wE3PNd4GJjrnxPAACrb/9NGjqmQbsGTGy62/TduUOpE=; b=o/WOZXk4AmWQuFlHH7EWq604dD
	9xpu+b40qcGTI/P7Tb7BvKqSpYP/BnJQ7KQguKubJZXn2Pg0ytK5G52zun3VMtbZUFbg48hNABtw5
	YnG6yJ0lt8QZoxP6j4xZ65k3FS32toKUFqlqJYHI//vXH1vPn4iZNV2E26ZirALJy2esa5FMwU7rg
	2iL5VxdrD3QPyUEqiLc5rD44cJO8JHBLzuYoS8/iNkCcGen8RMdwkGeeKjmfWKJyAUqvLk4d3vyvH
	t3/qCsvo4uwgccJojKI3p/mj6cXGjv/xpY7DBQSBaVePMvizPly3AlcJC5j8zDiyx0tkwxmx89dzg
	OtfCft8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svaqJ-00000002TlG-2oEh;
	Tue, 01 Oct 2024 11:14:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svap3-00000002TQG-1BvX;
	Tue, 01 Oct 2024 11:13:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E072AA43510;
	Tue,  1 Oct 2024 11:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7155BC4CEC6;
	Tue,  1 Oct 2024 11:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727781219;
	bh=lPXeZRkpEt7WUNU5nhjY9mrKHBjxiap39LWea4BKxgs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IFB+tdt/AemK7nQqXrUKwZYq+L4x21aly2yUZSuYAQAJSKUZzP016t+duHpsHoSXf
	 sEvoKWeBd638UgUts56fr7MXm/nA9wljMhwy0+Ds4+HSdaARjLz/hApBviIjgVrJC+
	 FGPZmfZqfaCyC8ewyW865LrK3CGWPWwyMFDLZxUoTnjkqbNK7XC1gmpVJomGJpQxxK
	 KtdjjYNDCBxF1EQFD7tBoIs4iwiWe6iRv83RAXwapoH6Mwf8Qa7Ndi3ZFzHuhpVf8a
	 JwO5t1QryHCADLTMqpQk7SOxQAp+LnKouwmPKkU8MkRVxzh9gD58DY85WJe+9Z4kgR
	 KXMsWQYQJc/Ew==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <20240930075451.14196-1-macpaul.lin@mediatek.com>
References: <20240930075451.14196-1-macpaul.lin@mediatek.com>
Subject: Re: (subset) [PATCH v2 1/2] ASoC: dt-bindings: mt6359: Update
 generic node name and dmic-mode
Message-Id: <172778121572.2280749.3048462139330835631.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 12:13:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_041341_420392_31A0AF34 
X-CRM114-Status: GOOD (  13.27  )
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

On Mon, 30 Sep 2024 15:54:50 +0800, Macpaul Lin wrote:
> Some fix and updates in the following items:
> 1. examples:
>    Update generic node name to 'audio-codec' to comply with the
>    coming change in 'mt6359.dtsi'. This change is necessary to fix the
>    dtbs_check error:
>    pmic: 'mt6359codec' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: mt6359: Update generic node name and dmic-mode
      commit: 4649cbd97fdae5069e9a71cd7669b62b90e03669

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


