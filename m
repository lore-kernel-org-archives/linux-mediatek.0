Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA76D17127
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 19:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4reSCgdFUPnrFtX5CfrumQ7RG9lU6Q7cWZnFBd/6Wyk=; b=c08DfTpSnS6O2EgD2ZrZS/DQxA
	JERi5QU8w5HBjE4tpXDUd8hHleRI14haLJriqJJbeuTfqi98QRf8MJGd5QII9sYOMCAYGvSFD5alj
	6/M+BOBqy88wQp77hGzH1FAXj4eeSEvClD3vZu+Wa5nJciveYLxMk8GUvFWrKnMuNx3nbGilUOgEZ
	pS5WzcK1GX2ReIByG152tu7Op63Mdbo/76qqUqWSdRV8oclNY1ul27O2Lm1AO5oHDt8ha64tv7Z5u
	2hzJBQfUBd9vuWWN3YE1VLyOpkV7wQTSD2pJU1m0WatftABEuUF0aAKUYYHi4rGAY8YXZXYk3gpTq
	zSZF++yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2xeQ-00000008NdW-2uTy;
	Mon, 21 Oct 2024 19:01:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2xeB-00000008NaN-3a6v;
	Mon, 21 Oct 2024 19:00:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 879825C0765;
	Mon, 21 Oct 2024 19:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926FBC4CEC3;
	Mon, 21 Oct 2024 19:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729537254;
	bh=1+aoPMboBygEKxSiE2RfvUpJhAyTmUBmlDBCyeFerjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icgPAVVXlk6ddNz9xJzZvxK/DPaJsvzTm14oIho8L9m9tLjg319wkKZdoaxtgLxoK
	 37eH1zOC0gR8TjASQnE12VPKk9/PdhqHK2tDJv3tJ1cnNIZ5dZIColv+r/Yf1UD6Oi
	 wViN7kj5oEIQlfaaGXucGgBSbr/83h7u7A+kRu+D1TZrfezD+K8w/VukbAZfaBVK38
	 CgoXjLDJHisxPBCm9Ye5IP9f4YisRueBkVuNacxEw9ObIho1kmnusc5Kcm4V57toMn
	 uExRsrOoowdJ+KOEscH2AvGj2IqH/TBrWYn2dkqkaFpafnYlHjrI/PPmZazp+e37Y3
	 U5lzqboplqgmw==
Date: Mon, 21 Oct 2024 14:00:53 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
Message-ID: <20241021190053.GA948525-robh@kernel.org>
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
 <20241018-en7581-pinctrl-v8-3-b676b966a1d1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-en7581-pinctrl-v8-3-b676b966a1d1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_120056_039489_8CADD81D 
X-CRM114-Status: GOOD (  19.80  )
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

On Fri, Oct 18, 2024 at 03:19:04PM +0200, Lorenzo Bianconi wrote:
> Introduce device-tree binding documentation for Airoha EN7581 pwm
> controller.
> 
> Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/pwm/airoha,en7581-pwm.yaml | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml b/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..fb68c10b037b840a571a2ceee57f13cbae78da66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/airoha,en7581-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha EN7581 PWM Controller
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    const: airoha,en7581-pwm
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +  airoha,74hc595-mode:
> +    description: Set the PWM to handle attached shift register chip 74HC595.
> +
> +      With this disabled, PWM assume a 74HC164 chip attached.
> +
> +      The main difference between the 2 chip is the presence of a latch pin
> +      that needs to triggered to apply the configuration and PWM needs to
> +      account for that.
> +    type: boolean
> +
> +  airoha,sipo-clock-divisor:
> +    description: Declare Shift Register chip clock divisor (clock source is
> +      from SoC APB Clock)

Where is the clock source defined?

You can specify the PWM frequency in PWM cells and should be able to get 
the APB Clock frequency. Then you can calculate the divider.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 32
> +    enum: [4, 8, 16, 32]
> +
> +  airoha,sipo-clock-delay:
> +    description: Declare Serial GPIO Clock delay.
> +      This can be needed to permit the attached shift register to correctly
> +      setup and apply settings. Value must NOT be greater than
> +      "airoha,sipo-clock-divisor" / 2
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 1
> +    minimum: 1
> +    maximum: 16
> +
> +required:
> +  - compatible
> +  - "#pwm-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwm {
> +      compatible = "airoha,en7581-pwm";
> +
> +      #pwm-cells = <3>;
> +    };
> 
> -- 
> 2.47.0
> 

