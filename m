Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C82C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 20:14:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFBF561183
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 20:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFBF561183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osFPQLTnOqo24LPNrdkGHPwuZZKSAeWjJOFp/RsGGqc=; b=mC1QcNviqf5w/l
	WLNClpsAO8WjTUqJR0R5qsgtGPHov5Je5TuKXz2C5DIso2Y6VlmBL2XxPq3RgtE4kvd31cXuN95MZ
	ptAAjQF27X+9hTQa2fs8J1xP10EVEUYpVm0Swkqvc4znkc3kuGEbBVDKVHKHo7N/Wwuf1Fqcx+/ac
	syPdCOVzB3uLymj5toVE3D2Tk8uLAIHm3VPnZfRPwXUyg/zus3YmUXNq7AI2CCdzJyZgdo6MwxBM3
	3yaaBbgRXJ+O1QVqqE4gAQXjIEWTe5tSecuWLXV/n7F0AnnF3Ax00ZE2z9Lk0uhDAcfv/O1h99zq2
	pL9ZWSzIULLk0zkvCT0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj5bX-00CGP2-AF; Fri, 05 Nov 2021 20:14:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj5bK-00CGNb-CM; Fri, 05 Nov 2021 20:14:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95DD56108F;
 Fri,  5 Nov 2021 20:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636143253;
 bh=BfJkmp/zQUz58AjoefSLkKZ/YEytniomZ7ATR4zR/dk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=neJH8bauoAdPDOcCsijwl4LUlljFlHGa6hlx/RGRvD81oLSiHUFYAYb8vR1GLk3oa
 gCI2fpW3IGK0SWqCXJQCRkBzlCLrWA3aERn39UuttW4lrbF4CTYtknU0hepaXmpT7O
 G40+YRqq6hbCO2fs49deGTimDZThoqK8b8Besbj5hIT4XTsvXUGA4yuOR0+d8iY+Gs
 c/UozEcRJK4ywA6hxN9yOdUmeLCsca924RYw9Y9Ip2jZsKsXoesK3ndna+tbdap32t
 90PjjJOhw2VwMP7M/mveTlZpdwTkKkQdoiR6MLiIGVsQe4JdsRmTGbnWwgJnRQe7s3
 x3wFHU6rYk7iw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, tiwai@suse.com,
 matthias.bgg@gmail.com, perex@perex.cz, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20211105152013.75252-1-angelogioacchino.delregno@collabora.com>
References: <20211105152013.75252-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8173-rt5650: Rename Speaker control to
 Ext Spk
Message-Id: <163614325129.3446536.8434137401670448140.b4-ty@kernel.org>
Date: Fri, 05 Nov 2021 20:14:11 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_131414_487915_19D6AB05 
X-CRM114-Status: GOOD (  11.60  )
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

On Fri, 5 Nov 2021 16:20:13 +0100, AngeloGioacchino Del Regno wrote:
> Some RT5645 and RT5650 powered platforms are using "Ext Spk"
> instead of "Speaker", and this is also reflected in alsa-lib
> configurations for the generic RT5645 usecase manager configs.
> 
> Rename the "Speaker" control to "Ext Spk" in order to be able
> to make the userspace reuse/inherit the same configurations also
> for this machine, along with the others.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: mediatek: mt8173-rt5650: Rename Speaker control to Ext Spk
      commit: 0a8facac0d1e38dc8b86ade6d3f0d8b33dae7c58

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
