Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF68C02192
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2025 12:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWpBM1bFgKOZf1GWq0UE8veQruj9KfPNvB2YK72Gjv8=; b=hZ9VaVnB1xCJzQHefbe0HOqQ/3
	vpXgwZ6wEEbC8DskMDRvhy4MATuAg3TT6kYnNDP/jPiedIEenLwWLMbQ+PZlZnopd4e+q73b3VBaa
	0kf9n0HITEP6iI7eWvzVmRD3e5cpJCbVkT/aiHpfUj//v3BlzekYuYnPbh+7KWkM9iFIL7/pOqhVr
	gb+fUGKjpW8X5wpD23XWvGHr8lhv9tjKoE2YPVSJAQZgPaUL3fsZkAF4zkElDgUXm2VP7tt9u5hiB
	e0tHmoYu5ykaDBexFZFfuY1wpKFD8KY0hyY4GFde/N0OJmSgKRG5dZT+r/ADhydms+ox35sPu1i8c
	iLjqAELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfesB-00000003HYp-2RIx;
	Wed, 05 Feb 2025 12:51:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfelb-00000003G6T-1meD;
	Wed, 05 Feb 2025 12:44:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 931FCA43591;
	Wed,  5 Feb 2025 12:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA77C4CEE3;
	Wed,  5 Feb 2025 12:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759470;
	bh=W+a+Yoja6r+NjMKoIeKEbzYjPLUdxxkyp8N0b43Me78=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cHiPW2GRXOB2XptJXk5LSz96Ia4+t1cp8W3f+DjXmFm1jc1a5SGi1e9G3Xs5XRr7k
	 Bp2O945I1s12eAmTAH39vCkV7ebN1Tj8vpfe5dRLipRUvnb4/neXwswzHoTL9XgRuB
	 Df8CF8KXW9e/JWSTFb7E81Cji+UqA6LZvJnv+M5TM0lCmudj5RcTvGtLEuc6E0Ie5p
	 XouIMYERSqzENyEgy0tEapD6RL1i6SK+yWXiZuRczgZvp/Ra7iTibRL8W7qQcHiJm6
	 DEJLlIPZ6M78Lj5s+6B7vkd1lVnqNI/H9Ykx7iL0O1erAMdpY4zJS9I4fc57vUMiZm
	 YHhyFOOlchP1A==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, linux@treblig.org
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250128005243.295977-1-linux@treblig.org>
References: <20250128005243.295977-1-linux@treblig.org>
Subject: Re: [PATCH] ASoC: mediatek: mt6358: Remove unused functions
Message-Id: <173875946845.32457.11968319889637039495.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 12:44:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_044431_536107_8D492DB9 
X-CRM114-Status: GOOD (  10.31  )
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

On Tue, 28 Jan 2025 00:52:43 +0000, linux@treblig.org wrote:
> The functions:
>   mt6358_mtkaif_calibration_disable()
>   mt6358_mtkaif_calibration_enable()
>   mt6358_set_mtkaif_calibration_phase()
> were added in the 2019
> commit 6a8d4198ca80 ("ASoC: mediatek: mt6358: add codec driver")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt6358: Remove unused functions
      commit: fb6ec1d27608c008bfe1ab0dfec3720990eb2451

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


