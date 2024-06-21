Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3599C2BA18
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 00:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijYG6nZSU+2Pl0C4YzzPp/4Ezwr0uRgndEkMIM0Pj7Q=; b=ZVm+h49HbySwYabn+lXWfFnJCT
	nZk4MXLQNzpOmwYa70lZhCkGrNO3THzG8l/1q4wZYlnYrHXBdr1XrBHH8xKNNtiW4fUDNZCiQUlCD
	l/QsxGPPewTBWBiqhevoqYN3g1DuYlleQdaQOu9EYsZWXVAT2o1/9nYUsi3HK8y4hzflXQCf3JywH
	SjsHBu4jsExVb8N7vxWBrWe4X5t00gblbnVXO8n6F61g0ho1iCx+A8fTRnW7Wb0lPEI49aNQWUvRC
	6f3VEX1QErkaQ6X1t3NL1GPcg47aeaaLfFkxMiNhzOKieP5UNYX5COuLXoleH/Il1tyA6BeM2Qoze
	dBnC5onw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKSSl-00000007Gku-2sYf;
	Fri, 21 Jun 2024 00:49:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKSSh-00000007Gjc-1kCu;
	Fri, 21 Jun 2024 00:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 117A8CE2345;
	Fri, 21 Jun 2024 00:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDF1C2BD10;
	Fri, 21 Jun 2024 00:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718930942;
	bh=BiQhCePJJd/KvSg0UgryJ7S8lCqzOeGVDO+ulriZ+ek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u8aEH1qUc/LCdLHqBDh+t7H2qXdlxsi+hS9lIvRp7xQrNo/DcvZZ1GdhB/ZrFTVvb
	 TREAgTtHyD8az2nIkLQc0IpnI9wAMYxx582HZ4D4gg+hOIL7Iy91RlE0PC+DCOwYQ5
	 9K32J9IZ+BjsUgancdVmLLTOw2WpN2JzAgaG0np0TgVTF804KMPTgDBedxS5ZB3OYc
	 3kLPPpqdyQUuCllHcoE9LOuScG4N1dqMy2lEKlC3CdDCKq4Au+JoWmWAt0vRdSJDot
	 TItQlahLGcIY6iMN+f4BZPDIMTUD5G5CyIY40TpuXbd1tW73UlkZ8BhjVMLOC9hR5U
	 SXUqwuXtae6yg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240620094746.2404753-1-wenst@chromium.org>
References: <20240620094746.2404753-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH 0/3] arm64: dts: mediatek: Add MT8186 Voltorb
 Chromebooks
Message-Id: <171893094009.286783.6584763337748943231.b4-ty@kernel.org>
Date: Fri, 21 Jun 2024 01:49:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_174907_670192_774968D4 
X-CRM114-Status: GOOD (  14.12  )
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

On Thu, 20 Jun 2024 17:47:35 +0800, Chen-Yu Tsai wrote:
> This series adds support for the MT8186 Voltorb Chromebooks. This is yet
> another product based on the Corsola reference design. This particular
> version features a higher end spec-ed SoC, necessitating a beefier
> regulator for the big core cluster.
> 
> Patch 1 adds an entry for a new regulator IC. How this differs from
> the previous iteration is not totally clear.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] dt-bindings: regulator: mt6315: Document MT6319 PMIC
      commit: ffe4b381e2ea97c7a5868dbe841c7522b1b0b408

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


