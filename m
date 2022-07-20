Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799DEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 17:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVvVeRmRXvjPzaajbXaiFutpIfSgHDSdBxsW2NCtmn0=; b=R0ZSK+415ogTa1zN1ZokPVjX24
	BDUuP1Tc/iYT1+q7EYuv5Y/1a5Fef1PYS9jA3sE7Rdzc4d+VWoBjFfc+X+QeaiRE1cwNXZ3iqn2H9
	Gb5GsemeKsSx/FVAUulMZrAftuCZ2jYbod/THLuN+bLK4uF6ouQojWRAnNPTNQqGTCKKryfxl7Ff4
	RfcpTp9yCGT+l93EN6KoJEW4NY3ExWcS2RbbJkn/901nGCWIn0jUlbcl8Jr+ahH7IecONqzZV6YPz
	a+k2o46BqKq6O1Hb2mU9gLKhCjWEqDgsS41kJOEux48P9Dtw19Y9g/9IaSYLJ5+cg8UwGbk9wugwj
	3SvWjCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDT0-008bWZ-3x; Wed, 20 Jul 2022 17:26:34 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDSo-008bRd-Q7
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 17:26:24 +0000
Received: by mail-lf1-x132.google.com with SMTP id u13so31407856lfn.5
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 10:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UVvVeRmRXvjPzaajbXaiFutpIfSgHDSdBxsW2NCtmn0=;
        b=NyMbMqZNAENBaZXdyz+DOU3rwHXHVCQ83gQ+nkqnGXzpxSskOqEKlotsHZTdX/RqnK
         v6UyFwE2bNLiveAg/ysC2E4WJFQhAChBQG4LrlATdsVvuSfHIy25yGfyATLO0fdEq8SA
         QgVerrtSqqo0ZNUG/D8M9lDHzrdp1qH1eGbYR9uzd27TQf9seZ11rsXItN3cZ1EoCGpY
         m5mPtpFHpQ2jXHRaC/neiCohXGZ57ccVXcbEo/OD1lzHcj4DF0jsYz1oMhGclZQN/IyF
         gxFbetjC4B+gKE2VVTek2BFV0SXLe+IBCGvK4k3noKwIyulFlRlnVZ/tFcPSkciDe/Zl
         uWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UVvVeRmRXvjPzaajbXaiFutpIfSgHDSdBxsW2NCtmn0=;
        b=WwMHa6+iTilbyOp9ijv1KiFhNXajj12zwKaOqiX0YOkqPScEsyHiDwv+dRgmkn4Xp3
         UnEnbW4zvPxfz66hBsyFgKdX2YuKdVUDN8bGx7pBAFyfX/U3PIv8HPMu4A4ypAbmW07f
         f9B15nhay02K2PMEFeR0fNMutcO589hzZwbHIFxfEPNBmuItwF4eQHPzI7siMWYtkfkK
         xtzhnUqH/Mg7Ens8qdyLkV2Bosde4dSXFmh752mGYcii2K6VMfSmWVzxbJJyZGjVod0y
         twHnAdwIufH/prXhS6FxNt/eDZF/OkAJlNGO8e0vVhgXWtc1ZShrlSovgeoes5KPl3Xa
         x6Kw==
X-Gm-Message-State: AJIora/uqRYjSsCdrq7M7cxsMoVOKAlrGO2mkjXRlEqzj+q+ksC/92Tg
	V+NiKXqRfsaXlgIuNn8sCky/qA==
X-Google-Smtp-Source: AGRyM1ttDyYjCxw5IvCY0G5ADuGKWEioaj6UptwigoLgIn75ac03PnpcHjZ6Mpy4L72UO3cALygi5Q==
X-Received: by 2002:a05:6512:10c4:b0:489:de26:cef7 with SMTP id k4-20020a05651210c400b00489de26cef7mr22165488lfg.216.1658337978951;
        Wed, 20 Jul 2022 10:26:18 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id r6-20020ac25f86000000b00488e50527e0sm3891305lfe.112.2022.07.20.10.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:26:18 -0700 (PDT)
Message-ID: <98ec7967-d007-46d7-ef54-aa41426b5f9f@linaro.org>
Date: Wed, 20 Jul 2022 19:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 3/6] dt-bindings: mediatek,mt6779-keypad: add
 mediatek,double-keys
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-3-ef9fc29dbff4@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720-mt8183-keypad-v1-3-ef9fc29dbff4@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_102622_910470_84EF25F8 
X-CRM114-Status: GOOD (  14.80  )
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

On 20/07/2022 16:48, Mattijs Korpershoek wrote:
> MediaTek keypad has 2 modes of detecting key events:
> - single key: each (row, column) can detect one key
> - double key: each (row, column) is a group of 2 keys
> 
> Currently, only single key detection is supported (by default)
> Add an optional property, mediatek,double-keys to support double
> key detection.

You focus here on driver implementation and behavior, but should rather
focus on hardware, like - in such setup two keys are physically wired to
one (row,column) pin.

> 
> Double key support exists to minimize cost, since it reduces the number
> of pins required for physical keys.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 
> diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> index ca8ae40a73f7..03c9555849e5 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> @@ -49,6 +49,12 @@ properties:
>      maximum: 256
>      default: 16
>  
> +  mediatek,double-keys:

Do you think there could be another MT keypad version with triple-keys?

> +    description: |
> +      use double key matrix instead of single key
> +      when set, each (row,column) is a group that can detect 2 keys
> +    type: boolean
> +
>  required:
>    - compatible
>    - reg
> 


Best regards,
Krzysztof

