Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1818D15DA5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/aHtu1QarMeKFBydLhr3tEetwne7qEYsLzw/CeApqk=; b=H9+7OPT4K1tnz4mOnGwN/uhJ5R
	bsueQbJ6DlqEQoToUwkF3nGWUdS22OqeCdboLjWTurrI6YhMLwSsuMvi72gRu7W25YmGrDaSTsfVI
	xH+o6mcPnyAajm3ZFHP/9fBSvg0Qix7BlB2yHN5bTrdb8/RTMlnJDN2qRMGPLj/6CE542DDho0bVW
	Rmzs6lkTLGdsE5ZU8cZgzzEXvmniN5bqsmgeuOVpqCdhcR50Mc9LgbTlN9y1pUzr+SvB0kxG44znn
	6RmY8RGyuvpAeAEXKmEdbiwiRQxPBI/G8bFduoU8uw26G8uDeHYSFEMsXIdcSmOtZiEeF6Ih98Smw
	7K1r0o3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2u83-00000007kcU-25uC;
	Mon, 21 Oct 2024 15:15:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sg9-00000007Sgj-1652;
	Mon, 21 Oct 2024 13:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729518155;
	bh=n5HI7q6/qnPaMy91MkXSVS3aseOGNcwWR8cS2NJnzds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qqHi8+4YbupJzReCJyWP/vsWSVsihO8SUuyYAr4mbkvwY0lJuR2MzI1vI67cP0FuP
	 WcAuGxAia/JPCOBQ4pifUH/Xrnn2KME5t+PJRnA7OZd3GgHwh6Lsm3ASOTF0mEwhRb
	 DCcyOosiIhVAeqiQfV5YmStTskt7PKsp0FlQ8xmZe4i+D1JvKBvshYWAxiTrdMT80d
	 nj9rzUgLJ92exsOUqk6RSyBDVqi9daa67bqCWDftVYISEJyWQNml7mRd/k+RKMhyNR
	 06k0Mv7kh9a/okax2vbdLWGzL8kS8sHpvOnqbRs5aE9oK8b8xYolUxJXFyp+xp6ZjN
	 ePE9a1yKJpWoA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 226EC17E3619;
	Mon, 21 Oct 2024 15:42:35 +0200 (CEST)
Message-ID: <53a22d98-e369-4ca5-ae0b-bddd42d539b1@collabora.com>
Date: Mon, 21 Oct 2024 15:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com,
 linux-pwm@vger.kernel.org
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
 <20241018-en7581-pinctrl-v8-3-b676b966a1d1@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018-en7581-pinctrl-v8-3-b676b966a1d1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_064237_491190_AA8E32F4 
X-CRM114-Status: GOOD (  18.75  )
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

Il 18/10/24 15:19, Lorenzo Bianconi ha scritto:
> Introduce device-tree binding documentation for Airoha EN7581 pwm
> controller.
> 
> Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   .../devicetree/bindings/pwm/airoha,en7581-pwm.yaml | 61 ++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
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

I think that you can either indent your description or you just don't; this
means that - if you don't - you shouldn't add extra blank lines.

In any case, that's left for the bindings maintainer to check - as for the
missing new properties I complained about in the previous version, you can
get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

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


