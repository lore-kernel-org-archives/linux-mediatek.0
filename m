Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61672C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbFxs/v8o+I3bASW0L8lV0dbjzcVe802SHlVA362Mko=; b=roz65334pT0ilL
	mb1beLieaF8UrWDiX7va4veK3zRO2VsC1ggBSpIUE7zVbssSZeIMcCMGrOuN/oH0nBy6SAVMLUePl
	iCa1eLWRYyFZaYthdoMxGETVc+mcVSgqFkbZLJvopvr3/8w1DWMS8NuFO1fQkiqdiAYfBIeo5+DSR
	LPKRMuhPG+kI9EsbCsU4YibpGz2GZYyzoVBCb2m+J2UP+Qw31QfKhQCfM/eF0Y10tg+amle0CfiTt
	xdHNPK3eUCXSCLlasIiI/QNnlJUY5AUG/aP6nOq6RFjw+e1lL6b8KaXH+DpxMvY5sYV1zdINJ62jI
	vV0NfjM6bqKiEtdLJmWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMAYL-006NUI-WB; Mon, 21 Feb 2022 15:24:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMAY4-006NM4-RO; Mon, 21 Feb 2022 15:24:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4EB0C61050;
 Mon, 21 Feb 2022 15:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13CEC340E9;
 Mon, 21 Feb 2022 15:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645457063;
 bh=vfiV1Qm1/MHU0lksy3rapa4k1HrN7kyCz4nC8r4epk0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JF/QiYigsSz+pDmwfxF75oFVURELZH86roMYRIxPV2sXjLtCr8j7QaJ+DYY262j71
 N5G4zXCg6UYzFKY/S7tD/bO5roVrmGYUN17dYEaOORamn/93HQr9WCBjGcAQy25wm4
 74HVL4u9SWjnMCo0yaJ7EpBzoidHCyGnCpf6pYj5guyRmx9rveRWzeK/lmNYZhFyJZ
 J9mCNS3pHnDNpB8jx3bSEGOg/DssqZxVGNeayKqcObShy3ycFAfX+M3OO4ga1Q+yYS
 Xsx8vOW1g/kUMTkcAIXceXoHyTJ8iY/UunYYno0cFj+Gj4znXpnjsrTERBXCKcOHFJ
 G78z2xTWfEH8A==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>
Cc: yc.hung@mediatek.com, linux-mediatek@lists.infradead.org,
 bicycle.tsai@mediatek.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220221055716.18580-1-trevor.wu@mediatek.com>
References: <20220221055716.18580-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: enable apll tuner
Message-Id: <164545706169.730905.15839904852131851975.b4-ty@kernel.org>
Date: Mon, 21 Feb 2022 15:24:21 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_072424_950400_4750E86D 
X-CRM114-Status: GOOD (  13.16  )
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

On Mon, 21 Feb 2022 13:57:16 +0800, Trevor Wu wrote:
> Normally, the clock source of audio module is either 26M or APLL1/APLL2,
> but APLL1/APLL2 are not the multiple of 26M.
> 
> In the patch, APLL1 and APLL2 tuners are enabled to handle sample rate
> mismatch when the data path crosses two different clock domains.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: enable apll tuner
      commit: ff5a90173d981934e1134d28af3625acaab01d80

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
