Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2E5C52D7B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Aug 2024 12:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWDlhuspqMZQSVfqkB5uwLLhc99x2hTs9thqw7rojvM=; b=e6Qoxu2G8kx8yXml+ediiVWtmm
	3fiH6E7XmJVrlvxH1mGiR7HBpbiJ5NPnSTrPZHSg2FAT957FQ/Zzw2Qzi6UNC0E4YraaVOV88pwCJ
	ivUTXpHOy+1fF8OhznsvC9GIimrrrJy1Cf269X3qBFpx/xO8D7vyKn3w0IgWpTSw6PYVAw4yA58gE
	GZjOUcjv1p+0xFwVIAmomydhlZQItcRAjAZ/tY/Wu6hP2/zSnj5RPSi3WXoojrRGjqfnY2m5MRAtk
	Z+a5+2i6YQ5bB9bOKsegJjFbeIbJktkV+/RyjBqrtCL0/Y+noeSbMgT34uutOK8IA+8hsPb3iZS63
	6zfSoa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seClc-00000006sCL-2ACV;
	Wed, 14 Aug 2024 12:06:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seCky-00000006s4m-24Qh;
	Wed, 14 Aug 2024 12:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32688619F9;
	Wed, 14 Aug 2024 12:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C53C32786;
	Wed, 14 Aug 2024 12:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723637134;
	bh=Tt46dLTivc8ro1PclaaecN0IJCdF1hcNl8PaGQssZAQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eIbmEZ+axeTJhSQW9d3VUCCmVSeahAi91uWQRIbKyHZ8xXIvkmMpI18KWX5kL1NDb
	 6wM3zeIS6FiOHrW+Li4YZr7qwVs9BnlQd6BPDeMdoKfX3LS8tF7xwyNBrCgEuhieUu
	 EPEIVVuZNtuab2nSrL2aCSIiJGk3I1KwmBioLHdlKx/rGribjazojeLltziaslWZOC
	 367Tw/PpFdfUYuCDO6MMwBFY6/CR58y3W9Qm3Zjwo48AZ0ev0UOozkerxgh93Gskvz
	 KmvAasXTprdah0Couo9zGZ+++wJ3vh6Fjn7vIYdF9wZ7Ir18Eog/HwsBxlw277W6Go
	 5fLRYcdnhBp/A==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Trevor Wu <trevor.wu@mediatek.com>, 
 =?utf-8?q?Albert_Jakie=C5=82a?= <jakiela@google.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240809135627.544429-1-jakiela@google.com>
References: <20240809135627.544429-1-jakiela@google.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: Add missing board compatible
Message-Id: <172363713082.176839.8410056147508796370.b4-ty@kernel.org>
Date: Wed, 14 Aug 2024 13:05:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_050536_598208_1F7D5403 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

On Fri, 09 Aug 2024 13:56:27 +0000, Albert Jakieła wrote:
> Add Google Dojo compatible.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: Add missing board compatible
      commit: c0196faaa927321a63e680427e075734ee656e42

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


