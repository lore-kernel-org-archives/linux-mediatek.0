Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95D5C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 12:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vykh4vCDAbp73AG7/iFURScIgGPF17oPb8rEyHQYsV8=; b=yNDPBFW/CMP9py6rEjM4w2rtdA
	/cUtdDaxo//9riQ80iKtWFJ9XzimaW1fJQYF6xbFfUlxUpWevBTTK28Nn2d5E9ZOgngZySJparNaC
	E4wXjm/yFrI88SBLVdgMmCfyZtdlnNfLehYd0lj+QSYyPTS5wtowCWf8Y6QONxLINp9RydTxyzw1t
	XAKNI8pw+aIn4rxlVYnBRcmWsw8oQTf+gKEfRw66xA9DLXljI9iUjc+Jl74pDscM02+afrd1Y9hRM
	bMvzv2A9O/TNjJj8IDYixXUx/x2XQZtHq/B9B/bL4K3pxFIvYUgezsFZWjLGOe0NM5I4isA1JiiZf
	xxKePqiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MVP-00GGPG-AR; Wed, 30 Nov 2022 12:48:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MVF-00GGJN-1F; Wed, 30 Nov 2022 12:47:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 58633B81B33;
	Wed, 30 Nov 2022 12:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDFDC433C1;
	Wed, 30 Nov 2022 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669812470;
	bh=Ayte6uLLIrPFdwUeST0p7W4NcAcyN4PTRnbwPLLszyk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rKPBhpNmJFVwU6Q/QOYtguDZuwRJfnPJxGuEMuF+J+xEO/Po4HA1Vqh50YYr2Egal
	 ekIv6SSF+kw6TIdhwHwxQ1i0S1jA5wqLrZ7rQuQcjzWNtz/ipjMRCDI/wiBJAOAm+Q
	 3FCu5H4cpe3GMKtg2bKh9aXFXcL14yhCEJFD0cil+YXo34OE6P5BhVGW8KEZujganO
	 r9lQBnZSzxGeNUXpPpKMGufZxUjgmafP3phq4mgDYGEtaL94n+a6Ratv16YF3ccp82
	 6Evtk/1f4LTR7GE+7zgkMFKF8CC+gDv+keIaapWgkeNE4anTMjPsBjmM50JL8wiZGf
	 90rGj8H/QsD0w==
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ricardo Ribalda <ribalda@chromium.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20221127-mtk-snd-v1-0-b7886faa612b@chromium.org>
References: <20221127-mtk-snd-v1-0-b7886faa612b@chromium.org>
Subject: Re: [PATCH] ASoC: SOF: mediatek: add shutdown callback
Message-Id: <166981246666.67172.3822012000949184770.b4-ty@kernel.org>
Date: Wed, 30 Nov 2022 12:47:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_044753_248829_4AD7C564 
X-CRM114-Status: GOOD (  13.27  )
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

On Sun, 27 Nov 2022 21:04:15 +0100, Ricardo Ribalda wrote:
> If we do not shutdown the peripheral properly at shutdown, the whole system
> crashes after kexec() on the first io access.
> 
> Let's implement the appropriate callback.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: add shutdown callback
      commit: e063330a77edbdc57a142a27a82e51dc1361ab9d

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

