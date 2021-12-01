Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8E8C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUhUsskIvDg7eemVqzS1IpsdjIdydgJSrx1O6qyNkds=; b=sQUbO4DqhRQaLr
	m1K7GvLvB18unWJsq1qwNAoNV7wEMcXP94Pi2ffA8z5X7giN0kvUEYmZGT7ddu6YL/sCqUPMtHHdv
	DnZLVRsClp0gFYdDc9FCkr+p3SPCnLHUTP8CfiTpqnHIYP6DVwcBu3fEGKsT7HweWRGWGE0a+sQOw
	staiLSIni1NHi3RGXYmAzjyrGQOZLvSGS3J1euuBktQEwBV3u/7PoYyGxt8PVKkJmzCGxxa6z4Ccr
	0GQtvYTq+9qI56pESOoiVa9UFcnBiLmbH82cTLrjnYsfv7ePQMQ1R9H+NQMVOeswCNfzfzulCAzLJ
	TZJupxNh8FIisNfdP+4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msUPO-009o5G-PQ; Wed, 01 Dec 2021 18:32:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msUOz-009nqH-F8; Wed, 01 Dec 2021 18:32:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18609B820FC;
 Wed,  1 Dec 2021 18:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA88FC53FCF;
 Wed,  1 Dec 2021 18:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383538;
 bh=DbZYTt6Xk61X6E64B2G6G9w0VkROaHjiFX2uaD0wNNg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SJ2EG+xrdvPZD6skv01hvMRDI4+2RGv4Ig9DI5MvpgJJwYwEA/gXuwPd/+5a1nNt4
 YRDybhqIWZvXurkJ1nLrP9zW7NBOXg18zY4GKgRuslx5x1DaGvJ0hB1DwyWr/OobpR
 SLBK8Yy59XdZMd4qdnz4KmTFGjIeyPZ35teoIpGAlx4yLvCOg/3OqgW9ho4Z7bBlfZ
 GyPU5C6AjZk6eJy04VHI6kOGbBzD7rMwLzQFTc2aSrn2ntTJtmLaXh89WUxg+rPaJc
 +hMf44lEJneiKx1V/gFEkWa8sFXy0XjhVkZ9Iy6nJLaX30r6oBpHY4/KZc8FY/MEYj
 iPMwW1ofG6MJA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Bixuan Cui <cuibixuan@huawei.com>, Trevor Wu <trevor.wu@mediatek.com>
In-Reply-To: <20211127093147.17368-1-rikard.falkeborn@gmail.com>
References: <20211127093147.17368-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Constify static snd_soc_ops
Message-Id: <163838353641.2179787.17471282072655140099.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:32:16 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_103221_715910_36127106 
X-CRM114-Status: GOOD (  13.82  )
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

On Sat, 27 Nov 2021 10:31:47 +0100, Rikard Falkeborn wrote:
> These are only assigned to the ops field in the snd_soc_dai_link which
> is a pointer to const struct snd_soc_ops. Make them const to allow the
> compiler to put them in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Constify static snd_soc_ops
      commit: 8752d9a82fd065ef60c9a0e0e8ec820327509382

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
