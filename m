Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC77C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 19:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQSBIOOZnRoAOqgF9jdJCGGsNH8gubmv8AlLliWgR4Y=; b=sgW7zR/Z5lfekU
	sDjMYlTUsb540ezDoWg3RLy2yN/dKLD7zoSxxC209vKrQ5Ce3ZYcW0UmWHT9cKIeyJgJjWhtxr2jE
	5e5HaysZyddwpIpBSQaLXMFSGT9WfIDFj6IGczvGcUYuitcYUmlNJ2pPm+bfiX3eU6YlA2Qwz952v
	iO5EhfOqRUixXwaxgPloo7lVBBdZjU72hBeHL5r2wtNUqlxK7PcBokgH4gJQy96647PnP8fD4YRqT
	Pg58dc5L+wpaGZvW4WZ4aGtWDzMg5lkiChBoN4vteN7k87KFW/LQj/XX/KbHhKlE4IowC4ubqEWaC
	l5o+0I2kEQkAQghHoV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOlUs-00Dld4-GZ; Mon, 28 Feb 2022 19:15:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOlUh-00Dlbk-1N; Mon, 28 Feb 2022 19:15:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEB2D61583;
 Mon, 28 Feb 2022 19:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E1DC340F3;
 Mon, 28 Feb 2022 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075737;
 bh=QMnH25jeKQK2fr6BizBXEDFvSipSItzPlv7VILXcuB8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qn1xxKzrBMx6gzQOnPPikBTdhge6w+TPfpMphxMBnscom5bnyygc/8+0MtZxR/mlF
 lQMZXw7xF93AQ8LF/0IHoO5yolN9gSPcFnO2mXiVfL9On7Js+kcjllsTv3C8nVXm9e
 o4jzyaBbq+WKIijT+/QyE9p2HyeW53fYW340f1KSuRXF4lhKkHJR2oxXunEg3BaGHX
 4hxIC+ABh5JmFgS84rMlOfNi1M0kuHEGkKNLESRzeImbLuWx4iasiIOItTsfJxwIkY
 T9EDk1wClMIGRFsjjLWkN7DYnS5ckZf9+zYWO/D5QEvFSpjvrzVaCzlqLFNMxIhmK8
 16MyVlXgjk/zg==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, Yang Li <yang.lee@linux.alibaba.com>
Cc: perex@perex.cz, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, tiwai@suse.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220224011046.76904-1-yang.lee@linux.alibaba.com>
References: <20220224011046.76904-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] ASoC: mediatek: mt8195: Remove unnecessary print
 function dev_err()
Message-Id: <164607573514.3538791.6139956984733372716.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:35 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_111539_165045_377849BF 
X-CRM114-Status: GOOD (  12.89  )
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

On Thu, 24 Feb 2022 09:10:46 +0800, Yang Li wrote:
> The print function dev_err() is redundant because platform_get_irq()
> already prints an error.
> 
> Eliminate the follow coccicheck warning:
> ./sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:3126:2-9: line 3126 is
> redundant because platform_get_irq() already prints an error
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Remove unnecessary print function dev_err()
      commit: 7d642c9c14b6fae0c05b91a92a86fae6674a2126

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
