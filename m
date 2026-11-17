Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6348606A33F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wbzy6sDB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpnSKYui
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wh+YK5GYBZZraDTZDEjxx9fOofeflJq8EylqEBbPVWU=; b=wbzy6sDBDKnMC/
	13MbhRpLmv6veS9FqEAD+B5hBGyJOjSps+jVu2W/9uLhSu2B5+gYrGWjESA+N9DLA2HXupheRzhlU
	8h04FOJYQ2vUvf79SKQCR3NHSfrqlx+DW2V67LJkCO9zvJFN+UD4w54RxG7SMW70FWitze91O/QzN
	ANj8Ud7+Qs17h6PvExjqExkTmFnty7NFVleOAeR8kYDc97iIM/+Re6SiW/89ArR4/M9mgix/GVAK8
	aW3gR1crvp538XnW7HLsGguDf8bn8XtM5YnjdwEPOHRk2pPXi40OFOYoPQikj8VwFgjaxtbgl0fN3
	H6+tk9lONfBv/zxKUHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMxH-00000006Ynd-1CbO;
	Tue, 17 Nov 2026 17:26:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMxG-00000006Yn7-3L7h;
	Tue, 17 Nov 2026 17:26:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 458AD45EFD;
	Tue, 17 Nov 2026 17:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0521F000C4;
	Tue, 17 Nov 2026 17:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936410;
	bh=Wh+YK5GYBZZraDTZDEjxx9fOofeflJq8EylqEBbPVWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KpnSKYuibRluIiM3G8ImpWk6psJ4i14a/8ojlwmASUjjpTXlSOBRoyPqJ7DZ4Lo+A
	 +x3BQUWH8SsFBDkSf7xSIfY5NGd37rdjM+Dy5WVKsjXVnRpsP7TEbpx+Yz/YeZUrjx
	 3zbVD8yLtdCyyUt1ByR58XjptFe90SLU0nskTQgVps+BaM4d9EKEDSexYiRyjMLDD8
	 u9sCmG0qxRFqeoTOXDndeAC7HUcELOPxgQFVl3zIa/W1TTbjwHnKtAeTW8SzjC5oxt
	 v1W4wHyv/CYOXuuUuQFVhdo0cYQfE4shmBf6TL9ThlmGPmG7TiSLi/fPXdsks4jHuD
	 0UA1JDdtZQrnw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 bui duc phuc <phucduc.bui@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
References: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup
 error
Message-Id: <179492904204.77896.2095522512320824302.b4-ty@b4>
Date: Tue, 17 Nov 2026 15:24:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ue80le/EfxT+oTQD+M3uJbCgfZW75OdtXgjrxJ1saAo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+9IWlNR/MdAs4dC2ILfiqfcU+yd6blx1eGR1YazWt+
 9yPizcud5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi60oYGdYun2Kjk19yTPfX
 9u+Zt/sKnvpz8ORKyiZ1LOe9tfpOozTDL2bRL/s4Hi2d84mf9eyKG/xKD84dqAjmZ/g+bXrT5EW
 mT9kA
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

On Thu, 12 Nov 2026 12:30:46 +0100, Louis-Alexis Eyraud wrote:
> ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error
      https://git.kernel.org/broonie/sound/c/1d1b67dcd40a

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


