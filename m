Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7C6C83003
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMiYuX/LcqbynhlE0dZWXHkEISsDiTg6Xkvo02rVsQc=; b=1fHE9G60liWpgqJLhES5DJPfbL
	85Ajd2TWYuR4CMudu9LxeRO9JiCTCfS10oS5+3FA57orw7FG6pDtPU7vvCIOZTPYqWHLhVL8szs3g
	cKvaQiz9dcfBtny2x6duDeKKM494Uj9DxI6nFk0DqC2cqHngcQJtfv93kB/lHo6Tlr8Y11c8eR+qR
	Zyvd4xl9JeZrDYNsTf4IBFtMmeWHq3RUhylFABaNR23c0Az6wD945OWXLayERT+1v+Mh6gERYS09h
	irQJ14GeqGdaaWVwKDQaq6UC/+n2gmo6kKu368ZxQrySLyMyGT7IY9/mvFXJY0Xh4mgGTE3bwraBH
	DBIDYyKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7HPe-009j1A-1T;
	Thu, 08 Jun 2023 15:18:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7HPa-009j02-2V;
	Thu, 08 Jun 2023 15:18:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21A5A64E4F;
	Thu,  8 Jun 2023 15:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8907C433EF;
	Thu,  8 Jun 2023 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686237533;
	bh=pk/K8VrdCKchUB5paUdeNuT/SCeVorFznzyFJBwz8p8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VQOBPggzksGxcDdx4KDssn6TUrr6M1MgOItXztQrrJNHN8QFTPKBRpiF7Mk01wXHs
	 Mde3p+xH0I1bA0D5r0kIWelmHj76C0JTiU6hTF9IUGz+jgmQW5PqhHnbrfOZluyfBo
	 C1DcvX6dovAyAg8nTSpQQQ1XQoPgkgtJeiv2+0NsB13dMK9rqfBa1nKuOKQaRverGP
	 vRqcK2eGjn2beNDhQBzmTeKwKCDNR65q1wtukFajPUyUUpAm75RG1405aAi1NgHhfn
	 WjheAsgrnxysOFlpFbuJZLTKotXOB5YToksxzoSSBUTCJEA+nvcHazlpIumaJoiUC+
	 gIeTSF8tx6ICg==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, amergnat@baylibre.com, 
 dan.carpenter@linaro.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 0/5] ASoC: mt8188-mt6359: Cleanups
Message-Id: <168623753047.1002486.1442664487202243971.b4-ty@kernel.org>
Date: Thu, 08 Jun 2023 16:18:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_081854_853712_6EEE138C 
X-CRM114-Status: GOOD (  13.29  )
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

On Thu, 08 Jun 2023 10:47:22 +0200, AngeloGioacchino Del Regno wrote:
> This series performs some cleanups to the mt8188-mt6359 driver,
> including usage of bitfield macros, adding definitions of register
> fields and some others for readability and consistency.
> 
> AngeloGioacchino Del Regno (4):
>   ASoC: mediatek: mt8188-mt6359: Compress of_device_id entries
>   ASoC: mediatek: mt8188-mt6359: Cleanup return 0 disguised as return
>     ret
>   ASoC: mediatek: mt8188-mt6359: Clean up log levels
>   ASoC: mediatek: mt8188-mt6359: Use bitfield macros for registers
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: mediatek: mt8188-mt6359: Compress of_device_id entries
      commit: 22628e92d76a403181916f7bac7848dd2326d750
[2/5] ASoC: mediatek: mt8188-mt6359: clean up a return in codec_init
      commit: 1148b42257e2bf30093708398db2c4570ae9fe97
[3/5] ASoC: mediatek: mt8188-mt6359: Cleanup return 0 disguised as return ret
      commit: 4882ef44f51bbb759b8a738b747fdbcbad38e51b
[4/5] ASoC: mediatek: mt8188-mt6359: Clean up log levels
      commit: acb43baf8b7e75acdb14920de29881e3f70c6819
[5/5] ASoC: mediatek: mt8188-mt6359: Use bitfield macros for registers
      commit: b0e2e4fb8a5467f4f64bcf64d1454d18cb665cc8

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


