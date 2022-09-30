Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589EFC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 08:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/uij7E3n0PgMNA7fLY7GtajW9iUtpHGllBtqat+cnQ=; b=wTvSpdzRb6aqEAlNfkcVfoiM47
	VJswLPyYTt3/euXIbtnXdthm6/xOYht44h6chdn8AsspLWeWnuVowoT5ZFu4KotBGwvtURPrOVFTT
	vR/BZmC+McESl0iSqrpK34bLgveXwHBkuBYea37Bv0Z8/8bJYpkMrFWuL5Baz5BpHRP5rpuUfOTCj
	a3yrinIl9pKgK1BYuynCz8O7469AdO90dHa21P/AMaKli9gE88TIp/t6ePC1VlrkU1GVF79iNNs4S
	gtxrBmJQglXTQYMph8m3sk8kQQjVIFFIYmyXLaajID68YIJBNMaxNdvV7zoKFkTI4541Mfp0RU6bT
	W6K3jz7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBN2-0083hZ-UE; Fri, 30 Sep 2022 08:27:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBN0-0083gE-Fx
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 08:27:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 33442B82698;
	Fri, 30 Sep 2022 08:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757BCC433D7;
	Fri, 30 Sep 2022 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664526459;
	bh=TZLyGE9FJQemU54GEhCuq0dM8vwxN8v4whQYxVkYgXo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ahqP7KrXxAeXqx8k/7s4MxK6Y9kUtZ5CauZB0ROr2pTp5kVBhTARgbsNZUYpoCUiJ
	 edrCABdb9/X4dGvI8sJWbXk97IV/xzfUKgQP7VPQN1g0CIDWhmAIu0ODiRjjwdyoqo
	 0Ds1rKcJY0apf9i0iTmhzmd8XoXH/RZS3fefAD+5931Vi/H0swQnyKaKCN41fJsg7d
	 c3A6T75acX9bGdyTWmcqMX8GiTSC4l7gpOSIqXc2WOo94sL9qzHAU2awj7MnWAI7mT
	 37OojpkDl/nkk55t+rAAfHOe0cNywj/OlCO3CN3E/dMYeY/XqZm9KY8p/c1uWuc4Pz
	 /Jf+4WLf0Tgkw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, matthias.bgg@gmail.com, lgirdwood@gmail.com, tiwai@suse.com, Zhang Qilong <zhangqilong3@huawei.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20220928160116.125020-1-zhangqilong3@huawei.com>
References: <20220928160116.125020-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH -next 0/4] Fix PM disable depth imbalance in probe
Message-Id: <166452645819.46391.11087036933729907918.b4-ty@kernel.org>
Date: Fri, 30 Sep 2022 09:27:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_012742_696525_37822FD9 
X-CRM114-Status: GOOD (  12.59  )
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

On Thu, 29 Sep 2022 00:01:12 +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of probe.
> 
> Zhang Qilong (4):
>   ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
>   ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
>   ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
>   ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
      commit: 41a736ac20602f64773e80f0f5b32cde1830a44a
[2/4] ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
      commit: 86b46bf1feb83898d89a2b4a8d08d21e9ea277a7
[3/4] ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
      commit: fcbb60820cd3008bb44334a0395e5e57ccb77329
[4/4] ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe
      commit: b73f11e895e140537e7f8c7251211ccd3ce0782b

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

