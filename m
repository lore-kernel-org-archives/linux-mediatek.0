Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F3AC54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9ZAtVSZKWRlck6M7a8eaqdw0d4IUcoZBR+H4w7teLo=; b=MUG7vZnO6szbgTGkIN2jYHHei0
	Gd1uRKUrYxfBOGYSz1nxcEROMz8kKxwBVG1a54ncZncFOY11L+SZ3Be4CNVZJ1CdlePn4LIzZTGap
	lYy0OyFrakA4V4D0ZWKzxGAZbsAB7+7JdCJQ2BAPpJ22Xippk+sRFRGsyAGE9OVWE/AM6ToHxkKEU
	uHA9p9RBB9ZQXG0pjxgxRt0AGm9aY0q3iZ4/HEL3xgralo20F35l4fFqoYG5ZiQzhI53Ly2Yxs+X9
	XBj6553bYoWQ+gE+ixX1wZhdPICq+ls6aEjOtwBTeUSDXwpKn7nKOHB7Yo+adiFwBbe4oK5ZbotR2
	T+JcM/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obKPI-00F9ti-AW; Thu, 22 Sep 2022 11:30:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obKP7-00F9re-Vg; Thu, 22 Sep 2022 11:30:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B528BCE1D28;
	Thu, 22 Sep 2022 11:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9D7C433D6;
	Thu, 22 Sep 2022 11:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663846199;
	bh=vPHa1RwfeSex5KtAHQa+yTSSsZHDEtOtWKVO9DzRPto=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GGuQbAQCYysTxYOcTOH090QGAg/99pXkYsIkcNAib3vcM8xSPeFd7YWJptJXM/Liv
	 FmR9cQVxq6xbX3yzpTvv53y7jkEg++PSiD35zMn5Z3RUnMNqvviVF+5XmGMTeq/npt
	 sC1bEaQXxw+ODjeyeZm8OdaC/WzAAHWBAEUkaYxE7bCR66I4tL7j4OZm5GxiWhaA/M
	 1giGCdcGhmm6SGuVHDJF8+lvni1QhcicR2LcnzZ7n7A5kcqN9+RSJAysQ0liAuPCzG
	 oPyocLexpRtOgRD4iq92g1z14d/uu5pmot1nFDZWs87VwcTBsq/xCqRrHiCiFF3Aqz
	 fiH2cV9GOp16w==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, angelogioacchino.delregno@collabora.com,
 Chunxu Li <chunxu.li@mediatek.com>, daniel.baluta@nxp.com, peter.ujfalusi@linux.intel.com
Cc: yc.hung@mediatek.com, project_global_chrome_upstream_group@mediatek.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220921120239.31934-1-chunxu.li@mediatek.com>
References: <20220921120239.31934-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: add pcm_pointer callback for mt8186
Message-Id: <166384619411.629460.11107464039277326622.b4-ty@kernel.org>
Date: Thu, 22 Sep 2022 12:29:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_043006_470494_73F84ED7 
X-CRM114-Status: GOOD (  11.82  )
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

On Wed, 21 Sep 2022 20:02:39 +0800, Chunxu Li wrote:
> add pcm_pointer callback for mt8186 to support read
> host position from DSP
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: add pcm_pointer callback for mt8186
      commit: a921986f445ad611b441c8ee7749dc6dfc770481

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

