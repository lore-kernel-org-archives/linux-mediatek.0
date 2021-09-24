Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D846CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 01:01:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EF5161214
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 01:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EF5161214
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hCnfUhn904lcS+wQ7Q7z2MporWWmQnHEHpgmFvr0GE=; b=t2VM7IKdWMAvPE
	uTxGZKr0Y4hNGx7gQ2hac7x8YRPOfLBjHknTWMQbcAy0XtbEIoF2/hzK7tUi6rAJ1wBVqffVdWsbE
	K/vDtETnSF4GdAI3uu0oRTE6IMk1BYQArYuNiFJKL/ClE805ER/GwDYf4848XN8lU8u5t3HwP7FDE
	2VtcfVVSDFDnuoA3zJ5sQ/BLB0F6AZyycySOJUMq8ANYynHyume7HzdWbiel9vgOQrInc3L1B1COb
	MPeIZl3RKlvFWI2pNSd38cN3tugfDrTbd9iMIhXfadWjsDeaSOj56sACJyTZ6CTK7QJD7kz8hA4f6
	YBNPRfwnk0FbZAlvavKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTZZv-00Cn95-Tp; Fri, 24 Sep 2021 01:00:39 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTZZh-00Cn7s-Tl; Fri, 24 Sep 2021 01:00:28 +0000
Received: by mail-oi1-f176.google.com with SMTP id e24so2361331oig.11;
 Thu, 23 Sep 2021 18:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GasIhLti856Ga5HeR4f+cGNysCxF+XCkHYY1M/ZuBiw=;
 b=qc/j5vnXbCSKd5kc3Eb/yUoEq+IO7A8KYso7OcInYPh2zBvjO8h8j7TCu05U55iDvC
 A8lCoidhzw2Qd3rmZoRQQSFuPBtDujY43hNLWfNO8PQkBE0lAvyprgyz5jaxVOJhqUkC
 fdkQh0BLALugiAKmQ63U75wZ8QWbTpy4jbjL++V98UrAh0vwOQq1lR9GOf3W+GY1qcF4
 v+6l/Sji1YjlFB2AsPE3LaSORii3mS6dvUIu2hJl/8NlQhNi+oha42zrUtLOESuQLtvs
 PyeRhe3Sl1Fzp4bj9snAFSH6R67r11UlEnXCkh/kApC/Nr4XqMfdSbCGI4HG6ruC4adc
 +6Iw==
X-Gm-Message-State: AOAM531ZLYkn0xC6t0jOT4PUicbCrDPe9zGoUskPkk4kjOFLAohMPQnr
 HfI0xPb5aAwMYKi2p0UDTQ==
X-Google-Smtp-Source: ABdhPJy3EwyotTQdzk+VORpqXwWszcJ9ggeJI7ThwmlybV4Y5HuNAm/UZzWsGRrWkehKfWCCmXAX7w==
X-Received: by 2002:a05:6808:ec8:: with SMTP id
 q8mr7842887oiv.94.1632445224741; 
 Thu, 23 Sep 2021 18:00:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a23sm1676644otp.44.2021.09.23.18.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 18:00:24 -0700 (PDT)
Received: (nullmailer pid 3848448 invoked by uid 1000);
 Fri, 24 Sep 2021 01:00:23 -0000
Date: Thu, 23 Sep 2021 20:00:23 -0500
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
 sean.wang@kernel.org, srv_heupstream@mediatek.com, hui.liu@mediatek.com,
 light.hsieh@mediatek.com, biao.huang@mediatek.com, hongzhou.yang@mediatek.com,
 sean.wang@mediatek.com, seiya.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v13 2/5] dt-bindings: pinctrl: mt8195: change pull
 up/down description
Message-ID: <YU0jJxr0OJoqahHr@robh.at.kernel.org>
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
 <20210922025640.11600-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210922025640.11600-3-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_180026_027214_FC268A8D 
X-CRM114-Status: GOOD (  15.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 22, 2021 at 10:56:37AM +0800, Zhiyong Tao wrote:
> For supporting SI units in "bias-pull-down" & "bias-pull-up",
> Change pull up/down description
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 65 ++++++++++++++++++-
>  1 file changed, 63 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> index 2f12ec59eee5..2f2afabbe4fc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> @@ -85,9 +85,70 @@ patternProperties:
>            2/4/6/8/10/12/14/16mA in mt8195.
>          enum: [0, 1, 2, 3, 4, 5, 6, 7]
>  
> -      bias-pull-down: true
> +      bias-pull-down:
> +        description: |
> +          For pull down type is normal, it don't need add RSEL & R1R0 define
> +          and resistance value.
> +          For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> +          define in mt8195.
> +          For pull down type is RSEL, it can add RSEL define & resistance value(ohm)
> +          to set different resistance by identifying property "mediatek,rsel_resistance_in_si_unit".
> +          It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> +          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
> +          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +          define in mt8195. It can also support resistance value(ohm) "75000" & "5000" in mt8195.

Please make a schema:

oneOf:
  - enum: [ 0, 1, ...7 ]
  - description: MT8195...
    enum: [ 5000, 75000 ]

> +          An example of using RSEL define:
> +          pincontroller {
> +            i2c0_pin {
> +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +              bias-pull-down = <MTK_PULL_SET_RSEL_001>;
> +            };
> +          };
> +          An example of using si unit resistance value(ohm):
> +          &pio {
> +            mediatek,rsel_resistance_in_si_unit;
> +          }
> +          pincontroller {
> +            i2c0_pin {
> +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +              bias-pull-down = <75000>;
> +            };
> +          };
>  
> -      bias-pull-up: true
> +      bias-pull-up:
> +        description: |
> +          For pull up type is normal, it don't need add RSEL & R1R0 define
> +          and resistance value.
> +          For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> +          define in mt8195.
> +          For pull up type is RSEL, it can add RSEL define & resistance value(ohm)
> +          to set different resistance by identifying property "mediatek,rsel_resistance_in_si_unit".
> +          It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> +          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
> +          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +          define in mt8195. It can also support resistance value(ohm)
> +          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" & "75000" in mt8195.

Same here.

> +          An example of using RSEL define:
> +          pincontroller {
> +            i2c0_pin {
> +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +              bias-pull-up = <MTK_PULL_SET_RSEL_001>;
> +            };
> +          };
> +          An example of using si unit resistance value(ohm):
> +          &pio {
> +            mediatek,rsel_resistance_in_si_unit;
> +          }
> +          pincontroller {
> +            i2c0_pin {
> +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +              bias-pull-up = <1000>;
> +            };
> +          };
>  
>        bias-disable: true
>  
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
