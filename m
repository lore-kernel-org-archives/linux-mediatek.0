Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D296C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 16:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6e61LimL828G0gIGHxuAKn4rVgMXHLuEJ79mnvfQMvQ=; b=P1121KdD7ZAsRxJMoTQMIG+l5o
	r7crVM2T18zFszrobwtFJ7eR1iQhOQq7wnWdQiv+6SAV1uIR4nbJlStJl2JalyKkishTWhrg0JQXu
	agHy/7BFHtWig06QBdMMA8SnQ2Q9G7rE+2qtj5/tWDGEgtU79fAHrp9t6xl0hn+vw/M56zSx/c7e8
	OvQE6aAQ5cfjLBee0XtuYqJU6aeDzodO6Q1TCCvrqGpJPzpd6byt2SM6vEjum3rcbB7f2iTYhahU7
	7bj4/LRBuoi0HseUynfDnG3J/2vatnNo3WDp9zj93nVqzUEWnWZzaR3WQ62KsxKo6RVMWZBRp5hBt
	bvzst5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTUw-0000000C6s8-3em6;
	Mon, 29 Jul 2024 16:45:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSTx-0000000Bte9-0pLw;
	Mon, 29 Jul 2024 15:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6e61LimL828G0gIGHxuAKn4rVgMXHLuEJ79mnvfQMvQ=; b=IaYBueKban79vCZuf0Nsz7A1HX
	n6o+NhWiTNMopxWmHxJ6JL1ail5fy5nL+QsEIGDTkn70HWxUnnq4iRdm5lc+PQ6i6VQZlrmnFrFio
	+jjXQTzs2c+wTvmf2CdgM+Rf5DF6Hrdm5BpXQeBKxmpHd/ESr8ct7jnHElk927xHdtvEBdNQBTOiw
	QZmHsWYFeo7vrtg3CqU6PBbvTHZs/aqpT7sDGUURy2UhCp/FAwaiYP19lcjmnRSg5pZLkNDLDIpkp
	zv7bsC0CD4KZkLP2wVTduqgmB+xJvun1+Gi5BB0cWVo5ShGVesp8moTqd41n2SLCo4B5xGhUUk26i
	MDRmCCYQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSTt-00000004oGZ-2qRW;
	Mon, 29 Jul 2024 15:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28B5061B44;
	Mon, 29 Jul 2024 15:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B646C4AF09;
	Mon, 29 Jul 2024 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722267610;
	bh=JEegVRRD+pSt7qGlqVbwF7CSj7IRWY9dFncZB1HxU+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i1z3qdDqX7bHCVzcbpEBOe+1BD/vE5ZKwrbZLk9xrH4LZzJB010JxbsYFEwA3NjPk
	 c/zcL2BdUMeuY+wnrRvAxhWKcOBom83DdHrE0clcr3f8VMTIX0Dmq7ubVybmMWXU37
	 sf+ANqsR7KYdG/1GuSd7MHhq/A01tW436In2zkqa2TuZ7ebqZsAYeOtj1P0PMgDzmh
	 F4ovZENBH5W+tPy9lDn5SlEdnI12vLgOcd3VTR0xbTNNj5UsNjkIxbgsR9vPKaBYzo
	 CQvsQbQMiITeIAWrHZA/9mRca5pi4Mur7xvag5U+6roSEVWLf+WxclTscjafrbYBbL
	 K5c9JSVdhFYVw==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20240726114721.142196-1-angelogioacchino.delregno@collabora.com>
References: <20240726114721.142196-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] spi: spi-mt65xx: Use threaded interrupt for non-SPIMEM
 transfer
Message-Id: <172226760809.71144.14726035193284084228.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 16:40:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_164014_139773_70FB0C51 
X-CRM114-Status: GOOD (  10.36  )
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

On Fri, 26 Jul 2024 13:47:21 +0200, AngeloGioacchino Del Regno wrote:
> In order to avoid blocking for an excessive amount of time, eventually
> impacting on system responsiveness, interrupt handlers should finish
> executing in as little time as possible.
> 
> Use threaded interrupt and move the SPI transfer handling (both
> CPU and DMA) for the non-spimem case to an interrupt thread instead.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mt65xx: Use threaded interrupt for non-SPIMEM transfer
      commit: 5972eb05ca322bb1efe44d32808bc7a331e7aee4

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


