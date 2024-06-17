Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE3FC27C79
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8STSviPtabOFvqQw/CJaV7Ko/R81y3RIOk20tLVZC3I=; b=JAUz64TN1I9wXvQ9vLqJ+kLf5n
	Ioj8Tp7wJlsGi8JfxWN04i3CU+P+x7uDGNEbBwvJfJjxCoIKl3UEVZ5WRkSqicDc4rW0ItUPgmslZ
	fLZSjU3O1eMHhTdRd9fN8yw7EoWZr3+jqIC4k1nN6Rjtl52tRzLons9DS6NCMoY9Jp/cK84avPdIp
	0pTVIQjhWiwPUThNBNSRBxjB5NYxv4NuHmtCQceNvwx7bcOsnI2omR3Wtl6BsumlVhFklQtmT7+qO
	PMSk6G2ScJnPWzebyEznvfftGwdp7soHNgYzDXkqd0HtGFrM82joJyErnR3C0kzv0tm7zb2hsGpnv
	txLSiA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJG8B-0000000BwSK-3Z86;
	Mon, 17 Jun 2024 17:26:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJG81-0000000BwOW-0Qyl;
	Mon, 17 Jun 2024 17:26:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E5D6CE1154;
	Mon, 17 Jun 2024 17:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61D5C4AF49;
	Mon, 17 Jun 2024 17:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718645206;
	bh=FBswpofNDhR2w+Ns2wjNtFSb1eY3Syl7BNKymUDMFHE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z/SZP+YMKge+5VVdaq/KuGfnZutODrS+5+77su4siOcVqSbCJPowjJ4c2+kNfEbx9
	 5/yV9rVw8Ru6v0fr/xs9yETL0wJRc+4HR98/9BFv+rkDDqtrgn7/M8FuUUJnHRqiJb
	 GVkcPMgYhqRypbB4DCW+sx+V7vxUTNtbSzKOEFnxDLjsvebka0WEFsAsNl12Ri/YLO
	 4iTUfXWOmti6UHSUCU7OlEeSTfMHiWC6dsX54YuVcjcBpItSdWokzEy4p2L1TR2MYa
	 ohY40KJOphkP9qYwBpTzMX3UNffB0kBOezA5Dmd/2fGt6LWjW+mbIgqfjVyECjgsrB
	 6u7sRg6hF9JUA==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <a45d6b2b5ec040ea0fc78fca662c2dca3f13a49f.1718312321.git.christophe.jaillet@wanadoo.fr>
References: <a45d6b2b5ec040ea0fc78fca662c2dca3f13a49f.1718312321.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: SOF: mediatek: Constify struct mtk_adsp_ipc_ops
Message-Id: <171864520134.209755.7325176074699665944.b4-ty@kernel.org>
Date: Mon, 17 Jun 2024 18:26:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_102649_370543_68C3F1D4 
X-CRM114-Status: GOOD (  11.37  )
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

On Thu, 13 Jun 2024 22:59:09 +0200, Christophe JAILLET wrote:
> 'struct mtk_adsp_ipc_ops' is not modified in these drivers.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> In order to do it, "struct mtk_adsp_ipc" also needs to be adjusted to this
> new const qualifier.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: Constify struct mtk_adsp_ipc_ops
      commit: 1c75adb22d49ca9389333ca5e6939052a7203111

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


