Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F152BCCD1BF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Oct 2025 21:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELx0aP2RnneWj17jl7tYafLf+M0WZ8fchgG950BhEo8=; b=q6xc0mJSZq/hrg0db0VbG9Vpb/
	fAVKPJ5tydqdpFEIwd5iibyWN5Aa7NVx8OJN6bohrEKig/sygBvhjonhl9sdXoJ93fxHz/d/8FTld
	dEGRK+AulwldOvsi8VkzJAdiIHCuchfz4ADSqANhqJy1VDS4Zti8ndBEHJdLyVqrX1Oj5YPUCEpY7
	fgHKPtdHAT30wKRIiQl0ux+srVpNEXj+gB6LCg82OzQFv7leKonk0tm/+6+J+ezRAQzn0BtVJMTqa
	T08HMfKfKxTyRVA7TEWvVkRn0+MxERocsoW/Ils76KkGDpK3hjBBTzaMo4YFo71rTw4Si6QOF3RHI
	FzvFlMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2dc-00000007cZj-3Eq7;
	Thu, 23 Oct 2025 21:14:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2da-00000007cZP-1vOe
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Oct 2025 21:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5192F450FD;
	Thu, 23 Oct 2025 21:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D162C4CEFB;
	Thu, 23 Oct 2025 21:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761254061;
	bh=wbkNBMIZ6jB8PHwxsS3CPuYPXG0TkXccuiVzpdAw1Rw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uXc5VAGy6Qh4nlLaNesi8kKyhhPkyrSPzmpW5+g6s1O7HowK/rPStGj8eMfmPM4ph
	 CFNNanD9GSMiKNMLOyIFiIUJnKwhGpaVH7J25ZvWLlbkzaCJD9lGSXzhldxn31pERz
	 t1CEC/Lv0l88pGda5Dfcfr5dGrn5z/ga3zHbBnpSxPjTc2zV+SwwHO8+ovcCWF/LLA
	 7Ay9Tg0Qos8DYrQid/wr020rlv45Qd6wTtaGOkVy8bgXEXE3/widDH6LG0Au2U2I2n
	 UmhF5uNi9SeboTwljJ+hYnK5/nrZEUOQOHEYJQVmcgU6LVTsYsRRevUijBWPUFaHwG
	 bFpxwFDlz18Yg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20251023061226.1127345-1-wenst@chromium.org>
References: <20251023061226.1127345-1-wenst@chromium.org>
Subject: Re: [PATCH] ASoC: SOF: Fix function topology name check in profile
 info output
Message-Id: <176125405790.267603.9724280623055175546.b4-ty@kernel.org>
Date: Thu, 23 Oct 2025 22:14:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_141422_543485_18F909A8 
X-CRM114-Status: GOOD (  12.03  )
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

On Thu, 23 Oct 2025 14:12:24 +0800, Chen-Yu Tsai wrote:
> The function topology feature, and the plat_data->machine field that
> specifies this feature, is ACPI specific. The check didn't take this
> into consideration, which causes a NULL pointer dereference splat on
> OF platforms:
> 
>     BUG: KASAN: null-ptr-deref in sof_create_ipc_file_profile (sound/soc/sof/fw-file-profile.c:291 sound/soc/sof/fw-file-profile.c:340) snd_sof
>     Read of size 8 at addr 00000000000000c8 by task (udev-worker)/247
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Fix function topology name check in profile info output
      commit: edf5c8920240dcafe830908549a0edee4ba3b4b0

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


