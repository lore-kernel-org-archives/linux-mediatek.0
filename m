Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8FAC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 15:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyV0MJ0TVJDgT/cxM8+1zyKKrqjeBp+cCUkpRvDgAI0=; b=AWQ82W+XfhxP06YyOsykq5x1jn
	qvcry/1ZukcwjayoMJIfvMm6q9Cy58sUVtSLL7pkT1lUFfkTggz0ZR4x5GX2Qwq7KIvO2atSNO5/j
	L6jIZEFKT9D0+satZWGV93cpYoKvvDvPjMjJ/7e5zJuAr9q+eYwzFmAPwXhb+CF7t2zy8TR8EopJw
	pLl2d278O/3Bxe9HHH89rutsWymwDhpoxmIIvvvtpJW3YSqXZqecQoAIi4MD07Z8s2e33UFdagXEr
	IfeyCPeWRmgjCVglqN5uhfsMb1GRElIMnM4n0CQ/ZtGrraekXOEgYRFcoXxw3pWN9TFdiqn7YXXJd
	eOyZbxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSUl-0000000Btkq-01mr;
	Mon, 29 Jul 2024 15:41:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSTy-0000000BteY-2Nhp;
	Mon, 29 Jul 2024 15:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XyV0MJ0TVJDgT/cxM8+1zyKKrqjeBp+cCUkpRvDgAI0=; b=fXnLsOSxYp1z3HKCymURonYb7F
	TyPEo1hARoCLDSSX+nRcnTRyl5WcWjxY8U7YrBSR7HqvK+s7Alf14w1T2AEZd7SxPrur4OSNxWpPj
	Gp6nwRxe26d6Pv21Lr4AlDv8DHTUoq170rClqa8yZaXT/Kq1uUObOSS0cdYpEm7ynVOw9lrAAmVuU
	tNFQRvu940j+eA3jATmP45eUzRponllOHeKeHX5sg4z96QHccAsofyjJvagJ9RXmSa4Q/X8yUu/TX
	l9qN+0CioI7QhuifiFLHZziW1cDGv0dJlcnjWcKo1qYDKJ8oPRiCEtFDOL01DSUNSX9lNFf6wODFx
	j6lTzdJg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSTv-00000004oHU-03Wy;
	Mon, 29 Jul 2024 15:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82DAC61B41;
	Mon, 29 Jul 2024 15:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F44DC4AF0A;
	Mon, 29 Jul 2024 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722267613;
	bh=uylFLwNOYdKjfLJ3Fcuo4VxUycGhddVAuVf2ch5UZX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ucr7hsEPKCdBT5GMa8bR6DoDPo0ZlbNg/B1UXakUVJm5ulmVOHBnqYA/u8O702hcu
	 w9smP9bznSPE6OKHPpSV1P4X3GfTa53pA4suOKgpstIF2+M1leEwTaABKDiFaC3pT3
	 etdEkkDTb9kMSVB1fjd+ECacCuxq4EIs1WZdiNGZHblrjimntG0H1TeNpXJ6cfW9+5
	 pQwEnYbBAVAiFfCbDa1S2Nlqh9AUK0jxf7v6U8Qhu2V5ZbBQlB1/iuYNJgYQIq0RrE
	 30PEypX5QLJ1n+WR90g2Yy0uNraJQesl1kXtADmR5V2lE8uCHVd/zaP87sS7u6pWJ4
	 XDugO+1O2fZZQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Leilk Liu <leilk.liu@mediatek.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, 
 Daniel Golle <daniel@makrotopia.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240727114828.29558-1-zajec5@gmail.com>
References: <20240727114828.29558-1-zajec5@gmail.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: spi: mediatek,spi-mt65xx:
 add compatible for MT7981
Message-Id: <172226761022.71144.306390741868262406.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 16:40:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_164015_305343_A73552EB 
X-CRM114-Status: UNSURE (   9.97  )
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

On Sat, 27 Jul 2024 13:48:27 +0200, Rafał Miłecki wrote:
> MT7981 has SPI controllers based on IPM design
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] dt-bindings: spi: mediatek,spi-mt65xx: add compatible for MT7981
      commit: 158678bea637020dd6fc521536c5b07701447777

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


