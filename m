Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A149C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Nov 2023 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3RDlM24ISMZSShQaQ71KdsYRLJiS3uCBar4bN7Ivj8=; b=ax9ATE3sKCoIAHyQQSd1ng7pSB
	bfh7+Fz2JZivPDf6tmIhASDE5Up5Ya/yTvmeHAusZDtO8atSdZuswTfHWVK/oOB+2Pe9lZCqcmFTv
	8RTB11AdixL5m/sYhymby5wQ0WvMXMH9rv6D2o/6VVSJ44tG1hqVL0RFpK4V1KJ4PJT2YfCGtfnl0
	Qyfd97lctfg09itX4mtTJKmKI46l9xOdhlxzU9+PaZ1XxOdTGUphNbOAOGkuz9lZJBfXx+yu1vMA5
	mTWABlEMxekDrroI415Pje0pdvQGnBQ2f0E1l9df44Fj2/FY5mDKU/HarhzBkt7oumV0V6Kbpm1/X
	aQo6m4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywWd-00Biv8-2z;
	Fri, 03 Nov 2023 15:55:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywWa-00Biub-0Y;
	Fri, 03 Nov 2023 15:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37284615BB;
	Fri,  3 Nov 2023 15:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AE3C433C7;
	Fri,  3 Nov 2023 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699026954;
	bh=tmLWY+L7FwVUJMV6C2Akc2299XINHfV2Cbm+4LEhXJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UBBdKHl15srI8XZ+TxU7EqftZIy+5H1Wz5rFrYPoIkFIfPnFiMwZ558WldaixuC2c
	 kIr8KmQK2rkk/uOdaaoVi/NnJQm55Gt+2kHaRnaKBWBsrTaY9rE794g3AUldDY+7hC
	 iJ64x4QuphHo5VRMoxOilJ1tbQF7+HCFl4X9fTbtW1GHkbJxrFu40e84C4p5k+fZB1
	 jmMG8PYS6gr3mmJssigqdF+FBt3L86l5v2hRAim8raW91adfPcGCU1QUUYIUoUoiib
	 og0SRGZLOtzFKQR72YCxjnJ11KuIDByLmG8u9dCjoOgMTez7AYNGaImvQO6HTTUqZY
	 1kqgkLOTcJnzw==
From: Mark Brown <broonie@kernel.org>
To: jiaxin.yu@mediatek.com, linux-sound@vger.kernel.org, 
 Eugen Hristev <eugen.hristev@collabora.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20231031103139.77395-1-eugen.hristev@collabora.com>
References: <20231031103139.77395-1-eugen.hristev@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: trivial:
 fix error messages
Message-Id: <169902695274.54161.7134802651266930542.b4-ty@kernel.org>
Date: Fri, 03 Nov 2023 15:55:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_085556_290375_C2590F03 
X-CRM114-Status: GOOD (  10.98  )
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

On Tue, 31 Oct 2023 12:31:39 +0200, Eugen Hristev wrote:
> Property 'playback-codecs' is referenced as 'speaker-codec' in the error
> message, and this can lead to confusion.
> Correct the error message such that the correct property name is
> referenced.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: trivial: fix error messages
      commit: 004fc58edea6f00db9ad07b40b882e8d976f7a54

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


