Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3833BC7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 21:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qfr8BVoS5TAgp4fCwBPfbPOjbXBAs4tfZrHfmN3CuBw=; b=D710w0TIiLnH2OJBNZa/XKiJ3d
	PG4v/4LxlSQJSDlFfjz3FuF/gbksQ86G8+ueVIRC6HgRSYbfVKNhApNIxTKnIbR7An0IQcqOY4G4U
	B80+4vP0bjJl4nwv4r7ROok2lTo5bQ5UY2os0e2cU/HuEaYA1WJ+alXVE9wiGqdQm/BONdaJynjF9
	Vw3sLEPsRKIkCoLCH4K5d0YNUeLlSIEyvSdkNl1KcLfKjxBtdz3GnI3r43LuGBYzEb7cCHN9bGBbF
	73xUJRgKDp197yoI4ER9D6UT8MHlCgMgXCG9j+w4J1UU+P7RwFLDziHvZ6woG8qamrPw3nAjugOwq
	CFtqG1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Zne-00BWIh-0K;
	Tue, 23 May 2023 21:44:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Zna-00BWIC-1B;
	Tue, 23 May 2023 21:44:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCB99625BD;
	Tue, 23 May 2023 21:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D798FC433D2;
	Tue, 23 May 2023 21:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684878245;
	bh=aMl8XSo6MAGNcouj2r0VodRBmRxEH/7FWMSr7kUooIk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tjSA5U+NoSiz6ZoJmbQJK45dwGsdDMEhNmzvUZaejH8oRc2vJlqaDRTZUflFch0rd
	 DnWr9fz+bio2zkQHI3MY1gpw+qbTpkQ2rgcPF5c5F5AfaBBbQiaU0jny6DtFW7Z/KO
	 nQQvwBCemNOgUPPwpBu6VLMnCTjllEH/TKAhxGbkDSrWfJTFpeu8zuKVEMJg1tcrAo
	 U9JqoAbRAITAfxrmx7AhMdVY1ocNyav7ZhgVyaSDg8VgIJDQCSWFokDkvahFvNgWdu
	 U/xYu/ULg5ZsaJQN0i+MuiKcIr9kgucz0bPYjNNxUqzZxs7gpu5eehmGBlrikH/AjJ
	 q/AfUqIMRvTsw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: bicycle.tsai@mediatek.com, ting-fang.hou@mediatek.com, 
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230508071532.21665-1-trevor.wu@mediatek.com>
References: <20230508071532.21665-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/4] ASoC: mt6359: kselftest fix and driver extension
Message-Id: <168487824257.297010.16948141699377522681.b4-ty@kernel.org>
Date: Tue, 23 May 2023 22:44:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_144406_462052_679272BC 
X-CRM114-Status: GOOD (  13.90  )
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

On Mon, 08 May 2023 15:15:28 +0800, Trevor Wu wrote:
> The patch series includes a kselftest fix and changes for extending
> driver capability to support more use cases.
> 
> Trevor Wu (4):
>   ASoC: mediatek: mt6359: add supply for MTKAIF
>   ASoC: mediatek: mt6359: fix kselftest error of playback gain
>   ASoC: mediatek: mt6359: add mtkaif gpio setting
>   ASoC: mediatek: mt6359: update route for lineout mux
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: mediatek: mt6359: add supply for MTKAIF
      commit: 1a3eb4bb9826fd317358113ca048ed60184c6442
[2/4] ASoC: mediatek: mt6359: fix kselftest error of playback gain
      commit: acd4d219798769a6c1080bcfa7953e165dd8d681
[3/4] ASoC: mediatek: mt6359: add mtkaif gpio setting
      commit: 24f398e74ba0a53bc95421f7eb139f4dc0207bb2
[4/4] ASoC: mediatek: mt6359: update route for lineout mux
      commit: 104ce27bcbfb204001a300498aa192235bd0836f

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


