Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DDAC25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1ESsIqQK33mkc2gES2cmv+jNqxpWrAFNggOv3RLRRM=; b=AqZ8/t0d0k6ESzKt7hFt2/B2M4
	taTD4P/eFbelc8nUm0cCJaLSI7pwsmHJ3uKED4zmRUI3areIo+urHog5KGclTZebtCaOf8on/ZQ9+
	UThnvie8fX7bqX3D+M1z44XCVdaF24WfXztn+1Jqo8X6TSm8ZNCGfqcqr9jbPMI/5tp2sK63PukDx
	DDA8jNhz4EVBw9aFXRY0LdCXgAYQb5WgpfItMOvb32U6q65cT6qu0Eq8TDVK9OvcQpVYcdcCrYcEs
	Va1vdzzVo/ejZuhla8QYJdRq4VGizDQbVuf7PQVA6DfO/KishNkR3V3YIcgHaW5uDuByl0Fxf4+CC
	SlsUaUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOI36-001qg2-23; Wed, 17 Aug 2022 12:21:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOI2t-001qaB-KP
	for linux-mediatek@lists.infradead.org; Wed, 17 Aug 2022 12:21:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id f8so2313901wru.13
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Aug 2022 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=m1ESsIqQK33mkc2gES2cmv+jNqxpWrAFNggOv3RLRRM=;
        b=pPcIdlQQUO1qWmqM0DAIg+k4LibZFLWCKC3A7EAiYQU9IkycD05kLglZo2lWWVcmB+
         eZkPJ4QrUl2IGp49BFinu5/UIRRE6dVC+jZITg475fvXiK088tDtWt3TwNO8uc6m0zA6
         +6FrYF/VT7FRZJgaCFvqwJ1ezcdXT95oZb9C6h+2KHemooT+4rt6NkvlZZrY4pnt+dRI
         ncfbRneUqN2mWDFMK9iD3M0ARzQ+yz5UM5zaOhGdRm251xuoN44cfqJp421zpzHjOoKC
         rjNDnmrxKXfWIFZgxroW6DieRro9FyqbvvbM+cXQFzM31wlvW1Iubd3BNItVA/s2G1Jg
         mwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=m1ESsIqQK33mkc2gES2cmv+jNqxpWrAFNggOv3RLRRM=;
        b=I1jRMJuGwNtBRpo3l3mkFG5kKco+MHRQ/3jGpxI95NjLspoj04vtPyHpe+uAlGUws7
         GTMvTY4SxagLZhPlHRGGaqcms1I3wTqEXcnODUgxhV5xp4d2IvpdRijKK/cdeyzk7E+o
         ljkgpUYaGyK7TRiR4o7biZS0LgQjSSpDc4kKyRRMb91EVd+ApVR6jPzdPAxbdImeKzR0
         bkOYCr8gl3GHEn9yfNcTqw8esriojHEW33DjqCS73QRL+myF0rkIu+UGBILNbP4M8/aZ
         l78OcmXDd7IrjwUbIV32A1dR7TDHnpmDBmSiS2UvFUM3NjIEUsxIWN1+vRsMm4FvE+W4
         p6sQ==
X-Gm-Message-State: ACgBeo0u8yJtElTg1L9/yKIhs0aWldNlkHoWhbQRCDyNS9mwZMvL2Wi3
	S3DiJS6Q9l830DMXvBubuCkCSg==
X-Google-Smtp-Source: AA6agR7OTnrPt5oIdtzE4QzF/PJAdntMdqijnhGLRs56Qj2uoOh/3Y5DHlKEkqQTRTTSmgxemiqazQ==
X-Received: by 2002:a5d:6f05:0:b0:223:8bfc:dd0f with SMTP id ay5-20020a5d6f05000000b002238bfcdd0fmr13949143wrb.547.1660738872993;
        Wed, 17 Aug 2022 05:21:12 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id az36-20020a05600c602400b003a5fa79007fsm2180552wmb.7.2022.08.17.05.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 05:21:12 -0700 (PDT)
Message-ID: <8ab34dd4-ca5a-2824-ccbf-867996ac6536@linaro.org>
Date: Wed, 17 Aug 2022 13:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] dt-bindings: nvmem: mediatek: efuse: Add support for
 MT8188
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, broonie@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220715120114.4243-1-johnson.wang@mediatek.com>
 <20220715120114.4243-3-johnson.wang@mediatek.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220715120114.4243-3-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_052115_748160_D2116939 
X-CRM114-Status: GOOD (  13.09  )
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



On 15/07/2022 13:01, Johnson Wang wrote:
> Add compatible for MT8188 SoC.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
> This patch is based on "linux-next"[1].
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> ---

Applied thanks,

--srini
>   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index b5a1109f2ee1..75e0a516e59a 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -30,6 +30,7 @@ properties:
>                 - mediatek,mt8173-efuse
>                 - mediatek,mt8183-efuse
>                 - mediatek,mt8186-efuse
> +              - mediatek,mt8188-efuse
>                 - mediatek,mt8192-efuse
>                 - mediatek,mt8195-efuse
>                 - mediatek,mt8516-efuse

