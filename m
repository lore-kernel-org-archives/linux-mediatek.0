Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C718C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0yNIP6MpjaHVWcIxbkqNM0AdAjCHiKnAY/z3tGomfQ=; b=orkV4kN3NnkddZGPKfwHElOafA
	bYtD0SgdUujnwioE3Ok3OpgT/gD5OsPzEXvAlZTfovE6SyAlkmVocOlroL9muQmCrKEUAXtPNVlYJ
	k26vM93yxa4FkWgZ+JoKfEcrtwAmCNQyUjixFb3ThdM5iTCONpbOZ1paT/iHqAo7//ONTaOIS9QMd
	Zed3XBkUY9aU/vFql39xUCwRftQ1BmjN44ZuNCagoBePAoQbrVQdOVa5IUHof/WWwMwlU7q0urNWG
	DQRWDbyIcp3DjbrqrmXlJYWNyWTAqLVM4/qVkDMnviTEWOEEXnwwVFhLP48u3ovpOuWZEzehx1irT
	59hIjEHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8ci-00CeeP-6E; Tue, 27 Dec 2022 12:00:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8ai-00Cdsd-UW; Tue, 27 Dec 2022 11:58:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 24237B80F93;
	Tue, 27 Dec 2022 11:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F15C433EF;
	Tue, 27 Dec 2022 11:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672142273;
	bh=MWHvjZhXqCXibASs7/ji0PRKFTI00JPAvF8xc89D7D8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XM/8z0a45B6yUWd7xT3hiXC4zWIB54DuzDwZIcSpMYLn6a76XZGm86Ge8jBR8XwMF
	 7YXiMtcbVx5r6RV8N3YAs4JJEfndGdWWrt3A6VOiBwCMNUB9jOcJWbx0xIY/6bIjQZ
	 TbkRao9okje45BY8i/2tfuALwz/JAP+rOtJ2+N4CpRj53/4jO9QiMfFVYB9QadmXMh
	 WfzCMUvXiWSUSvOyk99lryaZnSMMdt4ZuCSKqRuBcclTcp4thyAmZz/P3Y63iDt646
	 V++MOhThhrdFlyMqsncqkCz0VQEq/EXECfFv0Vm9gT8ZY+vSLByzGaCnaeArE0QAbs
	 z4xRQYIwJMJEA==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20221225-mtk-spi-fixes-v1-0-bb6c14c232f8@chromium.org>
References: <20221225-mtk-spi-fixes-v1-0-bb6c14c232f8@chromium.org>
Subject: Re: [PATCH] spi: mediatek: Enable irq before the spi registration
Message-Id: <167214227202.88639.2335851712877417463.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_035758_272537_72804E81 
X-CRM114-Status: GOOD (  14.40  )
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

On Sun, 25 Dec 2022 09:37:12 +0100, Ricardo Ribalda wrote:
> If the irq is enabled after the spi si registered, there can be a race
> with the initialization of the devices on the spi bus.
> 
> Eg:
> mtk-spi 1100a000.spi: spi-mem transfer timeout
> spi-nor: probe of spi0.0 failed with error -110
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000010
> ...
> Call trace:
>  mtk_spi_can_dma+0x0/0x2c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mediatek: Enable irq before the spi registration
      commit: b24cded8c065d7cef8690b2c7b82b828cce57708

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

