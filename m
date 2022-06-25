Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6886C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jun 2022 20:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyZdIB+a3zmI9o7okjV52QU2Tq6j8r50F7h1g1/ZmqM=; b=DViV1/JV92kY4A78SQDKITtlnl
	0Yy38+rGhTXRYLC7MuJzWx9Y2kMSqZDkX4Axa6DRQzcHKmhRjXt/eet9i8E2QkcPydMcct80UxuSF
	l2PfdZTfgaobCHHi9p56VQAFEIAsjD08zb0Z0W/TaGO62Mb28aiI6uJ6docTGWHeLbRs/kklbzfVb
	eBALJo0nUnx2Ux/JZpVohd0u9WophAfHDP+Y4mBI54tmtbAeaGtXpnCjia05rDbPf+gjLQVjq/MDf
	tPWgR+0jRVTQB24inyBz7rhd6ZM7gwdtKNgxdkCGHhsZVeggfn2tQK6BJ+ES1MvBXuCocRp7HjNqn
	9pbeMeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5CPK-007hCm-0o; Sat, 25 Jun 2022 20:29:30 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5CP1-007h3Y-Vr
	for linux-mediatek@lists.infradead.org; Sat, 25 Jun 2022 20:29:14 +0000
Received: by mail-ed1-x533.google.com with SMTP id fd6so7875612edb.5
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Jun 2022 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CyZdIB+a3zmI9o7okjV52QU2Tq6j8r50F7h1g1/ZmqM=;
        b=jh1P9SHTYiAY6bJeR6u5NXLil88CtmmVqCbzHotLRzOL2Uckkj8zWG4OGOELTd5s60
         yyymcNJwXxFkpHnuqFpuqtjPJL7L8GVR6j1Yv+mxzhTqDuUWsXXe4Xq73f9dU6gJsT2M
         9RC5dc6PF4Tfjrg64GyzSY2T3uIe9dS97Ybx6dQbikZ2qEUz2mgkL6UYSL1lZcVn1bVU
         NXpkl29vfd+iHN4xvmv0MnSxr/ln8wSE1K46AKqhsv2Lhu+XDwHNJ6WRqssjIlzBUaAf
         b6wVTAGq38CTBfNUF6dGDhRdnjWD4ebbw0MOTLuHr/bfGtYMKiCegkxvdAipfPMbeESd
         Lm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CyZdIB+a3zmI9o7okjV52QU2Tq6j8r50F7h1g1/ZmqM=;
        b=oseNXOvkj1AQFkwubzIb9Zugd4Dj5BLjbrPylL168BArPnWdH5smFCeAhKbqc9VbOj
         SACVjNcPwiZi/yGkARQp5EIz7KCpugGBrRi8pGncmPkFddz4Y4SW2o6b7nFwd//prQ3V
         /nq86Lfp5kOYlYd2mjy+t4TtXfIdP7zY4eO9hEAp2HOOcMuqynrKBltslGpQ7pmmpHtq
         2FTbrVZdovxVGM2X4OLwPzi1jO3eJoiXyJQgZHcTQukLTFUm4lJuGsXBfoZgeXkRYSBh
         IsYS+YhsuLwx4ZA+T3sKzoDDxdNZEvBA/phTa+y4jHseJy95Tsv8ULnagZaJZFejvs3b
         7JOw==
X-Gm-Message-State: AJIora8k4tVYR6r08ICJc/VMGhvYGMS3iqgLjOqjLf7B1Pfc1rK6rmSJ
	/0CvKQV4hb84O6kEhnD8GI0LnA==
X-Google-Smtp-Source: AGRyM1v6ZQH0/qOeo1s9JIO2lBEu0I3AR8lap3IT4Akxx776t9v/QxwM3w6b6PhwZmfK4m5bsV8r/A==
X-Received: by 2002:a05:6402:e0c:b0:435:25cd:6088 with SMTP id h12-20020a0564020e0c00b0043525cd6088mr6989495edh.60.1656188949672;
        Sat, 25 Jun 2022 13:29:09 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jw14-20020a170906e94e00b007263481a43fsm2644762ejb.81.2022.06.25.13.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 13:29:09 -0700 (PDT)
Message-ID: <cea65d6a-7d9b-7b14-9984-bcd7f115da47@linaro.org>
Date: Sat, 25 Jun 2022 22:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 4/7] dt-bindings: clock: mediatek: Add clock driver
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
References: <20220624093525.243077-1-angelogioacchino.delregno@collabora.com>
 <20220624093525.243077-5-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624093525.243077-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_132912_077103_DED73127 
X-CRM114-Status: GOOD (  17.35  )
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

On 24/06/2022 11:35, AngeloGioacchino Del Regno wrote:
> Add the bindings for the clock drivers of the MediaTek Helio X10
> MT6795 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/clock/mediatek,mt6795-clock.yaml | 66 +++++++++++++++++
>  .../clock/mediatek,mt6795-sys-clock.yaml      | 74 +++++++++++++++++++
>  2 files changed, 140 insertions(+)
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
> index 000000000000..44b96af9ceaf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek System Clock Controller for MT6795
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The Mediatek system clock controller provides various clocks and system configuration

Wrap according to Linux coding convention, so at 80.

> +  like reset and bus protection on MT6795.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt6795-apmixedsys
> +          - mediatek,mt6795-infracfg
> +          - mediatek,mt6795-pericfg
> +          - mediatek,mt6795-topckgen
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
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
> +        topckgen: clock-controller@10000000 {
> +            compatible = "mediatek,mt6795-topckgen", "syscon";
> +            reg = <0 0x10000000 0 0x1000>;
> +            #clock-cells = <1>;
> +        };
> +
> +        infracfg: power-controller@10001000 {
> +            compatible = "mediatek,mt6795-infracfg", "syscon";
> +            reg = <0 0x10001000 0 0x1000>;
> +            #clock-cells = <1>;
> +            #reset-cells = <1>;

No need for four examples of the same. They differ only by compatible,
so this is just unnecessary code... which as you can see does not pass
the checks. This also has to be fixed.

Maybe keep it as clock-controller?


Best regards,
Krzysztof

