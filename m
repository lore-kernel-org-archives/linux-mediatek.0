Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319DDC4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9eYxP9jo++BrU37sjEo0gWvrNmjZuuIGLRUfvENy9E=; b=hds1sBNquh3QAvC1GUbXYxLavv
	pg4uW/HtUFnpuIofUYWhIdbVw8RKZ8aTrJyv7nFjtnpt+z0AtKl9k9G4wLsTF+FyH4hf4CWIPjLHI
	iS/zc4N6/0KMHXKfJeEFY+SePrw3yw42/vdTeWYlQD2tw7S1ySDnjbJMOvE5WmWt1bTeFRBC0wzYa
	YLpj5/lAtZf1btKTiDb3yk9B0rCXrKUm1Uran8HEojPyzYsNq5Zsx27eL17Uqtot8CWmyKJn9E/jA
	nRalSUeNJxOJvUDHRiu4jk89Q0+KR976Km5hVkmyUMU0Y2lk4c6i8ScHiPOOi6+bav9Lz85RiHfcr
	2t097bZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZaL-00EJH8-2k;
	Mon, 13 Nov 2023 16:14:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZaI-00EJGf-1Q;
	Mon, 13 Nov 2023 16:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 995BF60FA4;
	Mon, 13 Nov 2023 16:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FE3C433CA;
	Mon, 13 Nov 2023 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699892085;
	bh=P1HsCRngx2AULeZ5NjJzkJnUfB2/UHXYrbiKx+V3dsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZatGpOBLjKNxznQDsZctXqsvFhBhjf8PWoirXtdiwxa9fifmlLOI2Vi5OS8HThuG/
	 o0pkOtnkwKY26BgyOTV/a2W/SrzsOPiD7t/43Pups9X3OC9Ez3lFdPnntPkKV+tMUX
	 mW/b5FCxuuoCJ3Md6Wn/MkEviUOTi373Z4cUuveMAruuicBtM2gTQQV/c0wE6Rmrsm
	 kGyLYCruxDIjr9xg4Xw60IfgcT8FQlxi9wbidKBiquR1IGgYJFkcz88Xg529QIQayz
	 SJMa4c9HrJsKNUL+GlWwDFhNcW5aTKNdFp+du6qqI3eEjFfsDa0V+Qdeeud+4Im8ON
	 A/SQ8kpg/rC4w==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com, 
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, Trevor Wu <trevor.wu@mediatek.com>
Cc: yc.hung@mediatek.com, sound-open-firmware@alsa-project.org, 
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231103095433.10475-1-trevor.wu@mediatek.com>
References: <20231103095433.10475-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: mediatek: remove unused variables
Message-Id: <169989208005.3289099.6135603822989118878.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 16:14:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_081446_544606_3101A697 
X-CRM114-Status: GOOD (  12.48  )
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

On Fri, 03 Nov 2023 17:54:29 +0800, Trevor Wu wrote:
> There are some variables that are no longer being used because they
> were declared for the deprecated memory layout. Currently, these code
> sections confuse the users. Therefore, this series removes the code
> that was implemented for those variables.
> 
> Trevor Wu (3):
>   ASoC: SOF: mediatek: mt8195: clean up unused code
>   ASoC: SOF: mediatek: mt8186: clean up unused code
>   ASoC: SOF: mediatek: remove unused variables
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: mediatek: mt8195: clean up unused code
      commit: ab475966455ce285c2c9978a3e3bfe97d75ff8d4
[2/3] ASoC: SOF: mediatek: mt8186: clean up unused code
      commit: a4de5a345cf76c6f294a906e11c2fb675a46fd3d
[3/3] ASoC: SOF: mediatek: remove unused variables
      commit: 82e340ca3f25dc3ddd20e88e3606ed9006f90f5d

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


