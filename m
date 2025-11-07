Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A84CCFA05
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Nov 2025 15:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZxAc2BQsRrMH4REaWyaYT4OlgH+tMplYPSOttdPQm4=; b=DhteuD8HuhrMX1p7KiLFTe3/De
	xJvTjuSx+9/S8NqS//ocPctm5WowWIGicuireM0dYeWE7FtuS48muFUDiOWjohT4I7D+ebuvRSn01
	X6WSHNxA5eVwneOqGgMDVeDR7fZmvvPvahR8qrOkFH5XKZ96JD6HJM0NWU2ov8iUY/4zPbBqGrE1x
	Wt0emMdTekcTVesy+BhTlFN2Hlj3vTqP2mbYB8Gb4v66IKykwEnuNgaLqWZSo418dgRsjxTg+1smG
	Ri2KEdXo/37GSz9jcnxQSZkLMu0acz/hCwx0g2SVFJTquwC89XDwq7sll8S10zs8FGXGOSyobUrVs
	7gn0JQGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOsJ-0000000029w-0cbI;
	Fri, 07 Nov 2025 15:59:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOsG-0000000029A-2Z34;
	Fri, 07 Nov 2025 15:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 082FC4010C;
	Fri,  7 Nov 2025 15:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A247C16AAE;
	Fri,  7 Nov 2025 15:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762531179;
	bh=CutddtJdxTwBMPiBCGqUeSQ/z6FRLzP4zZy5fTdyK7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TLUJ/idfKTLc/iAjQNurzsGK1lWtnQlcdJbDFIX8Mk+ipdDi2vKPAdI3/v0FMg3FF
	 W8KjmWKoEVDM3rzuX5WCkYKefvW7OOa4I7aOkojVmoMEmVQnRfDHVG3DeJ607o+o4j
	 3UpP7Mq9PaTtn4K6xw6Kz/oJnzWeOEJpZFE+gVqrw1bTaY+eaeABGC/E559P0uzmDo
	 QiOzwGmNakFraaQgRcXDz+X/ThnupkdgnTn2yVEWN7304gKf+w8Azj2mhDziLUzOfr
	 yrPt2HI8rjdBGND4jh5JmqatfeRkK6xKRAH/aMffa4xZSPo3+e0TtRJMzbBRa8OeAp
	 MU7E/TPDxP6DQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20251107085109.2316999-1-nichen@iscas.ac.cn>
References: <20251107085109.2316999-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] regulator: mt6363: Remove unneeded semicolon
Message-Id: <176253117500.2510929.10700935899599839032.b4-ty@kernel.org>
Date: Fri, 07 Nov 2025 15:59:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_075940_672746_157C1C77 
X-CRM114-Status: GOOD (  10.10  )
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

On Fri, 07 Nov 2025 16:51:09 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mt6363: Remove unneeded semicolon
      commit: 2089f086303b773e181567fd8d5df3038bd85937

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


