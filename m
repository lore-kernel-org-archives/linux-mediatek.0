Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBDDCA1013
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 17:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSfxh01A/9V8x+NQkrY16SwleAtQ6jhTOYLO4I06Grk=; b=3iltwBK+ehPe+SPJZ6AFhtCwiJ
	a1rxijCuJz9KbCRWeZR4s4IifKrCr52QochK8oyhHhiCpcy+xv+OujZTSh4ZIaKn5EE+E6tXp0wQv
	F8X3lr8L5+ZbEqX5kAhpeXnIHd3PPoYkcKzRxbJoE/1cXZQo6bEFjCmgj+k0fwGw7dmc2uKWZ4H2Y
	W5vc1R7sIx/O1CFWNVv75wFKBgYCFBPlAPVABPuwWirZtbEBgSN3Zxjm2DFodz/mp17+m6m1tRTWA
	y9dlddy0YIrh0TdQUGP/DlmhACPlqdT8ItwuHe0AgkvMybwvjzX4O22PdO8TLWBXpU4eJZVwcbKiv
	c2Usy4pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzI47-00000000iXJ-0eXU;
	Thu, 18 Sep 2025 17:05:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzI46-00000000iX6-15n2;
	Thu, 18 Sep 2025 17:05:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8150060211;
	Thu, 18 Sep 2025 17:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B169C4CEE7;
	Thu, 18 Sep 2025 17:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758215101;
	bh=a2wSSef3Du0dV802ZRWP0K1ebOZ2r80wa7XHm8uoFPY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=diFY3vQavuiQRrhCNAu6iUYXj9I8H1JqETJeI/Akb9ajERj6Q65o/UpnlZsGB9rkF
	 xcNbC1fXK1H9DtyoaQ8IlQah+TGK4dZJdBJ2SvU7Osr28nWZCyENuaODL9w3Dx3Q5a
	 V1rPRNb67TiuJVEDDyxpFseFt8hrRtj5q+XiGsclBScvr3aHrS1w+egXswXLNwA5AI
	 E7egT7+kNPmFotZGXGVuGLWJ4jCg/U3OCgS/FyGFsFhaMUm7N4xXRstHy9LRuaS3Bt
	 sr2NkAIXGwo7VqkKOe2jeUVAJiW+amPjJqtmkfnqLX70CdkmuI+Y/em8M+pQrR1pme
	 dgjuxyXaA1ITw==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tim Kuo <Tim.Kuo@mediatek.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Steven Liu <Steven.Liu@mediatek.com>, 
 Sky Huang <Skylake.Huang@mediatek.com>
In-Reply-To: <20250917055839.500615-1-Tim.Kuo@mediatek.com>
References: <20250917055839.500615-1-Tim.Kuo@mediatek.com>
Subject: Re: [PATCH v2] spi: mt65xx: add dual and quad mode for standard
 spi device
Message-Id: <175821509922.138184.639016042104046849.b4-ty@kernel.org>
Date: Thu, 18 Sep 2025 18:04:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183
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

On Wed, 17 Sep 2025 13:58:39 +0800, Tim Kuo wrote:
> Mediatek SPI hardware natively supports dual and quad modes, and these
> modes are already enabled for SPI flash devices under spi-mem framework
> in MTK SPI controller spi-mt65xx. However, other SPI devices, such as
> touch panels, are limited to single mode because spi-mt65xx lacks SPI
> mode argument parsing from SPI framework for these SPI devices outside
> spi-mem framework.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mt65xx: add dual and quad mode for standard spi device
      commit: ab63e9910d2d3ea4b8e6c08812258a676defcb9c

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


