Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654B4C32774
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNUxDp/ERmJYjT0s1+4MLm1f1tNR40YdclX+Gfdogcc=; b=MM892P69qbgL8PCB2M4v8U1IOT
	n7AKucLUq1AT2HKJHCkLjjror1LocBidemRLU0B6RpLYO8d27Cp8AUkcvTo0G2qSZ/QcBSoO/k1Mr
	J9jHMCcsK1n2zvbov82DocH2yNqiu+qPEn+wop08fLEI9w6bOhIyE2UoesWtIcPKm4gTIM/lgUoT7
	adgOoMhX7uE2Frc31lqZ4aACVHq3RjjcFxCKYlG076nfW5PSh7mLyEFh8prtMjDCKabuO8Uvty0LZ
	ZwohHKsGlk7ei/1QOsMFRbyvkOkC4uGtpj1J4X7Mv+uuRknMiA2SW/VKR0zrVsIiijeQ5PaM+41Rm
	eYQwATgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREnu-00FitF-Vn; Thu, 25 Aug 2022 15:29:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREmS-00Fi88-94; Thu, 25 Aug 2022 15:28:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4DBD61A9C;
	Thu, 25 Aug 2022 15:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1217C43470;
	Thu, 25 Aug 2022 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661441302;
	bh=yKyrbvscUxBwrXmqG5oLczuAvPaScnAReCHkvRnGolI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Cd1w5Anzs8A92wu9QLzQRLi2mmaTdtLxtA0SiMVUgcDjfqgy/OW1BTq629FuYNPWB
	 AHwLSRCL3JIsaqE1USVAwSlQVho6W1tvURq098/xRi0XRLtc5/JKmsBRsh5tU1yuwj
	 WoKDmxwOf3zes0JL14l1SVdA7XzM81jc2su/zEwzH3Nk1Iq+dYBiaRvNiLml0xM0+S
	 DtwvO1ags0IrXU4vyfQBUsWpqn+NhiExewo62RLqXCSgj3s5YZyEaoEC9Y4Jo4CB+T
	 +1U9VabK9CaRmOmZahgTfdBTv3GuDLehcLiv32HGP+QkWWPPX3tyjFsCszcv7gPYMB
	 qLhvsO63w40Hw==
From: Mark Brown <broonie@kernel.org>
To: chunxu.li@mediatek.com, nfraprado@collabora.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, project_global_chrome_upstream_group@mediatek.com, matthias.bgg@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220824122319.23918-1-chunxu.li@mediatek.com>
References: <20220824122319.23918-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH v2 0/2] ASoC: mediatek: dt-bindings: modify machine
Message-Id: <166144129763.526663.3235477335040031977.b4-ty@kernel.org>
Date: Thu, 25 Aug 2022 16:28:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_082828_408246_B94C5DBA 
X-CRM114-Status: GOOD (  14.79  )
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

On Wed, 24 Aug 2022 20:23:17 +0800, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> Changes since V1:
>   - remove unnecessary quotes
> 
> Add SOF related field.
> 1. Add a property "mediatek,adsp", Only when adsp phandle could be retrieved,
>  from DTS, the SOF related part of machine driver is executed.
> 2. Add a property "mediatek,dai-link" to support dai-links could be specified
>  from DTS
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: dt-bindings: modify machine bindings for SOF
      commit: 1173107d7c129ff87224814fd38fce5db023aaa0
[2/2] ASoC: mediatek: dt-bindings: modify machine bindings for SOF
      commit: 1173107d7c129ff87224814fd38fce5db023aaa0

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

