Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCDAC43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OilpxlfCgd6H4m5VAhZYyn0dzb4eCK0CVjSRiHN5c9Y=; b=T340czuzZIOShto2bt3R01BUuy
	GY1FV45TWexwJUP7hJU0MoIVKlnyCV36/stR/4bbeRIpl3JsNR+XWQiIIeq89F+to4pfpFZX/vKjy
	AllF6xsJHIiuPJX0Uuq0N9/u6vvQe+x4HT6Rh/Q25MIBZJBR9xX4TvvNuu2zPKqmPoDBW3yduhMV8
	1Kon9Fpv5AzbMe4D+RbqHbNyXR1WD8JAGIcMglYBLTqrRXJ8Ceaskc2ItdYXL3YPy+zOhCfysk1Pu
	FLvaHu1o+kKRtfqeG5O4l35kkpD93TKzoZ9HVYRpFZXDyIIEyKSzFDESTS8CQtjmTn0GrDu7Lvjac
	/BlrlTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZgT-00H263-SP; Fri, 25 Nov 2022 14:28:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZfN-00H1cp-3j; Fri, 25 Nov 2022 14:26:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CFB2EB82B02;
	Fri, 25 Nov 2022 14:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E64C433D7;
	Fri, 25 Nov 2022 14:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669386413;
	bh=1hTsLsAyt9tlsWhWVofHJBaSZd45+Oiiml90QdlACHA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d7i1XVyeymPD/W1dB8wSyfn631s2sYLxwcYl+RLcNcsR+oLFw/bWQO3xFUVKojZuW
	 bq1AjRZFEQcjgWYrWDTD7sWLkBB8W+lc8T/KxjeshziQBlA+4xcpUtHlFCBHP8CSI/
	 h6HfX42vHxnmYXUtcjxW0+U27Yn2g0dg9Hy0aIsA3mg/fRbeBbF5azaLBzpMHOtkUi
	 FJ9XxcdliNtIir2Hh+545ihzDwwM9aDJP9ojpV+mS9Ycpub+z9RD8CC4Mxa8og/VWR
	 XKW1tQZ7HxiLjAKKbasWJI1ZhTduyIvhfOQFQbfGywhD9tE+fuf7Eq0SXOUGwRm/vQ
	 J5QG5vKihy7xw==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com
Cc: linux-kernel@vger.kernel.org, ajye_huang@compal.corp-partner.google.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20221123161130.543-1-jiaxin.yu@mediatek.com>
References: <20221123161130.543-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Correct I2S shared clocks
Message-Id: <166938641125.506633.2366556842342118458.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:26:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_062657_387104_31ED40CB 
X-CRM114-Status: GOOD (  11.97  )
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

On Thu, 24 Nov 2022 00:11:30 +0800, Jiaxin Yu wrote:
> In mt8186 platform, I2S2 should be the main I2S port that will provide the
> clock, on the contrary I2S3 should be the second I2S port that will use
> this clock.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Correct I2S shared clocks
      commit: 248579fc9a4f3bf36e7cfe9f6a354cee0f9848dc

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

