Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3CDC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 17:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mC2R9jSXsaUkG5WJqEi7l8L09kg5942WQp9Q3o3a0s=; b=JZE1PDUO6i/099xZjYl5zPBm8X
	XImPThA2ollkFB5hwp/wsdWS13EhsuL/hgfD5wXCJH3YLslokIGaHDnUnYD8W8mCs/K/hIuQXpW6V
	8Uom9w2PP0zLLo0GMgxzYEoIyWXX9vg53yTMuyrUVo9RHTKbvKWovIt2LiJVDZk7ADxJtk8m4VroH
	eudAruWa7bp3AMdNgyj7E/Jbf0Z09ehWvOkio76eBhBx56+/2IQO2sNkCdUJaE8D05ZiZjnij1XOI
	lW+t8ptc+kzECzkb4cyyI21tCj/ia+z9G371PMjJ6WQbGoG9AMHWphzPpSmAD++/kK+acoRICeFEx
	0hBx7AxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oziJ5-003GXJ-H8; Mon, 28 Nov 2022 17:52:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozi7H-0039nK-GV; Mon, 28 Nov 2022 17:40:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3526612E9;
	Mon, 28 Nov 2022 17:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C351C433D6;
	Mon, 28 Nov 2022 17:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669657226;
	bh=ksNf/YddouAnHYSNO35e1eWHI7ypXSlIfibrJFdWEf4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Osc1H1Y2dd/1zAyoQv+CJvEfOBepdr9KnkC0Zq43CfxEmyEQzwk67A9puNnYw1UAG
	 O7eYNatbOG5Z14pGD8hrppnia2Ca1TJvKAzr96aG88MMS/18dMhTP38B9tjfH3zMta
	 YqQR6azn+QEVmFrzUXaVXRPwFej2H01vc+BY0ce5spLiGefmYlCDipt0DhT9Q/yvmS
	 hc7EKRFdHf93+NgdMwL47eGE10e3kiqHQqqsBa/sHM/+o+IenCpufIpc78A+zKNHDF
	 gZ3Sq/2abivOb7aykWQsyg+5mbBuDoihw6NCLvLqoHlYm07PhN7incrFBJbmaAy2Ym
	 3o1u0nuxP+WUw==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
In-Reply-To: <20221128-mt8173-afe-v1-0-70728221628f@chromium.org>
References: <20221128-mt8173-afe-v1-0-70728221628f@chromium.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
Message-Id: <166965722420.688163.18006301242962769416.b4-ty@kernel.org>
Date: Mon, 28 Nov 2022 17:40:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_094027_623314_ABF3CEFD 
X-CRM114-Status: GOOD (  14.52  )
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

On Mon, 28 Nov 2022 11:49:16 +0100, Ricardo Ribalda wrote:
> If the device does not come straight from reset, we might receive an IRQ
> before we are ready to handle it.
> 
> Fixes:
> 
> [    2.334737] Unable to handle kernel read from unreadable memory at virtual address 00000000000001e4
> [    2.522601] Call trace:
> [    2.525040]  regmap_read+0x1c/0x80
> [    2.528434]  mt8173_afe_irq_handler+0x40/0xf0
> ...
> [    2.598921]  start_kernel+0x338/0x42c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
      commit: 4cbb264d4e9136acab2c8fd39e39ab1b1402b84b

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

