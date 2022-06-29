Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62137C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 11:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WzBp18LKZqSKYqbDKk6Oq8ggaqGJZKxa+Z+FGlULYQ=; b=2yWodEt7yC702RAH5aMPgB9FL2
	BlG92mNSoZRZSvYN9aVrTuzu/9zjjOcY/uzzkThXYDanfFgbSlOyIt9iZ4HTObJmyUQzO1FD0FDJb
	dfmU4Rwy6Wej9EGH1MMevkkPPfm9XiROzJu3SkUGZIfuZ9UdFOtxlAQjVJYUB5jM57sPrllZEoBlF
	yQbazE+UB1MLfVtGdGgbkmS+RXf0z7Wx0CCjaE332zGr3WBYTp5eJgvUeiUgrKXNPzTGlSqBR3xER
	g7l7icC+av5BIUkUTzlEogPSH8pZ9QbI1Rdst5GRd7YWKC5jaQSCrbTkWxNIbq9GflPKN5sfMc3Uo
	4MqOTrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VcX-00BIuk-G5; Wed, 29 Jun 2022 11:12:33 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VI2-00B9yH-SV
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 10:51:25 +0000
Received: by mail-ed1-x52a.google.com with SMTP id n8so7650469eda.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jun 2022 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/WzBp18LKZqSKYqbDKk6Oq8ggaqGJZKxa+Z+FGlULYQ=;
        b=rNekH7esQwdFoUrV+OQ7tNQusXFKep9peSzA4lY44/D3O6rRuwDUUFvP/tIozeFl0A
         Rct+yIWR6669oJT/tYSdcSeV4MjAGDkVIDAlK+mk2jreftsN0R64ckDPHR0KQ2ufRZZZ
         86uDev5U3WwyygTqKCZewri/8F413Gs74ZtTo2l8fbSA0IK/+dTgR5a213eN383oaxlQ
         7RGpBQV+8C7cSuXb+3kxDZdH12RMwY+E5fhYr1K5R10AFx7Jx7ol152FUuoJY2QobpgI
         FN2EXpgUH3f9v5XXSZs3fsKMA8u+wkATJswMSg6UsGTZDXWVw5VJJk+QApzzBW4h+P90
         HXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/WzBp18LKZqSKYqbDKk6Oq8ggaqGJZKxa+Z+FGlULYQ=;
        b=EAMWwqHB5qSwml8OXFf/cnqdD2Z3AnSZybRhurt8IaYjiJ80QL9ywBlr8PdESPF24M
         MTPvxlORWjmC4qmKzs+zEfqXsfI0FK3lVLxuWBrXfW6ALhIJvrrv0fT8018Mu91ByPWD
         mXopc6riKUh254Qwha9NA70ZlE7mi4zpnTPGT+gznCw+a1upTikMLSET8AZTMuv824SH
         9aXYKHULO41HftwMH197EpZBDF8DUefg07Tip0vMG6t9TNqn6SUHJ/UjS6hUuyQiywxi
         wFsVuTSukGgRs/+itVXG7yD64Fc3GuTzERIMY4Tyd1YPQS69RsMuGG2feOEFF2aVdzhc
         rB/w==
X-Gm-Message-State: AJIora+2S5rw8hH3H8rElATiJeptmJZv3a56/crQw5ku3WK20oqSha0w
	SWJ/oT+dGm5CeOpf4q0+er9u1w==
X-Google-Smtp-Source: AGRyM1sYVRiFJXQJZQmnqBYLOkLubf7ZwCbfZgC1NFu0yS0OD6FiS0Ak2yA9G+L6OwBGH6pZegK/sw==
X-Received: by 2002:aa7:cd17:0:b0:435:bd7e:2efb with SMTP id b23-20020aa7cd17000000b00435bd7e2efbmr3541102edw.180.1656499880428;
        Wed, 29 Jun 2022 03:51:20 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i13-20020a170906444d00b00722eeb368cesm7582864ejp.64.2022.06.29.03.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 03:51:19 -0700 (PDT)
Message-ID: <fdc4fcfa-2d30-310e-d736-fd317b1cd2da@linaro.org>
Date: Wed, 29 Jun 2022 12:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 4/7] dt-bindings: clock: mediatek: Add clock driver
 bindings for MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
 fparent@baylibre.com, rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220627085632.23797-1-angelogioacchino.delregno@collabora.com>
 <20220627085632.23797-5-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627085632.23797-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_035123_062147_610B7B5E 
X-CRM114-Status: GOOD (  15.43  )
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

On 27/06/2022 10:56, AngeloGioacchino Del Regno wrote:
> Add the bindings for the clock drivers of the MediaTek Helio X10
> MT6795 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/clock/mediatek,mt6795-clock.yaml | 66 +++++++++++++++++++
>  .../clock/mediatek,mt6795-sys-clock.yaml      | 54 +++++++++++++++
>  2 files changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
> new file mode 100644
> index 000000000000..795fb18721c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/mediatek,mt6795-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

No quotes in both places. Especially that once you use " and in other
place here '.

> +
> +title: MediaTek Functional Clock Controller for MT6795
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description: |
> +  The clock architecture in MediaTek like below
> +  PLLs -->
> +          dividers -->
> +                      muxes
> +                           -->
> +                              clock gate
> +
> +  The devices provide clock gate control in different IP blocks.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6795-mfgcfg
> +      - mediatek,mt6795-vdecsys
> +      - mediatek,mt6795-vencsys
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        mfgcfg: clock-controller@13000000 {
> +            compatible = "mediatek,mt6795-mfgcfg";
> +            reg = <0 0x13000000 0 0x1000>;
> +            #clock-cells = <1>;
> +        };
> +
> +        vdecsys: clock-controller@16000000 {
> +            compatible = "mediatek,mt6795-vdecsys";
> +            reg = <0 0x16000000 0 0x1000>;
> +            #clock-cells = <1>;
> +        };
> +
> +        vencsys: clock-controller@18000000 {
> +            compatible = "mediatek,mt6795-vencsys";
> +            reg = <0 0x18000000 0 0x1000>;
> +            #clock-cells = <1>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
> new file mode 100644
> index 000000000000..629e0cc7c916
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

No quotes.


Best regards,
Krzysztof

