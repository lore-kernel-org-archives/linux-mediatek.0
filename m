Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C33CEB2C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 22:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KGEVh27fBmOaF5TEF9nZ0tFzI5PQxKrR0QJ7xJRHFg=; b=vde1RFGGEX8G9oT7KlR/iPg7q1
	cSxJe9bxkqlDiUraFqgLqixQzzYtRltp8KfEF1SjtiMmknT4FRinJGr7R0+utclplPmhDXRlvTTDn
	/1eb4Ga9XVeBb7XuwN0mDbXugzbEN0JTrplvVli7BwE3qQvjrbxmVeU89/PBw69Ztcj79XvOQJiek
	l2LIxKUVGA2IvgV7duv/Dr0SmHuNySgDzXbXTSUuMEbO0XeraZmWN0L8aQ7zXon+UQsx/eJokzwhJ
	Fb1/LVn6gkLIFquigPM9eAHGzvmt0h1s/iijxzrHm+7H+BiqynJcTBtLVCvWi69kh8r1x/QFek695
	5JE/8yww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svOuU-000000011Qn-2lAX;
	Mon, 30 Sep 2024 22:30:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svOtG-000000011J1-29zS;
	Mon, 30 Sep 2024 22:29:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6FBF3A40E7B;
	Mon, 30 Sep 2024 22:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFA9C4CEC7;
	Mon, 30 Sep 2024 22:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727735353;
	bh=nmH9qaJNjqw7Qc6T/lqnT06KkF7d1uYIKI94EUB9NQo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G5nCh1ZiP3M2UW5GbdgHysar+gLAEjEEkOJytKfAdtloFD65yi5i3gG4tLErO+JzU
	 hAJR8PT3AVA1pnSLgwap4qkue4K0uMlq3QoI+tbFtc6UQwLmDpdZs7YYHMAXUc/8R8
	 WBJNflBns8NYeysbjveMVRGvKUMTaOT42kacTBj9ZpHjeA25nNEctIpGi8BM0lGf3x
	 PBUhCeJZuWGIlYNek6dLxAEdjsEMDsi9bP2AD3WmQ7k5CnzZb6vKd3Oah4wjscvcEO
	 NTefxofKdZUbjv1p4bdXDfDbS3PBSJmHH2H83nFLJ4LPONS78kw4bSd3FS5zt0vkrA
	 IPUdekfh1iGIQ==
From: Mark Brown <broonie@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
 Johan Hovold <johan@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
In-Reply-To: <20240925093807.1026949-1-wenst@chromium.org>
References: <20240925093807.1026949-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v8 0/3] Add of_regulator_get_optional() and
 Fix MTK Power Domain Driver
Message-Id: <172773535067.2224406.9733965694288102381.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 23:29:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_152914_663130_AC0A7B8B 
X-CRM114-Status: GOOD (  12.81  )
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

On Wed, 25 Sep 2024 17:38:03 +0800, Chen-Yu Tsai wrote:
> This series is split off from my "DT hardware prober" series [1].
> 
> Changes since v7:
> - Added stub versions for of_regulator_get_optional() for !CONFIG_OF
>   and !CONFIG_REGULATOR
> - Added new patches for devres version and converting MTK pmdomain
>   driver
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: Add of_regulator_get_optional() for pure DT regulator lookup
      commit: 5441b6975adc26aeaca316b9075e04a98238b1b3
[2/3] regulator: Add devres version of of_regulator_get_optional()
      commit: 36ec3f437227470568e5f460997f367f5446a34d

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


