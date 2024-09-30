Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE067CEB2C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 21:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UL54jfBeW5VX3u5oqHMHGZf1har+EwzCZ6d2BhxqUvI=; b=CVrFQBaYyHFGDDE010r3D7dZQJ
	uNpzo2TO6TcumzCOSQ/c/n/mn/Ge+7AIh3qI5+LYRK1irm9QFcvZgk0EzOqJCEhCzjFSPvCGjFyiE
	Xt6h0o0xcjKPFZzzyEWo9RScBoa03587H6w2RlDtFHaBA4ykLlG8XkGWOyEMNWUQmck9NVceXqQX+
	Z0YUN3HVQm9ChvQrJqI/5GKO1w2guKtoFXRgFWduOR20bSKqGqiJQrUQx97MB0Zp3nyJtpbX6eYeB
	nX3Smbxhx2huanoBmcRTfh9O9/Xch3UfRHEbqv9fqqR6KAG7Xl8J/r/Ef6zQBmjvnYnVSR91aAlze
	1mRyF8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svOEP-00000000wZU-2uaX;
	Mon, 30 Sep 2024 21:47:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svO9f-00000000vmB-3xf6;
	Mon, 30 Sep 2024 21:42:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB10AA41706;
	Mon, 30 Sep 2024 21:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5F5C4CEC7;
	Mon, 30 Sep 2024 21:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727732526;
	bh=McD0PPLjiwQhNMLldB9C6lK8T6YObT0WHb3qn6BQztw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BLub11w1YJApgAOCcsuxt+wvn7pjKhEUo0lDZtXNOGx209M1pRP5Ru3jLIVNUkbG7
	 UICIWUIL52R01MfweJKsFG2IjmFFeOm6j3i1vzh2PUekcGoD3IghZiYXbIPfBpXw9o
	 8rFqKp5QibHIJsUu1NJoD4mYkUptuCg6U9DjPi7w5vmbkmr6pC1s/gJvRNPKe43TYj
	 9ITBM2MXY1xhFJGQfZbna/Xv13JkL6QNBzGuYJE33ZJt1ix/UmEW+vFwspM8YcaxJC
	 feikt7ZOzJTD8Yi25HaahXyYVtr6KZ6gWvxFDNa5fP4jJY4v7I62jVvNkkhTbdahd6
	 /sqmHrZMGXX1g==
From: Mark Brown <broonie@kernel.org>
To: linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Leilk Liu <leilk.liu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
In-Reply-To: <9e736d33-b07f-40a0-8fb6-8c3212593b77@web.de>
References: <9e736d33-b07f-40a0-8fb6-8c3212593b77@web.de>
Subject: Re: [PATCH] spi: slave-mt27xx: Call clk_disable_unprepare() only
 once in mtk_spi_slave_probe()
Message-Id: <172773252496.2210210.475643542831503313.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 22:42:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_144208_090476_91391D27 
X-CRM114-Status: GOOD (  12.49  )
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

On Tue, 24 Sep 2024 20:56:08 +0200, Markus Elfring wrote:
> A clk_disable_unprepare(mdata->spi_clk) call was immediately used
> after a return value check for a devm_spi_register_controller() call
> in this function implementation.
> Thus call such a function only once instead directly before the check.
> 
> This issue was transformed by using the Coccinelle software.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: slave-mt27xx: Call clk_disable_unprepare() only once in mtk_spi_slave_probe()
      commit: 610442f85c12ff662e3dec50c53d92f7a8e5a783

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


