Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE04C30653
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+aviNRkqeX7JS/mEc2U0zWlglVdSVXY2q1re2NPCc4=; b=3RObkO7dmSuhLReXar+iPiBgDK
	1BseQ6UXSeoGbJuhBT5/JdYh1rNl18lSisXGpRk6QN2D7nkd5i1iMf5YbWCNE1bNgic5100MHiHBL
	LqSaj6JxihKirM65S7uN0ugK+Fh5fNXWyDoULWXQJlJWrZrkz/rNvpLzA+Tgdf+4yIO3t8YktH9Sx
	hzar13fFtNGNFr9FZH0k9KfR4kcFyf/jlKvFWS9FsXZwIt28+C45TOxe55CVsk0tXhXhCJPhKUBXo
	E9OyX7TmmmBmJFoJ5YOyrbD+qLM2yYLZOxj8Q+uL4vp59bH/e4ZYrog1LnvmcOsH/duVY7hw5f8CP
	HrkA0fCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM4R1-00000002Yfl-2X4T;
	Tue, 25 Jun 2024 11:34:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM4Qy-00000002Ydq-18ey
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jun 2024 11:34:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A49D961356;
	Tue, 25 Jun 2024 11:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4387DC32781;
	Tue, 25 Jun 2024 11:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719315239;
	bh=POLNQtzyiFdfDZHg+15z+oQL9f1wyzLbbFrSGtcTas8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oROhn3xk6yl2yx3SWMZlu+wq2wf1jN9UjC/ac/ON/5I9jvMfhlJeiYrzhIGsjWyPi
	 27gsYWOjuiSZecuL1SnY7ToEtAkOJOLiMJS5ofAiDxazmczz9Ekz9Ls1PZQEVsv9vC
	 YchB2yMBu7/yIuzQvwrVWn2eFVLOolOdVGD1j/H+FFjqE6XORawNUwvvutTGCI3I+U
	 NN2WDyHHP8diGj4+UOs31O8gGlByJ91MbX1c05XHM7iuPb2JJxBmbRBuHBW3nXZsXM
	 96LAPF2wkfPsDFaJKy4gGG5uUztE6yDskTcuTroVu+yrbVS5kip3zbeEXykg71FFBD
	 EcUi6Hm9x7a8g==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240624061257.3115467-1-wenst@chromium.org>
References: <20240624061257.3115467-1-wenst@chromium.org>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8195: Add platform entry for
 ETDM1_OUT_BE dai link
Message-Id: <171931523799.64144.6880619543186232885.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 12:33:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_043400_440682_E409B2B1 
X-CRM114-Status: GOOD (  11.49  )
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

On Mon, 24 Jun 2024 14:12:56 +0800, Chen-Yu Tsai wrote:
> Commit e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component
> and rework codec link") removed the codec entry for the ETDM1_OUT_BE
> dai link entirely instead of replacing it with COMP_EMPTY(). This worked
> by accident as the remaining COMP_EMPTY() platform entry became the codec
> entry, and the platform entry became completely empty, effectively the
> same as COMP_DUMMY() since snd_soc_fill_dummy_dai() doesn't do anything
> for platform entries.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Add platform entry for ETDM1_OUT_BE dai link
      commit: 282a4482e198e03781c152c88aac8aa382ef9a55

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


