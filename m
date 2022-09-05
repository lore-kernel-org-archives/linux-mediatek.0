Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C417ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 18:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gAThCdrASz4i29I8aFP1pjqTtXlCGbHPk559uSsFRM=; b=FBYQnROhAOJKeKiNB3z7dAcRVg
	migSl3PA68Fbf4bXBAihPX1zQnNei/dP8iYeKHI0Tf9OFFbgM4vsLlvVa196y3EwpCo6mkRr9I76M
	7zvM+KHVNGhocYCCkv+dTcWXIrQO0h3WbKO48XTKBxdZLRe4cMqrNa4sc71xP6gxPRgk2XKBU+l9C
	0IydlfuDtTaeiwCVFpLgTzgRynm/qMijzyt8zPPop9TA5xqURVZLy4pKFr8sXbeQRUck9CiT2JSOT
	bllQQclS1M6urFzpxWhfpbO3VTWrVarWgaD0zs169PZE3oxfGkjMpL38pkxhh96EyFuBfr2ayMk9U
	iFj9VHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGcp-008EY0-4Y; Mon, 05 Sep 2022 18:15:11 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVBeS-002cjK-Uz; Mon, 05 Sep 2022 12:56:46 +0000
Received: by mail-ed1-x52b.google.com with SMTP id q21so3606521edc.9;
        Mon, 05 Sep 2022 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0gAThCdrASz4i29I8aFP1pjqTtXlCGbHPk559uSsFRM=;
        b=CiK72N0wBCG658QIKiEwIGfl85vMH9/yIlnXeWYA+FAdOycP2NbxES2Ukgh1m/NEZ/
         Y3yAIyYvuD8CmBREErPwXBCXjUSvaYx+TY/6n0yYb4LmSS0UkCS/y1LgMqmkTbfg/AK6
         eR9AClrdsu+GX/u65+a7h8Ibd/V3WM327RKa5jSXWkNj9axn7JIe9Yop6PdQPlrafmif
         nD9zZOJb1K9j1xVEC9FQ6/CLop4m7KP+Q4ITj3Cap93f2M6rvpl2pnp+RIsKGU8PqI52
         ewPuvC++pY5V01Py870ABd/oQhyHCgWP53WUkdh22XcZn4X1Uaoh3JrHiRp9MRXAzSdD
         pjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0gAThCdrASz4i29I8aFP1pjqTtXlCGbHPk559uSsFRM=;
        b=F3uDwfGLl9Kc/bAeHM5T3q2FMK/uDcr/0S0nDkhvoVBeHvSTREOrJxoxzxkFNswvLO
         7lis/fsiGqHDlC8bycHciNJ4GUTKqagL34GdmprYmtp+dYgvODLIl1oMwt6h7gWm/Zoo
         vNTqPd1jxoECmd5aduFsY68W0pUyq9d9Yqx0oBI/rjHB+HtI7MhJVL+eyzSq7SdM2/RV
         BBgJv36w4flW1EokTZWEFRRcPLbM+UDd5izpCzBGp/tQ3TgRUP0TctnSPXrogTx9llkx
         F+8TCAxCbvlJc+VtTsZSZetddFj6tlTRM6wAktUCFV34elb/By0BaHAWYkuf44m7G1fy
         1m2g==
X-Gm-Message-State: ACgBeo2JgAgWyQOp11Ieqaxwc9cMpK7JrX75eCVsbu8IEi0dXuEedUwQ
	TekKyYp29MR1HA81Q/KXH30=
X-Google-Smtp-Source: AA6agR7tHQz8yCPykbig7EMDbh8yZ3Z9bpq/JAYy6xdettSljo2LZv2RuRhZyy77J133ZIugYLeqZQ==
X-Received: by 2002:aa7:c74c:0:b0:44e:a7b9:d5c9 with SMTP id c12-20020aa7c74c000000b0044ea7b9d5c9mr1764250eds.19.1662382588386;
        Mon, 05 Sep 2022 05:56:28 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s5-20020aa7cb05000000b0044e9e5ce396sm1109481edt.95.2022.09.05.05.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 05:56:27 -0700 (PDT)
Message-ID: <d314d734-eb9e-1767-6186-b12460eea604@gmail.com>
Date: Mon, 5 Sep 2022 14:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] dt-bindings: pinctrl: update bindings for MT7986 SoC
Content-Language: en-US
To: Peter Chiu <chui-hao.chiu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ryder Lee <ryder.Lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
References: <20220902024719.31943-1-chui-hao.chiu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220902024719.31943-1-chui-hao.chiu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_055644_246208_B86D9292 
X-CRM114-Status: GOOD (  16.11  )
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



On 02/09/2022 04:47, Peter Chiu wrote:
> Add wifi pins in the description and set groups to string-array to support
> multiple groups in a node.
> 
> Reviewed-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 48 +++++++++++--------
>   1 file changed, 28 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> index 4eadea55df10..b08a0a8076e0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> @@ -117,6 +117,10 @@ patternProperties:
>             "i2s"             "audio"     62, 63, 64, 65
>             "switch_int"      "eth"       66
>             "mdc_mdio"        "eth"       67
> +          "wf_2g"           "wifi"      74, 75, 76, 77, 78, 79, 80, 81, 82, 83
> +          "wf_5g"           "wifi"      91, 92, 93, 94, 95, 96, 97, 98, 99, 100
> +          "wf_dbdc"         "wifi"      74, 75, 76, 77, 78, 79, 80, 81, 82, 83,
> +                                        84, 85
>   
>           $ref: "/schemas/pinctrl/pinmux-node.yaml"
>           properties:
> @@ -234,7 +238,9 @@ patternProperties:
>               then:
>                 properties:
>                   groups:
> -                  enum: [wf_2g, wf_5g, wf_dbdc]
> +                  $ref: /schemas/types.yaml#/definitions/string-array
> +                  items:
> +                    enum: [wf_2g, wf_5g, wf_dbdc]
>         '.*conf.*':
>           type: object
>           additionalProperties: false
> @@ -248,25 +254,27 @@ patternProperties:
>                 An array of strings. Each string contains the name of a pin.
>                 There is no PIN 41 to PIN 65 above on mt7686b, you can only use
>                 those pins on mt7986a.
> -            enum: [SYS_WATCHDOG, WF2G_LED, WF5G_LED, I2C_SCL, I2C_SDA, GPIO_0,
> -                   GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5, GPIO_6, GPIO_7,
> -                   GPIO_8, GPIO_9, GPIO_10, GPIO_11, GPIO_12, GPIO_13, GPIO_14,
> -                   GPIO_15, PWM0, PWM1, SPI0_CLK, SPI0_MOSI, SPI0_MISO, SPI0_CS,
> -                   SPI0_HOLD, SPI0_WP, SPI1_CLK, SPI1_MOSI, SPI1_MISO, SPI1_CS,
> -                   SPI2_CLK, SPI2_MOSI, SPI2_MISO, SPI2_CS, SPI2_HOLD, SPI2_WP,
> -                   UART0_RXD, UART0_TXD, PCIE_PERESET_N, UART1_RXD, UART1_TXD,
> -                   UART1_CTS, UART1_RTS, UART2_RXD, UART2_TXD, UART2_CTS,
> -                   UART2_RTS, EMMC_DATA_0, EMMC_DATA_1, EMMC_DATA_2,
> -                   EMMC_DATA_3, EMMC_DATA_4, EMMC_DATA_5, EMMC_DATA_6,
> -                   EMMC_DATA_7, EMMC_CMD, EMMC_CK, EMMC_DSL, EMMC_RSTB, PCM_DTX,
> -                   PCM_DRX, PCM_CLK, PCM_FS, MT7531_INT, SMI_MDC, SMI_MDIO,
> -                   WF0_DIG_RESETB, WF0_CBA_RESETB, WF0_XO_REQ, WF0_TOP_CLK,
> -                   WF0_TOP_DATA, WF0_HB1, WF0_HB2, WF0_HB3, WF0_HB4, WF0_HB0,
> -                   WF0_HB0_B, WF0_HB5, WF0_HB6, WF0_HB7, WF0_HB8, WF0_HB9,
> -                   WF0_HB10, WF1_DIG_RESETB, WF1_CBA_RESETB, WF1_XO_REQ,
> -                   WF1_TOP_CLK, WF1_TOP_DATA, WF1_HB1, WF1_HB2, WF1_HB3,
> -                   WF1_HB4, WF1_HB0, WF1_HB0_B, WF1_HB5, WF1_HB6, WF1_HB7,
> -                   WF1_HB8]
> +            $ref: /schemas/types.yaml#/definitions/string-array
> +            items:
> +              enum: [SYS_WATCHDOG, WF2G_LED, WF5G_LED, I2C_SCL, I2C_SDA, GPIO_0,
> +                     GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5, GPIO_6, GPIO_7,
> +                     GPIO_8, GPIO_9, GPIO_10, GPIO_11, GPIO_12, GPIO_13, GPIO_14,
> +                     GPIO_15, PWM0, PWM1, SPI0_CLK, SPI0_MOSI, SPI0_MISO, SPI0_CS,
> +                     SPI0_HOLD, SPI0_WP, SPI1_CLK, SPI1_MOSI, SPI1_MISO, SPI1_CS,
> +                     SPI2_CLK, SPI2_MOSI, SPI2_MISO, SPI2_CS, SPI2_HOLD, SPI2_WP,
> +                     UART0_RXD, UART0_TXD, PCIE_PERESET_N, UART1_RXD, UART1_TXD,
> +                     UART1_CTS, UART1_RTS, UART2_RXD, UART2_TXD, UART2_CTS,
> +                     UART2_RTS, EMMC_DATA_0, EMMC_DATA_1, EMMC_DATA_2,
> +                     EMMC_DATA_3, EMMC_DATA_4, EMMC_DATA_5, EMMC_DATA_6,
> +                     EMMC_DATA_7, EMMC_CMD, EMMC_CK, EMMC_DSL, EMMC_RSTB, PCM_DTX,
> +                     PCM_DRX, PCM_CLK, PCM_FS, MT7531_INT, SMI_MDC, SMI_MDIO,
> +                     WF0_DIG_RESETB, WF0_CBA_RESETB, WF0_XO_REQ, WF0_TOP_CLK,
> +                     WF0_TOP_DATA, WF0_HB1, WF0_HB2, WF0_HB3, WF0_HB4, WF0_HB0,
> +                     WF0_HB0_B, WF0_HB5, WF0_HB6, WF0_HB7, WF0_HB8, WF0_HB9,
> +                     WF0_HB10, WF1_DIG_RESETB, WF1_CBA_RESETB, WF1_XO_REQ,
> +                     WF1_TOP_CLK, WF1_TOP_DATA, WF1_HB1, WF1_HB2, WF1_HB3,
> +                     WF1_HB4, WF1_HB0, WF1_HB0_B, WF1_HB5, WF1_HB6, WF1_HB7,
> +                     WF1_HB8]
>   
>             bias-disable: true
>   

