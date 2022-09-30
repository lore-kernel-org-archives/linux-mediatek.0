Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485B4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pE1xT0Jt/xnuNeGgLORmNJ255mPzgiZ61ewFEalF9wE=; b=kgD3VA6R8oYA0vqh8LtgmoVgkG
	tZaegI3T8T2fx5LTMdiRxHmw2r1E+/tg6fwvEWm8nyxeqZ/lUF7cCp6AZHhvzTNRRDS7yqLGlWh28
	pxMIco935HpW3Lhc05V3Bgse36pSYMh8KNlXIjcHiq3Nsp+VuVEWnLoDOBsipeXeoa4bpFSpe4oWv
	idTfNCxEFW1EUEajP83hNz7SVT7mS4bwPkwuGiH8/sBFOK7aVMjByAANxrEdL0p0C0y8iL/PAGl0W
	gu549VinoRgTZcrjHaZWNchRBSIx7qPvsl4QCe6rk+k7jGJmSAt0v7s51pPCJsOQXp/c+3U9qATu5
	krYkbpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeDLG-008c7V-NN; Fri, 30 Sep 2022 10:34:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeDL6-008c4s-CJ; Fri, 30 Sep 2022 10:33:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A01466222B;
	Fri, 30 Sep 2022 10:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA7FC433C1;
	Fri, 30 Sep 2022 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664534031;
	bh=0X3E+aPWputC4RRQGG3fy3Z4J+gXjer7t+Iz6mKE8MY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=miPRh/4Ev5GjJcFQskAKTih6sZnHx5DXHx+D0MB7YLVHLqslzLM4Q2TSezOZJysRF
	 syIY9FpaCy3YZeDb93+RJEr2N4shFAWiiHUb2f9oQF0v0AtC4UNwArHot8UBou4Eeu
	 E6nWvblbC0jhiPd/E4ko48EuDLij+86NjGXw72a4Qwu2Li5uLmGjxHIi4J9Gp/Sc27
	 sJi4qMDTrAUp4En1jTjokMOtNER8DAYPTmD4LLvNWZ2RTT/6QIJJ6c47v3dwOlxg/v
	 s4Gbe/PYJ+YzPNpXtlhuS2TD/BG/sx5obqxFMaMPylFkELAh+e8AHHQCtby2BldfdX
	 APoRlYJAL4Z4A==
From: Mark Brown <broonie@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Miaoqian Lin <linmq006@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, Tzung-Bi Shih <tzungbi@google.com>, Takashi Iwai <tiwai@suse.com>,
 linux-mediatek@lists.infradead.org
In-Reply-To: <20220929205453.1144142-1-nfraprado@collabora.com>
References: <20220929205453.1144142-1-nfraprado@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192-mt6359: Set the driver name for the card
Message-Id: <166453402795.109056.12992219800008251777.b4-ty@kernel.org>
Date: Fri, 30 Sep 2022 11:33:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_033352_478797_9EA4CA43 
X-CRM114-Status: GOOD (  16.54  )
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

On Thu, 29 Sep 2022 16:54:53 -0400, Nícolas F. R. A. Prado wrote:
> The ASoC core automatically populates the driver name field in the card
> from the card name if left unset. However, since the driver name can be
> at most 16 characters long, wrapping will happen if the card name is
> longer, which is the case for the mt8192-mt6359 driver.
> 
> Explicitly set the driver name for the card in order to avoid said
> wrapping and have a readable driver name exposed to userspace.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192-mt6359: Set the driver name for the card
      commit: 4674284aa74cfc6db0c54c16f9557ed8c3552409

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

