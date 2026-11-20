Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0B3606A334
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 15:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uZtTX/yF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V2SdLCLl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ihZfSgxIvjEMkXvmyda1NP7Q3LgCpF1cCr/6VrpGnao=; b=uZtTX/yF3vPD+H
	JwjIfe2Q7DGDKBdh0m9/lzluPoPtIyIK94h5z9wCWVlD8hS74A0erm5kNmrPDdMLfjIblUrg12Zc0
	92h/OWURxnu+ToopgiJhXgf8K5EXXBCSfDMibzcNQs9olD4v6pMqDzz5qUb4+J6iudyXTxRg7FnMr
	zmTg6zBzUr6UYN4XBdFvObbMYYiT09de9gEyBa8CyLfyQSofUSi4k7XOEueYnuTxOhP4CI6KM8RUs
	uO0jCgkHNnM9pB+Fh3pSGqoIBPf2gytg6Xc1BBctQDL35JKdZtOple5Rz2GOyNnZ5vnnS+9lvr95V
	FV9qwfY6HQ1IsMa5zFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQLA-0000000FNq4-2MTB;
	Fri, 20 Nov 2026 15:15:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQL9-0000000FNpe-0PO5;
	Fri, 20 Nov 2026 15:15:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D5DC457FA;
	Fri, 20 Nov 2026 15:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B771F000CA;
	Fri, 20 Nov 2026 15:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795187750;
	bh=ihZfSgxIvjEMkXvmyda1NP7Q3LgCpF1cCr/6VrpGnao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=V2SdLCLl+PH46TsluxaAncAdCSR9/8rtkneR5aa2+XVpBg2n7i5eN61n5cLrPCib7
	 Y1zs7LkeLUtQHrxcc20V7hPvUP9By06ovOk3iQTAmN7J3oH6MYzGl0HY05tTzkI+B9
	 u/9dKgxi4O6o0Yh380pbhyF1vPo1Zrf5PGADjiauViB+YF/jzuMERHVtnTX/bql5Gi
	 +1nUjCdWbZN56Z9I6mR55wZQkOhJnTdRQAJiICTpxYaLwdTX7LO1u+nmJjGRI2+jMd
	 Ze3CRwcUqYqb0MS134tJx0N4UrdoQh6Eya2Ye/HI88d1y8sofiW9rEoG95Q2alL72z
	 BzPxn460AJnUw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Myeonghun Pak <mhun512@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ijae Kim <ae878000@gmail.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
 Darren Ye <darren.ye@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 Trevor Wu <trevor.wu@mediatek.com>
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
Subject: Re: [PATCH v2 0/5] ASoC: mediatek: fix AFE IRQ registration and
 removal ordering
Message-Id: <179517904754.6016.16269615530838300307.b4-ty@b4>
Date: Fri, 20 Nov 2026 12:50:47 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dSDkHmfmCeNxORnUsZPpEUBtYzLsL2QTxwlCUj1j5No=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZUhRfLDdqKWWb3LEh1FVrp2l39H3BnQd6bWoPShsfn
 Lls+9Z1HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhIsScjwx+bYs4LHKEzxes+
 S92Pay44tVhO67TrulBDmRstCW8VnjL8r+p8UPu9RtY4RXbrMr6NlamTQhtecNl6Z6y6wp0qGfa
 HAQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 01:17:44 -0500, Myeonghun Pak wrote:
> ASoC: mediatek: fix AFE IRQ registration and removal ordering
> 
> This series fixes IRQ lifetime ordering in the MT8186, MT8188, MT8189,
> MT8195 and MT8196 AFE drivers.
> 
> Request each IRQ after regmap initialization so it is freed before
> the regmap. Where remove() shuts down the AFE, free the IRQ first.
> Also balance MT8186's IRQ wake setting.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/5] ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
      https://git.kernel.org/broonie/sound/c/420be55fe0e2
[2/5] ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
      https://git.kernel.org/broonie/sound/c/4f4067c2d110
[3/5] ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime
      https://git.kernel.org/broonie/sound/c/eb9a5be4c2c1
[4/5] ASoC: mediatek: mt8195: Keep the AFE IRQ within its resource lifetime
      https://git.kernel.org/broonie/sound/c/eac2ac34a18d
[5/5] ASoC: mediatek: mt8188: Keep the AFE IRQ within its resource lifetime
      https://git.kernel.org/broonie/sound/c/94d0e251e7d7

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


