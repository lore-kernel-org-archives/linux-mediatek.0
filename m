Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33878C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkg42MPLnTpziWzCq064IDe7/RZNLE51B/HaNedC/M4=; b=FhqI760+nx9p5tH2ZKU//O5ar4
	WHHxQ1bI4D9/4GYtzBK7nu7yl22IDqZdzqeSxiedb8Ijg+Sasp1SWlK/bLDgl8EEMtuuJz+6mVShz
	9Edtx1N5oT03GPVwSCVnDF5f0Xs54hGwS+tlCb2QzAjqQ1I6d6BjtwnDRUOQMgSXkurEfi3sqdYoq
	ex8+DhuRawfd7cfrqrsQ+EAens0WlBPcun2MZnVubwFkzvf/QX9FFmWH+ampLMGR3fHJVzo6CMuWF
	aGrANTtaUChCf05HVzjaHG+IrzLklrgpkjDq72Zxy8CxY8CgH8ONwrO+D2tdJ/Me4z1DuRKUeuY0O
	nEPykM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeGs-00CMbs-5Z; Wed, 27 Jul 2022 10:28:06 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeGd-00CMRP-0D
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 10:27:52 +0000
Received: by mail-lj1-x233.google.com with SMTP id u17so9162927lji.5
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Jul 2022 03:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qkg42MPLnTpziWzCq064IDe7/RZNLE51B/HaNedC/M4=;
        b=SErH2wgVr7T9GDatPTcAGAZhz0mCCIDjYaeT1K3DquTqiBRQmu4lOqJeXjmlf4wSwc
         vo8/3Z4LTpRrDQi979vWtmSglgPlMkYTcQ26vu31iDQG7PE27l5fRJrEEZsqAAMtFUDe
         iXDVwP4J6bkphFAXvEkQYAp03ToC7AmphB50IXsMAEXwZ5XhiVmExasmoijWUEaZWIRV
         K1+ysD5xk3yksGQvtDClqFQS3R2BSc+xsvNPOehhWWB0r/iXZ+PL0IqTaxloC1HtsCJa
         uv+oNZi1SruljFirJgGXd6CaNkfFaYXPhFUr0Yw7w50Oy41ws5vMMP6IFClvrHTfpY9U
         Rqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qkg42MPLnTpziWzCq064IDe7/RZNLE51B/HaNedC/M4=;
        b=QfoWO3kRSr5jMkRplMHPGKPrIUv+qrJX8DtexeG1uKxsZsFTh4tVVBQ7joERxMu0Kp
         RVf+J+a/Hcg3hFz+Ve8qI2frm5rpzDqbvp8Graah9niecxEyCvm6zMkwU5M2pEwTW0d7
         l4vbJzCfKBNIgZmmIDvKLrPyCqv9GZFbxPIj9KTa9A4WTVWwl22YJkUSB4i98LCU93xn
         W5Ah/s+36c3XwUoU26Eq2fWo66jDalGG1Q7N7szKOoKevF3wAvkRr2lXc+RaRTcv3EFR
         gEN2+xemjnPr6wlx7z4p32SP6EsYgCEYix0h/M3VbOY9N64Hz0l7HYcp9TWqmnJayUic
         uLUg==
X-Gm-Message-State: AJIora+d3epJY4bsiyRURh0CXchLiex0uv+ha1sHPtttrMP0WBjdtL5S
	eboskUvpKKjmlJaJcN9c5XRLLw==
X-Google-Smtp-Source: AGRyM1smiFuUhec91Ofvzs2IHsiTsiuRW+1y4Zq7oAZXS2YflAQNU45FarTBw8uHHqUJXzX/uftelw==
X-Received: by 2002:a2e:7c15:0:b0:25e:33c:6a4e with SMTP id x21-20020a2e7c15000000b0025e033c6a4emr5397182ljc.483.1658917667213;
        Wed, 27 Jul 2022 03:27:47 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id r4-20020ac25c04000000b0048aace12740sm688069lfp.270.2022.07.27.03.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 03:27:46 -0700 (PDT)
Message-ID: <c980ea32-1a94-2120-c879-4825ade0a4e0@linaro.org>
Date: Wed, 27 Jul 2022 12:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/7] dt-bindings: mediatek,mt6779-keypad: use
 unevaluatedProperties
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
 <20220720-mt8183-keypad-v2-2-6d42c357cb76@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720-mt8183-keypad-v2-2-6d42c357cb76@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_032751_093024_85CDD756 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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

On 26/07/2022 14:56, Mattijs Korpershoek wrote:
> writing-bindings.rst states:
>> - If schema includes other schema (e.g. /schemas/i2c/i2c-controller.yaml) use
>>   "unevaluatedProperties:false". In other cases, usually use
>>   "additionalProperties:false".
> 
> All 3 properties from matrix-keymap.yaml are valid for the MediaTek keypad:
> * keypad,num-rows and keypad,num-cols configure the KP_SEL register
> * linux,keymap represents the (at most) 8x8 hardware matrix
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

