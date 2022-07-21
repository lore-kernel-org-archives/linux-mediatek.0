Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C52C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/H+ubGz5dC0Dz+m1egBSS+mn3sw5UpB8w1f81HptlFo=; b=Qb6/aRe7TBH9Phl8W0JHVnV5hS
	4XSPtvDpHBC7MrLXg9RrwbnYNDfMa8/9Bo5cJFSWHxn0kGpGcXvFN8UhOMwIv/XMExy2w7qoVRbXc
	r4FsFljjk/gM8tCXEttQ1b5ycRHmnMAJ48rchOUPMV712Y1rF3uVer0ZlQm2OM2cD/Uf0X+FRhG5N
	VzfY9zSVjaQ7rjsHKfHzxgYH15bHfbVloK26efOSCGhimbaJzXmVHmCH7lTuLgrn6vaBwuWMcNguf
	Y7fRaYaL+n3CTzcqIMtEsWhj/8OZsiikVFlQsMkPIaFS2+scO2CS1q6MGCG3Mk8YR+/J4G8yTwIYx
	0iohJu9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oES96-002zfS-IA; Thu, 21 Jul 2022 09:07:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oES8t-002zQG-Jp
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 09:06:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id b6so654225wmq.5
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 02:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=/H+ubGz5dC0Dz+m1egBSS+mn3sw5UpB8w1f81HptlFo=;
        b=D0wGWDqCWVf1ogvzp2scTFOcL/n/BMEgsTofv86DsSTkPtAJuQsI83k7g+ea2/xTwQ
         aI8aQ9xBbDoOqQ5HJIENAZCvvpuIuNc0skABIW5X+dF/ISz+o6oMNsblkkia9J5AZedK
         i1y3HXa+oWE2R64nyu9rYveTvuz0cb5odonsNSBEx+cwUiSPpkiGVPKv+peVdCd6QB3d
         OtgnnK4tBoOJsH602xwzjG1GygYAmo2MkVu23eWuqc5iZFp0sPMmFleasSQjSUwtBoAI
         yE+DInYb6Y7WwG1PbJk9v2V3UK6GMrfcKtTGnRUskE8dqSv80KIp37ZBuWUxeHQGh8H3
         9VhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=/H+ubGz5dC0Dz+m1egBSS+mn3sw5UpB8w1f81HptlFo=;
        b=rQD+daTn7ZFwmhiG6BO+0rv1jMUZgj92bNWdulHuUtPE1TfrnuvbjfKTWX1Kv9mvS2
         RF2zAZJGrc7k30vowfQUDOxvQR943DUA9Gt1ACa5U4G3u5lRTpcr7sg1THD0kwcJ4Tol
         9ILGC+EV7POxEkYv2whe1Zaq6rPfDlzx5ZddgMgWHaeimqFWuljRdV6gZ0zvVo4iiX/P
         zzy7Tn+tZotx6+KoaXpWKAXZCvpmOfB+NJaWfO+RS5EuPglb32XwnyjMdvpzKTarhjaI
         chKYZ8MjjWByaeThYxT8W+RjrQQ1GIwDdZlus/v9VVRBikOlZJNMQmWWq7N/zOPYVadu
         jyUw==
X-Gm-Message-State: AJIora/HCFlel52OAOvxKJUE90hfxap6nU32c7xswfYyBsheiigBTagW
	+XdzjV/ugI6zjg7brxE9oHeRDw==
X-Google-Smtp-Source: AGRyM1tZz2TDn6be9lWTWQ2CDScl7zAd9M2KfMm9B3ELPlAoh19nphaaWcU/vY70sT+0kbd5D4xRGw==
X-Received: by 2002:a05:600c:5006:b0:3a3:2dcd:8730 with SMTP id n6-20020a05600c500600b003a32dcd8730mr3710520wmr.99.1658394403779;
        Thu, 21 Jul 2022 02:06:43 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id q15-20020a5d658f000000b0021e48faed68sm1225231wru.97.2022.07.21.02.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 02:06:43 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/6] dt-bindings: mediatek,mt6779-keypad: use
 unevaluatedProperties
In-Reply-To: <e1ec8511-d1dd-faa5-031f-50c4e55062cd@linaro.org>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-2-ef9fc29dbff4@baylibre.com>
 <e1ec8511-d1dd-faa5-031f-50c4e55062cd@linaro.org>
Date: Thu, 21 Jul 2022 11:06:42 +0200
Message-ID: <874jzaj0m5.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_020647_730391_16587EA9 
X-CRM114-Status: GOOD (  12.73  )
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

On Wed, Jul 20, 2022 at 19:14, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 20/07/2022 16:48, Mattijs Korpershoek wrote:
>> writing-bindings.rst states:
>>> - If schema includes other schema (e.g. /schemas/i2c/i2c-controller.yaml) use
>>>   "unevaluatedProperties:false". In other cases, usually use
>>>   "additionalProperties:false".
>> 
>> mt6779-keypad includes matrix-keymap.yaml so replace additionalProperties:false
>> by unevaluatedProperties:false.
>
> This is not sufficient explanation. You now allow all properties from
> matrix-keymap.yaml, which might be desired or might be not (e.g. they
> are not valid for this device). Please investigate it and mention the
> outcome.

Hi Krzysztof,

Thank you for your prompt review.

In mt6779_keypad_pdrv_probe(), we call
* matrix_keypad_parse_properties() which requires keypad,num-rows and keypad,num-cols.
* matrix_keypad_build_keymap() which uses linux,keymap

Therefore, all properties from matrix-keymap.yaml are
required by the mt6779-keypad driver.

In v2, I will add the above justification and also add all 3 properties
in the "required" list.

Initially, I did not do this because from a dts/code perspective it seemed
interesting to split out SoC specific keyboard node vs board specific key configuration:
* [PATCH v1 5/6] arm64: dts: mediatek: mt8183: add keyboard node # SoC specific
* [PATCH v1 6/6] arm64: dts: mediatek: mt8183-pumpkin: add keypad support # board specific

What would be the recommend approach for above?
I see at least 2:
* "move the whole keyboard node into the board file (mt8183-pumpkin.dts)" even if it generates
  duplication between boards using the same SoC.
* "add a "dummy keymap,row,cols" properties in the soc node which can be overriden in board file.
  For example, use rows and cols = 0 which would have the driver early exit.

Thanks,
Mattijs

>
> Best regards,
> Krzysztof

