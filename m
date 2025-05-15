Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F47C54754
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 14:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bD5sRhy1xw93X63INS607oitEmmEFkgPcQYf1Qj7p+Y=; b=TWbcMptqIXj4UXPGcMv/PtpiGm
	ZbPKLJUvV/D0QjVdF9cBmBrPgCU1W+p4VeCj+LBRuAc8Pw51A/i7nvRdXvZe66PQFMpAXJB8H50+d
	EJCHFtF0oc446ipRsFfafn6XjPnxacwM6mHxCKO9sGR6Cv2k2WoD0NMTqt5OjMT2k6nQh3vaCJChz
	y9wb4DuSWOs3xUoBZmSFNHzJgUnA0u4zTYbo/D9h2d21WWlV6Cy2v4L2iCXu2KcenXQNLaTTko9fr
	YFzilLRY8AkQzkqB4H0E6wG66p78B2GmytdWglyYE0utuXscUKBYp6QdxD7gI+vDXQOFH4ecm/S2a
	0JqIkfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZhz-00000000u9Y-3Mrh;
	Thu, 15 May 2025 14:37:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZVi-00000000sON-3urs
	for linux-mediatek@lists.infradead.org;
	Thu, 15 May 2025 14:24:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11466614BC;
	Thu, 15 May 2025 14:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25393C4CEE7;
	Thu, 15 May 2025 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747319073;
	bh=YeiOfXX6SYoNVeYhSe2fFoez/4867S6g/UJ2uYpEv/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LpNcyritQ3NECd/Y0i1QR9KDvuYmyvvnPUA7Lmz2EgbZluW+PhjMT5W3Ki8rczIFy
	 cdrd6x8mD/RawpEx14RMUeFNzk9qCVVoQJ9TgxZ2kh8W3/G0ExoF3w3xIXIFQvzi/d
	 zl+MG2r4pPeqda3Dct4uC2lLtlCmY8FmmpIenStv83ni+QsboazyX8eJduM0xWtQnl
	 DqSPtH0C5CDh7kP5x/Eczm+lAadWTyDlicP5Qh+hUSFDaXxgWkRmi8SIOYjix89dRJ
	 1liZriIs5LVh6hYvSkiOpwWEnlXqsw/Gr8EmqWFKa3MJ7nWSqvaW0puk6hm5QLWCDr
	 E8p72wwBKz5Kw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Darren Ye <darren.ye@mediatek.com>
In-Reply-To: <20250425082551.1467042-1-wenst@chromium.org>
References: <20250425082551.1467042-1-wenst@chromium.org>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source
 code
Message-Id: <174731906955.355366.5967151829535099714.b4-ty@kernel.org>
Date: Thu, 15 May 2025 16:24:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
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

On Fri, 25 Apr 2025 16:25:47 +0800, Chen-Yu Tsai wrote:
> This series is meant as an example on how to use macros and range cases
> to shorten the MediaTek audio frontend drivers. The drivers have large
> tables describing the registers and register fields for every supported
> audio DMA interface. (Some are actually skipped!) There's a lot of
> duplication which can be eliminated using macros. This should serve as
> a reference for the MT8196 AFE driver that I had commented on.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
      commit: 91c2685430f217ae8f2866e4372948eaf123b5c4
[2/3] ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
      commit: 0be889823f93429dab396cb7ac061d02046bd962
[3/3] ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()
      commit: 29552dcc044a233be84ab9b64539fdc7d8f4314e

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


