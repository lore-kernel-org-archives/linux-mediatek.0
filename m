Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEE2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jt1IcLnf6rG76yI3vJyPsmWZRJydBtHzdd0tWF1PBU=; b=koUR1H8cqHdhs+
	ci+stOVaiNGGFs7LQy9O8NuxffBbg7fJ1fcin2368qHPgbTmcXYL1CR+K9ApL30HZNSCc2KatLzhf
	yozquS+mxrahQdVV5dYgYeBg9xHfgJWv1yru8dVyXPgRcCuMXDTYBwxxNGaNv1xecSjiEG3djuln0
	8Bt27+2Cpflm2NF4C/3w7XDJFwFSto4VBJZauQpCufzspeiYxuJIlOV0VZ85nECZbtiSZ1m0Gki5X
	I5waVnLYwIWrCi4S05SdrjvsmlqHEmKitCzfJ6MbAD46G37QxH/El+b2DvlLJAElWiKF5yGvyEKPu
	zM0yUwZx5ftVqEfVx+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqEw2-007g9X-No; Thu, 25 Nov 2021 13:37:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqEvp-007g7Y-HI; Thu, 25 Nov 2021 13:36:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 356A861059;
 Thu, 25 Nov 2021 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637847417;
 bh=YBUe5iaqpRc+freiqsgpPGGUt/uvv62GjcaSgEBy0SE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DLnzZ3fnInJInqcpRZi7dgjPdaG1NeirxE8fZIE/F308Gn6ohRfInj1CtYDN8Oa3a
 2l6Y5+1PJvKmMCHiURFPDeqyTqJuYDgPM4okXiygZxC5XNXkrNoTEzSUI8HwiBKQy1
 +TCLrUqazBIt9Fqs6iNnjElDGXI8G5G0JVzR/XHm0RL8KP4pRhP26jJX/TGv5PHTlg
 vObqXaYnbYLPGXYOivZIlwd5KkGfiwJpopHiPe+ntNtw+bgGirQnSjem1W9WEk2sAK
 bsDru2Z0+e5OkXpDF3x4ONLmsKi9efixko4sUoBea3hG749vPEGVMZOm6Ev46xz/k4
 Rx9s4ShUxCRGQ==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, tzungbi@google.com, kaichieh.chuang@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, garlic.tseng@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>
In-Reply-To: <20211125042422.2349-1-jiaxin.yu@mediatek.com>
References: <20211125042422.2349-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: remove unnecessary CONFIG_PM
Message-Id: <163784741495.3101847.17087805943861117771.b4-ty@kernel.org>
Date: Thu, 25 Nov 2021 13:36:54 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_053657_617466_05DD94B9 
X-CRM114-Status: GOOD (  10.83  )
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

On Thu, 25 Nov 2021 12:24:22 +0800, Jiaxin Yu wrote:
> The unnecessary conditional inclusion caused the following warning.
> 
> Such as:
> >> sound/soc/mediatek/mt8192/mt8192-afe-pcm.c:2368:32: warning: unused
> >> variable 'mt8192_afe_pm_ops' [-Wunused-const-variable]
>    static const struct dev_pm_ops mt8192_afe_pm_ops = {
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: remove unnecessary CONFIG_PM
      commit: faf695517c1c77bb4a4b46d54007a283962eb00e

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
