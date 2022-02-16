Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32793C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 11:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AD/mX0ggKJx9FISIW+XuI6Z5UVM/SnBss+H9cAkWCk=; b=R6AmaAUY6iMsnO
	2uW7RNSx5BGRQy7bPNYNHy7pzLyvke5DoFTdCvsix8aHe2Z6c+q4V7aeNr+Eb9qmUm3aegL8Y0dtz
	eU+/FtRGnqyyg6JipHeUtxe4Fc08+Ee7mgNECETTs7VQ4lUHWK5tlBbpl9HOs5ilz47HIvv9DYezZ
	HPqAnSsvCm7alVCbyjlnCdQXRJS3y+pA9VyYRkf/8owgW+0yArZ5zb17/nPmP06w7TO+UGA85w/1o
	ijJriDd8BA150qpO3ps3uI0/kkvwIy6zqumkUJWquvjI8ULZPfV9y9QLX9GwMOnFQgo2fyT1vwSvb
	Pgd5VgpCZAl4AwfVF9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKIjQ-006mvc-JN; Wed, 16 Feb 2022 11:44:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKIj9-006mmb-PR; Wed, 16 Feb 2022 11:44:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B5D811F45113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645011846;
 bh=vMYqlcxJ4lSQwNLunvGOfbKl7psBgbiPHyVvb4L4nwM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RiEn09QgynpodGO9teoyBuAYdsAdJobXsL4dfPAvnBfl1aO2Dk57h5elih2C5oAEp
 z7nXm4lm3Sm3fycsfqtGwWO+NdI4avvUEUurYHrIvLINcqK05+tsUKvy/99hRADF82
 s94Y8lfCDZkCpVJU/Gnc6aFBy9CzCfZLByin8zLo3H9REnru3n6DHJHK86n040tR6x
 eUhtvFuD7FqUIC3/pnYJHypbZw/R8PCs2D3vTjt7xR0T1PydVV49HClwhL9pp/PV/W
 3zXdi0Lyb2KhXTE5JrXTL8qB7h5UruYseqwUVxY/oZlEZw+ZWWchiij2w+s3LxMvG7
 5quSnteSnZmag==
Message-ID: <cc5e7f4b-8a70-01a3-3219-b6b3c825504d@collabora.com>
Date: Wed, 16 Feb 2022 12:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v11 2/3] dt-bindings: pinctrl: mt8195: Add
 mediatek,drive-strength-adv property
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Linus Walleij
 <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com
References: <20220216113131.13145-1-tinghan.shen@mediatek.com>
 <20220216113131.13145-3-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220216113131.13145-3-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_034408_001987_2AB1B1EF 
X-CRM114-Status: GOOD (  18.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/02/22 12:31, Tinghan Shen ha scritto:
> Extend driving support for I2C pins on SoC mt8195.
> This property is already documented in mediatek,mt8183-pinctrl.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../bindings/pinctrl/pinctrl-mt8195.yaml      | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> index 8299662c2c09..c5b755514c46 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> @@ -98,6 +98,32 @@ patternProperties:
>             drive-strength:
>               enum: [2, 4, 6, 8, 10, 12, 14, 16]
>   
> +          mediatek,drive-strength-adv:
> +            description: |
> +              Describe the specific driving setup property.
> +              For I2C pins, the existing generic driving setup can only support
> +              2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
> +              can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
> +              driving setup, the existing generic setup will be disabled.
> +              The specific driving setup is controlled by E1E0EN.
> +              When E1=0/E0=0, the strength is 0.125mA.
> +              When E1=0/E0=1, the strength is 0.25mA.
> +              When E1=1/E0=0, the strength is 0.5mA.
> +              When E1=1/E0=1, the strength is 1mA.
> +              EN is used to enable or disable the specific driving setup.
> +              Valid arguments are described as below:
> +              0: (E1, E0, EN) = (0, 0, 0)
> +              1: (E1, E0, EN) = (0, 0, 1)
> +              2: (E1, E0, EN) = (0, 1, 0)
> +              3: (E1, E0, EN) = (0, 1, 1)
> +              4: (E1, E0, EN) = (1, 0, 0)
> +              5: (E1, E0, EN) = (1, 0, 1)
> +              6: (E1, E0, EN) = (1, 1, 0)
> +              7: (E1, E0, EN) = (1, 1, 1)
> +              So the valid arguments are from 0 to 7.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +
>             bias-pull-down:
>               oneOf:
>                 - type: boolean
> @@ -270,4 +296,13 @@ examples:
>             bias-pull-down;
>           };
>         };
> +
> +      i2c0-pins {
> +        pins {
> +          pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
> +                   <PINMUX_GPIO9__FUNC_SCL0>;
> +          bias-disable;
> +          mediatek,drive-strength-adv = <7>;
> +        };
> +      };
>       };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
