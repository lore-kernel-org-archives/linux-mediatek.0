Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16BCC55ABF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 07:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwNkJ5k/Yg61eA28+MStpfNR2SV/C3habiYRXhmHhCQ=; b=tO8nxJxFRUyKAXQZyvLLDGME4X
	+LYyv7LCb6yGJiCJhT/lx3kZ6y9XgMgzjtYBBeOmiO9+yfBbNAXlUQXLrUvvqsKrcpu+Oq76U+T5I
	lPX0wqmcKMpudH8gF+fEJJ5OxlVYOHiEWhSobdTpVT2wckltnNS+a2NJChV3P4Ae0YVC7wI6UEcjo
	LJWZRdewUs1neK4rsCXHlcM8uMqS+K43HI/DBKOzfBLsJIPyqjmg5WVhZaeP2F5NUcRaFIUakWwna
	g2HueF3Cz30Et3NlLnYktleXF6RXLTuW/HMk6dKFVM8Uc2Ma8H/krkxfZzSS/EcUK86uROIFogftJ
	VkvMO9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsD0-0000000573U-3mYM;
	Thu, 06 Aug 2026 07:08:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsCz-0000000573C-0rzx
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 07:08:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89FCF60A64;
	Thu,  6 Aug 2026 07:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81701F000E9;
	Thu,  6 Aug 2026 07:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786000084;
	bh=SwNkJ5k/Yg61eA28+MStpfNR2SV/C3habiYRXhmHhCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QnV4eU5TzkqPq1Ftksvg5xOjg8ledIprFYrZg9FMw8uGP8cEvEdPCteE592KBx0q/
	 M+7pWqn8vviIrWSaaHBS5Zr5VplijkzHa7JFD7rw+zDGEglomgo+938ImCrrenC4fO
	 avFZBgWZEv5xwwjY8/tcDHKI2lYF+eH9KxTnJAtvxiRijfe8vcggUFvTUJRjzMZyNN
	 cdxecdkV+T5YKmNcIROQIYTeNFAKPW9aQuNzFWoa8Bw3tso71ctoLXQXTtuNm+GURs
	 GRyb+tQXXFL3qKulMcRMM/aqtvSIN7k8IUdLNBZTyLblXiusSZkbJtlPS+6K3ejkbc
	 6hu/MAPuRHlrg==
Date: Thu, 6 Aug 2026 09:07:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Subject: Re: [PATCH v10 02/36] dt-bindings: pinctrl: airoha: an7583: fix
 device tree binding schema
Message-ID: <20260806-large-ingenious-guan-c5df98@quoll>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-3-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805123408.3767648-3-mikhail.kshevetskiy@iopsys.eu>
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

On Wed, Aug 05, 2026 at 03:33:34PM +0300, Mikhail Kshevetskiy wrote:
> An7583 device tree binding schema was more or less blinly copied from
> corresponding en7581 schema. As result it's not correct.
> 
> There are following issues:
>  * i2s pin-function is not really defined for an7583
>  * i2s pin-function by mistake was replaced by i2c pin-function in the
>    functions/groups checks
>  * pcm_spi pin-function defined for less number of pin-groups
>  * pwm pin-function should have more pin-groups elements
>  * unexisting pins was defined
> 
> This patch fixes an7583 schema, so it matches actual pinctrl driver.

"Fix ..."
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


