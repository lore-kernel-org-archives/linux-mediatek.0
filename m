Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E0DC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 09:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcOuuVLMRPvcgqS609jqzO++6wCIprOGvA6tVBuXng4=; b=UJ68lAWag9Giwdx9T8A5LnWaLT
	InJ++KV4Uxsw/8Y/IRCZ/uyA+puxk1zRtf015HxTE2nbRiM2lq5eKAZa3R+XSSXJwGFkeAOmCDnsg
	1O04/buk7nllbBGkyVaMCBXHykopGVRkZEZEBZth2svBLVJI3NLsK82q3Fi+hr+aBAHJtNzvgD5am
	p6oj1YGA0COwd+L3qLe7t2z4Z66nkKKINRXhvg4HW8PA0AyL0LQfZfWUq+Ft9NrwudQL/tPFo10Sj
	HYJ8PKV6EwEqYJt2sw7QrctPJlR5qIl0KsZraueai7G2vSo+qbVi3/eaqqzx6IGP6MiC6nRXVLWio
	uqsLEQjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousb9-009arz-2r; Tue, 15 Nov 2022 09:51:19 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousT4-009W37-3p
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 09:43:00 +0000
Received: by mail-lj1-x233.google.com with SMTP id u2so16773422ljl.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 01:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pcOuuVLMRPvcgqS609jqzO++6wCIprOGvA6tVBuXng4=;
        b=XOaPnkzJeHzIeFxXzzJIxzy7diDEbKFmS6PQm3Z7zr0fPgejLXIrGdXo//MJa/t1Sp
         AZxve7rHIszO989iH7FY2rwa7TRzIma4dyIiA4iksHmvt4O2TRXy31V/YegM7X/FlkdZ
         KyjY8CtE54wvqy1CUx9QoytAEbcJy1TxYmFqcUZXq6o8dYNffOgajutxMT9rmTvL1Pbx
         JetYZpPKewFpz61Ziu35LeEdQ048WI4+yCbDO9xi5da05TXBFf5+t7wXn/BSCGuEH/MA
         Z8tcz1TfOHRA1v33/rA2TR13Qd/3fnEv2vplLtWU/keuMeZRQvOTl3MxK/bxowD20fhO
         F6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcOuuVLMRPvcgqS609jqzO++6wCIprOGvA6tVBuXng4=;
        b=a3Y2ptho8JvS8IDGhqa5upI+nRJeMSSEPFNdFQhZtt5fPvmgPA8QqhGkVxKs7c8fxN
         rTUKjWB0NWrUrOF2dnWL33BPJKIyULMW7YbR3ihnq5M9vpEosk3m4eDM0wY7ftAVLCqF
         j+FzuJ1Mf3a5V/5Sn/+jtxxzl3+0eOR+r2ZE6LW37Dd0P667a8qR+7xwOwxTQ3WHMGoy
         scv8s3k3CBMoOo4aq34QZhPCSeXD5wSeXX8LHNHZvSOAOgNwCBJ8vkaZyVvSItuOdd2S
         +T+NB6UoD3EtzmI7rW1eqgO8Kc1QRRst5vrlD78M+dW60ddMsSiHo8v8iPxCvDieDkK8
         OMiA==
X-Gm-Message-State: ANoB5pngyr+xmIbKWrPlDMYIXj/0AsWlUKL4JIN3DgeUA3/KVa7V4n5u
	J33smwXI63DF3xLfqxVYepYid2eOVN/jSOaX
X-Google-Smtp-Source: AA0mqf7o6HYdQ/m+T7fG4BO/aTBqHmWFwpCsdvzYlMBgLK7cFm3mEKNbwzJXoJqe4wSxsvb1xrvPFA==
X-Received: by 2002:a2e:5008:0:b0:278:f31b:2770 with SMTP id e8-20020a2e5008000000b00278f31b2770mr4703017ljb.310.1668505374162;
        Tue, 15 Nov 2022 01:42:54 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b00498fe38ea0fsm2163880lfg.174.2022.11.15.01.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:42:53 -0800 (PST)
Message-ID: <1a8608ee-bc9e-b5b9-b010-5aa76b799481@linaro.org>
Date: Tue, 15 Nov 2022 10:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 03/15] dt-bindings: iio: adc: mediatek: add MT8365 SoC
 bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-4-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115025421.59847-4-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_014258_205771_F5FC2EC0 
X-CRM114-Status: GOOD (  14.98  )
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

On 15/11/2022 03:54, Bernhard Rosenkränzer wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding for the ADC present in MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>


Drop second, redundant "bindings" from subject.

> ---
>  .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> index 7f79a06e76f59..ed582c6e7ea9c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> @@ -38,6 +38,7 @@ properties:
>                - mediatek,mt8188-auxadc
>                - mediatek,mt8195-auxadc
>                - mediatek,mt8516-auxadc
> +              - mediatek,mt8365-auxadc

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.


Best regards,
Krzysztof


