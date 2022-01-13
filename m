Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 16:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajdT4dekX9oIuRdhmTcv+M6PM9kanJDe+IsJzcLiAkc=; b=GbBT9VdvUiU7dj
	Hh2uJmj6Oj0Fz0kgY/5mArTKOqdQBXe13p5aRGP8oKMWELmLq0qYy9SOPFecvBph7GevWt5MADbbT
	QdQStboVyd/dKmvjz5wbJcZicl74N0m4lIWy8mBgOMo1sfA06pO62zlAvfUidzxjDZGfwBbXwEFsC
	ufTCo8Cg0DzorDAM6aJ1o97Lu5i5/VkWd7Kic5qZQo5F40c+PP+S5gM9IJpbrp+VquV8dU2hHSCEh
	od3kYF83l3Ok63MKkt9GUG0TJXEkDX8zPySZv+Tu4rna+x79NLl/YgPIJi1S3OhcTA5ny9JA3/U62
	9i9UssLJZNt5Q+pQIb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n831Q-006bQ2-TX; Thu, 13 Jan 2022 16:32:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8317-006bJY-7W; Thu, 13 Jan 2022 16:32:04 +0000
Received: by mail-wr1-x435.google.com with SMTP id e9so11171801wra.2;
 Thu, 13 Jan 2022 08:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=stJa+t6N7piCO/G9WOrqhozs1aIJeDJMCX2Hc5YW/E4=;
 b=maMcAzeBBfspfDIjpKaMxzI5mlxkmJd8BsYGLHKd274zOBEBxERbjDYCCSm9t9mFer
 e0nC3OgbAcstei0ExP0dOqEC7bu6xECBBLdA0IkDM7cGVmVju9N4skvu+h6UucLMkjiC
 FvpdQoFAMnxg5oCt2BtBBoosRZEqZDascNyUYCx3KUjy0ZFEgKXIPouUbRsBRYeDLgsu
 EusPagXiugBX2ZQTjLlNzbGdkhmyvUh+JCE3WYj4/pjyTFEZ6KrmkAKoO0uBafcGfqN8
 a4Gyb8NH3RCzdDHK9+06EMolyGzt0xnndvHQrsK8PZrF0X8D8y8wBtFEhtvlOzRgIywF
 33qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=stJa+t6N7piCO/G9WOrqhozs1aIJeDJMCX2Hc5YW/E4=;
 b=KGnOGgayOGl4esEZ2rO1EbqMxmT9Arm5xngdpC/3HpB3MtU4v4y9zjf5tS1P9Kai1F
 YlZT8LZEqBDVT947Hsl6ouga4BZjeWL/BHKyGVbCZEUWjBhIQNz7y8Yiq41sq3MBcLtM
 cIn/ZDe9cOckyRiwn8P5OfklGipD6WoiuvateFcrP0bChv8CpIWVXLMPSjlPl1NekU/Q
 kpk/47v/MPpjqsJbOEQkylGLdaykd7xaFM4tm8kq4FNtFTkQJT3q4jBAMT3bgZN0nftd
 mEUGaN43XiuBeWd6cOEx22xFYvrKIwu4p0AYW01DiTnVFbJchf/pMPncjbX3BHTuPB92
 hRKw==
X-Gm-Message-State: AOAM532ZpQfYorZqFbNOTALJBFl51Ic7GBNP59hpcXhDr5ix1JXyBtwp
 67H8Wa7dWSGHEahKGZ2yf9Q=
X-Google-Smtp-Source: ABdhPJzJBCLgIXVpW2ER0o2F54q3owOxB0C/KPwuwCJi9K//QZFSw+IEmYjjLP1k4kYswRx5CQH2kw==
X-Received: by 2002:adf:d08b:: with SMTP id y11mr4616297wrh.384.1642091519264; 
 Thu, 13 Jan 2022 08:31:59 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id y17sm2880846wrr.84.2022.01.13.08.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 08:31:58 -0800 (PST)
Message-ID: <18f7a647-6153-6d38-dff1-727b9592b01e@gmail.com>
Date: Thu, 13 Jan 2022 17:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 2/3] dt-bindings: pinctrl: mt8195: Add
 mediatek,drive-strength-adv property
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Matlack <dmatlack@google.com>, Jing Zhang <jingzhangos@google.com>,
 Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com
References: <20220112114724.1953-1-tinghan.shen@mediatek.com>
 <20220112114724.1953-3-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220112114724.1953-3-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_083201_342520_4C519258 
X-CRM114-Status: GOOD (  18.89  )
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

[dopping Maciej, Paolo and Sean Christopherson]

On 12/01/2022 12:47, Tinghan Shen wrote:
> Extend driving support for I2C pins on SoC mt8195.
> This property is already documented in mediatek,mt8183-pinctrl.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Looks good to me. Linus please let me know when you are queuing this patch and 
I'll take the rest of the series. Another option is, that you provide an 
Acked-by and I can take the whole set through my branch.

Regards,
Matthias

> ---
>   .../bindings/pinctrl/pinctrl-mt8195.yaml      | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> index 328ea59c5466..4db4899af6b1 100644
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
>               description: |
>                 For pull down type is normal, it don't need add RSEL & R1R0 define
> @@ -268,4 +294,13 @@ examples:
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
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
