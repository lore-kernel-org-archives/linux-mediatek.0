Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289C4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 18:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zj64keUJfxqLDQQ73j0uLAXzawNbwRgB28Gt8htJP8o=; b=L/aUien+41woYa
	5l2T5SoO/pjt0/VSNqPGeM/F09XFU/Wgzj/aF5mWiMpGw3sVk2mEZ/5/lu0ORUn2AQlhnRfKb8VYR
	hg9HL+15+/1wTtpUU9Ds62/wD4p66yPRstprvL/ynTkwpjSZmZ/DMC9/zkhSJAr+xirxAGgV6Yd6X
	TT4S/0JQqW5XA0Dmb+gxFdcsYssOVuGIS9bsf6kppBb2+2wJoI2vDuVxtu3Wu5iHjoLCDAMAWNyoR
	IyjPBRahkS0dfxkTlMfD6GvyPAedVwRAVTBK/EhoUjr+PT2idIsmVWimiz3Npv2ysN6KHR0ZfF8WW
	mciTOW8gqIjgqgRwMsTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxYnT-002DOp-8K; Wed, 15 Dec 2021 18:14:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxYn9-002DG6-Vt
 for linux-mediatek@lists.infradead.org; Wed, 15 Dec 2021 18:14:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41B9EB82056;
 Wed, 15 Dec 2021 18:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E007C36AE3;
 Wed, 15 Dec 2021 18:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639592053;
 bh=GST+AMAb3vSU4zGW1JvIWTxOwUtF4/vvjLZNi9gLugI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=up9rXDJ74a9oXNw9c7C8zYmVnXnlgabKaBxW/HQ7esMkaXgi+Uls65t7GiVqSLOTi
 O6oJz5fJl877rZEEaLSOf3uK4QgIkSV8T9V8If5vEnYnvJWqT2beMb/H3dcHxbenxP
 ocAVgHOu1MyyrO4gEljsph9JsxZpzWWc82XqfKylzLUiNh6odW3eFWEx22tWF6wkVk
 vhSJBE8czqImfwf80VifpA25VAfHwTVBBzL5Bu3vGvkOOewskKmz2NDnL6Fw/rWbpU
 lXz8G/yJIC1co0eDvsCf+NAFDW8bs4QTnyhmFL0OSWDI9hi+paA2NOq2Tc8nYG6rIH
 W8cPzIxJ65keQ==
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: linux-mediatek@lists.infradead.org, linux-imx@nxp.com, Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org, peter.ujfalusi@intel.com, daniel.baluta@gmail.com, guennadi.liakhovetski@linux.intel.com, lgirdwood@gmail.com, paul.olaru@oss.nxp.com, ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, Péter Ujfalusi <peter.ujfalusi@linux.intel.com>, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20211215085703.137414-1-daniel.baluta@oss.nxp.com>
References: <20211215085703.137414-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] ASoC: SOF: OF: Avoid reverse module dependency
Message-Id: <163959205016.2218314.2741357654083575707.b4-ty@kernel.org>
Date: Wed, 15 Dec 2021 18:14:10 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_101416_252270_6B097647 
X-CRM114-Status: GOOD (  13.01  )
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

On Wed, 15 Dec 2021 10:57:03 +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Similar with commit 8a49cd11e68ed0 ("ASoC: SOF: ACPI: avoid reverse
> module dependency") we will be having hardware specific drivers that
> link against a common "helper" framework.
> 
> sof-of-dev.c becomes a library with the interface defined in the newly
> created file sof-of-dev.h.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: OF: Avoid reverse module dependency
      commit: 28084f4a0e031a87b624ea121bd8fd782b90ff2a

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
