Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA6BC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Aug 2024 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQ1ZB5mNy3P/x3wmQqB0FZnO1YmcZinAixH25YcsG50=; b=UWTKKzGFH8bTFadbt5PGw3BSuD
	9pLDMaJ1bFVNvfYABJJdZgj72dsO9ArkGCNJNjdjMpS55YLZ88zyMzx7I02oUmA0/O0Ubua+1dTrA
	rah4bR+JtFDalL0UMAUwlefh7qo2HeyGGZIwiJy2r0CIBiYxbgzQ0LAfB5YdyCP9fjD3Mun+NNDie
	xgoBMEEcS0uvJ4m14KSqFyCBHTPGghXlwAJXwUpt24vy23RdCDwMqYXDHRywU3lDBk9EEFsRAoFJa
	BeoVkCtRZK3g/A8PsDUiSFD3Lm6LL6TkmKzwk9bOw9Fb8V+yOHpHhuOLVmLF8LrIhTmOS74nneuNQ
	8OTTZImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbyIH-00000007YN6-0ghL;
	Thu, 08 Aug 2024 08:14:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbyGM-00000007Xs2-46Tf;
	Thu, 08 Aug 2024 08:13:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4CC561506;
	Thu,  8 Aug 2024 08:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E3EC32782;
	Thu,  8 Aug 2024 08:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723104765;
	bh=wyGx+hEJcKcB48IvGGd6h0VDj2+CYo9kV3ak2QyISOA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QumPQrG/t3EEm3FPj5QkNQ3XdBdRoSCuWoeukdPa7MtrfgKS0xC9vBxYqtoRF5MpK
	 bnDB4+HjL3FXULyiDAHksc2g6dpe1s33Yc+8v5n/5KFSoBjvHWB1fljWDNQIR+LEJy
	 c5FAUrdWrv7YxsBFBW/O8T3CH091Fvo5a7WpvRiXIZUeQmPso4+HJOkIeQnlvy29AF
	 aXgdfxvF16aRnC2rRYRi2K+S4ISXhClzcxCPEzacBwtEZFG/m/4IgwZ/bu0mScg3VJ
	 0evxRAWBAJNechfp3g2G9Sl3ttiuDrSBFBb2iGvvRWTx9xlsmQwt+vBXk0946jWU2a
	 vlLxLDaj+F+7w==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, 
 Jason-ch Chen <Jason-ch.Chen@mediatek.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20240807091738.18387-1-macpaul.lin@mediatek.com>
References: <20240807091738.18387-1-macpaul.lin@mediatek.com>
Subject: Re: [PATCH v2] dt-bindings: regulator: mediatek,mt6397-regulator:
 convert to YAML
Message-Id: <172310475886.457595.9495452307181786798.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 09:12:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_011247_118569_B0504659 
X-CRM114-Status: GOOD (  10.47  )
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

On Wed, 07 Aug 2024 17:17:38 +0800, Macpaul Lin wrote:
> Convert the MediaTek MT6397 regulator bindings to DT schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] dt-bindings: regulator: mediatek,mt6397-regulator: convert to YAML
      commit: 1b4ec561b47d806eb0752a73837c2248bf622c06

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


