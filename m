Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C813C83F1A
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 12:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Og5iHsAUGwBYbOa5EeBcRoJZBoJouGYLbv+qaUXL58Y=; b=ohzccLIkrJ6MGTJneQnJJxmhqt
	jFqqANFG6MEA27guBfS6F08Qb3tOHEGo2q/kJc5HiQ1wii37Js/+mR8q/4ZJyZ8P6qwsjNBKYYr1b
	/Urm/TUxhwH4xQzSqvLgmusuyxen8MqjNHyDEUiNXEB1PJQ+W5lIghN87SppCINc/TBXUBm01rgW3
	u5/OeZm5S/7GGbBqVqEXtPHpZ8xRN1b3y9ehYDOCp30R/kHbyRuWqqtGs6ZTpLjLWBRkiC5x5qi4k
	/yW4wVWv7JeIkBcYZ0SMNF/TGlzShwBzvEZ4S+rVShXfI4k/LbmnlaSrV6GGWiGnNjcoS/gvydl0Z
	jNe3wTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckaq-0000000Ccqo-0Xon;
	Fri, 18 Jul 2025 12:53:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckan-0000000CcqR-1E55
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Jul 2025 12:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09F9F5C5DA9;
	Fri, 18 Jul 2025 12:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E22C4CEEB;
	Fri, 18 Jul 2025 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752843215;
	bh=DFqIGntCYSDgRSd++hhAmxslnI3X3C9xnvYkELthmFM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZKGwlot3sTrqgSAuO8a//BzR/b211Jr14aksFtG1WBlaizl9ZmAGs2/mpGKDkClbF
	 eqNVBFbAV77SUwwx6D8IGae2NBjNDgr4b2otgXIlKJ4A0J4k5NJKnXq2XPzbZJyV/v
	 PycPOFD2keijufbU48D8Jo4LytnN0dOizHjUEHgepadpQCVK9aHJ6BhGMnbKbCCf/c
	 HNQypMSO2sPMvzGNYcWJgz2uZw1qKwcRESvKxNZNZaxSOnZEIjwsUSpBWjE2p2UlYh
	 0/q9AZ+39TZ8r4MIpS+fZ2t5hhfnSdfK3p2P87JoG8mWQk/u1h5Uzr7jEYmH0qYvij
	 fLCsHcyFpFiEQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 angelogioacchino.delregno@collabora.com, amergnat@baylibre.com, 
 Guoqing Jiang <guoqing.jiang@canonical.com>
Cc: zoran.zhan@mediatek.com, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250710011806.134507-1-guoqing.jiang@canonical.com>
References: <20250710011806.134507-1-guoqing.jiang@canonical.com>
Subject: Re: [PATCH V2] ASoC: mediatek: mt8365-dai-i2s: pass correct size
 to mt8365_dai_set_priv
Message-Id: <175284321358.34755.13837470566210593486.b4-ty@kernel.org>
Date: Fri, 18 Jul 2025 13:53:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_055337_416075_8D4510BA 
X-CRM114-Status: GOOD (  10.90  )
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

On Thu, 10 Jul 2025 09:18:06 +0800, Guoqing Jiang wrote:
> Given mt8365_dai_set_priv allocate priv_size space to copy priv_data which
> means we should pass mt8365_i2s_priv[i] or "struct mtk_afe_i2s_priv"
> instead of afe_priv which has the size of "struct mt8365_afe_private".
> 
> Otherwise the KASAN complains about.
> 
> [   59.389765] BUG: KASAN: global-out-of-bounds in mt8365_dai_set_priv+0xc8/0x168 [snd_soc_mt8365_pcm]
> ...
> [   59.394789] Call trace:
> [   59.395167]  dump_backtrace+0xa0/0x128
> [   59.395733]  show_stack+0x20/0x38
> [   59.396238]  dump_stack_lvl+0xe8/0x148
> [   59.396806]  print_report+0x37c/0x5e0
> [   59.397358]  kasan_report+0xac/0xf8
> [   59.397885]  kasan_check_range+0xe8/0x190
> [   59.398485]  asan_memcpy+0x3c/0x98
> [   59.399022]  mt8365_dai_set_priv+0xc8/0x168 [snd_soc_mt8365_pcm]
> [   59.399928]  mt8365_dai_i2s_register+0x1e8/0x2b0 [snd_soc_mt8365_pcm]
> [   59.400893]  mt8365_afe_pcm_dev_probe+0x4d0/0xdf0 [snd_soc_mt8365_pcm]
> [   59.401873]  platform_probe+0xcc/0x228
> [   59.402442]  really_probe+0x340/0x9e8
> [   59.402992]  driver_probe_device+0x16c/0x3f8
> [   59.403638]  driver_probe_device+0x64/0x1d8
> [   59.404256]  driver_attach+0x1dc/0x4c8
> [   59.404840]  bus_for_each_dev+0x100/0x190
> [   59.405442]  driver_attach+0x44/0x68
> [   59.405980]  bus_add_driver+0x23c/0x500
> [   59.406550]  driver_register+0xf8/0x3d0
> [   59.407122]  platform_driver_register+0x68/0x98
> [   59.407810]  mt8365_afe_pcm_driver_init+0x2c/0xff8 [snd_soc_mt8365_pcm]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8365-dai-i2s: pass correct size to mt8365_dai_set_priv
      commit: 6bea85979d05470e6416a2bb504a9bcd9178304c

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


