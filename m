Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76424C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 21:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2RuROkLzPSjjDo0bHp0V/io89y7OEkc7mcCIfbzJ7Y=; b=46Y4vzdD2l8NZFxQCGL0erA8n9
	PS0d/gTnuA0UXj58YXhafyR30OBu7bLvpq+QtkYoNa7ZA9CWW+ZGFruTtFusaYAKm9pFJ7/UgJQoH
	GLYBacirrHT1y2Tf4Nd1hQUQXZYQrBsVKXbGrji0RFYzgXjHbdrC80LIqb4aOvBvUgT8sxHYufbGD
	1PHSbxSzjtUWKU5lX91LusRpgL38rHURQRF8QKtKbc8lkQBCjWjAs0C/+KUBQdVZODy/JI92EpFHV
	D2XLaV4iYpG0F1q8lRJkVPYN9HdWwxlEjQvpWETUQ3t5mY4zwuXY+/Yvr4zW1l6nT0uT5nyoPdsOR
	31XSCLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oygFY-002FiD-PD; Fri, 25 Nov 2022 21:28:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oygFM-002FgH-2L; Fri, 25 Nov 2022 21:28:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96A0560EF5;
	Fri, 25 Nov 2022 21:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43908C433C1;
	Fri, 25 Nov 2022 21:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669411711;
	bh=gpXPBtkhlxtel6UIyjoIqn1pao+hcbuVms341nimoJQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Nl9DUJ3vMi8UC8RHx3P+XDA2HgU08oruVOHNvBs651LwYsWMFRU4R4hQ4d7mQ/kTe
	 kCqE3b6gSIhwgk2qqX+0soOhAq+q84w3ztomCxUszjVR6xM6vK/5dmOGVM04XaVkHT
	 Rr5Wbk5zGQOneBwGQdrMuf0Qbs6/izdmwubpQguAh6t+iqK6ZIPQJWEUzaUHrsEtny
	 C3VgwPLCh3I7TgxulJwdwr/mHLhbFRYdtbpCyXxHh1kUEFtRskh52vDE2Jy2uD9GNa
	 mIEh+ra80smqk0EsgMjYs/Zg5KHYJCJG/oSQxtj/MMRgatj5xt/6dRv+f/ijIHl9Be
	 RAHSy6wS+7ezA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, lgirdwood@gmail.com, matthias.bgg@gmail.com, tiwai@suse.com, Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20221116030750.40500-1-jiasheng@iscas.ac.cn>
References: <20221116030750.40500-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: mediatek: mtk-btcvsd: Add checks for write and read of mtk_btcvsd_snd
Message-Id: <166941170899.2089698.737782395946563424.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 21:28:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_132832_166968_5F1345B9 
X-CRM114-Status: GOOD (  13.15  )
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

On Wed, 16 Nov 2022 11:07:50 +0800, Jiasheng Jiang wrote:
> As the mtk_btcvsd_snd_write and mtk_btcvsd_snd_read may return error,
> it should be better to catch the exception.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mtk-btcvsd: Add checks for write and read of mtk_btcvsd_snd
      commit: d067b3378a78c9c3048ac535e31c171b6f5b5846

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

