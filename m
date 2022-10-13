Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D65EC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jgwa7wf9tl7DAgG1BQaFXH7y5lHEEhEHAqsVuky+fw=; b=t18v2Qyajki0Q3qRS+g5/OcjUL
	Y6HkcbnPqJ157qaxc7VTfloh/xd5UIgTBqj2l5UCMwnNclGLlAnpzdGXsAFBOsd7HZZsCoXDihsqP
	WZNzI/XvphX9AoqVdEqNgR35wz8LnRBJkWlCcAe3ExYorzm8dfK55op3PMse6nXOK7AWavZN5Wuhx
	my4oQzy9brEkjp3Cu2SEuojF9aL65s9KurXUId2B85oMYNCQReo9cZbjnwQwgmm5EKbuje4v857S6
	Y3EfOeOJTkWKj1FbFVkXsaWwKeC8k/8P6mTFjH1aqzIW8A4uzeZrOVeOMkcencNA5OBICTKDJUwPI
	OBLIQulQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyfG-00C1qA-3y; Thu, 13 Oct 2022 13:54:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyT7-00BwJY-7i
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 13:41:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 87F62B81E52;
	Thu, 13 Oct 2022 13:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3F7C4347C;
	Thu, 13 Oct 2022 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665668506;
	bh=NeVcqoAgGh1lg3PWWmMZ5nDkI8q9uYsVwlypSbyohVA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZAkLT160sc4//zyppU6zd2zshwlfCZyAsD0INn1oK7/r3PqcmHUe9n1R9DVmqMcny
	 zfd9b01povtaLzdxRnjTWlME7MwZXRdAeX6z8hyCe0M91VhHulDUkb190jDr5wH8Dq
	 FctGAl6QXToNHE+vkj5xadDt6mKlQI4D5WVWlT+aIu6Lcl8gYNuvTkasNeE4DtCrWd
	 JwnypBYqzN6KNp2xBobmOs/VQcYVzWDf8Vp4pY7nDUHoyzZhst39oBA0yULIrFQKCA
	 Sf9Xl10Y5iUjT56U8skhjIquzreyLpc/9UMElTQ3m456IZQqHa6HGoRRs6uCyikHVS
	 8FXO5D0DGivDg==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.wolfsonmicro.com, matthias.bgg@gmail.com, tiwai@suse.com, Zhang Qilong <zhangqilong3@huawei.com>,
 jeff_chang@richtek.com, angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com, perex@perex.cz
Cc: patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
In-Reply-To: <20221008140522.134912-1-zhangqilong3@huawei.com>
References: <20221008140522.134912-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH -next] ASoC: mt6660: Keep the pm_runtime enables before component stuff in mt6660_i2c_probe
Message-Id: <166566850374.143340.3115691779887204250.b4-ty@kernel.org>
Date: Thu, 13 Oct 2022 14:41:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_064149_463120_3D71220A 
X-CRM114-Status: GOOD (  11.57  )
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

On Sat, 8 Oct 2022 22:05:22 +0800, Zhang Qilong wrote:
> It would be better to keep the pm_runtime enables before the
> IRQ and component stuff. Both of those could start triggering
> PM runtime events.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt6660: Keep the pm_runtime enables before component stuff in mt6660_i2c_probe
      commit: c4ab29b0f3a6f1e167c5a627f7cd036c1d2b7d65

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

