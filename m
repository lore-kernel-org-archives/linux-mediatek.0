Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15C4EB64D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 11:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w76cjyQKC0WvGwrpjAWHP/OiV6/xLcYakqAvmyJejzA=; b=UL+PecL8NhiqYm0QfL1gmhBc2F
	UbcGe3wou5IFPWAkCs6Hzw4EeDrYMNQmBaasFv3U84TzpKgqRr8cC50R1GE2JzFc4GjJ9r4JUVNTM
	OUmQtQSxSa7y2MByRkO80OiGGwQY2QuJvPf6S+I519O4p6ah4wfY/wMzTy2e8MOfY/i+QypHq3myU
	4+Vg2zRt37XkrKS4cC/Gp81MaSxIkewAT+qnjdqK81dN7zkQH6JsM6CIzUJNhKtzzGgBWnKXHhs7a
	CDVBMzxzhjPLr1OCX5AS9gdvKlCGJZjbWfvyv76eaKh1Gst8atU6qIQo/pgso8BbT0Yf+KIRO5A/Z
	QFTGKsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYJL-00HQnX-2a;
	Wed, 12 Jul 2023 11:47:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYJH-00HQlx-1Y;
	Wed, 12 Jul 2023 11:47:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA6DD617A2;
	Wed, 12 Jul 2023 11:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF00C433CA;
	Wed, 12 Jul 2023 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162426;
	bh=TGhw0BOQLfLCUfvKyBi3wy+x2YHrjsCaDwvjVbjEVZw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m+a21ZBwBD0dLXB9dUo3vmJ1K4Ko4ztyANwi9/iMKKtwbXia2rmAGh9lzTvFfquBH
	 bb6U6QwxZ8wz5c8QcOT52DKSEhGNA80SaZPpO1Cy3Rey2D0GydCcV3Io1jHm0wofH4
	 LDMYsllnFWxuLIFlPTNfOA2pvow6mzET8nKCuPljaLd5i/rxCwdbF446poiMzF1jIt
	 seC+a9Phb7jS92O2SlmY1cMWcicKAi1S7BXxs/8ylnfL0p7VRN8uBYJ7Q5acnQCluk
	 HPvXdIfUlRYx4pJ8YCre+jpIqPhLiygd3TvUK6kRTcbZWaCtGTExNgw35IYUSG/LqY
	 S5S5A1IJVXifQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20230629074348.21670-1-trevor.wu@mediatek.com>
References: <20230629074348.21670-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/2] ASoC: mt8188: add memory-region support
Message-Id: <168916242315.46574.12917006493052835977.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:47:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_044707_559784_54FA22CA 
X-CRM114-Status: GOOD (  12.61  )
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

On Thu, 29 Jun 2023 15:43:46 +0800, Trevor Wu wrote:
> This series introduces support for memory-region, allowing afe memif to
> utilize the region specified in dts.
> 
> Trevor Wu (2):
>   ASoC: mediatek: mt8188: add memory-region support
>   ASoC: dt-bindings: mediatek,mt8188-afe: add memory-region
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8188: add memory-region support
      commit: fd9965235099fc4cccd94f82a371192bf7645a3e
[2/2] ASoC: dt-bindings: mediatek,mt8188-afe: add memory-region
      commit: e3326e3bc4937622b4dc6e9721262483109b0f0c

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


