Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1716C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 14:59:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67C26610FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 14:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67C26610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/yMPBENqoOuTcqCk9/KH/EU18jS5ZWSS4PnpzJxmwI=; b=RApzYtP4n/PFGR
	YbYC/3xiRhnVC50dLos7mLFAtgmKurZTlPngrbiyrvvgr7zQqef9NH3aOnXMCcJS+K3Rb3MmuMFcw
	A/GBBXmbvdcYArC8PhI935QkR0H1Sf4a+BtQN2Wszf464pq1LzawI5ShVAD8LPg7mNTYW0uEKYAlS
	yFFIJifL+AOnMmjAGFiWirYi/EqIFDhZ+IBVh+b8+QOqi2gw6/0bSwTmNfziHFIiG6RwtkAw5UhlM
	O79fZVJycrkzyqCIvUohVO6ClH1u/PMYtz2Nxjp5iOoLQAv0GepRPx1p5/uQeRYX9kwHCWxG9bomF
	o0ni1vMleMzGVUPmpq5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgTLh-00BG4y-3l; Fri, 29 Oct 2021 14:59:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgTLU-00BG38-3A; Fri, 29 Oct 2021 14:59:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E69261184;
 Fri, 29 Oct 2021 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635519543;
 bh=mEBIcswgw9632dRuDbJzbqAYM5AZU2vSGumheCQp2Ro=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KmcYAvjHh68pAorsLxOts9w9lIiC0cES+aC7xR+/bdRa2d1oxoZSbQL6skMh0lVX+
 wqSgXHyc32CziuAP4T9p/VStKo7ceiO9K4Sy+6qvnlcr0ThbfZ6wpZBaGbqzw/aR37
 Z2IBMEACAUyCoeO9w/xdoT7i+wbTqOMq9aRJs0g4TvuKZcYYm0ishvWJkKX2UopdLV
 b8kfvvHMrvIrwf0Ip8R+01By2OH7eRhE38q2acOlU0vUdhzgtTA9RezwN+YTfWjjpR
 LU0omWqDbZzY7qgLEBR9T6HUgkH6tQPdOmpuq4esqxcn5169G4u6fmVqXWngCdmc2T
 ZGbG2AoMyIslQ==
From: Mark Brown <broonie@kernel.org>
To: trevor.wu@mediatek.com, arnd@arndb.de, perex@perex.cz,
 matthias.bgg@gmail.com, tzungbi@google.com, tiwai@suse.com,
 jiaxin.yu@mediatek.com, Julian Braha <julianbraha@gmail.com>,
 lgirdwood@gmail.com
Cc: alsa-devel@alsa-project.org, fazilyildiran@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20211029001225.27218-1-julianbraha@gmail.com>
References: <20211029001225.27218-1-julianbraha@gmail.com>
Subject: Re: [PATCH] ASoC: fix unmet dependencies on GPIOLIB for
 SND_SOC_RT1015P
Message-Id: <163551954099.3555751.4265484307853649135.b4-ty@kernel.org>
Date: Fri, 29 Oct 2021 15:59:00 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_075904_184681_D02580D1 
X-CRM114-Status: GOOD (  10.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 28 Oct 2021 20:12:25 -0400, Julian Braha wrote:
> When SND_SOC_MT8192_MT6359_RT1015_RT5682,
> SND_SOC_MT8192_MT6359_RT1015_RT5682,
> SND_SOC_MT8183_DA7219_MAX98357A, or
> SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A is selected,
> and GPIOLIB is not selected, Kbuild gives the following
> warnings, respectively:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fix unmet dependencies on GPIOLIB for SND_SOC_RT1015P
      commit: 2554877e4b08d258c2def27e3a0fd49d60a9a2c0

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
