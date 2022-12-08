Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418B9C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijEI9Ra/s0T9IQTMsabEYyLb2thsuV9aBxhF7S9JwHg=; b=XJh98IFLKn6rWoOmMcKaphthsF
	3f5LpUQ9X8mlVbXXCWdGYtvyna5ptw744rngpBgBf9TapJvMouDupEb6rKwV5hmWBk74MpKcgxL3A
	4zSVo/ajRwiIaGuVQDXpZEVrWKmQ4Fg+zmXgKUjJaC4Faiw8gd2IwaMRFskbqtBf2J14z5ROmcw9t
	uwrftQlk4V2mqwKeyeXngv8HO8tP0n90fk7aeJAM/w30wizOyiJMTjEFAoNJ7tVoVAjsVBgjImRMN
	1CZLV8nNVJqszLNabfMVk7RkLBfxNSkPis1R6EviS7pQo45BQdzV7UhHZpcxCHeJYdF4tl2ttFhgy
	OEKp5pBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DxN-00C4Nm-Gf; Thu, 08 Dec 2022 10:16:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DxA-00C3wY-Vq; Thu, 08 Dec 2022 10:16:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AB421B82304;
	Thu,  8 Dec 2022 10:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6855C433C1;
	Thu,  8 Dec 2022 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670494589;
	bh=KLaSZ5blId5Z7aDCG2Qh6BNgobCKMPPmG8Rf8GJpJAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLZTtEwkJBTfxeJJ77Yxq/MviOgCl2D9CY39vBvKkk070riGQ54+RiNIkozhE3rdF
	 mDPYgF28ilhYWoM0/5oELjHwmU1uWVigLCdXtf7nrPG9hNZdcvDlw0wSiZDi+Kclvo
	 DIQeP+klD4gnv+VFDjVX/7DP+iL9m82iV4N0RpKrkze6nZr+DYfIT6XmccRSwsrOGk
	 BhpWj/7672A46pax/edJNyySK1sKXoZilUyLdMt4sKqQRVEcoN8bODfncQS16Hmfqz
	 mLG2QFbfzq2W1BHuxtQp52GLUJVyaRDNYcTwNZD1Qao4eiUforqzHHo6ilxcfGDHG0
	 VzEO1KX172WvQ==
Date: Thu, 8 Dec 2022 10:16:22 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Gene Chen <gene_chen@richtek.com>,
	Daniel Mack <zonque@gmail.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Add missing 'unevaluatedProperties' to
 regulator nodes
Message-ID: <Y5G5duIqBYuEXqJU@google.com>
References: <20221206211554.92005-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221206211554.92005-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_021633_220032_F2B9E2FA 
X-CRM114-Status: GOOD (  14.64  )
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

On Tue, 06 Dec 2022, Rob Herring wrote:

> Several regulator schemas are missing 'unevaluatedProperties' constraint
> which means any extra properties are allowed. Upon adding the
> constraint, there's numerous warnings from using the deprecated
> 'regulator-compatible' property. Remove the usage as examples shouldn't
> be using long since deprecated properties.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I'd suggest that Mark take this if that's okay with Lee. Or I can take 
> it.

No problem from my side.

>  Documentation/devicetree/bindings/mfd/max77650.yaml  |  2 --
>  .../devicetree/bindings/mfd/mediatek,mt6360.yaml     |  9 ---------
>  .../bindings/power/supply/mt6360_charger.yaml        |  2 +-
>  .../bindings/regulator/max77650-regulator.yaml       |  1 +
>  .../devicetree/bindings/regulator/max8660.yaml       |  6 +-----
>  .../bindings/regulator/mt6360-regulator.yaml         | 12 +++---------
>  6 files changed, 6 insertions(+), 26 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

