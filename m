Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48785ECE589
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 21:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fLvJm2AdJalhW8NrrNeOozpxblVXnRN5Kl+xF2tIWw=; b=QwVu8P0FBm9yIm/kAymg+GlmVf
	kkpybVhmhbt/HTyDIRoPZf9rLHIv+B+uTxrZVZp/Vnc9Siie6dvdu6AZ9CVRWIBeAknvJ77P2QvqO
	SdirKyVXev57fPmEN6klTqn4uHM5+ZFtPJ8Sc9vr2v4elyUlgwVFvaP8ku9mVJzBIp/URajFRnPAL
	hin+losDBwxxA8XMtXXK5CtUD1fICItS8AMpMXKfOOtj4qhekiTkyFWbfBMzISp10ltQtrYFdBX94
	BxUnCXHaYP7CkHmFabtouyOtDeeojTVEMRVG8EKo0Szw9KcIrL2kGDOACGQSukuSOy1lewYZBbiwq
	R1zdL1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snmOv-00000003QEY-3I52;
	Mon, 09 Sep 2024 21:58:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snmNt-00000003Q4F-1hI8;
	Mon, 09 Sep 2024 21:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2AA895C0648;
	Mon,  9 Sep 2024 21:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F98C4CECB;
	Mon,  9 Sep 2024 21:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725919040;
	bh=2UqAJVFWBnjGJoioHdA1uFRvBlpi1A+ZG7kkU7DYCGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XZGFmF7KMgt+DbN5wp9RuN4VheJL/oWNBdMiHvhi/FbVbckqAELzDes8OYxH6gLRy
	 MqiHsUBvwabRIWxx9tPABWEgeEu7nk7mYHRrlSfG0xHKlVKhAQ2HXvd9BXW3DfOzAk
	 fQRgWmwzXdJiIia3E+JFl7s0VMAn4cBJPwLfmKiRJW2DFOGyusWO1KMRm7JyndHGEV
	 FaUzpxAQ2PaCzbJAtrAvZbYsApvr6CDYP3QRRLIWWX18JiSrf0cL2bRSZJ/b1CmwWX
	 qlOLX1/RDJ8Qsy8x/tPlxcnwFksXC5mylNS2GkAA3fh2+lKWJYhLqr5zz0D+X3jB7z
	 TLNozMClrByZQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
Subject: Re: [PATCH 0/7] ASoC: mt8365: Fix -Werror builds
Message-Id: <172591903776.148496.17884899696654432666.b4-ty@kernel.org>
Date: Mon, 09 Sep 2024 22:57:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_145721_523199_CA9E46BF 
X-CRM114-Status: GOOD (  12.27  )
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

On Sat, 07 Sep 2024 01:53:25 +0100, Mark Brown wrote:
> Nathan reported that the newly added mt8365 drivers were causing a
> number of warnings which break -Werror builds, these were only visible
> on arm64 since the drivers did not have COMPILE_TEST enabled.  Fix this
> and some other minor stuff I noticed while doing so.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: mt8365: Open code BIT() to avoid spurious warnings
      commit: d01c6a398750aae265c17859b57d7409a6d9181d
[2/7] ASoC: mt8365: Remove spurious unsigned long casts
      commit: 1b084d8e3b98ca460b815cff14617719ebe605ad
[3/7] ASoC: mt8365: Remove unused prototype for mt8365_afe_clk_group_48k()
      commit: 3e61df7d2ff67875c770a7f548038054d05a0f15
[4/7] ASoC: mt8365: Make non-exported functions static
      commit: 63157d994025639075b3faa372976a96186322c1
[5/7] ASoC: mt8365: Remove unused variables
      commit: 067d832806225cfaabeec8f5f683b7e2bc508a6d
[6/7] ASoC: mt8365: Remove unused DMIC IIR coefficient configuration
      commit: d70ce6d3105a6bd02b1708c399105631643a550a
[7/7] ASoC: mt8365: Allow build coverage
      commit: 36fa259b214c37bbae3e0b7a47e7fb49cb0ab462

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


