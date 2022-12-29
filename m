Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D57C3DA79
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 22:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRHiUq3yDH0fy5hQGHPWc/XlZq7F3tTH2hSm+IxeCOA=; b=KUnTsnQOmrySvWZdzBpoSis8Ag
	sSyJ2FKvVR8G7DwJZWhXaUZp6rlNAndgE2ix7soiXZb8NYy1Vry7HJ3f6KaMYRkLK3Q6qBDDJh5jo
	G6dYW9BbuxWxcqt2JwTmwc+Jwq1uXNyT2JowbVnUNwpwqXPMfmhMIGCg6xr9ZURFSRZK1jhWSFCbW
	lwi9NKaTSaIEewnee2fSfJBt+aSGRj3AfKYkav6R/Z9BYiFjhWP2Y8ntEhSSmQnVAJm2yybW5RWpw
	dlRqRPJl1l6KnO4emjotATZ0CDFClHCDtvwZ1FQTYlaIhIl027aTDOiaRCYnWFFhI9llYWHikYP/K
	0Wbk4JLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB1jm-002qLi-Pd; Thu, 29 Dec 2022 22:50:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB1jJ-002qBk-Ov; Thu, 29 Dec 2022 22:50:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4DC65618D3;
	Thu, 29 Dec 2022 22:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8331C433D2;
	Thu, 29 Dec 2022 22:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672354220;
	bh=I93/1mRsdn1k7zesrQeJJdmqUVW8X7j/6JylnPTDMak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A3zMnWxQ2QRSKe/ukjH1wIb2KGk644x0HuxTVfQL213iMNb5bCyXlVpClZkFU7Jol
	 w93hBVwJb7wwY8isey1tapUOsZ87dy/eXYlr3mjOgLVcKn3SWCHJuy/QOqPe09bx+d
	 D9ikBGbeCQPbHNdAk2NpZkM95LVy3tGt9yaKzDPR82ECnBiZlJxWowZFhsquIHSwrG
	 hHzYcCwAsl0B9EUaHh1A4wAlYv6Ts9J7ItcUGdUh1O70b/qIm7nvMnTondcYznu5b4
	 +XXDR1BcyOohQEWXUrpczci6xMWcgUAgWcgURtWSSUPRMLVXsArKHyCehzdgAWw/+b
	 F2RP8XVneaqSA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
 jiaxin.yu@mediatek.com, chunxu.li@mediatek.com,
 ajye_huang@compal.corp-partner.google.com,
 tongjian <tongjian@huaqin.corp-partner.google.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To:  <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
References: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
Subject: Re: [PATCH 0/2] Add new AMP MAX98360A for RT5682S
Message-Id: <167235421493.130379.3520267907504978837.b4-ty@kernel.org>
Date: Thu, 29 Dec 2022 22:50:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-69c4d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_145029_950408_0851E2BB 
X-CRM114-Status: GOOD (  13.43  )
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

On Wed, 28 Dec 2022 20:22:28 +0800, tongjian wrote:
> Add MAX98360A for RT5682S, MAX98360A works same as rt1019. So, it can
> be supported.
> 
> tongjian (2):
>   ASoC: mediatek: mt8186: support rt5682s_max98360
>   ASoC: dt-bindings: mt8186-mt6366: add new compatible for max98360a
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8186: support rt5682s_max98360
      commit: 6e1dbf694d7cd1737ee14866e9e05016ccc9ac40
[2/2] ASoC: dt-bindings: mt8186-mt6366: add new compatible for max98360a
      commit: 2d3dd559751ce19ba84f9690c6c7c5a4b39129df

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

