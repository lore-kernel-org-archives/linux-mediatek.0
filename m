Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFF7C47077
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 21:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSlknirIIR8WbJio5I9v96WTeb2+ZWGORUtbr7Q038g=; b=EHZXIRe88ou34yCHNgmHgffAS/
	nh1SsCht1xbkK5DhS3rYvQ9XUaMS3YonyKggrwedJx5jfRUo84A1pPcC/UxuerHP4/8f3Oc9JY2l4
	U38ps5d57lmD1ejWYvN+9L7balBMljqcaO2qaMO6gNpPOU0bpT6XIZecdtpJ4BA6NgefcGck2aFih
	kwg/BG+sevFmMc2EyUuKAbKSRfDJVliqWgsy+tukI/CHijF6UZ5EQnnWc5MO9YG/3dJbnlk2LGP1J
	kgBo9whU/dMk19jh1gwpScmFdAM2bW7sg2ZAkLe1GqM1pPSuR0DIMrVvnsPMlKWhZUtK4ri7e3RSB
	ZY7Cc3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO2bC-001FkY-26;
	Thu, 11 Jan 2024 21:28:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO2b9-001Fk2-2U;
	Thu, 11 Jan 2024 21:28:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E5173CE2145;
	Thu, 11 Jan 2024 21:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F2AC433C7;
	Thu, 11 Jan 2024 21:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705008501;
	bh=xfT2lbYAwKsfWKscclTNCiUip1woT0/W69P1c37dqBw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o+hyhlEYYzWi7d2r740CFFGz6drWNPDfrqjOKc6JjyWWsoeruXenxmY/e2Y+UopKY
	 qv0bY6rvU0Ft2ELBEF9q2bBnnuMhH52+Ucvipv+w8MPUJPZ8oYBFXvTxKgN8lMYDjT
	 o4ESKQGR8WsdTtMXnE2RLRiJTjxpo4PWe09DiLDDkPA8rnWofDFkmLfvq3Se/ycdfU
	 MKzX2zRIqC93UtSzxFuZ4TOSbYlMCVTTe/kwWNzEZVCsGRzPVeRaYmXl4OqCR3X30T
	 CR+lyKZeZ5OsOpu7roGAVqhL6dfluZCtJGL9NM2qqq+9K9XOwVWxP5/Xyzu+P5fnNJ
	 HhLZqtxMLEOdg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 trevor.wu@mediatek.com, kuninori.morimoto.gx@renesas.com, 
 chunxu.li@mediatek.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240111105226.117603-1-angelogioacchino.delregno@collabora.com>
References: <20240111105226.117603-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: sof-common: Add NULL check for
 normal_link string
Message-Id: <170500849826.453613.12911028566745797174.b4-ty@kernel.org>
Date: Thu, 11 Jan 2024 21:28:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_132823_988976_72BAFACC 
X-CRM114-Status: GOOD (  13.76  )
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

On Thu, 11 Jan 2024 11:52:26 +0100, AngeloGioacchino Del Regno wrote:
> It's not granted that all entries of struct sof_conn_stream declare
> a `normal_link` (a non-SOF, direct link) string, and this is the case
> for SoCs that support only SOF paths (hence do not support both direct
> and SOF usecases).
> 
> For example, in the case of MT8188 there is no normal_link string in
> any of the sof_conn_stream entries and there will be more drivers
> doing that in the future.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: sof-common: Add NULL check for normal_link string
      commit: e3b3ec967a7d93b9010a5af9a2394c8b5c8f31ed

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


