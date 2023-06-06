Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B558C7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 09:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBYlIdpTft+IILWfU8QKB41NOLs5b4pNVwgWdOe7tqc=; b=25DerzvFFJRYm8dUckbhyabDhB
	gCrRCWP/PmIp6yxpyvtrFYWo2EX4DJPVTPqOpHRN0OgwpsfmZXTnoYqdyU726IgD31pbo+CfxAZiD
	kiiKWemGkEgkc6P32zTE+HnqoLPRF8c3+QvwYqYwgiHKVvdze572+stYRAYrXnDHmTGhZR9ON9w42
	RGMCFhNjLCqmf6kEbiUnGMUat8Lj3TrqPpOXeK9H3r4aQ1Jv9mkhXrAZwkpHsBWdszNjMjAh5GEw9
	E3nURfJiA3FEgLYrwbdHCEt3gJgNlIj/eerQDWMWy2eAJelLLon0+ZDk0IN7vatGEFbQh4+W1Xkh7
	7dIjs/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Snb-000y3C-2h;
	Tue, 06 Jun 2023 09:16:19 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SnY-000y1s-32
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 09:16:18 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9768fd99c0cso741512766b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686042975; x=1688634975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBYlIdpTft+IILWfU8QKB41NOLs5b4pNVwgWdOe7tqc=;
        b=vncFQqDlNQD4M5UowqZ7dH5lQ9V03vmSMwGeG54OCxGVIfCL8ROEWg+2m0+709wKLt
         5WzqpiXlaMYIFX/QL93ikhZg08bbq3bKsm0NaUBQr61w4+MqTKBj1BADt+v3PC+X+V9Q
         xidNvJRdtIIHT4eEOg9pPWnD2/hX23fZfSiWghBEClSAa5KX31VnDo6U0IkFnMg8/mMQ
         gDfyxMq/BUJuV6WrO3voT7uDVUpFYdqFlyDJvPgrcpxnTJU495rJsoi789X0U822pN21
         eba/ZjepKoQ2alj2V0QLqWdFEaDnZXHcX0fAPoDcmaaZOY/WK71/A6B1QgqmA/OJsD7w
         EDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686042975; x=1688634975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XBYlIdpTft+IILWfU8QKB41NOLs5b4pNVwgWdOe7tqc=;
        b=JP1lcMb4FTN7TrQ9Px2AfQvbRle3JOalj7gYYalL/VVCn8Z1WQVoaPWfLTxGJ7AB8k
         Ffz0aGBOkHJKTn842FrB9rfnoUTZUuy2uktcwCWE7rkW/Wv8BZaGcPQD+/1xo/kB4R+7
         LESxdsva3yGDVUBV430EMn5QDj+qvRQaw3TldTUMT+w5vploleNUhjOsqYGT9Nh+YF+E
         XT/WkJyof6HkV6Lid/5xdBQSqfGTYBpVzhGVbk87924txb5MF2HJhb/y7TWjvrs6u98w
         +oFJUWanakCIVpkWjrUZhC59mOUMO3w4YknbcIq6bnXg3oRSBXBb3xyuXYL4LunQlVt2
         fyzw==
X-Gm-Message-State: AC+VfDzPdfDXPoog0x2RMIJL27j0wxnv5LGY3RqN8b6GHN1LLJbZAon4
	HfRm+CHZ9DAuyvMNdd04/LOOIQ==
X-Google-Smtp-Source: ACHHUZ4PZb7TYXvL7RYHNqfdcJ+lt6xZPJBxKI73CgRYcLmtnpjkmNEq8NjmkFFBYXv2bKypsJ0oAw==
X-Received: by 2002:a17:907:9405:b0:973:93c3:16a1 with SMTP id dk5-20020a170907940500b0097393c316a1mr7380863ejc.19.1686042975479;
        Tue, 06 Jun 2023 02:16:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n7-20020a170906700700b00965d4b2bd4csm5415416ejj.141.2023.06.06.02.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:16:15 -0700 (PDT)
Message-ID: <6d476d6d-7100-7674-2e08-661516b75f43@linaro.org>
Date: Tue, 6 Jun 2023 11:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 3/6] media: dt-bindings: mediatek,vcodec: Remove VDEC_SYS
 for mt8183
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230605162030.274395-1-nfraprado@collabora.com>
 <20230605162030.274395-4-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605162030.274395-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_021616_986181_D134BF42 
X-CRM114-Status: GOOD (  24.58  )
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

On 05/06/2023 18:20, Nícolas F. R. A. Prado wrote:
> The binding expects the first register space to be VDEC_SYS. But on
> mt8183, which uses the stateless decoders, this space is used only for
> controlling clocks and resets, which are better described as separate
> clock-controller and reset-controller nodes.
> 
> In fact, in mt8173's devicetree there are already such separate
> clock-controller nodes, which cause duplicate addresses between the
> vdecsys node and the vcodec node. But for this SoC, since the stateful
> decoder code makes other uses of the VDEC_SYS register space, it's not
> straightforward to remove it.
> 
> In order to avoid the same address conflict to happen on mt8183,
> since the only current use of the VDEC_SYS register space in
> the driver is to read the status of a clock that indicates the hardware
> is active, remove the VDEC_SYS register space from the binding and
> describe an extra clock that will be used to directly check the hardware
> status.
> 
> Also add reg-names to be able to tell that this new register schema is
> used, so the driver can keep backward compatibility.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> 
>  .../media/mediatek,vcodec-decoder.yaml        | 29 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> index 6447e6c86f29..36a53b2484d6 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> @@ -21,17 +21,21 @@ properties:
>        - mediatek,mt8183-vcodec-dec
>  
>    reg:
> +    minItems: 11
>      maxItems: 12
>  
> +  reg-names:
> +    minItems: 11

maxItems

> +
>    interrupts:
>      maxItems: 1
>  
>    clocks:
> -    minItems: 1
> +    minItems: 2

It does not make any sense. Just two patches ago you made it 1! Don't
add incorrect values which are immediately changed in the same patchset.

>      maxItems: 8
>  
>    clock-names:
> -    minItems: 1
> +    minItems: 2
>      maxItems: 8
>  
>    assigned-clocks: true
> @@ -84,6 +88,24 @@ allOf:
>          clock-names:
>            items:
>              - const: vdec
> +            - const: active
> +
> +        reg:
> +          maxItems: 11
> +
> +        reg-names:
> +          items:
> +            - const: misc
> +            - const: ld
> +            - const: top
> +            - const: cm
> +            - const: ad
> +            - const: av
> +            - const: pp
> +            - const: hwd
> +            - const: hwq
> +            - const: hwb
> +            - const: hwg
>  
>    - if:
>        properties:
> @@ -108,6 +130,9 @@ allOf:
>              - const: venc_lt_sel
>              - const: vdec_bus_clk_src
>  
> +        reg:
> +          minItems: 12

so max can be 1000?



Best regards,
Krzysztof


