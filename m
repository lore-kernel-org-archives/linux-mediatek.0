Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27E7C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 13:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFpI4YWH/HQAmLaA1tpu78yzVtmF4wxEDpDK+aq5yIU=; b=yP8tYM1dwU1H5t7jobGT27g1/U
	qH+HxMNvsZpadMYbisvzuuyM4+iPjIz2iiKB4YmZPUpw2SztMo5CVszOjb2svefwLh9ORFzLh6K1A
	JJUWAiiXKla8UlnSuKLRogy2eMXhsey0W4hE7igV2ToMpWIhuyX2kn83kDfiqLHK+l5ncSKqPZhnc
	6eovHfoWtx2SFZEwV8AVE8rb+dS9UhD0bov0UBPs5ydeh780NqcVuT7KIb+sWqqRuUiTmO73VTHLn
	6WUSlfj2xACXfiZ01b44VA6d+az1yvhTspaeMs/IXWJW3lPUhvdz+HVRviSgaVbDI7Sq2UvaEFQf0
	Ir7fikGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyfN-00C1tJ-JU; Thu, 13 Oct 2022 13:54:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyTA-00BwLM-FE
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 13:41:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2145CB81E55;
	Thu, 13 Oct 2022 13:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80C0C433B5;
	Thu, 13 Oct 2022 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665668510;
	bh=74Z5rv+raWoM7hrvHUWcSoDclbjh49eJjbnbszkJsZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MKwV9G1AP5Mnz7j7JSQi2sbkPcL1/kiynic4BfVeoaHmSyOhIuDu25YbBQ2nZUwnr
	 Z9zR+P4lRMGhnaGTZtj0AhlZYT/vDn3+QFzFcRI3MlTI8bltMLDT6msomPvkQTw6wd
	 N4EctM88ox4GzI3kgMJ3t93Gpq3HtYoAElpIcaIfd6qV/A8wIzacla/gkRV8FpxJM7
	 FNrSONxdwI1gWFJOiAJpcPKZVdqtEqyBuqO56KJHIF1M/zjn1ycLGTmRLU6MPHSm4M
	 20vdkt6goMg9kcePIewdEXhU83IEODreZw3sAMAFbKqEkQta794sHC/nnIDyptyQ/q
	 NTkdrKl3njuMA==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.wolfsonmicro.com, matthias.bgg@gmail.com, tiwai@suse.com, Zhang Qilong <zhangqilong3@huawei.com>,
 ckeepax@opensource.cirrus.com, jeff_chang@richtek.com, lgirdwood@gmail.com, perex@perex.cz
Cc: patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
In-Reply-To: <20221010114852.88127-1-zhangqilong3@huawei.com>
References: <20221010114852.88127-1-zhangqilong3@huawei.com>
Subject:  Re: [PATCH v2 -next 0/3] ASoC: wmxxxx: Revert old "ASoC: wmxxxx: Fix PM disable depth imbalance in wmxxxx_probe"
Message-Id: <166566850840.143340.14591438019775589248.b4-ty@kernel.org>
Date: Thu, 13 Oct 2022 14:41:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_064152_697210_F906256D 
X-CRM114-Status: GOOD (  11.78  )
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

On Mon, 10 Oct 2022 19:48:49 +0800, Zhang Qilong wrote:
> Both the old and new patch have been applied, it will resulted in
> redundant calling of pm_runtime_disable when error returns. We Just
> revert the old three patches to fix it.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: wm5102: Revert "ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe"
      commit: de71d7567e358effd06dfc3e2a154b25f1331c10
[2/3] ASoC: wm5110: Revert "ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe"
      commit: 7d4e966f4cd73ff69bf06934e8e14a33fb7ef447
[3/3] ASoC: wm8997: Revert "ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe"
      commit: 68ce83e3bb26feba0fcdd59667fde942b3a600a1

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

