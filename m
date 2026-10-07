Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C45ECA600B
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 12:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZHgvot9XBR6NDc7d2O3La8Sy9kro5TUOFUC8aNnoG0=; b=dHXAgZW92aPWZvYi6t2s+mIrZO
	izX1QUCGMK3rFwZ/PzfY+Pj/Kpjeqi0wPCfKYTJhM0WsLIeK+8h7fvUFdOwDoAMggwON42JTGxU9h
	gYE7DAbSZcKZEwzXgeVLES+Rl6WcOXBXiv9yIxDc0MHPkPQ/7p442EOD5tM4hqzsaFtNGacbeeOuR
	SFHF5jN6Coq3Fr6sDBNmhCQQSvMLKvkTiUTAhDreFwoi+8m8/yuRY78TL4AbASQ1Y7I9ofypi9Mtt
	13j8w4Cv0RlUzhcXwrYqby77edONgvoO2KZUAOIrW+CYqlImbPqFcVan6N6uVmq4GJCejLojH+rM6
	0gbWjUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnR2-00000004Nff-1jtb;
	Thu, 08 Oct 2026 12:41:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnR0-00000004NfO-2Hrj;
	Thu, 08 Oct 2026 12:41:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E96CD41A68;
	Thu,  8 Oct 2026 12:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AD81F00893;
	Thu,  8 Oct 2026 12:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791463277;
	bh=tZHgvot9XBR6NDc7d2O3La8Sy9kro5TUOFUC8aNnoG0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HDEhTpZZ6Ki0QKgJWh1sFFKBgqbKYoVJSWGWHgrHE48O8aKf1aBLavbl4dtrHiX4s
	 co0a7Tg7igbIDeaHR+6kBeCzyW1i81CjMQBsRrrfWvTxegUskgGRQYYmc5Jub8GHez
	 QQvpqWUOalJPBN7GMzQZZYvDnSnApcXI+hS3ItYjUJaQgihX/b9/SDnZ3sMDdjQJwP
	 5CtHZ+dmROCZNCjIlb93PZDYpKLGV2NmWxFGzqWG5lFA6McOfFLHeACA2/4OqWibxM
	 jb/lVsyunUQkulu5N1PQ1SEY548tETp36fIqHEmAi2AVKfXBoDw/hv+7qnINpSHhgs
	 huaW9xcnz9x8w==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 cassiogabrielcontato@gmail.com, Haotian Zhang <vulab@iscas.ac.cn>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
 Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: mediatek: Handle constraint return value
 in FE startup
Message-Id: <179138999054.2423942.10212092263791353501.b4-ty@b4>
Date: Wed, 07 Oct 2026 18:19:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QY1B/YC/9U9/25uIL41mpvndoi/nxHgNpTP3ZhxQnAM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKO96cePxj5zcWdP2KJU6/bh/aeNrGQWcZnFykf3s+w7
 FhJRe3RjhIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEyEaxbDf8flor88Uh4aMP1e
 Z/720qbwgs/RDMu/8/bzXy9te7M5ezfDj8nl+t94tNdbcbXlhvSptN2tCrt05c+SpP4p91ozriq
 xAQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Wed, 07 Oct 2026 18:08:54 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: Handle constraint return value in FE startup
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> Some FE startup callbacks may return a positive value from constraint
> helpers, but ASoC expects 0 on success. This can cause .shutdown() to be
> skipped during rollback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: mediatek: common: Handle constraint return value in FE startup
      https://git.kernel.org/broonie/sound/c/5fcdb40a4776
[2/4] ASoC: mediatek: mt8188: Handle constraint return value in FE startup
      https://git.kernel.org/broonie/sound/c/71253751586b
[3/4] ASoC: mediatek: mt8189: Handle constraint return value in FE startup
      https://git.kernel.org/broonie/sound/c/1f234d33e42e
[4/4] ASoC: mediatek: mt8365: Handle constraint return value in FE startup
      https://git.kernel.org/broonie/sound/c/8de3f4e8e811

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


