Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C84C38145
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecahfKfDC98eQEdoqw9+VmSLjzNtGRVwUrqw0ye+Yvk=; b=0WSo9cNjZwMPFGjvTUIOc+x7ho
	A2HP+fm6GEpI7LIolbuD05kZuEKCx7XFyv5ILK6o8eKBUT91ZXKx/8XJ42JfCoUOvrSR44E37BjnN
	AvHZJNswQ3H2FjazrqNKKWT9jq++OqO/JgJT869JI2tjGwhopZHWnmf9b4e1Rbt4K7X5ETWckxoWp
	IB39w+coMeOgECVVqrtXD187+s9H22xz8khoIjcyc4HeB8EvYZ677brwTTbJ+i5qgPS6YDoLBMD99
	OajZUfvk2rVk10DRlbfTa12G/xsOVCQGzLTn0ier46cSFz9/cKbjWi6RCW6aUT0fEbN0jX8bCkh1k
	4Px7Ztpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVw6h-006vO8-7h; Wed, 07 Sep 2022 14:32:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVw3Y-006tYD-CK; Wed, 07 Sep 2022 14:29:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C948A617D2;
	Wed,  7 Sep 2022 14:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D15C433C1;
	Wed,  7 Sep 2022 14:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662560971;
	bh=JiG4OMVdJz6MGyJ5Eyg3FGUXY+/mdIJYNhGg0aNUHFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QJV2XHmIRt6pj3UdbrtHmM7FwcxMC+QbMjV1HVM3CYIVcMBKCJ3meDxMza79bGx71
	 aha0tSB4pLRxVuS/UjBg7e/uR0+XV9ZRy2/jSl55u9Y8z7FyFaCsZQvCjx6N6ZdcE8
	 Kcw0JLQ2JzouI7WR5l2iV61ilvqMd1KzF3l0p/CsnMRF0l6XLkZTJN3b4BMl/C1ERj
	 m4QTmjwbFwc8C0RnyxDVw25YE/WfnoVcwITFaIw+77h2aBuusyLiest2ykOvuNFi4E
	 SGXzkbW47BP2sHvaHW9hRyKXhPLq5VU5F9zvtnn7CrlhDws4aV+S+x8WzM+K/+omnJ
	 8EOtoQ96LqS6w==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: pierre-louis.bossart@linux.intel.com, yc.hung@mediatek.com, ranjani.sridharan@linux.intel.com,
 Allen-KH.Cheng@mediatek.com, trevor.wu@mediatek.com, perex@perex.cz, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 geert@linux-m68k.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, daniel.baluta@nxp.com,
 chunxu.li@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com, sound-open-firmware@alsa-project.org,
 kernel@collabora.com, peter.ujfalusi@linux.intel.com, wenst@chromium.org, tzungbi@google.com, tiwai@suse.com
In-Reply-To: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
References: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 0/5] ASoC: Fixes for MT8195 SOF support
Message-Id: <166256096652.159155.11970501436356826295.b4-ty@kernel.org>
Date: Wed, 07 Sep 2022 15:29:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_072932_531193_DB37FF59 
X-CRM114-Status: GOOD (  15.21  )
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

On Tue, 6 Sep 2022 11:27:22 +0200, AngeloGioacchino Del Regno wrote:
> This series fixes Sound Open Firmware support for MT8195 by making
> sure that the sound card driver is actually able to probe and IPC
> can finally happen.
> It is now possible to get DSP support for audio.
> 
> Tested on MT8195 Tomato - Acer Chromebook Spin 513 CP513-2H (Pipewire).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: mediatek: mt8195-mt6359: Properly register sound card for SOF
      commit: 64ec924c781ee846bd469be8d1d6bbed78c0f439
[2/5] ASoC: SOF: mediatek: mt8195: Import namespace SND_SOC_SOF_MTK_COMMON
      commit: 404bec4c8f6c38ae5fa208344f1086d38026e93d
[3/5] ASoC: SOF: mediatek: mt8195: Add mailbox generic callbacks for IPC
      commit: c2186a9b3a98f1ff814996aa52a019158bfad9c9
[4/5] ASoC: SOF: mediatek: mt8195: Add generic pcm_{open,close} callbacks
      commit: cf84edeeb95ee8e76f12bb02a7444876d031bea7
[5/5] ASoC: SOF: mediatek: mt8195: Add devicetree support to select topologies
      commit: 8a7d5d85ed2161869452ddb9ec45345dad665f52

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

