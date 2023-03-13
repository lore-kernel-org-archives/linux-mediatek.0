Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616E3C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 19:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpW8tIdtMCVLbm8bvFpURHkHOH3/68LedyCnubCgW4k=; b=Z9zSeVK7pkgPLlNdZU7Y/um9SY
	+D/ku2ktA4lGe4/etXn8HrWehoptLwR4YaMploy9pL2HYng0tdstUUj46JbdIIoaBKm7l65oEXZk0
	EFKSmq0Y6YxPCuvjZqx/mN93Ls3oKFjii+ylre6qTcR6jUFKtmdY42SLdYx3a+3YWw9AHpV120bDg
	f9DHhgkH19YmmVqN5pizA7qdo7GgF0ANBB387TKRQ9HDVl0xhNUIkeydRX9g/xWM9RzfSoXjy2ou6
	sKwD5snQLNVE16pGFuTYpoqDT7DfbfulAy4Nm1np9xa2VIi2kkI9xhKYL3Z7+P6Zbn4GLpNiQuV5m
	llHCcNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnWW-007RgG-F3; Mon, 13 Mar 2023 19:07:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnWL-007Rbz-OQ; Mon, 13 Mar 2023 19:07:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 52644B811F0;
	Mon, 13 Mar 2023 19:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98ABC433D2;
	Mon, 13 Mar 2023 19:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678734461;
	bh=NSgcGMlvHaZdY1J2Us1HiQZa412OdeIu/4FLhrIhJVY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Hke5SM/mxLaeP5gd2fw1qU77XLIYsy+ZXz0S7dsUv8LMn1YYsIlQ6sXh+uiX1zMho
	 wMadRJNLkrsf+GDOtvxXZ7rhhtkafdpZp1pXKaGOJp9aWdzK+9CKn/67GFQ1EWF6A2
	 c4s27L+XyF3z4d18AuPa8c/tist0WAr6kC1SvAacWEA/KYWex07XzZw2tDWVJO85ID
	 44i1KbUg9ph5zxCOfrcQxri2+1o25dXnLu2gRnZYcZkWxCTkWGOhQImXGWGa7BUmto
	 UQl8KN52L6Qz4CjVdj743JQ1EDE66kiT6ixeUJwJlUxpWl0gKjHrbJMH88r+oIaSfc
	 W/tGN9jJcNGEQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: jiaxin.yu@mediatek.com, alsa-devel@alsa-project.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230307040938.7484-1-trevor.wu@mediatek.com>
References: <20230307040938.7484-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: fix coverity problems
Message-Id: <167873445867.106067.16026073006550113761.b4-ty@kernel.org>
Date: Mon, 13 Mar 2023 19:07:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_120745_983145_EAEC3C6A 
X-CRM114-Status: GOOD (  12.64  )
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

On Tue, 07 Mar 2023 12:09:34 +0800, Trevor Wu wrote:
> Coverity reports some UNINIT and CERT STR31-C problems, so we add
> initialization and dai id check to resolve problems.
> 
> Trevor Wu (4):
>   ASoC: mediatek: mt8195: add dai id check before accessing array
>   ASoC: mediatek: mt9195-mt6359: fix UNINIT problem
>   ASoC: mediatek: mt6358: fix UNINIT problem
>   ASoC: mediatek: mt6359: fix UNINIT problem
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: mediatek: mt8195: add dai id check before accessing array
      commit: ff728899065922534d80170685fb807194d6487b
[2/4] ASoC: mediatek: mt9195-mt6359: fix UNINIT problem
      commit: 1a3f0116b74ba2f9477c28fcf9d66ac7126455fd
[3/4] ASoC: mediatek: mt6358: fix UNINIT problem
      commit: 9760e01b3851dc51d1901876668168328d34a647
[4/4] ASoC: mediatek: mt6359: fix UNINIT problem
      commit: 3a60fa4c063dacc5eb66660aa23107f3cb8a477e

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


