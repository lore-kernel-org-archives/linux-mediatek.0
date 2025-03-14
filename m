Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707D0C35FF3
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Mar 2025 15:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMqofPFDcyqhG61A/bg/258DYQEfnbCliJvm6jSXtLM=; b=d3CTftk25r8nGP
	O+hDZ8EywS4R1ZTDN0GozIU8SAQpAG/8Sg0A8mp8AccuDx6Nm7GXFTRyWodo5qh4jsQadxPCldI3F
	FOekH7u74Ae9iqkmUtm1xxTBXAAzmH2Nbs1IAPTMRs2Yq4no1whwZ+2VkuH/kVcPvknPcxFfXJFeO
	UzlWAgDz878WerdyMLTBpokge/ZW4+2xCRiGoT9f1MtfsBy96RXAs3JSExLErbezBLGCBcEjTFFUx
	mGi/jXCobOP6rGtGt7lBiyS7jVQ0izG7drg1H4KahoFZSvJID9rKp4Y7YzqJeQo9/D1vkQG80cGTq
	fE7O1Kq5hjwZZdToPYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7QB-0000000EeGj-1s4L;
	Fri, 14 Mar 2025 15:58:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7LR-0000000EdPX-27Tu;
	Fri, 14 Mar 2025 15:53:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 16CA25C46EC;
	Fri, 14 Mar 2025 15:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AC1C4CEEF;
	Fri, 14 Mar 2025 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741967588;
	bh=WcvIaJXZSoQm0ADUQKO1KQ8SqfP3MvACY1Lsy7BpMHg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dofsPJ08AKOVendj+CorudDO9G7YbrV1zXO3rRb7uUd9rBH6/RWSfbaTVChz7dODZ
	 z+HdzXzspsWrJRZAhDHsCpxjywdztIG6ENN9DamoP1gyX/AWShTwzIxsjpHGF/FPIA
	 uhBjkQmMlIFUCtRtokf5SQHRWvOrGA35NqXMzdzpalPwzJaMnPK66MsuQpchWRtwF3
	 9Mb/fzveJKlz9AqGzRmLxaErnrEj/wG42q6/VsqeWJjyZc2kECnlOaa7WMMg2PbUQB
	 KXM4DmfInYTcvsAu+IBXPX38hH/m47xafcz29v/xNwotkGdbOU40k1lu4eAuYj3icL
	 iaeJEkNRYWeOw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20241109105029.52748-1-linux@fw-web.de>
References: <20241109105029.52748-1-linux@fw-web.de>
Subject: Re: [PATCH] dt-bindings: spi: add compatibles for mt7988
Message-Id: <174196758592.19958.17138223278523726564.b4-ty@kernel.org>
Date: Fri, 14 Mar 2025 15:53:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_085309_589267_F4568E8F 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: devicetree@vger.kernel.org, Leilk Liu <leilk.liu@mediatek.com>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 09 Nov 2024 11:50:28 +0100, Frank Wunderlich wrote:
> MT7988 has 2 different spi controllers. Add their compatibles.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] dt-bindings: spi: add compatibles for mt7988
      commit: 3b2e1b87ad0870ad37ee8f2ca0ea6ede19a29795

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


