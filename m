Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F65CC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgBYOtyaDbvenfg+2Pevj8lpnFyJr6WEwQoNInbuY24=; b=tZW41PwnhEzeDoc1F0fHa7Qyut
	OspAHEYOYXSvn6baIM8Erz9DQKBZipU2Ql9jERKcF6FQnRzBdJ0qUSFg+71QIvu1C9gHUaCESSX+j
	vK5ROvR+nyWty3Ijj2aWA1AQ+xk0AVifNikm79lPVPx1n+axt5QWDvv0F8h5nfXs7rzZlYBO/Mltj
	irK1QKaHXj7rIdxsyo85HxAoI7nP/JT0PVsbUrkAjY/Yy8gfBMovBITu96iVlvvRkQDB7UY91bPKD
	U0RWxXkfM25GOGrmVYV3EvjPZdsp9X9kXgr5BGRI2d2ZmeS2nMoplmGO2WANWXn/YvF4awOIYYIDk
	ojdRdflw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odtH4-003AjD-5D; Thu, 29 Sep 2022 13:08:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odtGe-003AbE-Op; Thu, 29 Sep 2022 13:08:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0318D60F83;
	Thu, 29 Sep 2022 13:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F72C433C1;
	Thu, 29 Sep 2022 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664456875;
	bh=sj+OdEAtykHcBziJ2ilGZDg/T4fIfEtsnxrbhj4A+U0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s3E375LbnG4eXybX2ENtevXcY20C0PZdCx3Q3e6yp/kZXN7zNECGzVmHl32719qh/
	 raW4MuWEJZvdJiJQCVTlE7KErEZv8Lk215c1IvjuZmAhYY1SqupUdapxcZ+ofl+rrQ
	 oqA2Dm1oqRfXid7alPVTyIDylj18xPf+x6sss1RJJcz6uR53Lzldb3Qp4/q5LMtMpG
	 yt6W2CcQiS9OIxn4Fj9N3/CpN5LnqlhsGUrSZqOkAYAQVjnDP/pPag0RU/iSlH7ULl
	 qIDu7AewPCAFjTtOCm27Coc+pVraVBWFzSPD3Ro6umAKSEGWBtRTJVpjPR2dtSNJGq
	 sP2+Bn4vk7bIQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
 Colin Ian King <colin.i.king@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220928220417.66799-1-colin.i.king@gmail.com>
References: <20220928220417.66799-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Fix spelling mistake "slect" -> "select"
Message-Id: <166445687286.114358.7172094686592004129.b4-ty@kernel.org>
Date: Thu, 29 Sep 2022 14:07:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_060756_860391_02EDF323 
X-CRM114-Status: GOOD (  11.92  )
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

On Wed, 28 Sep 2022 23:04:17 +0100, Colin Ian King wrote:
> There are some spelling mistakes in dev_err messages. Fix them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Fix spelling mistake "slect" -> "select"
      commit: 65c94e4d15830406a31a55085887e97bacd25434

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

