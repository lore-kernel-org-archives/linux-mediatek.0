Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B0EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 13:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0yNIP6MpjaHVWcIxbkqNM0AdAjCHiKnAY/z3tGomfQ=; b=Aqd0fraGVG82vLAP081CYqf5Ml
	V4iIwY5Hj3Dif6XiZM4hzZUrjwzAZT4X3IPG1K9cA1YcLx7H7QVMRaYCzWotTO1AokCgJIVokmXni
	s8DnQmP6mEXuRtdADaoDoQdco4x51+/NoGFdQaH95KxUGgqk/3e7ISJXZD7F+RzR3Y0OEvTtFlvKM
	DxCPgByyrYDMXs70QjsBeL8YAPreaBzWLZSQ7w1uvBleFhNolJ510dp44et1OSO5j/zRdjTyXjTa5
	Ahxj/jLwr8hDzdZsWVI9GDz1+bnLc9XFJ/sXNfpLcdSKLJ08O5C2nCZ95f2Bq/eGwyhqNwWXVcXSs
	gSYeKwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAAF5-00DNnv-EZ; Tue, 27 Dec 2022 13:43:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAAEq-00DNgr-Au; Tue, 27 Dec 2022 13:43:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B4B58B81038;
	Tue, 27 Dec 2022 13:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B2BC433D2;
	Tue, 27 Dec 2022 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672148605;
	bh=MWHvjZhXqCXibASs7/ji0PRKFTI00JPAvF8xc89D7D8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tIF6qIL8Y0pR593s3NX3Tr29bkjIHPsh+00HkRkm1ZOFp7ltkYgwiE7MKrXRKkA0r
	 r+m8y3/xHBHqRegi7W+eHENxQxGcJbhhWqHxTTPm3nvICgCmym6e+xO9FqvE+PD8CP
	 Jo0dMbESDEOTQoRaB2qanG8VqL1L36wHESRk8ph7DmPinNpIumLvZQrj1C6S8tQirA
	 Q29+aq8d7SouvpPfFKQ8h85ztI66+zLhaAwbMgri3sKw7uoqPJZJvKSnCAwROdqlZn
	 q5zAEtCQ8jfjmZeD/xGyowLqaBNycOi2v7voNPpM3M3Ytj8mDV6F/PYr+ygPMA3VIH
	 F53An4qIZ4WQQ==
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
Message-Id: <167214860344.446872.17166503994226712534.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 13:43:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_054328_562650_B4545485 
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

