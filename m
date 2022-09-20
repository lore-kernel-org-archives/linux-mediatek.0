Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83459C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 20:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xB4Hm40IQR6uXIg2H3dgKgzFG3y+/79/SCMGpIxsiHE=; b=mYnhmmG+I5m7jekHa3FAwM9DKO
	7NA/dU8yHNAiZuqD7sjU8oAkHwTlqrNROo9Fnw2u+rFrlv2PxTPPq4f9TSGyp4jM8FRvj8OrqqGM2
	a9sMy/ms/kNSgt/gLf4vdmyuOJlG4r5oWRVp4vlnsmwCsjMy7FmFotyKKBk7f6L+eBxnJGuHxu90L
	Cr3MFM+HhmX00d+M6yz6rzdnr07PC4WM2wWH1fi8gZHDxCU2upsucibqWyHzKl3cNK+wVwLp3ZM7b
	ZA/oSUJFn9Z3NIGKn7j4ZEwNza0o6a+XU2vfkPjQyQvBk00kKq7lTl9faNCxro1wPWPAFOGaNkbDy
	JLHPnmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oak8y-006QtC-H2; Tue, 20 Sep 2022 20:47:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oak8m-006Qlv-5H; Tue, 20 Sep 2022 20:46:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B4341CE181A;
	Tue, 20 Sep 2022 20:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AF3C433D6;
	Tue, 20 Sep 2022 20:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663706800;
	bh=HYli6/cvxotMBPYQELJFv5WGyh/XqaUzoeHSir/vKA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YbhnGHFY/LqduHDsATHsaeiSD1PpZnjnVP61BY+U63BG8Rr/T6Zl+jKsfV87a/JIA
	 KIqajDw/eonnTVG2zxoq/4ck+aqS0LjZ90/+70kP/NYZYgLE1k2r8RDLGDAXmUiQpA
	 y6DVW2JXxWfkESO7UUiDU1iS7xqPyH9TuLkWW33q5jmc8ywDuEHeKrQxPZDDJ+B0uR
	 LYo/EGTH/GxpivGgDXaLiFJ1kdpvCJAF6ULeLP1LImNHsyAyU7bItQ1I4i3PVoBBiA
	 ZG7iuoDfRnLnIfDNsiD4G5jJIBLrvPWina5kP7wnC6uav9foC5rSIrJWMPUY2lEMSt
	 YaLj8ZeUhmilw==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, Chunxu Li <chunxu.li@mediatek.com>, lgirdwood@gmail.com,
 angelogioacchino.delregno@collabora.com, daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com
Cc: matthias.bgg@gmail.com, sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 linux-arm-kernel@lists.infradead.org, project_global_chrome_upstream_group@mediatek.com
In-Reply-To: <20220917022610.594-1-chunxu.li@mediatek.com>
References: <20220917022610.594-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: add pcm_hw_params callback for mt8186
Message-Id: <166370679567.361668.2078852324764910878.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 21:46:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_134648_419602_17D82D11 
X-CRM114-Status: GOOD (  11.30  )
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

On Sat, 17 Sep 2022 10:26:10 +0800, Chunxu Li wrote:
> add pcm_hw_params callback for mt8186 to support continue
> update dma host position
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: add pcm_hw_params callback for mt8186
      commit: 78091edc1c7806846049e1d480f6a8051507ed94

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

