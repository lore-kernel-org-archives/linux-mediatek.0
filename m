Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCE5C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 12:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1Gh5aKdbTdP+qtmiPst9kiB4BzT/lLl/8G+RL9TN/w=; b=ohGi+7wrlqPtgd5GZ+3JQvxaD+
	MVyoOpBro/u80HuGID8xQZJZsa49SyYTb/AgDzZ11zLC0Ue8PaN5W3n3uiky1xiA76EnBqbvG/L1M
	CSajNRm/KriJiTr4EWH5dBerN4clO1+9YwNQBLUbRcBz1Yy+kpE4DULkf1RJ+2NGcWrOoXSir5YzW
	EF+4CZiQ0HeyVfpMSwiErDF3HsKQJIWyU00oMTTtYw/dEusidySLlaEbMku62azwxlacbn2A6J6h3
	TxYDJJQJ+nY2UP49v3tSlpC99AM68QpdzKPfcm8coVsLdwrf3G02GUFTWWPleVzzKp8H4Xw761NcE
	FXz4eSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp65E-00000004VBj-36Ku;
	Tue, 26 Mar 2024 12:39:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp659-00000004V9M-47n5;
	Tue, 26 Mar 2024 12:39:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 671EBCE203F;
	Tue, 26 Mar 2024 12:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FD2C43394;
	Tue, 26 Mar 2024 12:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711456748;
	bh=aIZN4ayFWAxqe4bKOQlECj+NTdd2YL5f3lY7krQamOI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H3MPJ6sOxaDeI8bHhLDFMP2Ffwr6cvCkA0U+3nDbvylo/g0j9l/OlkyHD2TGM9HRl
	 ds1FvyfPZDloy+G7iQUEMRqlHqigq2GM8bAKN8ZPfLQaQ3ZD7oytI//3lTWoIFpuJq
	 DyAG/rjOUhjYxChskOOmq/wj/OV7WJNdfGiDQSfi1trxwiswy/dtFi53pXx+93mIHn
	 Q8pkaS+ZQ5thrA8EJIKCrBoSJjzwPLyC37q/dg/XSsjfBIDi4Pynsopu5HV/I+gR0K
	 /ObQQa+0ONrCFOyLy+6pe52oj312ufuQ76nd5g8ZKXJUlAMxsOnIRDdhDVJrwK+gK8
	 FzMvcEDHC9Ryw==
From: Mark Brown <broonie@kernel.org>
To: support.opensource@diasemi.com, lgirdwood@gmail.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 jagan@amarulasolutions.com, Bo Liu <liubo03@inspur.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240320085740.4604-1-liubo03@inspur.com>
References: <20240320085740.4604-1-liubo03@inspur.com>
Subject: Re: [PATCH v1 00/13] regulator: convert to use maple tree register
 cache
Message-Id: <171145674540.65165.16145640493562999646.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 12:39:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_053912_496812_20A63B7E 
X-CRM114-Status: GOOD (  11.19  )
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

On Wed, 20 Mar 2024 04:57:27 -0400, Bo Liu wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> Bo Liu (13):
>   regulator: da9121: convert to use maple tree register cache
>   regulator: da9211: convert to use maple tree register cache
>   regulator: isl9305: convert to use maple tree register cache
>   regulator: max8973: convert to use maple tree register cache
>   regulator: mt6311: convert to use maple tree register cache
>   regulator: pca9450: convert to use maple tree register cache
>   regulator: pf8x00: convert to use maple tree register cache
>   regulator: pfuze100: convert to use maple tree register cache
>   regulator: rtmv20: convert to use maple tree register cache
>   regulator: rtq6752: convert to use maple tree register cache
>   regulator: tps51632: convert to use maple tree register cache
>   regulator: tps62360: convert to use maple tree register cache
>   regulator: rpi-panel-attiny: convert to use maple tree register cache
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[01/13] regulator: da9121: convert to use maple tree register cache
        commit: d92eb7c333c5ac8d8add10d5a211ac9c405e4393
[02/13] regulator: da9211: convert to use maple tree register cache
        commit: 03ddbcbe2f1ca9fac2759849be6714d8e82aa331
[03/13] regulator: isl9305: convert to use maple tree register cache
        commit: 66a4ead5ed9393d250105fcbe6e3525e1cdd977a
[04/13] regulator: max8973: convert to use maple tree register cache
        commit: 36649db5b216a85cfd7937a289c4cdd0b4b69126
[05/13] regulator: mt6311: convert to use maple tree register cache
        commit: bc125125125c10ec14764d153227c95ad0fd0b48
[06/13] regulator: pca9450: convert to use maple tree register cache
        commit: 0b03e9cb8b137490f4adedf07482384ffeee7145
[07/13] regulator: pf8x00: convert to use maple tree register cache
        commit: cea065dced280306ff5a4f7adfeb3773c49b2818
[08/13] regulator: pfuze100: convert to use maple tree register cache
        commit: 0332f074f5c3d8c2a32db24c9dcc3c3f13056cef
[09/13] regulator: rtmv20: convert to use maple tree register cache
        commit: 43edba6b670bc4f5426e77873b400fe91f8d3c75
[10/13] regulator: rtq6752: convert to use maple tree register cache
        commit: 81c180e77d60755ca5ff217786e2f427ccab04e0
[11/13] regulator: tps51632: convert to use maple tree register cache
        commit: 9500d38e50d0cfd33536454a204dedb9d47d84a3
[12/13] regulator: tps62360: convert to use maple tree register cache
        commit: fe258f54c0a85c1bfc0e836e20c3e4e52f1a8318
[13/13] regulator: rpi-panel-attiny: convert to use maple tree register cache
        commit: ab470abe58c09b2fbe2c1478e67a904fd803e84f

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


