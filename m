Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DD0CCA479
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 23:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TS7S0/NUFZCZPWZZaJQ12zl/oK7tziHeU2BA3Bhjfjc=; b=pQWrq6NKhRnrhjsGDqHvlffSPA
	sNOylyYhjftyCOCCGTZ8K756idOiT6uqeF/2sWSa7Q9BqqsBdP4VYNOsOHmInEIv+UPRBVO78yi2Z
	xpiI7RvzAiKs4MwbJx5u1xU5wfvZMcvZobzs4DkkPFLOcOdW+vsfjF7RmTwg5f02hLngjwEUQmjnZ
	Y4t+dM9GgE8yxIDTxqvukcTyBLm08X846/KipuWJJSeG4P+2N8ATg0PThFEmeD4/ug/1g3dlLTE81
	M7KLTeSwpxmAoUtzB2Ky4yJvkgQv/+0EFtKi3g6WnK1raCNsHSwRClhgyXDpK5Ws+1urCZy/PHF4x
	sUIvqfMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LGA-009ada-Fu; Fri, 17 Jun 2022 23:20:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LFl-009aTh-JF; Fri, 17 Jun 2022 23:19:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id DA4BFCE2D81;
	Fri, 17 Jun 2022 23:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC44C3411B;
	Fri, 17 Jun 2022 23:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655507984;
	bh=VtNJbvspHUs35Tn5OYelrC56+LY9y645NyYD8WwY/BE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=biJN97UERqtusKpdqZOLkc8npgf4Ip0seEShYYNVx6p+bRjaxF0ksDkDDNa/JiaCs
	 d9VSB+XZZlKrV+96ejddsf3x7gPSnqkRYFRh9MxTlVj1qHlkslW02vX2x2VvkKXTC9
	 AEbmLfDvO1lUki/m81RbLA78+HjKw+dUEIive4YLLmidHus7QcUe59zkNdnuuRmdpN
	 YsNb2I8676V1lX9qbyErvXPlaGW3G26PEVqdLmSo5WRpYWokf//RnvtLoUry6rQAb0
	 ViLFAivaLWR5dAkmh97USctZgdAl20pEXZVVKo6g+nd+zlyqpJvPWkadjcZT28XcRp
	 fmhfpiTe6+HZw==
From: Mark Brown <broonie@kernel.org>
To: jiaxin.yu@mediatek.com, fshao@chromium.org
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220617100632.1447811-1-fshao@chromium.org>
References: <20220617100632.1447811-1-fshao@chromium.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Fix mutex double unlock in GPIO request
Message-Id: <165550798257.994018.15965487016237461990.b4-ty@kernel.org>
Date: Sat, 18 Jun 2022 00:19:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_161950_029805_DB8400AA 
X-CRM114-Status: GOOD (  12.23  )
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

On Fri, 17 Jun 2022 18:06:33 +0800, Fei Shao wrote:
> The lockdep mechanism reveals an unbalanced unlocking on MT8186:
> 
>   [    2.993966] WARNING: bad unlock balance detected!
>   [    2.993971] 5.15.46-421fef3b44d7-lockdep #16 Not tainted
>   [    2.993978] -------------------------------------
>   [    2.993983] kworker/u16:1/10 is trying to release lock (gpio_request_mutex) at:
>   [    2.993994] [<ffffffdcd9adebf8>] mt8186_afe_gpio_request+0xf8/0x210
>   [    2.994012] but there are no more locks to release!
>   [    2.994017]
>   [    2.994017] other info that might help us debug this:
>   [    2.994022] 3 locks held by kworker/u16:1/10:
>   [    2.994028]  #0: ffffff80c004a148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1a8/0x364
>   [    2.994054]  #1: ffffffc0080d3d58 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1d0/0x364
>   [    2.994074]  #2: ffffff80c12ab9a0 (&dev->mutex){....}-{3:3}, at: __device_attach+0x44/0x150
>   [    2.994096]
>   [    2.994096] stack backtrace:
>   [    2.994102] CPU: 6 PID: 10 Comm: kworker/u16:1 Not tainted 5.15.46-421fef3b44d7-lockdep #16 a2af0e2c6b3eeab6799b5aa8091c1d05d3a7bbb1
>   [    2.994113] Hardware name: Google Kingler board (DT)
>   [    2.994120] Workqueue: events_unbound deferred_probe_work_func
>   [    2.994130] Call trace:
>   [    2.994135]  dump_backtrace+0x0/0x1d4
>   [    2.994144]  show_stack+0x20/0x2c
>   [    2.994152]  dump_stack_lvl+0x78/0x9c
>   [    2.994163]  dump_stack+0x18/0x44
>   [    2.994172]  print_unlock_imbalance_bug+0xf0/0xf4
>   [    2.994184]  lock_release+0x150/0x388
>   [    2.994193]  __mutex_unlock_slowpath+0x4c/0x1bc
>   [    2.994202]  mutex_unlock+0x44/0x50
>   [    2.994210]  mt8186_afe_gpio_request+0xf8/0x210
>   [    2.994220]  mt8186_afe_gpio_init+0xcc/0x134
>   [    2.994230]  mt8186_mt6366_rt1019_rt5682s_dev_probe+0x14c/0x220
>   [    2.994238]  platform_probe+0xb0/0xd0
>   [    2.994247]  really_probe+0xcc/0x2c8
>   [    2.994253]  __driver_probe_device+0xbc/0xe8
>   [    2.994264]  driver_probe_device+0x48/0xf0
>   [    2.994271]  __device_attach_driver+0xa0/0xc8
>   [    2.994278]  bus_for_each_drv+0x8c/0xd8
>   [    2.994288]  __device_attach+0xc4/0x150
>   [    2.994298]  device_initial_probe+0x1c/0x28
>   [    2.994308]  bus_probe_device+0x3c/0xa0
>   [    2.994318]  deferred_probe_work_func+0xa0/0xe0
>   [    2.994325]  process_one_work+0x208/0x364
>   [    2.994334]  worker_thread+0x288/0x3fc
>   [    2.994343]  kthread+0x140/0x160
>   [    2.994351]  ret_from_fork+0x10/0x20
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Fix mutex double unlock in GPIO request
      commit: 6c9e9046e1ff356bda66661213735d33c6cfea53

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

