Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676F6C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mESb9JsmLUJ5Dte7ZoxvL0+20yNeIJTfQ4vxejvf5jU=; b=ueV6HhnUpKZZtIdNcKkkyR59tH
	/fTzDQtRj4EHohPS/C4l+wcZIaU+TYanEIT75TrxQYXlq0FNX+iQoAtHsbCMH0L8bgbmV4+QMcMQ8
	0zsTVgQaH/JzaMCF9MjwxXIhus9Z4sRJ3KkOm95/y+HzLixmVxPD5qspRTVC84hdujTLepV8cAzjj
	m37oHd6vFGSLGyD8AbLlZzt+QH1A7YabgdSXbStgDQyAdi07Bhve8R6dTNBneDp749ydPU6BEoMb5
	RwCMdgV1/XENgOEH0AmUbMtEu7kxJoq9dKkx9TyZd1CK7yuzKWJltJGoDTQNWPRtGDIysE1kZod2z
	OaWl1PUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otBmR-007tGQ-RC; Thu, 10 Nov 2022 17:55:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otBmF-007t9I-Ls; Thu, 10 Nov 2022 17:55:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D1ED561535;
	Thu, 10 Nov 2022 17:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45E8C433C1;
	Thu, 10 Nov 2022 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668102946;
	bh=8dI8eY6XRVF/HoJGtbyK+9hJs93DmhjtU6qSrByxC10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OAtLTp8+iWJCoGMy0JXHb53wCbSiQExkneRydmZYlVcf9q3F2o8BrmR2el1B7EfzL
	 F95JJEQRXuoxx76LYx5QWgYpb4VVg059HP4FenS+qYRzrVSEMO+JEsvUZPfz3u50yQ
	 UM4S/BajnMESc9zA03WIDRh19bbUu9VME95+NgICxEn97kfw0zn+ILDvIeQmdcTC3V
	 TooEKPoAHsd7mggfNMCiEZ4ogY+Mw3AJZwk7j30+46Gv/WxEU4KlRDQLQucod5zwNL
	 XKQP1eExPh2/CPt8MDtjIR2R1LML8y+2Ci46jjxja1RT9qARqOXqKnNHLITUtmEV8e
	 SBgWE7kbLxfuQ==
From: Mark Brown <broonie@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Cc: kernel@collabora.com, alsa-devel@alsa-project.org, Trevor Wu <trevor.wu@mediatek.com>,
 Miaoqian Lin <linmq006@gmail.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Akihiko Odaki <akihiko.odaki@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "chunxu.li" <chunxu.li@mediatek.com>
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
Subject: Re: [PATCH 0/9] ASoC: mediatek: Register machine drivers to module device table
Message-Id: <166810294251.959181.9607215723593812051.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 17:55:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_095547_807722_5DC64793 
X-CRM114-Status: GOOD (  14.86  )
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

On Mon, 7 Nov 2022 11:04:28 -0500, Nícolas F. R. A. Prado wrote:
> Some ASoC machine drivers for MediaTek platforms were not being
> registered to the module device table, preventing them to be
> automatically loaded when built as modules. This series adds the missing
> registration to the drivers.
> 
> 
> Nícolas F. R. A. Prado (9):
>   ASoC: mediatek: mt2701-cs42448: Register to module device table
>   ASoC: mediatek: mt2701-wm8960: Register to module device table
>   ASoC: mediatek: mt6797-mt6351: Register to module device table
>   ASoC: mediatek: mt8183-da7219: Register to module device table
>   ASoC: mediatek: mt8183-mt6358: Register to module device table
>   ASoC: mediatek: mt8186-da7219: Register to module device table
>   ASoC: mediatek: mt8186-rt5682: Register to module device table
>   ASoC: mediatek: mt8192-mt6359: Register to module device table
>   ASoC: mediatek: mt8195-mt6359: Register to module device table
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: mediatek: mt2701-cs42448: Register to module device table
      commit: f0f217ba7dea78872f5001135984159f4def7047
[2/9] ASoC: mediatek: mt2701-wm8960: Register to module device table
      commit: 59429a5ecc3337aaf6bbd878637250c1c878edc2
[3/9] ASoC: mediatek: mt6797-mt6351: Register to module device table
      commit: 083e948082def40d5d801a3e281d637ee3c0f9bf
[4/9] ASoC: mediatek: mt8183-da7219: Register to module device table
      commit: b5e004b0e5b57d14ac7804875878cdfdb31c9288
[5/9] ASoC: mediatek: mt8183-mt6358: Register to module device table
      commit: bc63a806acdcfca201c68c820731d74185118789
[6/9] ASoC: mediatek: mt8186-da7219: Register to module device table
      commit: 7d6d41e5fbf5e96788c88c9e82a3898ad4cf4f3c
[7/9] ASoC: mediatek: mt8186-rt5682: Register to module device table
      commit: 5d7c2ac0eb3e830a5c8e30515805b3a345d9b919
[8/9] ASoC: mediatek: mt8192-mt6359: Register to module device table
      commit: 2d32a3e52b0537638b31b3315ea1feafc5d0bb02
[9/9] ASoC: mediatek: mt8195-mt6359: Register to module device table
      commit: 6bd8ddf05e9a19fb9efebe46bf58f45b9a6af26a

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

