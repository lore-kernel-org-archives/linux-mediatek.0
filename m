Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C51C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiChl6swvjdNJt4BL7PNpumaZjt7l2oeMRF/EgqNKOU=; b=0SvSOqlcbAMx5JpRgCtZ3WH4nc
	ALfCDhuSs1jrDAaDZVqvQ/nEFoKou+XCV/ATnFqgz/9jgZJ2HGHykr6GX6pTHXA8+wDwT4v5/K1g7
	2wMxE65M5PMFDnOgbg1XUgjlcL+upo4MYjjr6n6o+O1ZrCaGfRit8EU/hJuZlPsnAkGFq/QDW1ZFr
	P0URau7LQ9I0o9sDe0hdpjBQ0RfV3bZQVyu38TqCUS/pSMyVzxcxEvRUXId0ZOZUUGA0ewgvPi+Pl
	KULgUTgO1xh4WVEwTURt7r4a5LQIna1dy/IbjOx3VZj9yasLeXOgAAv0DIg9+qVXamuAS+7vlsJTN
	ulfTBYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWMj-0077zy-2L; Thu, 21 Jul 2022 13:37:21 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWIH-0074pt-Jv
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 13:32:48 +0000
Received: by mail-wr1-x435.google.com with SMTP id bv24so2309835wrb.3
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=YiChl6swvjdNJt4BL7PNpumaZjt7l2oeMRF/EgqNKOU=;
        b=KJ71mRTHjcMfVwNP//9xcFCcC1OBo4d3n+D7jV0IXQn0jU0RVFvVjC+UzZNv1hTdkp
         rbmJXMz0Cu6ENMhNmXpJjh3tMTUGkoMJXCiFqjpV7/C65puZDUJoXZaTu+INoXqWSzQt
         XUc7JDuo4yVxIUSYpe+yCYeirNvHEtCeW/+w7Ke0TDXVFJCe59VOt3CvLZjPYtPna3kv
         7JRi9aSPPvzaLaeaz/Zc2688kIV6P75gNSkAQxx87aI1yH5KD+XIMBgq2Qt3RXa7Gnme
         gON1/dS8zJBUQfAmwgwfxiEkOblleELw+kE41VyCRsu+jBdKgnJqFMWPDifbHFHFV5V8
         4PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=YiChl6swvjdNJt4BL7PNpumaZjt7l2oeMRF/EgqNKOU=;
        b=1iSgk7nr+LfNxlAEPFLxnnRNicZcr1dA8DqjVR+/K0tpNGl0Jud2W1ds3+zUxPSyKk
         83TdTiwiY1lkA1hS3rWtSSbaRUDAz4v7DGyZqPZz/99Ts4fy/u7/Ya+nk492NkPh+PyJ
         fAY/AFtGWHb2qeqyngP2VHCdSHZXp4qb7EXB+yTThP2M+hG3VmMioj/sEasffBxr1CVu
         7Xkq6z9vXeUSFQ1Jq36zDdXt81H2sxh94FJEq0mzBQU8jWwoK118bd5GwxfJZ9Yyl94P
         zx+NaD+ZlZ+FlPG6TyLUD2+x1LAg3C1rIcHRwmsWUazrmnGxtSr/TAjzyPtr+4MXagj3
         L+2A==
X-Gm-Message-State: AJIora/YYkgpwLIKNrwMvuIv2YIfI8WexYQzwyg3x/4EdVS9YCuTR3lc
	IW6nSnZ7iphP5Us/vzalJ9Qtxw==
X-Google-Smtp-Source: AGRyM1sl5Re6/quP4ss/24GJdvjVTANw3tDDCmdmbHWbEAkcAXG92PF0UHBuWneayHvdT1EvhLLaHQ==
X-Received: by 2002:a05:6000:1a88:b0:21d:aa97:cb16 with SMTP id f8-20020a0560001a8800b0021daa97cb16mr35374955wry.97.1658410362731;
        Thu, 21 Jul 2022 06:32:42 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id o15-20020a05600c510f00b003a30fbde91dsm6560975wms.20.2022.07.21.06.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 06:32:42 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/6] dt-bindings: mediatek,mt6779-keypad: add
 mediatek,double-keys
In-Reply-To: <98ec7967-d007-46d7-ef54-aa41426b5f9f@linaro.org>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-3-ef9fc29dbff4@baylibre.com>
 <98ec7967-d007-46d7-ef54-aa41426b5f9f@linaro.org>
Date: Thu, 21 Jul 2022 15:32:41 +0200
Message-ID: <87r12eh9qe.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_063245_716104_445F3CA1 
X-CRM114-Status: GOOD (  14.89  )
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

On Wed, Jul 20, 2022 at 19:26, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 20/07/2022 16:48, Mattijs Korpershoek wrote:
>> MediaTek keypad has 2 modes of detecting key events:
>> - single key: each (row, column) can detect one key
>> - double key: each (row, column) is a group of 2 keys
>> 
>> Currently, only single key detection is supported (by default)
>> Add an optional property, mediatek,double-keys to support double
>> key detection.
>
> You focus here on driver implementation and behavior, but should rather
> focus on hardware, like - in such setup two keys are physically wired to
> one (row,column) pin.

Understood. Will reword in v2 to reflect that this is hardware
description, not a software feature.

>
>> 
>> Double key support exists to minimize cost, since it reduces the number
>> of pins required for physical keys.
>> 
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>> 
>> diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>> index ca8ae40a73f7..03c9555849e5 100644
>> --- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>> +++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>> @@ -49,6 +49,12 @@ properties:
>>      maximum: 256
>>      default: 16
>>  
>> +  mediatek,double-keys:
>
> Do you think there could be another MT keypad version with triple-keys?

Of all the SoC's i've worked on (MT8167, MT8183, MT8365, MT8195) I've
never seen a "triple-keys" keypad.

>
>> +    description: |
>> +      use double key matrix instead of single key
>> +      when set, each (row,column) is a group that can detect 2 keys
>> +    type: boolean
>> +
>>  required:
>>    - compatible
>>    - reg
>> 
>
>
> Best regards,
> Krzysztof

