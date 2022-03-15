Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A132C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 13:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3H492/y4LIcoqdxsfHkObROTAb+DxUdmgweRW5yHbs=; b=b8bfKxslo00G39
	wFupU94KrHIQ/8vufHmoHOJW5RmOF6FnP0nf787jk+bWGbPLdFOK13EXWgdl8UoleWJhAaXW1d8GP
	/N8avsdQihv2VuV7L55q7Asqjae9aYkHpR0sjnEFiPeWQn0LvKXqFk4RuWp81pur6DVbulQrCoVgr
	KN0C2Lw0h4f4AutxvYZ5DlIsglc5nNe5EMYPK/+cAYJsGYC6Kal0ENTog7veC/W9AhqH8mDKUhyES
	pJLtMGpSxQQURpYvOpjKJ2upsIc0ROgG4y/6QVHF2I+hjIuRhHQd/wUqKkI+t3vkI81dklU/BnLo0
	JPdmZIx59/ZVcuHZxfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU7RK-009Grj-Aa; Tue, 15 Mar 2022 13:42:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU7Q9-009GLh-Cc; Tue, 15 Mar 2022 13:41:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D85BE61647;
 Tue, 15 Mar 2022 13:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45D3C340F4;
 Tue, 15 Mar 2022 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647351664;
 bh=5GoPK5Absvivj6zbGvAbFgfXegOGh3wNX8cSwc4rE2Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FFPImUwRJDbCvfgkde1ZiY2E0xqIjyt/nvkBKcHsOjugP7pKiun2GTEwDpXKDjgWd
 qUCchZh0HdRwzgcAf45YNfb5V5Rz0QQfy/z7RKj/nkiS1b1VAcpGO6n1yLM9DDdyxg
 gufGGq0vA4UVMec8WGGNppyO/+ljNlWuD2PGTsbHoVtqcfF952wuzQkx0dcufty8ex
 7Wt6uJThbhFpuDZhDTSeZOewBpCQGFMtSoAsYXIGxwfLEJ81Wiu4DKSsf6stTOCnFG
 oTDFe54ar9QIoh2ii89I/+1OHRskZ3kVrM0bZr4Jqlysk4Q5F/2ICmv3ccM1EduMWK
 0LYb/Ks7S8lqA==
From: Mark Brown <broonie@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20220315032411.2826-1-leilk.liu@mediatek.com>
References: <20220315032411.2826-1-leilk.liu@mediatek.com>
Subject: Re: (subset) [PATCH V4 0/6] spi: mediatek: add single/quad mode
 support
Message-Id: <164735166243.3687547.12763908878922774952.b4-ty@kernel.org>
Date: Tue, 15 Mar 2022 13:41:02 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_064105_497904_81F1A512 
X-CRM114-Status: GOOD (  15.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 15 Mar 2022 11:24:05 +0800, Leilk Liu wrote:
> This series of patches are based on spi for-next, and provide 6 patches to support MT7986.
> 
> v4:
>  1. fix Rob comment in v3;
>  2. use "mediatek,mt7986-spi-ipm","mediatek,spi-ipm"
> 
> v3:
>  1. add Rob Acked-by in "dt-bindings: spi: Add compatible for MT7986 with single mode";
>  2. add a fix patch "spi: mediatek: support tick_delay without enhance_timing";
>  3. fix Angelogioacchino comments;
>  4. use mt7986 instead of ipm in dt-binding.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/6] spi: mediatek: support tick_delay without enhance_timing
      commit: 03b1be379dcee2e9c866c2a455a1a4a9581b3efd
[2/6] dt-bindings: spi: Add compatible for MT7986
      commit: da40a352db2bae470a3eea038cc53454c24e67f3
[3/6] spi: mediatek: add ipm design support for MT7986
      commit: 7e963fb2a33ce488e65258ab5be38a4855923033

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
