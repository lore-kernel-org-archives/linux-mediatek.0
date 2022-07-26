Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAFDC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 11:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AM138nWIDQ4ohL3yU3zlbAvVbooSvrLKqJaA10cGeto=; b=hY2ZWS0pyviCkJh653rn3WW9FQ
	fx+nnSktnBefVfybOzqvpGVllPdv3INSuCEVihRYeoAEf8qsI3Z7ByesfA8aAwf9CBjeyNwaMU9sk
	Yuz9QmEnJ8a1f30ZNHbefQmqG1zzh+AbEPhqbI419mEHYPYj1nMaEcvmpS2ePB/41cy38+b+IIkj7
	9BCQ25p4d/+F6Rh3k0lPQP9fWxyoL4O4/f/xEFGNpD5OWZShbyBwtrZJggduioqj4/kEyfdnQWCJB
	jTIllGNRyO8f/Flza6zEJ/p7JIcga0QsFZAEf5e/u4vroLQQXCoEGQKPWxiVF7LIM+xRxefssings
	yFmZnyrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGIm3-00FqsQ-UQ; Tue, 26 Jul 2022 11:30:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGIlr-00FqUr-Dj; Tue, 26 Jul 2022 11:30:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F341161349;
	Tue, 26 Jul 2022 11:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92203C341C0;
	Tue, 26 Jul 2022 11:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658835038;
	bh=5S7SIX8+8VYQEQQKBE0504g9SamLUXfQF0wD+GwQE6E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=If6nt4Pne47+rniua7hVbGMTUWoakTPT4G2XWlzFjBmt3SHHB9pdlMwDkjjaDpDON
	 k+/nDHRz7+ZNd3ULc+Ac3HPb32+AK8ofzZ8Qp8cdTdfUzhWVUZ18IgTWrZq9c9ONS7
	 N80SgCwZsFGGxYOyeWByRcUx50tNTt/q0N1SnyYunee2RCZAfyKKuMoTRZGifVnCOi
	 igoi19ltxvQYwuMToUjlEqV/AP040hMjddBLUor89Dl22pPcSzeMmgbjbwk3SeqD5y
	 IhhK2XCXKX+a5RXE4Td+AcDgTEupG2u2F7KhdHZrdq6KXpyVBzqvUTKO0DbSa2sFDm
	 tDBgtv/QcSkow==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, julianbraha@gmail.com, perex@perex.cz, geert+renesas@glider.be, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, tzungbi@kernel.org, angelogioacchino.delregno@collabora.com, Ren Zhijie <renzhijie2@huawei.com>,
 trevor.wu@mediatek.com, jiaxin.yu@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20220724110619.212774-1-renzhijie2@huawei.com>
References: <20220724110619.212774-1-renzhijie2@huawei.com>
Subject: Re: [PATCH -next] ASoC: mediatek: mt8186: fix Kconfig dependency
Message-Id: <165883503527.86475.6043755927851181413.b4-ty@kernel.org>
Date: Tue, 26 Jul 2022 12:30:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_043039_524945_8595951B 
X-CRM114-Status: GOOD (  13.23  )
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

On Sun, 24 Jul 2022 19:06:19 +0800, Ren Zhijie wrote:
> If CONFIG_SND_SOC_MT8186=y and CONFIG_SND_SOC_MT6358 is not set,
> make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu-, will be failed, like this:
> 
> sound/soc/mediatek/mt8186/mt8186-mt6366-common.o: In function `mt8186_mt6366_init':
> mt8186-mt6366-common.c:(.text+0x4d): undefined reference to `mt6358_set_mtkaif_protocol'
> make: *** [vmlinux] Error 1
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: fix Kconfig dependency
      commit: f20d5116b7f3d8d40e1248a59be89e667eaabd62

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

