Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B46FC64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 18:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pm/LmxXkFvMjay3OZYbmXF5JhHjO4R2wyQbwilZdJNs=; b=IOJ6pZzU5eZ3VtKDoOzyPRGS33
	aEakZ4VnBUlUUOnPhdDDM2gh3wkIsW6DkqEFEL65KQUDK5FbTqaFK1GK95yDvwsbIe23E5HQSX9oz
	zMGOYeHHTviRGeVbgSSuik1X/BPolMf5dBqBIcOks1Ny7GojNb0/Uxe3cOscKmWlTFwz3J+TOn8md
	/631tZBBWY9Hp4+/IYyJxL11E0EfT8Ql/dj/jSBnX1ohg1N8DNkCuvlDmNdMKnQ30+qaUfIqtKAJn
	l6qCR3sSevoSpUUSCV89XzC2DkNuZNlov5k2gwfSUwg+VwT85Fuq/DeFovg+sMTGeCBaERbJNbTQg
	HM9rrvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4Hi-00Dvg2-OY; Tue, 28 Feb 2023 18:01:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4HG-00DvYe-H6; Tue, 28 Feb 2023 18:00:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2F1B1B80E9B;
	Tue, 28 Feb 2023 18:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C570AC4339C;
	Tue, 28 Feb 2023 18:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677607235;
	bh=OEe2wAjAN5Wk3+/Gr8WAFlMWCXBu8whw25LrAQEArjE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fUlCaCrme1FbHiY+4s3OeDrWTDvt7fHBRl0xaqaILYRrDLdhpn62iLCwpX0Oh9206
	 Ct1GeeXawus4QVZYYiHmMMdLF+xK4pmRH+zVFh9K+F7kuZ+Ap1W+evafNlck9QXwsp
	 YlTHeccnaa96QFRp4Id+YULbn7dTGg2WMH+91yHb7oYCmnNlf72rkOlBIEjfF0frvU
	 b5Xwte7IR9Cn/kMnvv3Tggtj0cXiSYKSe2Uh308K8VmCMrhiRSJegdg+nPm6tjaXsQ
	 6QK0CexD+vrAVnKmX9MHf2HnkbIMNtLmJkCrecSFo00kMscjEiMBpTSrr5Dqi/PoEr
	 dbDoSeqUwRffw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
References: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
Subject: Re: [PATCH 0/2] ASoC: mt8183: Fixes from an initial glance at a
 kselftest run
Message-Id: <167760723351.68866.5282074700831903370.b4-ty@kernel.org>
Date: Tue, 28 Feb 2023 18:00:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-ada30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_100038_743295_6A1F9DCF 
X-CRM114-Status: GOOD (  14.68  )
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

On Sun, 26 Feb 2023 12:49:55 +0000, Mark Brown wrote:
> This is a collection of fixes I came up after glancing through an
> initial test run with the snappily named Kukui Jacuzzi SKU16 Chromebook
> on KernelCI.  There are more issues flagged, this is just what I fixed
> thus far.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mt8183: Remove spammy logging from I2S DAI driver
      commit: d71ed1c8f0f458ae6852fdab055790fe1d9d19b6
[2/2] ASoC: mt8183: Fix event generation for I2S DAI operations
      commit: 18f51ed09888c8e48bd377d1715d4ff807b4c805

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


