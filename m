Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EAEC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZDdaOok2OjWQBiEXZqlP+KdErSqxt6fw78AMor+tbI=; b=yuEuzD+rPVwQrIPuNYdM8gfQBO
	v+w9Qoq4TmPAr84Ji7frMHj1JERq2s8JJLdKrlWebKIrEXdMrFsUWVyMHS+khqLAW6afIL1J9dWF7
	TIizNSr9Z4bah0YIKV/zxzxp6Tzu446vC4CSgEj/zaXEvysvVw4cqBAGGGBc2CId2dLQWBPDhPE4V
	AqBPOFtEeaD/dAs+wjV7bVMk9o06kEJ9rzjh+eAWUZCMx+gwKBHPrA67co+4xLtcWQGka9aqWUWnZ
	njEX38AOuakfIXJEo/aY6rT8GWUVWoJCd8bND81TDQCclPr2cPIrp19JuFHaEvYpzJ8pcRcBKy0km
	DstE3bCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3GY4-000DM8-1z; Thu, 08 Dec 2022 13:02:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3GXr-000D4v-5b; Thu, 08 Dec 2022 13:02:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A27561F16;
	Thu,  8 Dec 2022 13:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D752EC433C1;
	Thu,  8 Dec 2022 13:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670504553;
	bh=HF/CT0qe8YpFOKtPjeRHyYkiJf0CwH4GR79yo9n3q3U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jH5e6c8f849b8XDNRljqZMzdQjJUarDYzIfv9F1yBeld8zD/0aRo/sJfPTnt7sV1A
	 vihQJrDaeqAPCkSJEF3929KEVyVZLcRjaBgwft+3zvWH4dDLeRqmPvzakPZplUV29o
	 QxLJZi2q8QIbw9Jk9zIm4j66lufJD2HGxZOjyQVqTYai9ze8Ze/E8ogATA10bokRYA
	 7rSZF0lvpNacNjOGYJS4um3efdxrADYZrIveP00ieN2znQddVIuHDZMWg0cD2VMMqE
	 Vdi2h6NQVYLcpT7bmZelyOsBD70dDzcjgBDA9Z3HZtG0hwZ2qG6esrqJcfJVXpBHrw
	 rilDxPN/YI3Aw==
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Gene Chen <gene_chen@richtek.com>,
 Daniel Mack <zonque@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
In-Reply-To: <20221206211554.92005-1-robh@kernel.org>
References: <20221206211554.92005-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing 'unevaluatedProperties' to
 regulator nodes
Message-Id: <167050455059.159009.6147291983377925638.b4-ty@kernel.org>
Date: Thu, 08 Dec 2022 13:02:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_050235_276222_DD831F25 
X-CRM114-Status: GOOD (  13.45  )
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

On Tue, 06 Dec 2022 15:15:55 -0600, Rob Herring wrote:
> Several regulator schemas are missing 'unevaluatedProperties' constraint
> which means any extra properties are allowed. Upon adding the
> constraint, there's numerous warnings from using the deprecated
> 'regulator-compatible' property. Remove the usage as examples shouldn't
> be using long since deprecated properties.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] dt-bindings: Add missing 'unevaluatedProperties' to regulator nodes
      commit: 2a17ddfdca25ac4cbb0d317362608ec32f98fd82

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

