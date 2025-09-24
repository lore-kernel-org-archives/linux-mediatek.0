Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78393CAC5AE
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FZtn+5ryL09ikcdJ6Z6VZxQJm2u5G2qn03QgVTm+3M=; b=BbBf6u5300MD/0BBdXb8QREDA6
	hHAJcwAkl6nYgufVF2Dqtnq5qQRCFGFScJ6BfEfbjvoA65yNY9LKRy3W2WyX7rL4lGR2Zm4H4m+I8
	FFkfZeaPrSzd1mRWBOKbfKdR65Rp1s+oWNbUtkhkYsd3qRSkjgJaiz0bCiEulC1CoFIcnD1ECzIoA
	UOZ6Ph+YCOyRZb3AnuXxPICWJQekYFK4FI3UyzvHpKUlziyz/a3idfPuuzSgx5tiw6uznDMKOM9Ny
	1MBrVrOB3nEvfkcPAaITmeG9GD4B/8cb17VaRPf2ihkt0BQxs2sdw7Nzq2dKWIUuvD/Uo2A3Ht520
	TTKO4MOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Q6k-00000000T3D-1wRn;
	Wed, 24 Sep 2025 14:04:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Q6i-00000000T27-38Do;
	Wed, 24 Sep 2025 14:04:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D09D60191;
	Wed, 24 Sep 2025 14:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF83C4CEF4;
	Wed, 24 Sep 2025 14:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758722671;
	bh=C0dwQH0lvkoovYckC7Dh3gPsVdizym4Fy3oXd1r+BM0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YM9WnQK+AJr/ajVZrg+1NUcxowpn3XbMi9WKFggm4MSi6Cy0Zzouy3LOjqj5gI0Dm
	 vogvFe0FXq/b6yw6FPPkamHXmeC4QZ8QnA6RusKwGzsyRXWM/mN4WmIWuy1AQctIKe
	 GoPwnM+j9hdS51BkjxdkksOPLhvoO3Mufy/SZaoZUJl/fzOkWsWTVjjaodoStG0dFA
	 XTIaTaWVHA8hExTQpv8v+1ibJkwDCa/XqCCGbqbvCCd7gQ2tss1I4cN0GTF7KXsb9M
	 rJ6aSH3wRt+zcfg0btve3j5IbgDWrUYJj0Ko/TpO+guNf/ElWH0zgPstnJjCAkp5eq
	 pEPjFvJ+T/P7Q==
From: Mark Brown <broonie@kernel.org>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Julien Massot <jmassot@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Julien Massot <julien.massot@collabora.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
Subject: Re: (subset) [PATCH v3 0/6] MediaTek devicetree/bindings warnings
 sanitization second round
Message-Id: <175872266654.1250098.18318654970419425506.b4-ty@kernel.org>
Date: Wed, 24 Sep 2025 16:04:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a
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

On Tue, 26 Aug 2025 09:39:33 +0200, Julien Massot wrote:
> This patch series continues the effort to address Device Tree validation
> warnings for MediaTek platforms, with a focus on MT8183. It follows the
> initial cleanup series by Angelo
> (https://www.spinics.net/lists/kernel/msg5780177.html).
> 
> The patches in this set eliminate several of the remaining warnings by
> improving or converting DT bindings to DT schema, adding missing properties,
> and updating device tree files accordingly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/6] ASoC: dt-binding: Convert mt8183-afe-pcm to dt-schema
      commit: 52aefc1e3c5fbdfdd216796fbe78443ae67e447f
[5/6] dt-bindings: sound: Convert MT8183 DA7219 sound card to DT schema
      commit: cf5be90ee4dfa3c38dc64fbcc4fb70fa0180b7b7
[6/6] ASoC: dt-binding: Convert MediaTek mt8183-mt6358 to DT schema
      commit: 82fd5dc99d63f948c59ac3b08137ef49125938bc

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


