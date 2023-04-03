Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C7FC76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 15:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0TOOSNi3UB3QVVKxBKmIaumeF0hMOeZXBo1iOoSlGk=; b=nERssgpfCskBVm488nNIvMvDQb
	KHSp+VKzcXGtjmujENYnGdzCgdIszxl6D/n/kypgUvVdBlKnAi2cnDE0SIifTwhscZfxqYywh+Nt6
	/Mp8RnpY1dE4aI0NDQ2v52PiOlV5gAqKv3Pd3vP0QZJ+C/ggTRRHOFqwhfTSIs9IYsPUI4VS495bN
	SiK1HXYi0QImgkSzgVKoTSnkRRwPQ1vhxIRitMLdKaZwZiJAxgTvKgHWhXSP0h+pdx84eEvcK8JhD
	EXwr26rWK6s/T3pv0eY6isHaxS0K15ODWMbVQbBwT3/3vVizQjmWMwzgFXNkkBH6UXCAI/KUehQN/
	BGpg2iXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjLmp-00Fjdk-0q;
	Mon, 03 Apr 2023 15:07:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjLml-00Fjck-1J;
	Mon, 03 Apr 2023 15:07:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4038A61FC7;
	Mon,  3 Apr 2023 15:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72277C433EF;
	Mon,  3 Apr 2023 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680534473;
	bh=BSS3Ft8JQ9etJOn1zN0oTwzUaes1AtJBsgymC/v4kdc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LH6/UPc2zLS065s2+tZPcVdZUiadCX0D0+ucwbowf+9GAdMeVXzEUGVjxqu6zBBlu
	 PxGDkfaLD4x0nPXajNRS7WcMTdKpyQ74urU0X29Xc4DeJTHLLpP/8o4ch58oA4nZtI
	 3HCO81N1V9Ko9cJMH4tH3EAPvUPRGEkdB295IcU1lfq9sKwoBmhMSlCTNMpEGgJZHX
	 VIBB9CXQyFAXAjisMPGJDoLg2PLMITWOfOh/tNThpFHBiiJrO1tUc6EXj/GqEbXvht
	 YpXJ/9kftMUe9VMfRs7aK4bHQuJ1e54oQsnT6oR4q/KhNJTh6mg+dbNlmQbiCkVHZG
	 AQe0G0fPoHYUw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20230329080418.1100-1-allen-kh.cheng@mediatek.com>
References: <20230329080418.1100-1-allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Move some prints to debug
 level
Message-Id: <168053447118.47553.13821701231639468315.b4-ty@kernel.org>
Date: Mon, 03 Apr 2023 16:07:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_080755_506998_3D61C189 
X-CRM114-Status: GOOD (  12.57  )
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

On Wed, 29 Mar 2023 16:04:18 +0800, Allen-KH Cheng wrote:
> There are many log messages scattered throughout the mt8186 sound
> drivers, and they are frequently triggered.
> 
> To avoid spamming the console, move these messages to the debug level.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Move some prints to debug level
      commit: 3af24372964a8f999d62427c0585d9a4693ae4e4

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


