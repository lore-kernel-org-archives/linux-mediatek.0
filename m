Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A77CC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 07:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frPzA9xTLGKz92/1qTzuW4BZr6aA4/SEQGAGAcHMDq0=; b=WJAhqirS6pVgP7mxTsiWCIlbZw
	oS/yz8gMTOLaNancAMRRfh0jVWZBFnWB0+Om/F+/4bWXD549m7fCPXlim/YGO22iB4zWyrlsapJNW
	A/BanCj6h7xNKWD8VIS3F5HNKpUkDPS2JYlLdCeNMSnN2HnXZgcca8dheJmsSFt9GRU8yR88FuZwh
	KK8iluXMFEqRkV80myGPgPGWar4PG+76gV4U78pDU9ZdjSou53yE09FpvS8gCd6VEnlCktpvIVqnR
	Vv0Zopka4T5a0yDh10FHxYEV1uHrcUWnweqCWSrMQm25q+8tUSf6VeQSp0okGq3BkylzqAYDrBLME
	gfduq/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE2kf-002Je3-1c;
	Fri, 15 Dec 2023 07:36:53 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE2kc-002Jch-2P
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Dec 2023 07:36:52 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-551e6b99490so341946a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Dec 2023 23:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702625807; x=1703230607; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=frPzA9xTLGKz92/1qTzuW4BZr6aA4/SEQGAGAcHMDq0=;
        b=SJToC5dDbC7k2Ia1sVktk4SqBoXPwVcfpOGh2gy6yIXkEZB0l9LBAdrNEnsuc5pvTg
         yRgd/Nvf3IbYqOcszwBZeSWFifQ+uSJPoF4OVKmjBVNRS7ChmbhkXKrKssxg1U4Nd4Hg
         TB92FER2+MTbW9DE5O7mN01j9aWZilozq6BJcAIdIEn8mX5a5ONzMc9eFVQZs6cKs8w4
         6ZfcNAAEOWe6MnnRQfs9GgCLe8DzjCV8NCAj6r9QiaE9gv9d/CYdVgE4WAQewqhfCQuj
         yQcA1tv7AG1RKND0LYcLUr4dYbySD1I0eR1H8odAID7IKO7AiWIVfTo0HeWK2o7WUmGk
         XSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702625807; x=1703230607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frPzA9xTLGKz92/1qTzuW4BZr6aA4/SEQGAGAcHMDq0=;
        b=ibghv152UY7qg+XGQ7iicU9RHWx0kuNAg+BgqQLqr0jJU6VABD6wilXSwXd9fdPH+7
         YBuGRuD/JHgQ1wmYaXY7IqdD7U0wMIzIR1VBGSPNTJAlneM7woRHxwricQs8HZwFISrc
         2px36o6AMO6Mye+yInUMdFxdAvsAlvVY9ubO+ggHHdwu61ohSiknsNKjV40BX9sJVbuX
         pofXg16s+RrISw4Cd13gDuj+jMEj5VGQqsAwtnc8Pcun3mTbiM5C53PslC9RQgsRtXPH
         qRG5a5ViHErR64BSZw70l0VHUbfFUPlCIdSMCWliER/XaDOYWN2XXnj6UbShGpzmo0Rw
         dBTA==
X-Gm-Message-State: AOJu0Yye1sPwnkr9FSrj9vl9GsndX6M4H/ejr/LQ1auj+TY3wHJ6CiHq
	PzLC81jl1H6FYWZNgrWnohAuCw==
X-Google-Smtp-Source: AGHT+IFLu3IzW1GdoPuPzsqFBHKs+amYl6Tq/sMls8BhuNAw7AcNrl2M6sFfog+h0EvGqQIUKi0+Og==
X-Received: by 2002:a50:bb69:0:b0:54c:4fec:ce with SMTP id y96-20020a50bb69000000b0054c4fec00cemr3275311ede.93.1702625807016;
        Thu, 14 Dec 2023 23:36:47 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id et14-20020a056402378e00b005527cfaa2dfsm1217270edb.49.2023.12.14.23.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 23:36:46 -0800 (PST)
Message-ID: <d50abf1a-1ee7-4f84-9f53-69dfe9aad103@linaro.org>
Date: Fri, 15 Dec 2023 08:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: mtk-xhci: add a property for
 Gen1 isoc-in transfer issue
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Macpaul Lin <macpaul.lin@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>
References: <20231215073431.8512-1-chunfeng.yun@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231215073431.8512-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_233650_783232_C5D3CE4F 
X-CRM114-Status: GOOD (  16.96  )
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

On 15/12/2023 08:34, Chunfeng Yun wrote:
> For Gen1 isoc-in endpoint on controller before about SSUSB IPM v1.6.0, it
> still send out unexpected ACK after receiving a short packet in burst
> transfer, this will cause an exception on connected device, specially for
> a 4k camera.
> Add a quirk property "rx-fifo-depth" to work around this hardware issue,
> prefer to use 2;
> The side-effect is that may cause performance drop about 10%, including
> bulk transfer.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: change 'mediatek,rxfifo-depth' to 'rx-fifo-depth'
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index e9644e333d78..e44a71acb5c0 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -124,6 +124,18 @@ properties:
>        defined in the xHCI spec on MTK's controller.
>      default: 5000
>  
> +  rx-fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      It is a quirk used to work around Gen1 isoc-in endpoint transfer issue
> +      that still send out unexpected ACK after device finish the burst transfer
> +      with a short packet and cause an exception, specially on a 4K camera
> +      device, it happens on controller before about IPM v1.6.0; the side-effect
> +      is that may cause performance drop about 10%, include bulk transfer,
> +      prefer to use 2 here.

What is the meaning of 0-3? bytes? words?

> +    minimum: 0
> +    maximum: 3


Best regards,
Krzysztof


