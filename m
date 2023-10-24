Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F4DC25B6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 18:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miR0E1/vMgmxUM8YtZNU/wOkobD3lhBj9MQ3m3Bn74M=; b=ZLvxRAyXal6TUrau7SvgXFbyj8
	QRsaXuOgcR3Bull34qUq33pSDroBcU4NvEYStd4bGW7WFMBMHz1gXegdB/rPIZU53PNOaArvvBbzO
	PHOv/RV2TE3u8KNDdXAWfZ9aBMMTQ9PUaQlrEWOvQYp/kJmiGA+0gFiM7Wfl7Y3yqzVAmqjf1FwJB
	RTeVtaqD/OFKo1Ay4k93eAQfl+EB29X7RUYDcvFb5/gVtn1+8HYC40sDAP8BV3obuuTuZh1Q9RbFU
	J98uZC0TycXqKWbLQxkEJqUQwp0smRLg9L5j2OpzzocZBNJnSM8VXmGsb7QGIg1HNT46aDyojrebS
	bhVebPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvMX6-00AhZ1-04;
	Tue, 24 Oct 2023 18:53:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvMX1-00AhXm-2p;
	Tue, 24 Oct 2023 18:53:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0743FCE31CB;
	Tue, 24 Oct 2023 18:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E3DC433C7;
	Tue, 24 Oct 2023 18:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698173613;
	bh=tqKKyqDACaNThpvov4ZEREo0ocu9Uu1TB1KubL2Jyrk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=upJ/xPXUUl2MVFWJAnynPy1fEw+RcVMCd7BRbMNgQG8LRpN+NXeVsBxbbX7DTvVQ1
	 MxxK2JTWCB3XWh6z0nqsuBV47X9edm7/QsIS86/UgbOMgRzDYUW8QIyXY+ea773pjU
	 yPLTSX0U1EZwK92rSSpGag2/n5im7zDXFwWWpxEU3/RV0aY4dWgrP1pGDfBOrDmWVE
	 quaW4R4NBl50hwxFKo/Sw1IbFixev5TDxpWX5HdjB71o/Sx/a0Bk7MVf0IpZIn17Cy
	 TC8KpsHAXYh4IB25/glnpHNIe9tDyrcvgFGxaNvTm/bqskNYwovn/Bg6ukA93+JfZq
	 2FVlR1jK+zR9w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231023151704.670240-1-colin.i.king@gmail.com>
References: <20231023151704.670240-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: mediatek: mt8186: remove redundant
 assignments to variable tdm_con
Message-Id: <169817361079.82257.18121881250208985059.b4-ty@kernel.org>
Date: Tue, 24 Oct 2023 19:53:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_115336_095903_EBA1D7B2 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon, 23 Oct 2023 16:17:04 +0100, Colin Ian King wrote:
> There are two occurrences where variable tdm_con is being initialized
> to zero and the next statement re-assigns tdm_con to a new value. The
> initializations are redundant and can be removed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: remove redundant assignments to variable tdm_con
      commit: 2e2a1613342658962250873cb8a0406bebdab9e3

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


