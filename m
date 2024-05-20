Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E769C25B78
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 07:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiyrjpf20boahfYODaVgUoaaasy74zM8DfkCEcceeFU=; b=G0EmImo4zw98+NskbydBrDTuoC
	RZTSDs6/fVqVi6j9wt10XDVWpGqPG8x6U1euG/VXJMZqjTCf7pcjwMSAOz5FM4eKvWQi4C+E9TPz0
	mruhMUteGNTeuINvqrNjmrYeXqcKUza/+3mSV69VmcsLg8n1imv7mCz69mxmh1Ih9NRNN1Nt7p/Jd
	Fa2zlKFrEjhyVjNI5zripm0p54eRu6djbpOMojwJ6EonAYf0cNas2AVAUAMJh0RZPkQWDghBtyFDW
	/Ci6U5jP774H7qHMCFF4AtCS3ou7Ez5lqzhCyCigJqLPfSSb+zp1X7h81t1Mf/VnOJoptTAqnv0Rm
	Ks/Cxheg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8x8z-0000000DjBT-2Qqz;
	Mon, 20 May 2024 07:09:13 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8x8w-0000000DjAr-0Fpy
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 07:09:12 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52388d9ca98so4776429e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 00:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716188947; x=1716793747; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kiyrjpf20boahfYODaVgUoaaasy74zM8DfkCEcceeFU=;
        b=fwFfBzaHSsiY3mJ3G5cjsWFz2m7rGEUmY1kNO66m2xt+inoscOGe1BSyPgPhO+3T5w
         RRUITCiwchVyT2n5KabgtfTV8cIQ8H6vSDHklrXUdM4ZXw0NEStYZMoaPZhsFcRoMdl+
         Kdvov8PD4iVYSc09IQDfPq3ir1HmAq/x1yuCQpsIIrm8amJ6LcrD5jY9KB0RfixFdHy5
         tWTORLY57z3vG4WbY/DVF0zf0SH02oDSuh6SUZc8nqlGg+T5thcsg9c5DZMRmA3oFB/k
         aWga2JJR1zJ6zagzctmlSaonBXvildpy+NgpF27qus557SJHNS+TCfXxy+bfdSMHZFr5
         EL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716188947; x=1716793747;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiyrjpf20boahfYODaVgUoaaasy74zM8DfkCEcceeFU=;
        b=u2AsHqj/7yhtK1exfKTvYmzPvQhmAvprdnJA12I+basGpSvct5Qsms7Vh5Gxomci04
         nbxOT6tw+htkNaKPiLRiTLt87wNRbKQStl7V7tCnYo2kai9q4ftXi5p4MeW/AWwYXe5n
         IhhbuOH4Vk8ILjQDonIWDppibvsDOj5Gjax/MWe1So8P5OqRWNi9gS6I9x4W0KE7v9xe
         RuR3jQ+Vclmy2bFuSxUN1rv6LbSYtBxMstkb6hXrlTkIKVZR2DVIVekcu0Q1jYfQUEm2
         i8/tm0kzzJiZ5Xww8zWx3JMYOzCDr41mbCBNguPU35x5U+/6ZQMlmDPIZrsEwFLZhk/Q
         by7w==
X-Forwarded-Encrypted: i=1; AJvYcCU8v7ieJI7LbbYbr0MbxZymFd6W5PqWcoXc6ejsv0+cPIaJYtdUliM7bWxvgx3d+lq27HfZbwgvpbEyHsrFstOw/ySYPbcoWUJk/4/g/3FQWraT
X-Gm-Message-State: AOJu0YycctaXkw+wul5os0llwJcFfQuBVIKvLCyHT/tHIl73f5xnXEVc
	EeH04QYehSZfH5QAhM+5H1pLU4PfQ9BRTRP5IqYYSLZRX3vfTpkYFWzql6fNyGs=
X-Google-Smtp-Source: AGHT+IG9x+WQxBXG1YbU6a8p0uWmG6wF2P3iHkbOXX4aiVI1y2Kcd8p8Av8hc4p+8nJRchqXusKteg==
X-Received: by 2002:a05:6512:4003:b0:522:221:d19d with SMTP id 2adb3069b0e04-5220fd7bfccmr26640844e87.15.1716188946600;
        Mon, 20 May 2024 00:09:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d6bfsm1419329466b.31.2024.05.20.00.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 00:09:06 -0700 (PDT)
Message-ID: <c05f91f5-a878-4f36-b325-0ac8e038a7e5@linaro.org>
Date: Mon, 20 May 2024 09:09:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: mt6358: Convert to dtschema
To: Kartik Agarwala <agarwala.kartik@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240518081621.63386-1-agarwala.kartik@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240518081621.63386-1-agarwala.kartik@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_000910_144729_58F3C8A4 
X-CRM114-Status: GOOD (  17.20  )
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

On 18/05/2024 10:16, Kartik Agarwala wrote:
> Convert Mediatek MT6358 Audio Codec bindings from text to dtschema.
> 
> Signed-off-by: Kartik Agarwala <agarwala.kartik@gmail.com>
> ---
>  .../bindings/sound/mediatek,mt6358.yaml       | 47 +++++++++++++++++++
>  .../devicetree/bindings/sound/mt6358.txt      | 26 ----------
>  2 files changed, 47 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt6358.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
> new file mode 100644
> index 000000000..f57ef2aa5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt6358.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6358 Audio Codec
> +
> +maintainers:
> +  - Kartik Agarwala <agarwala.kartik@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
> +  For more detail, please visit Mediatek PMIC wrapper documentation.
> +  Must be a child node of PMIC wrapper.

Did you update the PMIC wrapper binding with ref to this?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6358-sound
> +      - mediatek,mt6366-sound

You did not test the DTS.

I think I raised the issue already: please make necessary fixes to the
binding (with explanation) or to the DTS, when converting the binding.

> +
> +  Avdd-supply:
> +    description: power source of AVDD
> +
> +  mediatek,dmic-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Indicates how many data pins are used to transmit two channels of PDM
> +      signal. 0 means two wires, 1 means one wire. Default value is 0.
> +    enum:
> +      - 0 # one wire
> +      - 1 # two wires
> +
> +required:
> +  - compatible
> +  - Avdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mt6358_snd {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Definitely no underscores. Probably this is "codec" or "audio-codec".

Best regards,
Krzysztof


