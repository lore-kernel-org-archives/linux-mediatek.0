Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5097DC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2ip+1vl99bof8WRBrzmvnpmyqEZD1AselIMZtmpu58=; b=AyrgW230uev28Zx2fz+iLcXFnz
	+vQOhEeKCAUPRULyBzavJXe7jv7+eEKwXT+6uwEFknlhRXpadaPLSaY8sdXCYYJJV/fKmaSl/PPrR
	jkqLb3r2LFnzNv/tw9+9ITNdAUhths7f0n+aR9kMvubacX9cYqG6Nb3gMNwjq3o1+5OSGl2Zsa6kP
	unMLARB/QfQKTCVmUANZKmozhwsu1K0cLkYeHGJEXBDKwNdSa3tpuP2asl51N6OruNRYu8OEBr5by
	T3LawA9NuIBCZSv1BM2fCTKe0JV7g7LsE9tPLeUTPQuZoqge5chTEb9uKatJzojxx2lW7My6pey8n
	GQwPj8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozhwK-0035Fn-Ap; Mon, 28 Nov 2022 17:29:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozhw8-0035AW-Ij; Mon, 28 Nov 2022 17:28:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 30F23B80E97;
	Mon, 28 Nov 2022 17:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B5BC433D6;
	Mon, 28 Nov 2022 17:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669656533;
	bh=gvBIJ5o3hFY/0i6NMg2Uwx9JeB/XU/zKEUgXsoB1508=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PJIX+6kJjfkAqwHy+7dvp740PGUQYy8CT2KJC0Gn5H77M23nL83BqzoLVrDwOLkkf
	 9WP9R7Vt2OV+vBlMy6qhaHybiHK/bwW1ztmultQfsClYG47rjYWckFbadJmtep5myF
	 vMHx3sWH+RfIYch5f9d8pchNdRIBNf/ewFVwpft14zvSn80ODmqdvdqB7K21rg2Faq
	 WvWQs3s3wVcE6UkwGPLGyIYRN7pyVyfWEDhlNqQZMvLjDxAKZBUyiPITyGaTH1zzBU
	 E6dXDVV/mzaMxZ76gZKVGe6dDcNn+XP2KYSVOKdPr0PzhOifJxi4u2nQQq4lUs/3T6
	 J0TMgk0aJQUIg==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org
In-Reply-To: <20221128-spi-mt65xx-v1-0-509266830665@chromium.org>
References: <20221128-spi-mt65xx-v1-0-509266830665@chromium.org>
Subject: Re: [PATCH] spi: mediatek: Enable irq when pdata is ready
Message-Id: <166965653185.677424.5326738316899525692.b4-ty@kernel.org>
Date: Mon, 28 Nov 2022 17:28:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_092856_777904_9330DC7E 
X-CRM114-Status: GOOD (  14.32  )
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

On Mon, 28 Nov 2022 12:00:01 +0100, Ricardo Ribalda wrote:
> If the device does not come straight from reset, we might receive an IRQ
> before we are ready to handle it.
> 
> Fixes:
> 
> [    0.832328] Unable to handle kernel read from unreadable memory at virtual address 0000000000000010
> [    1.040343] Call trace:
> [    1.040347]  mtk_spi_can_dma+0xc/0x40
> ...
> [    1.262265]  start_kernel+0x338/0x42c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mediatek: Enable irq when pdata is ready
      commit: c6f7874687f7027d7c4b2f53ff6e4d22850f915d

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

