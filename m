Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56180D3DEA0
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 17:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrTL/jjGzCvqH/yeN5UwgYSLJOMowWMElMOJP+0rKm8=; b=o/b9UuvNFPWrLwCTmDA3Q09GeH
	rSmovxPWKiKY4XFEljrmPYbYsYDVnkEnzyvUyJre+VvUZOOWWi+LuLFaqd730uF0AU8apeWC+rfQF
	mD9N3Scs87U81zt8vzGtz/i4E3IL9PumQDEYE5bmGkH4bZBDUOLypgAAKT6yKVOQV6RUlsUXhGPVo
	YdAHTE8DGcXKQ4TmsdpvxboNx5Jy+3v61j+OnRRsX/+3zkooEcxuL9qHB/axAeQ3ljz8UgUr04ccE
	2BqhZGPgvGcKOspFLeHuBhwoUptq0AJBmIa+ghmVVpcAwp6gxzQvq23sYikcaZ0ok7eUbQmzkBsRa
	+ScZBfKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1r2O-00000001Yid-0tGn;
	Fri, 18 Oct 2024 17:45:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1r0r-00000001YGm-3XeZ;
	Fri, 18 Oct 2024 17:43:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA9685C51A4;
	Fri, 18 Oct 2024 17:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19BDC4CEC5;
	Fri, 18 Oct 2024 17:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729273424;
	bh=XbeyX7FNDvoei3M13wTCf/2lpZ7+fW2VCTRPNVZNE+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GIzd0MvGmMYK3Bfj9BzYhzagaM5G44stCvZx+ikR2dsO+1wyxiS7PV63zcuYistOP
	 a0etq+SfIZ78vO/8bCg+C4wnpir6EINk2DJ1HU3T0klqa54yIKMCdJTDOZy0NimNBC
	 333VhLoggzddiYxk6P8YLY8gBQCZPun6LxsnTkHG8qy5KvVLldZ8NGrlZ40lpI8y6n
	 5oD80cekAjJgfeAkUqyS/eNpNzCbkDhROEHd7ytPVWnQRA1z4i0a1tIFANGc7578FW
	 O6mN5TCSAP7/OO0FP03z18AdvnSmr3stbIW3FSA7e3cd5W3yukHR2ggl8X99peBxPm
	 SmhPeIb5gka2A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241016011851.2023-1-tangbin@cmss.chinamobile.com>
References: <20241016011851.2023-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: remove unnecessary variable
 assignment
Message-Id: <172927342272.163659.4351031993017950860.b4-ty@kernel.org>
Date: Fri, 18 Oct 2024 18:43:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_104345_960797_5390D716 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

On Wed, 16 Oct 2024 09:18:51 +0800, Tang Bin wrote:
> In the function mt8188_adda_mtkaif_init, 'val' to 0 is repeated,
> thus delete one.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188: remove unnecessary variable assignment
      commit: d3170359c96082302e7b6de624cb8592d8954e7d

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


