Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670B8C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1p93sP57bX3YUpHWEbKBs4RiVRzL8MVR1ZKYsQjqHI=; b=QH2YYV7GWfNAUYvKz351v+HY+q
	20oKT2olAtPolDDZP1HArBUo1R7vXGAA04LaZ1+I09J4r7gYTqTotSbkIcL+fa6VD75btbFQCd0Dl
	NAHQCUwbTRiJDYMF6B12EOt0mgMp4GXK69HjD109CLi5aIWq5P9HqUI2vgQqURCon9qupy13q3rCF
	QmYX779Bpj7UoIWZgJM1WRdFqG07gFIfLCnuYxQVJs00BM0nT8PwOlKoixVMY6OvF0x32MHvVieAB
	7JDAxmADat0kgLYTY18/u0KJNGUYuMG6xOwHNxED690J/YDJfeEIQ0otW4H3us1kBcOPSfKNuEq1s
	50hjfRbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofObj-006tuk-Jc; Mon, 03 Oct 2022 16:47:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofObg-006tsv-HN
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 16:47:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA35B61165;
	Mon,  3 Oct 2022 16:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C594C433C1;
	Mon,  3 Oct 2022 16:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664815671;
	bh=8275/nUNkwTS9Z+rY35CEzhqt4CgDP9X5igmrk+BmuQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ccTXOr0VeVzw1V7AvDqidgIJgg/1hNMxHhUMAirC/a6DhHOGSjk1DgmlKCtfecEnQ
	 vA8DVXJN70vsACDl3DTPb7P1QFD5geWn/E4/BabHSx9xu0hkQriFP2MIGlVA9K4HH+
	 ae1XEh5SSPa9r8rKiQp+nRrHQ3CeOsiTx+be7qgnB62gaqNOUs6h+gtPdh4HLlbpjJ
	 ELka7AYkaAwioxFBRIsfbekJAXCNW+wsH9+DhT8uRrTAd5n+hfMq8ZzlFyGlV2NMUc
	 csRC8ktVgAb5EP661b1xslTZyxHaFcU6pDanEAex/XArzGQTCLGeGzVNExVyzFcnk1
	 nP8DolLl/vj4Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Zhang Qilong <zhangqilong3@huawei.com>, perex@perex.cz, ckeepax@opensource.wolfsonmicro.com,
 matthias.bgg@gmail.com, tiwai@suse.com, jeff_chang@richtek.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, patches@opensource.cirrus.com
In-Reply-To: <20220929150653.63845-1-zhangqilong3@huawei.com>
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH v2 -next 0/4] Fix PM disable depth imbalance in probe
Message-Id: <166481566916.272202.9369598232153225882.b4-ty@kernel.org>
Date: Mon, 03 Oct 2022 17:47:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_094752_636386_A2541D2D 
X-CRM114-Status: GOOD (  11.68  )
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

On Thu, 29 Sep 2022 23:06:49 +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.
> 

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

