Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9265EECAAD1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNOYEau6NCyMFt2UF/kOrdVjy55MOyCZeOBAl0rr6hw=; b=iJ2PIMaXpI4ZJ9CsqRPiYhLb8o
	RTnUP9suOBr6Xuf/JyjwoHhrO5aLHjjaqUQKTV8nT16o+Laayv8MdD4pkF0ohjqU2wPR3f7flq7fp
	qqi7dW8GBP8BhCy3Tthg/jNXNqjw54HDWr1VFQ6Fl6Ly4nV/8G+qy2oDbgv+mKMyNAw+X2WXuq36r
	QZUWh8JAake4GJ/nUTAhD0O63Mtv6T/Rbv6mzjzETJdv8cPSqTP+aXeE2sSkq45ihVThK0Hvi18Ay
	+f0DSD661fJqGVO3Samm+IrKiooSo5JLmg+tL2rquPtjtGXYKfLuLsicO7a/LWBG97H7KN39Mjqwi
	rPs7YZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT5Bs-000vH3-K2; Tue, 30 Aug 2022 17:38:20 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT5Bm-000vDG-DC
	for linux-mediatek@lists.infradead.org; Tue, 30 Aug 2022 17:38:16 +0000
Received: by mail-lj1-x235.google.com with SMTP id s15so7008365ljp.5
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Aug 2022 10:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LNOYEau6NCyMFt2UF/kOrdVjy55MOyCZeOBAl0rr6hw=;
        b=JD7T2lrVvZF5GuK6KGickAQthyTSo1wl9nmJAy/h3ZXsePGnpeOzxDZhY5lljse7bg
         06oxnhr/vVv/IfWFBXuv+pBCkF3YH9FQJ93IRcWSueYyfagxPFrKrWLTQxMNB3nqcwyZ
         Bg6PD0m0ckgnKVzvYMVvoSEWBteYmvIL0HupVOodxYjnE2DSrTZEIJQeOAmMni9X7Ec7
         KkzX7xrNAE6S/SzVhw9jmyEfEpMKzuul+iCIXLBk0BlkjYcJhUXi/HbUF/KEFVxpBD+g
         Q0iM1Enws7ViTWcia6GQH7FGqeOnB43qwPl54FvzOZ1pDPd4ffTsY+n4atQQILBSYknj
         C5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LNOYEau6NCyMFt2UF/kOrdVjy55MOyCZeOBAl0rr6hw=;
        b=AbEQrW51cRL2uRfkuoTVcW4NEIm0BkyWNIpPDLe3gVPma1mPpbFs3mSCoRQx7cObOP
         hf6Ht8lRK9/9DuR0ibYVZx5tyOhHe83MokftA0K7MH72R5JyCRPqo2rb/szHH0+uDZGn
         DswgvZdj62WtImr3T4Jxq2YI2GI06kWFHzeMsIFOTg4cLj+g0onVL3bXNKM/YXpMgO09
         tvhSoVBfCBH/2iU3I7c8K7nKWQ0lOlYL0SM2NyGpPjv4z6Xqd3WqJ4anPcCCLqyEv4Ej
         vKD6X26Aptfig+2d5M8Oz6auej8wVvHchypTa2OGUdBDX9IHFEAGwYpNphCWMLh8yzyT
         QS1g==
X-Gm-Message-State: ACgBeo29ZC6YbYejrmzW3mb6oTmw8SS0xgLeMTMBm9vFC6Xcb+rJYccd
	OPMab4q2nyLcjs6tRARNPHcaSg==
X-Google-Smtp-Source: AA6agR4+iZSFr53G4vs26EmPBaP0Tw6RUL9/GjW9nDcQMmgpq7SSZtskFMm/hYnqoKkDPU6gjFG6NA==
X-Received: by 2002:a2e:a403:0:b0:267:7e5:a5ef with SMTP id p3-20020a2ea403000000b0026707e5a5efmr1555985ljn.93.1661881092264;
        Tue, 30 Aug 2022 10:38:12 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id e15-20020a05651c038f00b00264bb2351e8sm446663ljp.7.2022.08.30.10.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:38:11 -0700 (PDT)
Message-ID: <d1f49935-b465-7495-d345-f35bf4dea9f9@linaro.org>
Date: Tue, 30 Aug 2022 20:38:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: mediatek,tphy: add property to
 set pre-emphasis
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
 <20220829080830.5378-2-chunfeng.yun@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829080830.5378-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_103814_511226_607E15DD 
X-CRM114-Status: GOOD (  16.11  )
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

On 29/08/2022 11:08, Chunfeng Yun wrote:
> Add a property to set usb2 phy's pre-emphasis, which used to widen eye
> opening and boost eye swing.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: Add more description suggested by Krzysztof
> ---
>  .../devicetree/bindings/phy/mediatek,tphy.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> index 848edfb1f677..e0754fb44451 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> @@ -219,6 +219,16 @@ patternProperties:
>          minimum: 1
>          maximum: 15
>  
> +      mediatek,pre-emphasis:
> +        description:
> +          The level of pre-emphasis which used to widen the eye opening and
> +          boost eye swing, the unit step is about 4.16% increment; e.g. the
> +          level 1 means amplitude increases about 4.16%, the level 2 is about
> +          8.3% etc. (U2 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32

As I proposed - use instead common units. Since only three values are
allowed - make it an enum. These bindings are expected to be
usable/applicable on several devices, so units, not register values
which can change between devices, are the proper and reliable way to
describe a feature.


Best regards,
Krzysztof

