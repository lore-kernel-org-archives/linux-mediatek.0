Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854E1C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 10:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5BHCwK866FKaPWX0+zDlUvh3n5lR454bzIEq4VKIOI=; b=Zg4FjA2wTrYElr
	V5xZbtfI4nrUuCcWT7RVnIE2fGFq1Eoc0ulZ9uStV3/eOf2Tv+L7riCU5AJIoV3+Z3aKrRpJogxPI
	Q53Qz1/+9rUhAEAEGtR5bau8ysOBnaZEhsy/owuCMaE+RDqS1AClA2jAMm1jGYN3nqk0fTnqrpl3O
	pObmv7Hg5WlZuLvNaAqxFT2q/wG/0Vm8OgBHx2KrOq0voV9nqehYcEwZPIj83VK5o2MXo8EJ26T02
	F/m5nn+ITXRyyW7/wWW5Sgnft4TUIXOPXzMlxOHUJsRU/iC92yUCpI1lNgv1LgGiJaEVNY/6TEvcb
	kezSJn4AXf4AUQlSVCIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWkZ-006nwG-RW; Tue, 07 Jun 2022 10:47:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWiv-006mwO-8q; Tue, 07 Jun 2022 10:46:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C9CD861578;
	Tue,  7 Jun 2022 10:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3142C341C0;
	Tue,  7 Jun 2022 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654598768;
	bh=AXXJpNaKkdG+7UQKkjCCo3D49fnR3t/hk4qP9P50y44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mL7XmWnZ4DH2YT5pHV0wtRdY1iYtU2Sg45NZFMb7kc5J77S4okvTh/kr3wDZDc2T/
	 U84TfYl/fQNgPV02O7hzN5U6M3mjRSpryr7aVrC7XEIqtUoVFBGy1JX5M9GGyiE+JT
	 6MMcGfiN5TaDNaRm9Pozr3IdI8XOeX64LVQ+mTcyJWYYNxt+sH/NnSIQ2sT9V0gP6z
	 mhqbT35K9xd6+7Eq6W4OC7g2IYILBn6FrALqyOBH4guQ9n0v4+KvXhJ18Sqmoy8VqJ
	 8/rWZ0ouCSX62snUe6dCLZ60jF0pMYVOJ1tc/j3ocN7LoE1RaI5kbxjLZ4B1qfiu4B
	 tUP0UMXh0nCcw==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, lgirdwood@gmail.com
Cc: chi.minghao@zte.com.cn, zealci@zte.com.cn, linux-mediatek@lists.infradead.org, perex@perex.cz, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220602071809.278134-1-chi.minghao@zte.com.cn>
References: <20220602071809.278134-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: mediatek: remove unnecessary check of clk_disable_unprepare
Message-Id: <165459876658.301808.3499982605939074236.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:06 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_034609_388940_C1543F2E 
X-CRM114-Status: GOOD (  12.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2 Jun 2022 07:18:09 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Because clk_disable_unprepare already checked NULL clock
> parameter, so the additional checks are unnecessary, just remove them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: remove unnecessary check of clk_disable_unprepare
      commit: 12ba5ceb4a08d5ea776d3eaf83c0cee63fafe952

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
