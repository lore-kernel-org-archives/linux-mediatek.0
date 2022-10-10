Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFB1C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 11:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KLFalUAyDYRRAuo2RZEo0CIB7dAfq1L+VrdHdQSF6M=; b=aCAfpznVhQHNiUnjmkl0SYsxUj
	//DFwI0oO+AX8MpUiOTLILU8cEoig+7flgBjm98oeZ9fgiSLbx1ji5l0Ver1t1ywv8cQseFTQ/I8P
	y+Heb0zdcsKBG8JW/BIdZeFuOu95+zVM3j05G64Q1pMn0Lr5NnbPmY1S6IQ2b/ekAB05wsueFn7bN
	IuDuUUSgD1mHS/YQEnFTXr9kqOsa8d2IKsaHw0RfSh1GdEvFKaLuXC8Q5FqC0jecWcTY5t8cIzM6o
	qhz8ZqZi3pz3i6iFNfdYGg4FFgFnIVHdRPDb5TLAucWIBX04SYAXv4quNhOShgNQ6wZ1T53mrtdjs
	cGUvpkMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohqwl-000b4p-Ah; Mon, 10 Oct 2022 11:27:47 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohqwg-000b1g-WF
	for linux-mediatek@lists.infradead.org; Mon, 10 Oct 2022 11:27:44 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id mx8so6927443qvb.8
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Oct 2022 04:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6KLFalUAyDYRRAuo2RZEo0CIB7dAfq1L+VrdHdQSF6M=;
        b=ZJ9JbKxFDyiBd5daTqxJj86MOdeWinWUnr80mi1bPPACzfNeK9IvC/g6gqx/LXA9TJ
         MPWcdYUyUamm4i3pL63JnHFDjFRnK+nRIcJU523efyNUnGOublJ+QAOpvO9tGknp0y68
         1O4CsyiJ4oTUucISC5Yu3lmbM9wQrEpCsU2bg/+HgKrO/9ilAC1cNBFi8/zcd3erdzPt
         qnCV9ZClNByB4GjT5MyOyJaTTsGK6w10otN49B8UOqhZmi+d0Xv+2x3KUFXboPEcgntn
         lboXJDeOkj+0bI29uA7ufSEJHQeYVIRk6JxQIfRAqOO6NxJ7xdqFe+fcxVvNlpyk+qpB
         jMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6KLFalUAyDYRRAuo2RZEo0CIB7dAfq1L+VrdHdQSF6M=;
        b=ubaXToDVYHjYULS6KkPaEXjZChSYtnn+b0EyYHRqNBD+RjYHCrIi6o+qRTX3iY5Z0O
         XSyBpTqqX0bRK/08Nr2mcH5J4Y+5mYCVtKValOG6DwrS4osXNds79IIRTxPU9Minr3Fv
         ew9WLdu47212lHJuxWbebvP651NI1/rjt1W7z7qBd25a7O64IU3gzOv+Vew7TywB7XYW
         cJmJZLXmhyOOpKFag0NeVDdTpKJIIwVCOaDPJ5x1aPzaQEbgZ2JYJjMYof8HqNFVR/+y
         e+xd1SIQ/zTgCRZ0R3XzNPryYg3Dc34HQv5/GJbKM+p5Z8XzlnPQBHH5St8BvETEMsNr
         y9fQ==
X-Gm-Message-State: ACrzQf08pNCf1NXOYSmE328btEEfw8dvcOtMZ4J/vUSqOojMwlxPPubn
	JZ3uc45hUvdEh2EKHcDzb5cFGg==
X-Google-Smtp-Source: AMsMyM4mKTBEEm7Io1Pjk/bSULDpUWutUdTQql6wf7Yl68LM838llzxU2f41GEwsTa6+bZ1fOSHG9g==
X-Received: by 2002:a05:6214:5cc5:b0:4b3:dd79:cc7e with SMTP id lk5-20020a0562145cc500b004b3dd79cc7emr8205111qvb.76.1665401261100;
        Mon, 10 Oct 2022 04:27:41 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id t28-20020a37ea1c000000b006cdd0939ffbsm9977560qkj.86.2022.10.10.04.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:27:40 -0700 (PDT)
Message-ID: <bf471795-8821-6206-408e-4460c59fff5b@linaro.org>
Date: Mon, 10 Oct 2022 07:25:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 09/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6735 pin controller
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
 <20221007125904.55371-10-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007125904.55371-10-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_042743_114703_11FB90F7 
X-CRM114-Status: GOOD (  17.17  )
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

On 07/10/2022 08:59, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add bindings for the pin controller found on MediaTek MT6735 and
> MT6735M SoCs, including describing a method to manually specify
> a pin and function in the pinmux property making defining bindings
> for each pin/function combination unnecessary. The pin controllers
> on those SoCs are generally identical, with the only difference
> being the lack of MSDC2 pins (198-203) on MT6735M.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 46 ++++++++++++++++++-
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index 71a9aae2cc8c..7b120803a1a5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -10,6 +10,7 @@ maintainers:
>    - Andy Teng <andy.teng@mediatek.com>
>    - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>    - Sean Wang <sean.wang@kernel.org>
> +  - Yassine Oudjana <y.oudjana@protonmail.com>
>  
>  description:
>    The MediaTek pin controller on MT6779 is used to control pin
> @@ -18,6 +19,8 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - mediatek,mt6735-pinctrl
> +      - mediatek,mt6735m-pinctrl
>        - mediatek,mt6765-pinctrl
>        - mediatek,mt6779-pinctrl
>        - mediatek,mt6795-pinctrl
> @@ -63,6 +66,33 @@ required:
>  
>  allOf:
>    - $ref: "pinctrl.yaml#"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt6735-pinctrl
> +              - mediatek,mt6735m-pinctrl
> +    then:
> +      properties:
> +        reg:
> +          minItems: 8
> +          maxItems: 8
> +
> +        reg-names:
> +          items:
> +            - const: gpio
> +            - const: iocfg0
> +            - const: iocfg1
> +            - const: iocfg2
> +            - const: iocfg3
> +            - const: iocfg4
> +            - const: iocfg5
> +            - const: eint
> +
> +        interrupts:
> +          items:
> +            - description: EINT interrupt

Blank line

Best regards,
Krzysztof


