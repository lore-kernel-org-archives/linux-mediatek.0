Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B0CC77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 09:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4AmdVwg4gjTsAxfk42+ya/xr1mTSRxxbVKQ3XrFUpQ=; b=S8+EUAjZ+qjeSOS2pmrH9a0lSP
	lw04q9U4ggMQH4r5FeXSviRNw4R5/f+MTeTqJPmTpt6hJRhUWNIipMSeqMMqL+6CkgFxsqvS+ATB9
	SUXQTdql+vf2ZLJ+qG8emHJ/vRMUHukNNCURCTOv9cReOdh8Nn39hZApnk801QkWUPK7VHX4iN3Tx
	IiVaEQD7hHhQ+5CXNPskZR9I5hxZnRi6lOklTzWpKowZPSZ4+2vyv7U8+g8J13znejS80bvNKOL+N
	ZlhVE0Zij1Cft9IE1WFZ6cntK7kUWuAW54GLPdf01Q2qTey1oxCQtd0Yu1p7pVXYTStzhjIk5LnkP
	YUWfvHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Sjp-000xLF-1d;
	Tue, 06 Jun 2023 09:12:25 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Sjn-000xKd-0u
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 09:12:24 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-977d02931d1so374799966b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 02:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686042742; x=1688634742;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4AmdVwg4gjTsAxfk42+ya/xr1mTSRxxbVKQ3XrFUpQ=;
        b=PnGKM47mpj3Ddc0oSOEllxLh+oOxYtyvpANv4U3kMcbOr/jE0l0k2q4H0SonOqThMB
         1bWpcUnZ2cJQns1go/rFdSkU6JyA5wm0uZzXtAS65t/BrkvGuymnrxqB9y7RbQwwzrwB
         RtGRMJSHvh4A7hK5EjmNlOApop0WmF30BooHT/TlzYGVLJqPYAriWOIiw4OVNtFRGYGf
         u8qbcP8YNWTx5oSLaswmdNiyc8inJh6ERiE7Oi03fWtjan0YPRaPagyBzA0iyBuTdnDc
         evOfD8rjLngWo+AlXOWO/2pRrjiBsgfO/IIWdJfQJ68k5qVKOpXGdaeiuhn/7VVlwWZC
         L2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686042742; x=1688634742;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4AmdVwg4gjTsAxfk42+ya/xr1mTSRxxbVKQ3XrFUpQ=;
        b=au7uypmjr5+af/7CslFsjoxVlYGoxG5Obo97Ciw/6ufL07quWPRa6k8zY6pWtf+bed
         xOcqBrITtXRSjzUCQbKkSkYlzsaLaqK5okp3cES0kJqZDViuOV4EgYv2SrCTfwhbBi2G
         AFExwCq+vb4GxJujN8WzNuoseSy/fopYmwxFtOBYj/qZrmnMxFaOjXfnZkWbSSXN+4Je
         H6mYvM4N5O/7Mu69kkzalZt92DdvrgjVz1iBKfj4L+H9Go6qvddh4Yt4qGxjE+WyJh0C
         Vo3TsK0qKuOfIkOwVU9mHgjvw8gJAAbrrfvy0KXz1zEJ4rzk1lleTuTOUBibnaOBUmUZ
         PGVA==
X-Gm-Message-State: AC+VfDyl9VZuEUxRpjmZWFipzBQsR8LEndtxiWvl78ICV+P+Sc0rWVLy
	Bahk5Uw7KxCHvpT0O3BM8zre4Q==
X-Google-Smtp-Source: ACHHUZ4ICG/LiMH48iJ6ITReWMZhhxEFrAzzKgQao53xyViRDfBvZqW8oHYQ9GVk/zBWdm4mgBP5YA==
X-Received: by 2002:a17:907:94d4:b0:971:2eaf:556 with SMTP id dn20-20020a17090794d400b009712eaf0556mr1942718ejc.18.1686042741710;
        Tue, 06 Jun 2023 02:12:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d12-20020a1709063ecc00b0096f03770be2sm5289135ejj.52.2023.06.06.02.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:12:21 -0700 (PDT)
Message-ID: <b9ad3b42-8d56-a9ce-bdde-df4ac65a1b49@linaro.org>
Date: Tue, 6 Jun 2023 11:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/6] media: dt-bindings: mediatek,vcodec: Allow single
 clock for mt8183
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
 <20230605162030.274395-2-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605162030.274395-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_021223_328799_975D5161 
X-CRM114-Status: GOOD (  14.23  )
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
> MT8173 and MT8183 have different clocks, and consequently clock-names.
> Relax the number of clocks and set clock-names based on compatible.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  .../media/mediatek,vcodec-decoder.yaml        | 29 +++++++++++++------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> index fad59b486d5d..57d5ca776df0 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> @@ -27,18 +27,12 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 1
>      maxItems: 8
>  
>    clock-names:
> -    items:
> -      - const: vcodecpll
> -      - const: univpll_d2
> -      - const: clk_cci400_sel
> -      - const: vdec_sel
> -      - const: vdecpll
> -      - const: vencpll
> -      - const: venc_lt_sel
> -      - const: vdec_bus_clk_src
> +    minItems: 1
> +    maxItems: 8
>  
>    assigned-clocks: true
>  
> @@ -88,6 +82,11 @@ allOf:
>        required:
>          - mediatek,scp
>  
> +      properties:
> +        clock-names:
> +          items:
> +            - const: vdec

You should constrain also clocks as they must be in sync with names.

> +
>    - if:
>        properties:
>          compatible:
> @@ -99,6 +98,18 @@ allOf:
>        required:
>          - mediatek,vpu
>  
> +      properties:
> +        clock-names:
> +          items:
> +            - const: vcodecpll
> +            - const: univpll_d2
> +            - const: clk_cci400_sel
> +            - const: vdec_sel
> +            - const: vdecpll
> +            - const: vencpll
> +            - const: venc_lt_sel
> +            - const: vdec_bus_clk_src

Ditto.


Best regards,
Krzysztof


