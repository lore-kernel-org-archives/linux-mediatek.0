Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AEFC77B75
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 May 2023 06:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onQ+aXlH/9N2G4zvALpF1VwVNay1xSOT6gFh9Zgz854=; b=k9VPSCKNR3+BHfdTZeIzU3/v3t
	tB92WKUjKpHrKFGJ1PgPPGvTn8Xvr5+KgANfdHDfEitUtJhX6O8VfEqGNg4ObfzN15+0vnS+3cxBE
	EmHH+JUd6xRrvYOngBI2k1o/wOKq9N+BHLHduS0aQuxpwwsojGNZzRtF/PsEq7QdCnOeoIj0W2sTb
	3G0s57+PAnhP6MyFAF5+IycfLM71XGaXILuUGo41XCcNV6MLw2AIbLa9FC6Hx+5mV/PUNALMJGH3Q
	UqPUNguHIRLNOusFbRTM7dX5Zzs2SRaGATba0Ni56PtB+ixKjfpCaU0zS3Q2rg1E0q1lutPpDZOoR
	+M5FUmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwGzn-002Q92-09;
	Tue, 09 May 2023 06:38:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwGzj-002Q8M-2p;
	Tue, 09 May 2023 06:38:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F008B61325;
	Tue,  9 May 2023 06:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153E7C433D2;
	Tue,  9 May 2023 06:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683614322;
	bh=lAOoAECVpMoCOowjJYUiemBGQR7sN94PdRfyG4VySYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MGM6PYlCqDWUw1JwT+EFrLng4WmNtRpTlTldeioTgOdsoAHRl8NHJxzhT0itnxoAU
	 AdUZ56frI9ZG09zhSS7qnRn77F9spA0Vv8wEgvQ1KE32SFQtQ9NVyZtkFyta6JtQ3b
	 oFCYPs9C8EVpkObuk1cMyKu9hYxE+cSp1yVxliWFvT8AGRLXZwNRnAFuB2Zwvo7gRq
	 /Z4V4LvyFOlWkiYJQM8g6rk+HtOsOcfFwBI+aV0MD1kwr33gUA1Oev1jnY29lyLYWr
	 U/Pc4bvsqc79LRQAekTM+Uoq4Ch/+NwX17h9+wFAZMVMCpJP/cPderHYfnx/hqQlsv
	 WOfrXKebn7VmA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, 
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de, 
 chunxu.li@mediatek.com, tinghan.shen@mediatek.com, error27@gmail.com, 
 ribalda@chromium.org, yc.hung@mediatek.com, Allen-KH.Cheng@mediatek.com, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 sound-open-firmware@alsa-project.org, kernel@collabora.com
In-Reply-To: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
References: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 0/5] ASoC: MediaTek MT8195/86 Cleanups
Message-Id: <168361431059.303059.10248668166730992280.b4-ty@kernel.org>
Date: Tue, 09 May 2023 15:38:30 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_233844_022361_4DE95C26 
X-CRM114-Status: GOOD (  13.31  )
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

On Wed, 03 May 2023 13:34:08 +0200, AngeloGioacchino Del Regno wrote:
> This series performs some cleanups for mainly MT8195 and switches
> both MT8195 and MT8186's SOF driver to the snd_sof_ipc_process_reply()
> helper.
> 
> AngeloGioacchino Del Regno (5):
>   ASoC: SOF: mediatek: mt8195: Use snd_sof_ipc_process_reply() helper
>   ASoC: SOF: mediatek: mt8186: Use snd_sof_ipc_process_reply() helper
>   ASoC: mediatek: mt8195-afe-pcm: Simplify runtime PM during probe
>   ASoC: mediatek: mt8195-afe-pcm: Simplify with dev_err_probe()
>   ASoC: mediatek: mt8195-afe-pcm: Clean up unnecessary functions
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: mediatek: mt8195: Use snd_sof_ipc_process_reply() helper
      commit: 06ba8020287f43fc13962b158d8dec2689448a5a
[2/5] ASoC: SOF: mediatek: mt8186: Use snd_sof_ipc_process_reply() helper
      commit: 709f34b41ceffedec17d1150018cf62f8ea95842
[3/5] ASoC: mediatek: mt8195-afe-pcm: Simplify runtime PM during probe
      commit: 2ca0ec01d49c9c2742c2151ae94c94bdf36bb1b8
[4/5] ASoC: mediatek: mt8195-afe-pcm: Simplify with dev_err_probe()
      commit: 863da1c17616e45f1472370892b6c925cee27e24
[5/5] ASoC: mediatek: mt8195-afe-pcm: Clean up unnecessary functions
      commit: 686d041685639493a608bdcdb0d00551796721c9

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


