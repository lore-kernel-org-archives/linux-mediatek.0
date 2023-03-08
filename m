Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF299C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkSL1BKs8qQuXssQmsoT72r/3xC/fwXVehYN3PusxSU=; b=Dku9sUDhFvuwkCd4Y6AekV8fTG
	PIQRI5wXLIPdiEKxRvtj/e9KWHbtgBw/GN7rUeNWtV0idWKrlTdg5YyIwQ5IFLhiL2v6kB0zjy5hb
	yE49SU+f64u5W5b2yKuU0cq3QBNEWQ/0Uode9V8pAGdIB3D8L340PMMRgPHPoeCn5wSa1Y1/kRIOt
	ckqpTuCOlufTg8alSVQYw2+07unF16uqBIUtqVTY8jPMc5j5moh8SNVp1gIXYYTsdmG8+1CMSnIKH
	pC7Eji6N9Hwzd3n5nBOCxnObiRLwrXIPZ8t/lbbeVLoEDpCygPeF1bBH+WM1MkmhyD/E5oDVWWZbN
	WZukp69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZr45-004Pnq-H4; Wed, 08 Mar 2023 10:30:33 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZr42-004Pmy-PL
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 10:30:32 +0000
Received: by mail-ed1-x530.google.com with SMTP id cy23so63566428edb.12
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 02:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678271427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HkSL1BKs8qQuXssQmsoT72r/3xC/fwXVehYN3PusxSU=;
        b=evWB+d0e1Uquo8dr4r1VC6OHOejb7gAMsxkMIxPvgiJPtCZT5Gxmr2GExahMWkdOyx
         4ZZIOntnqQ19JU7niWQbOtTTV2rXyV/uin4GHBcSD7HdbiHT1jgzk2g3yXllsRbZ2PMe
         d7njlA4+DBtaN+Vtz4VeXb/fg9BA51+j2UhSFTK3rNKawVvkrYAxIP3a4v0Jf+1VE0uT
         +mh5L+6CGTwEIMtSrxGe1X9Fc/jZ9r8GjxGzVs4/O6vH28wjU+xxU+84H4FDT83P2bQ8
         RuSv15+h8llbX9Xscl0vCD/xInzDWptKuzcY/c2BzuuPMoXG36L5f5ydGxoETsygekxK
         DSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HkSL1BKs8qQuXssQmsoT72r/3xC/fwXVehYN3PusxSU=;
        b=RF2V7NP/C+xgP+lMroO9JCYTA+ozoee5u/wPNmt6xeCJ7r3KL0I6U95VxuEi9INSpS
         WGRVf3OTjQi9R63p4wuDnogvcdatr67daELMsleyu3q5jXISDaKnmW9Yd58nZnkG1jxs
         utzxA6Y+R/59oKwXH8Q7GQ6qvwzEK3e/LuHjF/LagM5d6NNBmZObzsLCoWPbts0H+eoJ
         W5lmom1064UOjnJISTBYxNoKil8THO+wHgx1SOH/sHlD5cgvaOSksBuaGfdEoT9KsqF8
         Pawt1WST6qmAyKz6Ffi//6Zm+uLazCIKmJBAAoLV/GXReQ7Z7B1tm9G8ydsZ8GjHtm7F
         u7SQ==
X-Gm-Message-State: AO0yUKV2DRz3TbUMf+DS4Strfon7HGo4hnMbYsJFgS6AXn8YghKDQAMy
	qEktLgEjNgJ4M7tIAkukjQp59A==
X-Google-Smtp-Source: AK7set/koDWIG8PwDaLODojT1e2g5Y13QtDF0LLxtW/sFTuh+svu9dDc9LTmiiyY6ii+2GE5BgIEpw==
X-Received: by 2002:a17:907:a054:b0:884:ab29:bd0b with SMTP id gz20-20020a170907a05400b00884ab29bd0bmr15871656ejc.69.1678271427688;
        Wed, 08 Mar 2023 02:30:27 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id qw15-20020a170906fcaf00b008d57e796dcbsm7259615ejb.25.2023.03.08.02.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:30:27 -0800 (PST)
Message-ID: <4dba4db2-60da-02fe-6237-c5893fdf2e14@linaro.org>
Date: Wed, 8 Mar 2023 11:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/6] dt-bindings: memory-controllers: mediatek,smi-larb:
 add mt8365
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
 <20230207-iommu-support-v1-2-4f0c81fd52c1@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207-iommu-support-v1-2-4f0c81fd52c1@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_023030_873399_C30F8B6C 
X-CRM114-Status: GOOD (  13.06  )
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

On 07/03/2023 14:46, Alexandre Mergnat wrote:
> Add binding description for mediatek,mt8365-smi-larb
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> index 5f4ac3609887..aee7f6cf1300 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> @@ -34,6 +34,10 @@ properties:
>            - const: mediatek,mt7623-smi-larb
>            - const: mediatek,mt2701-smi-larb
>  
> +      - items:
> +          - const: mediatek,mt8365-smi-larb
> +          - const: mediatek,mt8186-smi-larb

You need to fix the allOf:if. It expects single item, so you need to add
contains like for mt2701.

Best regards,
Krzysztof


