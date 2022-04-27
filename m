Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DE9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 22:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lA3PwEBb9mfzn2AuvSCI7LoTk8dtciLlm3FwRbXTg0=; b=KCfcGxjFfB8dcL
	jdLPEolTMf7UsuFAWGYXIOcu90ct3zy7FBCVoggrcbY9boLKNPhJvvFTBmtkg/I+mriI7FeU8BJQd
	dD18a62w4DWUxAQ/W+kj2KPq+sp88/+IGUwb5zyM+SrfMuquVR6cMhy11qowkCMZpzzZ97iOM+W7a
	NVTh1Bfq6tiWhjmdTRJq9JjU3wSat1zzgi1heYf4+bbjmNUeKG8cM7zFH9Jpw4KPiDMorNb2eOksa
	OHfEeL6Cq5orVWVwlNX37P+DzHXcsFAsUjrdUR8H8hBthsStdaQe5V+bJ7SueLLxoufSA3UX5GuJw
	y2Hq/ab8dZQGDAgbMdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njpkP-003iGx-SL; Wed, 27 Apr 2022 22:02:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njpkD-003iEQ-FL; Wed, 27 Apr 2022 22:02:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E24D0B82B06;
 Wed, 27 Apr 2022 22:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374A9C385A7;
 Wed, 27 Apr 2022 22:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651096962;
 bh=jGR3MtKiwYyR+lUnJSaAaDsNLiw4lH+yX1MtYnOs/i4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KYAsSER2fa68mS9DGuKJMxkz2YSD++pSrMvoxGWqBZ5FXe3TlAtwgsOqiA4aJk+7P
 FuC7iZnPgJiRFtfG+2TqFhKDB+aB4DF9nCvdnEZwf4nt1QKW3etyqCmmBh3DpTgIZm
 wFPwoKtcIqCFyYKxr8vgd+ej8mL9eM5Kz0ftgvB0h+bNI2N9rWu6XiD0pSWSBp8lS9
 Op3mySF/PDzwazx7lnmoYQibcQyvh6ZJbp9xQeZHubDMvGDQRgM7Q+s+BQWXFdt8b1
 gp5kEKwMNBA4bHkInGCJQiEozfrj5VYJpiGnY2D0C6L4paMmJuzSHS2r9Cdic0GlUW
 1mFKxLwcqiTVg==
From: Mark Brown <broonie@kernel.org>
To: yc.hung@mediatek.com, tiwai@suse.com, matthias.bgg@gmail.com,
 perex@perex.cz, allen-kh.cheng@mediatek.com, ranjani.sridharan@linux.intel.com,
 yangyingliang@huawei.com, daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tinghan.shen@mediatek.com,
 lgirdwood@gmail.com
Cc: sound-open-firmware@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
In-Reply-To: <20220427071030.10172-1-tinghan.shen@mediatek.com>
References: <20220427071030.10172-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2] ASoC: SOF: mediatek: Fix allyesconfig build error
Message-Id: <165109695894.498174.15533470381534539256.b4-ty@kernel.org>
Date: Wed, 27 Apr 2022 23:02:38 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_150245_696899_9172BDEB 
X-CRM114-Status: GOOD (  11.58  )
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

On Wed, 27 Apr 2022 15:10:30 +0800, Tinghan Shen wrote:
> ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o:(.opd+0x18): multiple
> definition of `adsp_clock_on';
> sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(.opd+0x60): first defined
> here
> ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o: in function
> `.adsp_clock_on':
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: Fix allyesconfig build error
      commit: 9ce170dc9c08895846c5828addb724e42bf98484

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
