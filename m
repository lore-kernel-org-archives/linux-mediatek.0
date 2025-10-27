Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D23CCF9EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 12:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gxttrwl4ijM5neDPcmhaZ3iHibeUAMQRouvt17vrSdI=; b=orvATkBubYqbWVpATApTRs8//0
	7nhHMUZOWdEgv8vMTPsx0hyqG9upW9GXXwfSYtBwy61onbeDejy2jGoyW+Q7/cx5tRGFBtPbHOpoj
	PUyt7JndUiH/Aq9jud/SbpSAej6F9lJDxf458fKuNzUdeDJkoZB30EevjizFyJSd5Sacr/9BcZa9s
	J1kTTKicdYAmnfsRVfgi0tJ3IQI1wCIHEK7nDk6ovmgaNdlcuZwDaPtFB+RUwTRLxQleyH7JbDYI3
	MkbEWPhltBoVtEDo8+g8bR0Eryl0Ie9vWafR9A/NOe2n2Jhj4Wvin+7/Rf0X8cy7NIRQnOC+unjha
	Rhp3Dtkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMTG-0000000DuWR-3IH2;
	Mon, 27 Oct 2025 12:37:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMTE-0000000DuVX-1a9H;
	Mon, 27 Oct 2025 12:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD1B5450E1;
	Mon, 27 Oct 2025 12:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03E2C4CEF1;
	Mon, 27 Oct 2025 12:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761568627;
	bh=O7wPv4QpTRw78qivSWIaU96EqkWfkdAYzMszaHVERm4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TUkKMtA1UWpAOfIwCQWcAE20v1PJ11TY2O4atvut12Bj3GR9sqpzLjkH0FzI8MTdt
	 6E5zjBvpchZ9HuqQhuwOgF9iRHWOp2TchvnH2lnJLrKbrRrCQajCGIaVBe3hhBi4Ly
	 2uP0bRRMDHO3yYeO5cWxxu9Cxk76joo/rkJ6/QYSCAyKpaKGga0pdNgZV6rW9tq3QF
	 i0hxzOX26y02bMLuu9F1ISjeS19L4w/mn7no23gzPJSbPyo70Yq9K0Igqm00CfJv3e
	 oZlQcHHFkTlmZIO6H9/dYgOK2rTNuXvLSYAN8T+9TKrrtWWf14lSxtlQ6Mr30lFiNE
	 pVYnkRWOdnRIQ==
From: Mark Brown <broonie@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20251020170440.585-1-vulab@iscas.ac.cn>
References: <20251020170440.585-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: mediatek: Fix double pm_runtime_disable in
 remove functions
Message-Id: <176156862550.24382.7526074553836824881.b4-ty@kernel.org>
Date: Mon, 27 Oct 2025 12:37:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_053708_440105_D81E792A 
X-CRM114-Status: GOOD (  11.34  )
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

On Tue, 21 Oct 2025 01:04:40 +0800, Haotian Zhang wrote:
> Both mt8195-afe-pcm and mt8365-afe-pcm drivers use devm_pm_runtime_enable()
> in probe function, which automatically calls pm_runtime_disable() on device
> removal via devres mechanism. However, the remove callbacks explicitly call
> pm_runtime_disable() again, resulting in double pm_runtime_disable() calls.
> 
> Fix by removing the redundant pm_runtime_disable() calls from remove
> functions, letting the devres framework handle it automatically.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: Fix double pm_runtime_disable in remove functions
      commit: 79a6f2da168543c0431ade57428f673c19c5b72f

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


