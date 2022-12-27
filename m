Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2DCC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 12:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQJEN7FWc/2k6nF/wGz9/+FrC5L1b+8/SOmBbCgEa4o=; b=p494YneXUFJ5zYCMZgC2pJwM62
	ygQLHzFvV0waCdajMWQX6EiQgJ3a8/PwA6RVNxLuaLOU0KkHMEKPTzVzmGulGvgiAJ7zpdOOVSB/E
	rZpOHQGzVlU4Je2OhfDrq4EUWzDFfXN5wrdJ/Z/+nXHlL+2PZ1VqaZmUs02kJks9mXxPa7UoSLUdG
	3/RX3ANTGQ9fIkspuYDglQ2nssGQZ3f2gmSFKFAMPkqlf4POKQuKc20t5GVcTgOdSb93n0JRAh6mL
	uqnKnT6AWnxgiJ+FoJPuUs1yS/AAkF0hDykW/0RgPkDusbqUBPSjyC2DOZWydE3DR7/YHJFra15tJ
	SyhnvWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8bd-00CeCd-D1; Tue, 27 Dec 2022 11:58:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8a9-00CdgQ-Fd; Tue, 27 Dec 2022 11:57:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC85061013;
	Tue, 27 Dec 2022 11:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33125C433EF;
	Tue, 27 Dec 2022 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672142240;
	bh=Tp797qKymqBv9WjfLeXEP16pI60mkQzwoax0c7aWd4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h5PqXQt+1dOSdfqT0sUbOR6JLvDmP4bByJjBGkaFm75wKOFpxrJzF7nc4Dr7JAWFI
	 fKusaXiCtsWq9WS3gWWr7EmLaiCyxKc7Vc5DfdIc6qpaA8go4rtlaDLFU5CuCuin9h
	 QjqH0PWpSB+zbTNrLS/Nwz0fs+0A6cu1+qWfm1fvc1vnWl/VYchGh5/NIxVC50Euyp
	 elnh+wER6z/eexITr9fGXBat1jYnR9XPc51xhHRdXD9JjmVjMIsBMl8oxAk9PtRiHV
	 FjQO9BNm7Iu1jygJKsKUBbHI9IpqmfjEfQojTW7Yo9qHCprSxZ7dWlkjDEBZ9PuMny
	 YYWell7aWyiTA==
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunxu Li <chunxu.li@mediatek.com>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Curtis Malainey <cujomalainey@chromium.org>
In-Reply-To: <20221215061046.16934-1-yc.hung@mediatek.com>
References: <20221215061046.16934-1-yc.hung@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8195: remove a redundant
 comparison of sram
Message-Id: <167214223584.82924.11453521857555977092.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_035736_199043_F88E4231 
X-CRM114-Status: GOOD (  12.88  )
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

On Thu, 15 Dec 2022 14:10:46 +0800, YC Hung wrote:
> DSP SRAM is not used for audio shared buffer between host and DSP so
> TOTAL_SIZE_SHARED_SRAM_FROM_TAIL is zero. Remove the definition and
> redundant comparison to fix coverity "unsigned compared against 0".
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: mt8195: remove a redundant comparison of sram
      commit: 3f58ff6b53c11773b1bd564082fae37d48e0cc40

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

