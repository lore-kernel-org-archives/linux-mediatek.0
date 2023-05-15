Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5384AC77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9agHu0fY5lqi9eOcL0ZwZO6ExlJumYrStfpnyOLFzVc=; b=BxraKK5e3tvyRijjwqjfw3JNrv
	bXCD9Flgf14cydYpQHsm+1HV73bWm9kU/kTXce/+rnKw9e0NQhl7JxR+a2DEaiwTP80KsYncicWJU
	Vy0vRAyBNjcd68vsH4lSPBWX65dR7gMJ4dCqH3hkYTkDaWwm6rcnfZ814KmUGN7T+o9vL63eB90va
	ORkDQEH/5gW1+b9TrWExfTX80EwDrnwH3wfvP7cbw6G62WQv0ufNo3kIiM/UU4G6dJOxMzFu6A1GO
	X6u74WqBa2C9xRc6+mRgPql1NFO/pioL+kSeqSEGkW+DODlAT9A0BmgZQcAkHdXX5SQTdxBiEMqqn
	vw5t8Lzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyW5P-001vvl-0o;
	Mon, 15 May 2023 11:09:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyW5L-001vv0-30;
	Mon, 15 May 2023 11:09:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5FB6615FE;
	Mon, 15 May 2023 11:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A94DC4339B;
	Mon, 15 May 2023 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684148985;
	bh=KEaOEqbRtYhzunYdC2/oNS4bINLreQCjokum/W9ombs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I8kWKmCNSXJxEyQqVg5SyQHpH0m6kt/oPeTkr5WHFdQibKL4IrlR3tVsoEkyccdS9
	 8nrWB5hkWxU88g7ywkEs0FmweXvOOmYIrxmKx0nFNmwOmrGWISiXh4EWzwz/faVwZN
	 8Bcu2ODWp6SpfNfFz9zecTt9GpgH4UsaeCfnPELleQ6vxk6U1USEF2iyPONES74/H4
	 wGyixTNp+Qw561VRilHClaTznFAI7OnuwH6kKJpgsy0pNkR7ooAUHK3knKZuizycvL
	 m2JM3R6KYK7mbf49YcYkNa1pgwjp7HKnNMin0wMojjXsIUxDcgv+q8clEc5dCZ4k9F
	 ddeTkSqy3XADA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunxu Li <chunxu.li@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20230511092437.1.I31cceffc8c45bb1af16eb613e197b3df92cdc19e@changeid>
References: <20230511092437.1.I31cceffc8c45bb1af16eb613e197b3df92cdc19e@changeid>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Fix use-after-free in driver
 remove path
Message-Id: <168414898289.394037.12962945078412931473.b4-ty@kernel.org>
Date: Mon, 15 May 2023 20:09:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_040948_007547_CC843C17 
X-CRM114-Status: GOOD (  17.56  )
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

On Thu, 11 May 2023 09:25:12 -0700, Douglas Anderson wrote:
> When devm runs function in the "remove" path for a device it runs them
> in the reverse order. That means that if you have parts of your driver
> that aren't using devm or are using "roll your own" devm w/
> devm_add_action_or_reset() you need to keep that in mind.
> 
> The mt8186 audio driver didn't quite get this right. Specifically, in
> mt8186_init_clock() it called mt8186_audsys_clk_register() and then
> went on to call a bunch of other devm function. The caller of
> mt8186_init_clock() used devm_add_action_or_reset() to call
> mt8186_deinit_clock() but, because of the intervening devm functions,
> the order was wrong.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Fix use-after-free in driver remove path
      commit: a93d2afd3f77a7331271a0f25c6a11003db69b3c

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


