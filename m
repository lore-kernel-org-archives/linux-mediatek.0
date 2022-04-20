Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B606C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 21:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=innjWJh0dgP4O5L9lq0NxQmcaxK2kv/PDXTpxMe9f3U=; b=maiyVOv55HZ31M
	KA6vCF/zFbpz9dquNXbf+NwzLtunHwcmJLZ5Bo3XORx+tLydyeUTdEYH1xX+mu8Hfa+fXm4qsZKZq
	4rdkC1X/aM8v/VnK8C0P5f/0fmpbO+VNE3cp2dNa+a1wof3FkjadIEGJlIOlxfr4FhAx5ccs9bQT8
	YYVriBwN0YRiRmGgcyuOmJ4niw8zqdKFIBbgGEcn6Ry8HZByLvquBI4kf0iiKxCEG8Khr2DdFnwX0
	QjfsMQsR36qgPiLXr+6ACuRg+lOsjVU478N2pttMPtnMD3dGMeHdji2ErRVJSwvNCvRs5qdjUuVnP
	njE/qebL9QTouZ8HTGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhI4h-00ATI5-Hx; Wed, 20 Apr 2022 21:41:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhI4W-00ATDb-2D; Wed, 20 Apr 2022 21:41:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 918C561984;
 Wed, 20 Apr 2022 21:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCC7C385A0;
 Wed, 20 Apr 2022 21:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650490869;
 bh=4o+rRgdBUkHNDZ6Md2nImSgDPD+EYrSKUa+rPtXadeI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ONozDncWv/9yq2y5PKHzUcm2FYVPLlZnFOsIeN0bbgcRTTSRX2WoBwy42E07hdiE6
 NlPH2ISCS3bnvFwDYqDGEXFkpgLr/mj78xJ7eJCbQLpaNCcJKoeF+G0mBegJNxuTBT
 fRdUokWLXUpIWbkoVRYuaWoy557fpTDM4yveQ/p51dleTWq5HjqOiCvCf6s0V0S/zq
 G4mcJhYw4g33cMfkO3pX3p3nvCeX9mqBB9V1yuKlQhpVArMRtzCB4VGNKo5NStiEax
 Ot4k1UyZ6tNtdOQn9ujbJrZI6C8bOWgx5NfpICM4NFaYrlwqErYF2iLO6jatceYW7f
 dM3UXWBDPSALw==
From: Mark Brown <broonie@kernel.org>
To: angelogioacchino.delregno@collabora.com
Cc: linux-mediatek@lists.infradead.org, nfraprado@collabora.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
In-Reply-To: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
References: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 0/8] MediaTek SPI controller cleanups and documentation
Message-Id: <165049086768.143449.12761284074720810678.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 22:41:07 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_144112_179388_8DDA7CD1 
X-CRM114-Status: GOOD (  14.71  )
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

On Thu, 7 Apr 2022 13:44:20 +0200, AngeloGioacchino Del Regno wrote:
> This series performs some cleanups to the spi-mt65xx driver, removing
> all gotos, simplifying the probe function and adding kerneldoc to the
> driver structures.
> 
> Changes in v2:
> - Rebased over next-20220407 for new spimem commits
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/8] spi: mt65xx: Simplify probe function with devm_spi_alloc_master
      commit: ace145802350e0f8eec4a40522a1b1d5a4f90114
[2/8] spi: mt65xx: Switch to device_get_match_data()
      commit: 7f7cdef7288a7da117a54249b680b04f503f8a67
[3/8] spi: mt65xx: Add and use pointer to struct device in mtk_spi_probe()
      commit: 6b4440584b92851af44b235ad825c8554dd143c0
[4/8] spi: mt65xx: Move clock parent setting to remove clock disable gotos
      commit: 5dee8bb8d14dc7536cec58cc1d94148dce89dfc5
[5/8] spi: mt65xx: Move pm_runtime_enable() call to remove all gotos
      commit: 5088b3136439896c2858173402f32dada4db69f6
[6/8] spi: mt65xx: Simplify probe function with dev_err_probe()
      commit: 20cdbb80095711decef6401f839aca8476be1910
[7/8] spi: mt65xx: Add kerneldoc for driver structures
      commit: 3c5cd2e23fe4c840b437496e131e1f74afaebbbd
[8/8] spi: mt65xx: Fix definitions indentation
      commit: 8e8a9e364a3b3053f689a649df1107e61b9e3bed

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
