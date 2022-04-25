Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86776C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 17:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MM0E4ISYu+MJZxec2vhYCSoAq+7aOIY37IAEwu2h750=; b=NxFWX8bhMd/791
	jqumKbKshkv76VJ3bE4Y7eb3uUzzC5YAeSaSM1nxb8uOzdGJVu6WJxBffOaK1mgM3Jd9pTnZJ3gJj
	Ujdsm1oY6UVZRMUN3bKIFY1wsaGHP0bTeyGnkUumt3FH7IDxBf6fCUyydaEaqmXEYN95DMZ0TjQm1
	Myrf1SrkyLjGJRJbbT48xE44hzl+FV0ueREKPFR3zOyFyXt0WXGt0loEZeIqyIxm0rH/LKosHIRkc
	IjP1j9+NFmV5+FkvKEtRUEtV5I1WKzMntBz6cyIOPfAl4FhC2mbMxXrnEq3AGkMSerCyl17xhAD0/
	rsagrwxxSFyU/EZUTGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj2T3-00AeMo-6c; Mon, 25 Apr 2022 17:25:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj2Rv-00AdsW-IZ; Mon, 25 Apr 2022 17:24:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E4FA61501;
 Mon, 25 Apr 2022 17:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B27C385A4;
 Mon, 25 Apr 2022 17:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907474;
 bh=/eg1aAQGAhXyy+euVBTjuXj3vXPgIAwKG34G46xjphM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jt7M9osM6PGY8RKw21ZKDnjUT5uRB/zCjP8t4Akgeytohy+jyODJheE/nvOwDa1t8
 cfg2a75JtASaoc0k5JzcLAHQ7dnEHFnzSAZsk8fCbpCAtJla6HgGEbH4W7m+fDZaj4
 gtV4zjyAXIMBrqiRmejQ6/tqWJ16XFjdZWAvnTmSQNXsp7flV75570lHlPVEAGtqbT
 f70bpC2CuqDEYpe0OeF8MEtHuXKVj0DdLRSTsjuKc7ieqeDyvpUbGXBh7AgvT/Csqw
 YLr4R4O++XWkpftl9ivE0DbOXNPVji8jlZtaladHg+m0tPE/wTtRMJUz5YmHqSdAKI
 EUdUOUTPjPu+Q==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 geert@linux-m68k.org, perex@perex.cz, yc.hung@mediatek.com,
 pierre-louis.bossart@linux.intel.com, allen-kh.cheng@mediatek.com,
 tinghan.shen@mediatek.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, peter.ujfalusi@linux.intel.com,
 tiwai@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20220422055659.8738-1-tinghan.shen@mediatek.com>
References: <20220422055659.8738-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH v1 0/4] Add support of MediaTek mt8186 to SOF
Message-Id: <165090747057.583823.11213583506158187957.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:30 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_102435_748696_D922FF50 
X-CRM114-Status: GOOD (  13.30  )
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

On Fri, 22 Apr 2022 13:56:55 +0800, Tinghan Shen wrote:
> Add support of MediaTek mt8186 SoC DSP to SOF.
> This series is taken from thesofproject/linux/tree/topic/sof-dev-rebase.
> 
> Tinghan Shen (4):
>   ASoC: SOF: mediatek: Add mt8186 hardware support
>   ASoC: SOF: mediatek: Add mt8186 sof fw loader and dsp ops
>   ASoC: SOF: mediatek: Add mt8186 dsp clock support
>   ASoC: SOF: mediatek: Add DSP system PM callback for mt8186
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: mediatek: Add mt8186 hardware support
      commit: 1f0214a86de87011ecb96f22545dd6e5c7324cd7
[2/4] ASoC: SOF: mediatek: Add mt8186 sof fw loader and dsp ops
      commit: 570c14dc92d5dc6f732cb74fa691ef909d182710
[3/4] ASoC: SOF: mediatek: Add mt8186 dsp clock support
      commit: 210b3ab932f7a08d8b912c497ca0ca86f712814f
[4/4] ASoC: SOF: mediatek: Add DSP system PM callback for mt8186
      commit: 0e0b83cc7ec7fc5e6695aa6ebbb0961e26096105

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
