Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEA9C54EAA
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 22:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flnSuFJeK+89EVJtShaKVkqbEPxcP24JRQuCZ06H7Xc=; b=ZV9QGHBFY2e3dGH9aE8B0Wty0X
	KSoK8Y1hASMUlumI0gWN12j/UFhMO6Bwm02c7pikrszNpAW2V+KT07m2AmbB0b7pBKX430uwzCfmQ
	ER86ZwKBWrAfcFBf/8JVayJjaY8pVH5sHJmqH0Xr5GKcVmfo0CojXmJsZwjGN9f6UATaelq/GNlGB
	xa5dTGlu0zRgMzLJmlcDern56uK1mWenVUk68lZPC57JFQzX0zeOHBZhDRmJAd9sHtUanbztRZUE6
	6V+IMibzcbWMuW3OpuJAnJY5znBnFxbbRVdMK9AYx1so6v7WBubyX/lbXr46ywJQf9SRZ+KrABSfS
	csa+VISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLBA5-00Chjk-9l; Thu, 26 Jan 2023 22:56:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLBA0-00ChjA-7q
	for linux-mediatek@lists.infradead.org; Thu, 26 Jan 2023 22:56:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E526EB81C5E;
	Thu, 26 Jan 2023 22:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBA7C433D2;
	Thu, 26 Jan 2023 22:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674773757;
	bh=lUlV7aiI0si0/W517FBDa/HeRq2i5wQgYiZ8e4/VPhs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NJ8I2pTHBLWb9hqw76GjVnV6JAeuMwrghH7OCL69Ywnzcw0hma9owHEn0ajjkcR+2
	 LDPToCsgG14hdUcA1a71FHfrreEjFtpjY5lyDWaTsJp2yLsyJDgyMG36v/SwuT+D0a
	 hXXGPROBCuaiQoTpNbVqWtw2TE/G3+H39NbPP91qI24Y9LGZrpht/e8kQXcx6jUp/V
	 4OM2AJpgoMtuOjANAvLc3QL806WDoHVtRAu3jjbhqGgs+9I62knDXsh2kxSgtFqrH8
	 Blumk/pfW4u8siG8Ljt3B/8XnxVu2GBLuAtuShCCoGgRFQxP3RlzKIusfqZ4ngyacJ
	 qIKP5PQHppuEg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Dan Carpenter <error27@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yang Li <yang.lee@linux.alibaba.com>, alsa-devel@alsa-project.org, 
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
In-Reply-To: <Y9JHSwcfdNcfMjjt@kili>
References: <Y9JHSwcfdNcfMjjt@kili>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: remove some dead code
Message-Id: <167477375499.524795.3525968034845691950.b4-ty@kernel.org>
Date: Thu, 26 Jan 2023 22:55:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_145600_619564_E50691A2 
X-CRM114-Status: GOOD (  11.77  )
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

On Thu, 26 Jan 2023 12:26:35 +0300, Dan Carpenter wrote:
> We know that "irq < 0", so delete the unnecessary check.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188: remove some dead code
      commit: aa326917f58fa577bfba8976da214080bdec2699

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


