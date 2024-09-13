Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723D1FC616C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 18:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eqpvrm9kEdQqb9xiY2LK0gsMq/Dl69NYirnh2Gam8tQ=; b=0+rw6bC9L6BA+IhkxPraPgMKqF
	40Wvg+e/YK3w61Bh6/gU6v+rZBUOqweIq2BPYSE/n5DhoJ1cM4a01IxTS9NLl7V+pWoN+zcqsbhh5
	mvPhQBWEsKIZA55qRxwirZruF0vsGNCJv5Axnfj70MW6DOe5ZoHui4ntL2eUKU/Is/ChZ6jtyK8Vl
	w8PXRHKX0Q9TUi5S1y9uoIO5jWTQk9Xb8tDgnJEuqj89z0xaORPcyzYo+uWj9v5jSAbDmLYySheUy
	pn71NFGiUg2RZSGgsSt/Dg7O1SK9J5co/HiiT4G0pMQOqGp8h3mS01tt/x4HcDGeU3nx8YlLWmK+E
	E2+slCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spAkJ-0000000GmB7-03Q6;
	Fri, 13 Sep 2024 18:10:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spAiH-0000000GlkS-3ylc;
	Fri, 13 Sep 2024 18:08:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81C3B5C5A7F;
	Fri, 13 Sep 2024 18:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDBCC4CEC0;
	Fri, 13 Sep 2024 18:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726250888;
	bh=pPgUGqSKrZW66jNavRtTicsXWsvkNovyg2p7zhV3gxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hXb2J3SEji2GtVifTGFvnzD6IPBGSigN4Pq0+Qz4KCrZpRyZJER0bFvZiFqkNGlFH
	 liFpZ+z3VUqFs96uPNIgWgQDxYpjQaz6wByUyym8mWE5DsR4S5/k7Pdi50ROqReK+m
	 iAkGKCPvYCGryPPCEE6JdPWMNoeehgfujSHPFUQkgSEon27SftSpnnTc2zK7xmS7hF
	 BRcncDSkZY8EaGKsuY7F1TXiupacTBggo3YoEbboRMJwYrdYwixpeIlmI2aRCgTxbY
	 FQS9XPonpVOJeUskn/fg8IYSAsIFPRqQB1By6iidMvEL19YlUcHnbZDsJ0qZsuGqg5
	 k5D6Z4kpwDd2Q==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
 Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-i2c@vger.kernel.org
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v7 00/10] platform/chrome: Introduce DT
 hardware prober
Message-Id: <172625088498.70368.2332989625290315131.b4-ty@kernel.org>
Date: Fri, 13 Sep 2024 19:08:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_110810_141957_464109DC 
X-CRM114-Status: GOOD (  14.94  )
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

On Wed, 11 Sep 2024 15:27:38 +0800, Chen-Yu Tsai wrote:
> This is v7 of my "of: Introduce hardware prober driver" [1] series.
> v7 mainly refactors the code into a series of helpers. The scope of
> supported components is also reduced to those with at most one regulator
> supply and one GPIO pin. Also the helpers expect these to be named and
> so the "bulk get" API changes have been dropped.
> 
> Also, a pull request to document the "fail-needs-probe" status has been
> sent: https://github.com/devicetree-org/dt-schema/pull/141
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[03/10] regulator: Split up _regulator_get()
        commit: 2a1de5678944147c2a41b6006127d2d0b618e83b

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


