Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AA1C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 10:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xkCeFRSOl7osvDg152zQFoduvixlLuMF0R3jqBMPtE=; b=QomA4RTySKgPcqrpTN9EyCX+2o
	abri96pQHefAVSBibRvyG/J318FaBvruzHn4cOtHUzXytkOvUNw5/l0UOLvzpDtTc7l5XvE5YTguB
	5yDD9pzvnMef9LL53ObPozBVvlxGPkelbuDlnyqKHNm8jpFk2+r0NmdwtHGagjDYqhf5gmrljDReJ
	YL0oH4CSLYauwgYFlPzdP8fVRaZItY9Er2pUp03yPcTxBMaEKSsdGhuagh9g+aRZ8eP3xpHFEn5Nv
	1jO1gqsElZB66FWp2a95mGOgYL/BndQdXqM/TshGkckfBmaDElb72RVxkiDZGIBf/2kp5k3IRRRjb
	6vDp+eew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH12q-008TeZ-BH; Thu, 28 Jul 2022 10:47:08 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH12g-008TbM-TU
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 10:47:00 +0000
Received: by mail-lf1-x131.google.com with SMTP id m12so2249221lfj.4
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 03:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1xkCeFRSOl7osvDg152zQFoduvixlLuMF0R3jqBMPtE=;
        b=opnSnGfLr5+oJ+3vqZT/hLOk1V8U8yEK0wPTxIM93IkaXqWYk1Ld0S3aN49DFqsrKC
         brCoucMHeboD2rObwXhUTmc0hq6oe1xpJ1YkrSOajMAfXhJqhpkzknHC2A4hIzgtssT2
         XkIqu9rpMR5exL6AXXtdKpUf+ss8912IzWib+X9vG7A4XrFuLReRgkPBErryYVKW6KuL
         7dlCMH2FVPCQGH6rpijwMmqo+DhJ8xZA40ZH9N/QJTr7BNYLWOtDJe11Lk2l7kDgj77L
         NbPDgAfxSvEEggNhCyLFZOKLrtWkfsnv60jalk2c/Bk79YM/hDuu41Lr5tfxjiPFP1Mv
         tlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1xkCeFRSOl7osvDg152zQFoduvixlLuMF0R3jqBMPtE=;
        b=Um8xGWPMWzEyRJwahWODB2p1Pq6bVVC7FXXJBQX2785Dw/jU3lD0PT+TiIRMxMgNmN
         eFIOEC43grT6IkpsdRAtGowTC17QFfH2ILtbnoPUa39oacbd7z3WQwAytHrV9dL4053Z
         zrYdXiqd4/D9YjKrGRkhnvrWiWwcZ/gsnCY/kweywOfWyuhTXDXZ8ph/0j2lHFyF8lfo
         Kt8b+bovKxqQvxWkifCic36IxEg6Yoyjo6lujrwpYVGBUjvia8jxyqBNc6Ga5KCetAqM
         0EY4kQcjvbKHeNcpw49M3k0bhmQd3hACapBTeDGK8c5yq0G7YjPgZtMDMd1hdcew0/Bo
         nciw==
X-Gm-Message-State: AJIora9yIzVSxQsm0rOgRvJlNPD8v9396//gx2NXdx4FqczCevXYFFgB
	YLGMXjKzVHTk9WuhSh4wJxhyOA==
X-Google-Smtp-Source: AGRyM1sIey0VRJ4CLEdBZqZgjh+1viX6/kj9l5GJluthddRwxzsUiTTrYmH22z2/zIS4RpaHW4SqaA==
X-Received: by 2002:a05:6512:318b:b0:48a:ce50:3271 with SMTP id i11-20020a056512318b00b0048ace503271mr180700lfe.182.1659005213778;
        Thu, 28 Jul 2022 03:46:53 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id i20-20020a056512341400b0048a7901903esm141668lfr.144.2022.07.28.03.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 03:46:53 -0700 (PDT)
Message-ID: <03a13ed4-e7cd-6f7d-f8f7-9b1e6193e202@linaro.org>
Date: Thu, 28 Jul 2022 12:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] pmic: add mt6366 regulator document
Content-Language: en-US
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: sen.chu@mediatek.com, hui.liu@mediatek.com, allen-kh.cheng@mediatek.com,
 hsin-hsiung.wang@mediatek.com, sean.wang@mediatek.com,
 macpaul.lin@mediatek.com, wen.su@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 zhiyong tao <zhiyong.tao@mediatk.com>
References: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
 <20220728062749.18701-2-zhiyong.tao@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220728062749.18701-2-zhiyong.tao@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_034658_982950_6BA46C4E 
X-CRM114-Status: GOOD (  15.45  )
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

On 28/07/2022 08:27, Zhiyong Tao wrote:
> From: zhiyong tao <zhiyong.tao@mediatek.com>
> 
> Add mt6366 regulator document

As usual with Mediatek your emails fail to properly pass modern SMTP
checks and you end up in spam.

I reported it months ago to folks in Mediatek. No improvements since
that time.

I stopped checking my spam folder for Mediatek stuff and all will be
ignored. I will also stop complaining about it - just ignore Mediatek.

Fix your systems, instead of putting additional effort on community and
on reviewers.


> 
> Signed-off-by: zhiyong tao <zhiyong.tao@mediatk.com>
> ---
>  .../regulator/mediatek,mt6366-regulator.yaml  | 375 ++++++++++++++++++
>  1 file changed, 375 insertions(+)

Subject does not match subsystem.


>  create mode 100755 Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
> new file mode 100755
> index 000000000000..eb72c64757cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
> @@ -0,0 +1,375 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6366-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6366 Regulator from MediaTek Integrated
> +
> +maintainers:
> +  - Zhiyong Tao <zhiyong.tao@mediatek.com>
> +
> +description: |
> +  List of regulators provided by this controller. It is named
> +  according to its regulator type, buck_<name> and ldo_<name>.
> +  MT6366 regulators node should be sub node of the MT6397 MFD node.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6366-regulator
> +
> +  regulators:
> +    type: object
> +    description: List of regulators and its properties
> +
> +    patternProperties:
> +      "^buck-v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
> +        type: object
> +        $ref: "regulator.yaml#"

No need for quotes.

> +        unevaluatedProperties: false
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$"

Why do you enforce specific regulator-name? Remove.

> +
> +      "^ldo-v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$"
> +
> +      "^ldo-v(xo22|efuse|mch|vcama1|emc|a12|vcama2|mc)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(xo22|efuse|mch|vcama1|emc|a12|vcama2|mc)$"
> +
> +      "^buck-(vcore)-sshub$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +        unevaluatedProperties: false
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vcore-sshub$"
> +
> +      "^ldo-vcn(28|33)-bt$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +        unevaluatedProperties: false
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vcn(28|33)-bt$"
> +
> +      "^ldo-vcn(33)-wifi$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +        unevaluatedProperties: false
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vcn33-wifi$"
> +
> +      "^ldo-vsram-(others)-sshub$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +        unevaluatedProperties: false
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vsram-others-sshub$"
> +
> +      "^ldo-vsram-(proc11|others|gpu|proc12)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +        unevaluatedProperties: false
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vsram-(proc11|others|gpu|proc12)$"
> +
> +      "^ldo-v(aud|bif|io|ldo)28$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(aud|bif|io|ldo)28$"
> +
> +      "^ldo-v(io|aux|rf)18$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(io|aux|rf)18$"
> +
> +      "^ldo-vsim[2]$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vsim2$"
> +
> +        required:
> +          - regulator-name
> +
> +required:
> +  - compatible
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmic {
> +      compatible = "mediatek,mt6366-regulator";
> +
> +      regulators {
> +        mt6366_vdram1_reg: buck-vdram1 {
> +            regulator-name = "vdram1";

Messed up indentation. Use only one, so 4 space for DTS example.



Best regards,
Krzysztof

