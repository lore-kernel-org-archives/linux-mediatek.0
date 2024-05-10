Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF24C25B10
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 May 2024 06:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7PRYWugpBBv/gpZ3rVIVHb57uxHn2I1FQ+P58C7EUg=; b=zJEFeq8G5quHooPIoJ/s3jN70o
	7lEoIzJhF/PW87UxoiCA1mwPIpZTWeNK9W1BhovKZ/AshUwTaQhXKUEb6gEItW/u/TU8d5Atr11bL
	UFsHU/ntgRigqTIgR826CDBLzWyOBcn/MTs/HEcQmhTH6xNcV9LUvlZ+RLiN12BMs982yU0Fi7NuT
	L5wZRxiEeqJ8YVo/TCvjcqgIAkJ3kkvEOf+VR0S0+Uqh4gYeq3JTJ9pAgF1Yvb8h3WFxwvYvZOlXG
	2Lb48dncr8BPiZf9RSVcYG4yOzlRhZOg3F0YokyxKD0QNyzeHytZvfaoUv/W2qJUSZQ+4i2yvvsbO
	eiXSRuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Je3-00000004C75-3ucG;
	Fri, 10 May 2024 06:22:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Jdy-00000004C63-3diN;
	Fri, 10 May 2024 06:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50A9C61E1B;
	Fri, 10 May 2024 06:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464C2C113CC;
	Fri, 10 May 2024 06:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715322128;
	bh=T9jRIkRpc7yRgY2Mi79GUCF2sA7gPb2fWldAOAEDO/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KdNs4fcZdoKnBhQbc27T8hwMl6ahthARRP72sHArwK+IaXVrcuUSnsR0QMVpHlS02
	 ofHYXAFj3fImM0nt1Z0L5esAnNO+Bi4CgQCkFAb1Dox3AJtQHUjmXipHvRjLPmcG53
	 OSND6iGiKvjPNNwBK/b1lPFPfn/IjqUF59+qNkkoyo5+u6j4ogw61iIuAhPaBYVIUB
	 kKB9r7h8eDEmDNlrRHua+FC8QZ0SQsCgs494A7axCiVFXtrR3gRBunG8kB3uvKwie5
	 Ni03D4wiEs020UF0hXl2hCSwrpNvNZHhH1FkDkbJdNCOvV7C0hvsc586RTEAP2i7Gp
	 /isBY25dzuVlw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240509-8192-tdm-v1-1-530b54645763@chromium.org>
References: <20240509-8192-tdm-v1-1-530b54645763@chromium.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: fix register configuration for
 tdm
Message-Id: <171532212481.2044808.8204957750366408255.b4-ty@kernel.org>
Date: Fri, 10 May 2024 07:22:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_232211_012382_3A6BFDBC 
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

On Thu, 09 May 2024 07:31:29 +0000, Hsin-Te Yuan wrote:
> For DSP_A, data is a BCK cycle behind LRCK trigger edge. For DSP_B, this
> delay doesn't exist. Fix the delay configuration to match the standard.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: fix register configuration for tdm
      commit: a85ed162f0efcfdd664954414a05d1d560cc95dc

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


