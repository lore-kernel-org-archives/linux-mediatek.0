Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280E2ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vFCSexr76HlBCHcrQn/vIs9359eDZxRFYJurz0HFmo=; b=xesl6meO11/mjfV4SGtbJV11iX
	HVDzUbr/WOAPrVJ0dfpuK73KnbafFAKvi8j2nkG/sGKw6+cnGnOhNONi0Cu+816hOLK9TpX+yLzJi
	OyQ422S3scsx7TlkN2DoCHnNU5tLJh/4jwCdC6I/a9KMhNuc8puCvN/007nBgs2gJX4bAiXgekLjg
	GnDcS5nTMaZEY5i0YZ18uhLRcpDr8Vj7t8r09ARrErfzqRI+ngIzKRU/hq9u8XPPsEQG4qLuSOcE4
	0DhVhb7LwwMxhzF2DHsJEUOpgLsUddhOvJEU8THOkYZ7FREymzh/ktavUNOfDIO68hO0xMn+Lo53E
	yupa/OOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxGz-00FTzR-KF; Tue, 30 Aug 2022 09:11:05 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxGk-00FTpj-Mb
	for linux-mediatek@lists.infradead.org; Tue, 30 Aug 2022 09:10:52 +0000
Received: by mail-lj1-x22a.google.com with SMTP id z20so10675513ljq.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Aug 2022 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=+vFCSexr76HlBCHcrQn/vIs9359eDZxRFYJurz0HFmo=;
        b=CnU/2NHU+5ZWMnfhlGMXRn7vd0rQke55CYHYd58495fnKVaXeP96TZWwX3JyiBzaAo
         tLa1EeOJ5RW6ctdcTRSEo3eXTALArkmWt6QIRzQv11DAXQWF6g90wcU4FLVaZwkdi1Pi
         uOZpDqJ48USDbihnJ+aAYdqMWtptMbU8/4tukJW5RQqjTnL0XKLDhC13VAObrjnIuJO9
         28/UNhVbLU90yiRpL1sjPdMXj7a91Ey1HdW7lB6r7PAVJZcC4BhPX0oR8c5pA0DUSflv
         +9TaVFt7v0YhmhuOIvkVmdHaUHIt8l+CyqgX+mLkxqQ0ya58BSGwjvQ9ab1+nitEB3Ny
         sZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=+vFCSexr76HlBCHcrQn/vIs9359eDZxRFYJurz0HFmo=;
        b=wdumTrcFJhVRgSjFNUkL7nYakFe8Hy02sAsucHaqf6iwmFtcSEg4ES3UNFITQGuQqi
         q4dpxsM6XaZCIQzCvuA2ZyJ1l45tL1uDoOMJe7aTIvNDsV/t+7jsfsFuNchsPdLjP5iN
         etCb3nB6xfdbHTLzHdWd6HOK6DgnQY4cL+7X9+LdK8eAfZKCOtkcSnqqoLH3LeyQ9Ery
         FP1j7fHnWM6fn2R3KHlOmmIKqjBnwq7iMvHPrHV9iAaPMm98cUnBkisA1H7wCXKLyD/Y
         Bag+CNALssqsuuF3cS9ELTvSvKTNW9iHPGaSOQ9aMsWDhZxfPR0DxCxuk20xm+TAaVoP
         kgew==
X-Gm-Message-State: ACgBeo2wNzLjVI/L0RFyPKXORihhgx1HtiP8OaKU9U63QgrqndnQsrwT
	m0Pw1iJV6mCjS+ZdH7NHE0K3pg==
X-Google-Smtp-Source: AA6agR7NEeEYYtmJpkCNYve98HSAgJWirTpD5nfKvslXsBiBWZAoj/T37NsmSWSobBGbte7eVK4Vig==
X-Received: by 2002:a2e:534e:0:b0:261:d1b5:dbca with SMTP id t14-20020a2e534e000000b00261d1b5dbcamr6223939ljd.187.1661850648437;
        Tue, 30 Aug 2022 02:10:48 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id t11-20020a2e8e6b000000b0025ebaef9570sm1684850ljk.40.2022.08.30.02.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:10:47 -0700 (PDT)
Message-ID: <23d2764d-17da-5d26-29ed-0b1f5418d004@linaro.org>
Date: Tue, 30 Aug 2022 12:10:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: Add gamma compatible for
 mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-2-zheng-yan.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220830063929.13390-2-zheng-yan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_021051_603561_32F11A1D 
X-CRM114-Status: GOOD (  18.24  )
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

On 30/08/2022 09:39, zheng-yan.chen wrote:
> mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
> current 9bit-to-10bit gamma-LUT.
> 
> This patch thus add constant compatible for mt8195, which means that
> mt8195 should only use specified mt8195 gamma driver data.
> 
> Also, delete related compatible from enum, to ensure that
> mt8195 will not accidentally get others' gamma driver data and thus
> cause fatal error.
> 
> Fixes: a79257bae9bf ("dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0")
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index a89ea0ea7542..fbd7b9664a78 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -25,11 +25,12 @@ properties:
>            - const: mediatek,mt8173-disp-gamma
>        - items:
>            - const: mediatek,mt8183-disp-gamma
> +      - items:
> +          - const: mediatek,mt8195-disp-gamma

This is one item, so not a list. With all such cases this should be
dedicated enum.

Best regards,
Krzysztof

