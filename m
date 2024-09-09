Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961A2ECE58A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 21:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/Sl1MGA9kpMY4Sl1K0fTxOWoAkDxhLsEVqpseVUXFc=; b=uK/LrgX1hOr5KocPfdyck1JCOC
	2X2cZK6ItksUXokmeeIp8zvG2zkPYBusQk21kkeUQ9TuJYgP3Ge9G66o9g6chA7i1bPXx6o2BEzkQ
	hdlXvzDaGnlKR6TeGraxJU27jKWORV7SHGWuBpvW6njWfYQSWm22C5fPNin2LV6pB/pzbX7EEhqWf
	6oQlDEPBrHQKTztsrusbmxKrpCDA9cKCu5ETenExC6q1JkqoOUMkLC4NRG9gawe5RZc1NmSVNLssI
	oLEAF0TO/EBnDIbWLbipBLp2s9IBpqgdI+85BWIN06auLHESnz9v1I+vO1pqdAhGdn280OoVfrG9u
	42oJ72qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snlZ8-00000003Jn3-1BsR;
	Mon, 09 Sep 2024 21:04:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snlWD-00000003J3s-0FEn;
	Mon, 09 Sep 2024 21:01:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4484A419D0;
	Mon,  9 Sep 2024 21:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DBDC4CEC5;
	Mon,  9 Sep 2024 21:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725915712;
	bh=fk1O36vP6EYATpW7zFnE0wBAJf09Xs8FlL14jwq2K04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U83w8q4vmWuUNWWa8wp6WXXICFHNrWHnRAOLoFaJwf+YGIhqaA4++V14XBYpETLmz
	 Rrd3E+kOLKplgGDfpABUQym08RyIiH3l4jAbmyk5bBAK0s0gOBxgw2KpqYkk67k29Q
	 bB2annXHCrM4S5XPhPdfW+/6Ff0w15aInu8EqGFqDTaWc6XH5oDKdHJJFazQNbDIc4
	 p3AukalcGRDrdrFRfFF1YtRIBR9v1CMyNI+juVxM1lxCtHvdKIJ/p3GvzmaDqMOg0z
	 e01KB1mHz9lEzQnWY0Dh6JJLHfYFid95AQrKjY5TyB7IUFJ0wwiByyCgketuPB89UX
	 ftt0aAFvxLWog==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, sound-open-firmware@alsa-project.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20240909151230.909818-2-u.kleine-koenig@baylibre.com>
References: <20240909151230.909818-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] ASoC: Switch back to struct platform_driver::remove()
Message-Id: <172591570834.136248.17412626468486255591.b4-ty@kernel.org>
Date: Mon, 09 Sep 2024 22:01:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_140153_181859_9350082E 
X-CRM114-Status: GOOD (  12.66  )
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

On Mon, 09 Sep 2024 17:12:30 +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all drivers below sound/soc to use .remove(), with the eventual
> goal to drop struct platform_driver::remove_new(). As .remove() and
> .remove_new() have the same prototypes, conversion is done by just
> changing the structure member name in the driver initializer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Switch back to struct platform_driver::remove()
      commit: 130af75b5c05eef4ecd8593371f3e924bcd41241

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


