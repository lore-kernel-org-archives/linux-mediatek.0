Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEF8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 18:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlibdgKQHlHtn8mvGBioiL8TWIByXk4rhcfC+Px57Z8=; b=g9KrIIJkZGMHb6
	QhIdm/JHeJSXSKxmvU/D9tBIEPptYpvzDmde5bNEyMbuf/ySd070AjfxBrwr1M/ZqThciZIj8sp+n
	M0FVGc87NolU1oivnlCaHbuUbvfEFPCvXbqdVL0whzRohdnh0K93deu+0RUOOpVVnwGUHCliGrrTz
	YtTFz8KXJqYw6i0FQN/gs1hYlKwRB6y518Cm6seU/nVPvW8tnxEFn0WbFry/GUHBDBU+Os7vd4AyZ
	33G9StSqu0+UPLb/YDSCFvslHp9EYTLVPZa1Jkq+vduj/sRWfKdJY75ScD6q457TWwUC03KAvMq6Q
	sWEUVhLIkD2stNz30tDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAFIH-006hXw-UN; Wed, 19 Jan 2022 18:02:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAFI4-006hTD-IU; Wed, 19 Jan 2022 18:02:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 277D161659;
 Wed, 19 Jan 2022 18:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0858EC340E1;
 Wed, 19 Jan 2022 18:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642615355;
 bh=lFbFmk/aY3Awpx6kg8ejVPc7bOfnP/ly0j3vvYiYSLk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=X13pX4fJy3fRJZKI7F7MRVUE9FDrT6nBmOjzxghhUmAx2oa89pVuGluI1ZYQomcy6
 J+u9NeebYvDBhaYmNBCPyWnAjj843aXJvGQIg5lEMex3rGmpPraZKtS0Sx3GixOSWu
 vOFCHvDwIjpsucj9Dm3JF8fyjUVl+U1NJKul284TSlhz9ilYs39lj11XWUJ/f0eAWA
 aoMRjTtdGCjJ1nOQKkTsTFwusUiXG8pCTiSkWRpA4jWRHdLqZ9X43k7TEqlfTQxDbf
 s7aV3RXj48GWZ8ij+1oHhON0CDe042M5476jVs1mtL2ADTwQ7m1iF2hjoGebAbAjNd
 8fitwOsx/LB2w==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, Julian Braha <julianbraha@gmail.com>,
 matthias.bgg@gmail.com, tzungbi@google.com, geert+renesas@glider.be,
 perex@perex.cz, trevor.wu@mediatek.com
Cc: linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, fazilyildiran@gmail.com,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220117050324.68371-1-julianbraha@gmail.com>
References: <20220117050324.68371-1-julianbraha@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: fix unmet dependency on GPIOLIB for
 SND_SOC_DMIC
Message-Id: <164261535273.2816847.12797426159265748718.b4-ty@kernel.org>
Date: Wed, 19 Jan 2022 18:02:32 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_100236_677466_B2CF89FE 
X-CRM114-Status: GOOD (  14.28  )
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

On Mon, 17 Jan 2022 00:03:24 -0500, Julian Braha wrote:
> When SND_SOC_MT8195_MT6359_RT1011_RT5682 is selected,
> and GPIOLIB is not selected,
> Kbuild gives the following warning:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_DMIC
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
>   Selected by [y]:
>   - SND_SOC_MT8195_MT6359_RT1011_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8195 [=y] && MTK_PMIC_WRAP [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: mediatek: fix unmet dependency on GPIOLIB for SND_SOC_DMIC
      commit: 579b2c8f72d974f27d85bbd53846f34675ee3b01

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
