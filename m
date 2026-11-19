Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197EC60A2602
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=49iitWWY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UxVlEIuu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Zl7t7lboEbloIJd8RC5C7tK+W7frU5FjFtsG+nus5oQ=; b=49iitWWYpwh0wT
	eY13vQEV0XqQEu7QT/S4RcWcq2Iv7YIvWHsHBrJmh3ZTVpaQ6l36pPqjEOz6Fdv8MKHzB9DiVuaeY
	RfRoZfOQQUQUYx8N+kUmvRqdZQ0yILaYvwj0ikLmSlSKAVFD6ScXJLHVuASTzaZtKyFTW+A9Ooclw
	Zaq3EZbUEg5uT/AbjRwR/rGmaZdDLS44vrQOP4r2zNsq1Tjz/fNvaP8E3eJWivksKBhP1j7yZ3i3b
	lllGdekFKthXqP7EdPSKmQ6MujX3zuwGDmaDBNO1snmnVhNoN5N8I4svnM0qO+U//ha8Osp1nEwGJ
	nclwjKRPukjiZm19udYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNH7-0000000Etqy-33mm;
	Fri, 20 Nov 2026 11:59:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNH5-0000000EtqQ-1gmO;
	Fri, 20 Nov 2026 11:59:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FE05435A1;
	Fri, 20 Nov 2026 11:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BFE1F000CA;
	Fri, 20 Nov 2026 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175966;
	bh=Zl7t7lboEbloIJd8RC5C7tK+W7frU5FjFtsG+nus5oQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UxVlEIuuoAJcnkkJUJPDVcOFwrOWksIH8ocQBmhEnGyOrvgW/9Iuxj/uZ8FN+xoRq
	 0l7xiSt4FzfKbBXc6jvSkiOQpan4OIMIA+ylosWOxFjnU5FnAMfD0CbYgYnQY+LK/b
	 WlnBOWZxghmzfxnL/Ee0bHaE7oFICt5jeyyV0Im8z1sKSz/CZdtvyJc+Y5RDPaAHPF
	 LZxaT7VfNZtlwEwJacLsYF6ePLfUsLgkPVIhcBtBUYRgNaFjvDZWf1LxVm7MJhFFXt
	 VNkj9ziU/PDu40egH0I3rWKdR4h4voz52OjFu9uZU6kou/GXZ4k9D7XQ8tH1x3gU8o
	 BsabpuYI5WrzQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Myeonghun Pak <mhun512@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <179428456134.51374.1588994696516825613.mt2701-v2@gmail.com>
References: <179428456134.51374.1588994696516825613.mt2701-v2@gmail.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt2701: initialize IRQ dependencies
 before requesting it
Message-Id: <179509485455.116416.13262712760345484261.b4-ty@b4>
Date: Thu, 19 Nov 2026 13:27:34 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+XN/1qvarpNKiz7da+Lam/9r+iuEq9PEpy/kgh2Ro/k=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZzKQ2Jvo+UzRZ+ClSZK+7BZ+uhGCR2m7xypvWftELx
 VweZrl0lLIwiHExyIopssRlcb+sL3m9hu/gwjaYOaxMIEMYuDgFYCLJ1xj+mSu8zxDtd9p5jM1U
 kiXp1dFp5Txv1xhfusfB0/1Cad6PGob/sTb7bqSwZUT9NPf6z+p49khoc4Lgjbsr/FWrbG/yHNZ
 kBwA=
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 09 Nov 2026 23:23:21 -0500, Myeonghun Pak wrote:
> ASoC: mediatek: mt2701: initialize IRQ dependencies before requesting it

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: mediatek: mt2701: initialize IRQ dependencies before requesting it
      https://git.kernel.org/broonie/sound/c/5649b1d4835f

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


