Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14932CD128A
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 17:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0BL0fowKFD46SSnXKpj6tnFTkeTXb+AgMB7rjec/JU=; b=oIC6kwMJyK8PTzNgIdpQ6UZi5s
	MV/dOh2YATwsGAa4zfalBeQKcpxo7TlYAF/ZlhsgeSBs+Ode+jI6wFmB5J5emrPE67tq8Jsub8lld
	rhSYr/5voYt7eNw9iuRs1U/cNJvYrY7ujdL6t26zG2Og1qRPiNQZQ94f67auvm0yZa3qvSL66XVcC
	8r7BhqupGMkN23MxZDmipSWJpa8H0IbsvWps4+OzMEMYZz9F+RncDcMpiLkpy3EQzySVe6cJ2wURK
	RkttcdrMDq8IzmkfIyT9GyIxEurodOlpWGnEqSmGBuIF3h2XvWjOcy2r1vQbV/ucBvZm2/1f4LLHN
	wAZ9p5iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruF34-000000036Jd-0Fnd;
	Tue, 09 Apr 2024 17:14:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruF2z-000000036Fk-1Mcu;
	Tue, 09 Apr 2024 17:14:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 91CA9CE1E40;
	Tue,  9 Apr 2024 17:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DDDC43390;
	Tue,  9 Apr 2024 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712682850;
	bh=TBA2HdhdctdleihHhpwNGTmnAD2XEeUKBvJmag1oMrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oJbfs7mDu9BM/dO9ZU0CMhMRsqPZ0uW3Trc7tZBlp7JzeFGpvn5PYgBKnu2dfkH4z
	 mahdyiYMjwZcrxqDmHQQbnNyE5iQqX1r6OP0pVBcfevu3epFSjGpGgpppolgXtU6Zj
	 zYnlEqkRlW+j61qowesmCry3m7qr1xd3eqqchzL1cJbhzEf4EToRmDAqmRLHL29Fr5
	 CCLVH89Zq3SF0k5aTFwObGLAmRi14zlsLyOrZczMDoCWjXn+pqSdMuvd75ZjohDw/1
	 rL2yKm//82kx/Z4yQytMPs+frJE0tco9xbeG96Qxb43OxCSU6fN3LWo+j8l5VQniPH
	 NOrYKyF43oCyw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, gene_chen@richtek.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20240409144438.410060-1-angelogioacchino.delregno@collabora.com>
References: <20240409144438.410060-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] regulator: mt6360: De-capitalize devicetree regulator
 subnodes
Message-Id: <171268284879.51855.7043430433984734547.b4-ty@kernel.org>
Date: Tue, 09 Apr 2024 18:14:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_101413_633533_2D7AFC57 
X-CRM114-Status: GOOD (  12.89  )
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

On Tue, 09 Apr 2024 16:44:38 +0200, AngeloGioacchino Del Regno wrote:
> The MT6360 regulator binding, the example in the MT6360 mfd binding, and
> the devicetree users of those bindings are rightfully declaring MT6360
> regulator subnodes with non-capital names, and luckily without using the
> deprecated regulator-compatible property.
> 
> With this driver declaring capitalized BUCKx/LDOx as of_match string for
> the node names, obviously no regulator gets probed: fix that by changing
> the MT6360_REGULATOR_DESC macro to add a "match" parameter which gets
> assigned to the of_match.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mt6360: De-capitalize devicetree regulator subnodes
      commit: d3cf8a17498dd9104c04ad28eeac3ef3339f9f9f

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


