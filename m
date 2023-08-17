Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8102C6FD22
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dL1vxMigGNaUpHnhIyo8oGni6FKBsjZZGUX6SaWN0HY=; b=t4bpH7SvVfToWW/71vCBenI8lX
	BLRH96jIJ6zBtXjIyn7Za4Jtsrm9K144K6BxyyMAtnq/8ebMt20YTlZ/Ue/eCx0gDq1ze622YK5pT
	hDq4n6xlczOpbcfxm4pU1s3Z/K6+ZtqreVLzg4ufs3EVOYeMRtjQe4XviJ9+kkzfic5k3sqAU32za
	liWLBiihENyYZF4HOzrLPj3GqjNYUcfC1CNdmvAd7/8H48wXD+ESPiJ3ZczD++J49/5g3kXa4aRFg
	CB+KyzTv2rrYFPhLvS1wK1KnQ3Cgm0I9INj33riRl8LLTc8QfbSbeFlbjjNDvKQx5GC7L7YFckqcs
	/4mTtgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWlbh-007GDC-25;
	Thu, 17 Aug 2023 22:36:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWlba-007GB7-16;
	Thu, 17 Aug 2023 22:36:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78B2C64030;
	Thu, 17 Aug 2023 22:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734CEC433C9;
	Thu, 17 Aug 2023 22:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692311796;
	bh=tOGckeY7O8J6GlVuUCz6yWek4KQlNAl8jPLek4LXQ0U=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ixjjApHpPipdtj0u9dHwmmYsUpfpqVxAkquQ6+aGs464Wm5DY+EjZ6eQ2ipAISa38
	 lM8u/+z2G4gnXHvbbO5AtHP3jsBFAXaqVJjrVFzWxsrA8vUnXhA7l5mEngiQKF0X4M
	 8kbEzXDBWs/DB3kW0IWoO5+HliFfySbiRWbdzDkqGBCeCs/GOGf520Cgxbyl9ZWUCC
	 BkaFt0OW7kd1wqm0YuY9uKAQrrY/Gdu2UQsbG4l+GXnz6JfyEmsGn0EJ5iwx6sUJ+I
	 LW7DrA3XwZYOaQRWJmfzEGHHp7qfsUwrGizgNtTySyPSVGF7GBz7u/VecwcCnON5iJ
	 KYSstiWDDvakA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, 
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>, 
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Maso Huang <maso.huang@mediatek.com>
In-Reply-To: <20230817101338.18782-1-maso.huang@mediatek.com>
References: <20230817101338.18782-1-maso.huang@mediatek.com>
Subject: Re: [PATCH v4 0/6] ASoC: mediatek: Add support for MT7986 SoC
Message-Id: <169231179319.153247.9684848124345959803.b4-ty@kernel.org>
Date: Thu, 17 Aug 2023 23:36:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_153638_477187_67424D8E 
X-CRM114-Status: GOOD (  15.20  )
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

On Thu, 17 Aug 2023 18:13:32 +0800, Maso Huang wrote:
> Changes in v4:
>  - fix typo of authors and copyright
>  - refine with bitfield helper for readability [2/6]
>  - refine with human readable error message [3/6]
>  - use "mt7986-wm8960-sound" as compatible string [4/6] [5/6]
>  - refine properties based on reviewer's suggestions [5/6]
>  - remove assigned-clocks and assigned-clocks-parents [6/6]
>  - constrain clocks per variants [6/6]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: mediatek: mt7986: add common header
      commit: c4c3c32d088d5a432d3c40efef80d1b64743b6bc
[2/6] ASoC: mediatek: mt7986: support etdm in platform driver
      commit: 9f8df795ae8daa0051fe15b27c7a3b3842d3d91f
[3/6] ASoC: mediatek: mt7986: add platform driver
      commit: 8d0d4884ba2cdabc823dc263c987bb22aae5fa5e
[4/6] ASoC: mediatek: mt7986: add machine driver with wm8960
      commit: 9873277fc2ea6e517602c29cb336bb1e43ff528c
[5/6] ASoC: dt-bindings: mediatek,mt7986-wm8960: add mt7986-wm8960 document
      commit: af835f0b49777476528be5a913e5c00fc3789f41
[6/6] ASoC: dt-bindings: mediatek,mt7986-afe: add audio afe document
      commit: b41efc224a5c859ce982ab73e8a05ecac73d4752

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


