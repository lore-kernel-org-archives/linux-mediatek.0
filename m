Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B76DC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OOA/atR4kn1fduP5dU5PlfQn3pYohpCvUoZk1S0IeY=; b=v4E/S85wRnQvMZY+xBAT6xqzXG
	ewVbn5CkpRnYPihzB5iFb7cHALgB7r8bKqeXcza9hGg5+15llg0plO9/L1/f/qt//4pJS9foC1sya
	gzm/iT+K8OfSNvbOOHVeJRvH07STLNT2Yh01Gav7IKCwSGrCr9rbLC2M3FmzK1d3N9SJTiS+6tsdh
	Uz3qia1bfsrDXy/iMBtGUslBa6Qj1sLRaNBKq2KOpBsFutWCxjYzQ1uLFQXoxp2+k7PpKQsI9MWdm
	2cgSW2DdB+0dioXXdcYvYAwMVmJjE+vf186/79ZSPH8JoduHpCJ74U+DfSp3CSFrAH09Lps2cGo5k
	F5GYbcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5T94-00HUjC-5F; Wed, 14 Dec 2022 14:54:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5T8r-00HUcx-94; Wed, 14 Dec 2022 14:53:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9CCDA61807;
	Wed, 14 Dec 2022 14:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54770C433EF;
	Wed, 14 Dec 2022 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671029632;
	bh=w5xhvVMm8HcONvBFdH0GaBJz/7H0mrmGXMjWGZuBv8Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Nl26XP32SxbpeOA3E7n4KLxmMIyuxGZPgbGDEYUueETTuCIhMhZz1JUnrIC/ufWYP
	 8eetISDpNIk5bH/qt3D8VjaKqGpE5y0dmyOrKWFqQwCm0nbH9ug1SYHO8ZOGcT5+u3
	 RgII5HQxOL9HrcZK0ndL1oL+FWTfyd3eddZQwlgwjkP0bQFBOo2Jacz/0bdh1YfskP
	 ft7jQhHjFtklBVqVd/3x2oMu/YT60dGF7vSL7pxRYfguRXIpRQUbvY3vtJ8ST4tiJY
	 B9YsN3HSFf6rs3juaYnTCTB0TM2ZItJ0FTBGIB0XvT4yvXUzHoZ4Bi8Yg5frCjljIC
	 7JS8QxUyvDb5Q==
From: Mark Brown <broonie@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chao Song <chao.song@intel.com>, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 chunxu.li@mediatek.com, Trevor Wu <trevor.wu@mediatek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
In-Reply-To: <20221213115617.25086-1-yc.hung@mediatek.com>
References: <20221213115617.25086-1-yc.hung@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: initialize panic_info to zero
Message-Id: <167102962807.215050.16757916120691616071.b4-ty@kernel.org>
Date: Wed, 14 Dec 2022 14:53:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-7e003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_065353_385401_B5158420 
X-CRM114-Status: GOOD (  12.07  )
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

On Tue, 13 Dec 2022 19:56:17 +0800, YC Hung wrote:
> Coverity spotted that panic_info is not initialized to zero in
> mtk_adsp_dump. Using uninitialized value panic_info.linenum when
> calling snd_sof_get_status. Fix this coverity by initializing
> panic_info struct as zero.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: initialize panic_info to zero
      commit: 7bd220f2ba9014b78f0304178103393554b8c4fe

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

