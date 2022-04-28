Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6F5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 07:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hiXvfYvuRUzNGWTaK3PgBq6KICuo5Nxp7ShQLBdBL7g=; b=iDEVbJUt/d+zwj
	BkdEaBQ2o2UsN+N2UO4QUZDRuPsAhCno0lDJGEOqPsYPSDgNOzqDup+sUtrB8ZRsZ70g6JM69yloL
	wxMXFHJhJ0ODcdCl3cXStB/XPNtZBtA9NAuOtbo1HxxBwsNsNF5ifkHauavcLojTBAdixsQs5nsCZ
	ECj9EAM6nIbn6XHrws/rCLTdpDoNmbj00Gsk9aP3/vFteS0Ri3aVXXPAViMaNlYOYs37iBsILTyWZ
	GjFMkbCTsjW4C1AenGR8cuviaza49RpmKldgpLW61Jh3KRhrD3N/OHQrDCncgNu4M7CQNnr23LtiS
	c9Itgd85VU7V+ZEjNPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njyS1-0058hL-KA; Thu, 28 Apr 2022 07:20:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njyRy-0058fO-QZ
 for linux-mediatek@lists.infradead.org; Thu, 28 Apr 2022 07:20:32 +0000
Received: by mail-ej1-x62c.google.com with SMTP id l7so7765213ejn.2
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Apr 2022 00:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=up7p03H0J0l2JRjS145DbS50uy8AZoB9ENunf28x/sA=;
 b=PEs/6oNfJTBBN0h6QIIIJb6yJ2g32AbHqLBEV+1SLFdYoMXSRbT4yEoKcw3XUuNemC
 uj0IPsvcy+aLjTqkDN0RCJfyuR1Y7fdqG2Xm6zqHBvTbfZetlGIxRzCVig4L+tuVImje
 0KXW3mG472TTAwXzM3e7LTmrHs1WsyGarm2Vyg1vpUnkQyfqYgIB1fRhh3Dq7a35111a
 q0FlxgXc2kKS9zb8OQ0blhu3oqlTYKZtJ5Aa3jeAD5u7/cT2O6WO6kwhkCTUpvU/XsK2
 jBDAH2sfvRylegku/5gfh2b1R7XUUOb9++mgbsDLuepc/c6XTqhAtfu9mJWvctCogwsm
 +QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=up7p03H0J0l2JRjS145DbS50uy8AZoB9ENunf28x/sA=;
 b=5nD9wW+FMXfI98QANCpu0TplCuVmf8nQTBa/xSpsb6erip9MZiRilf9LzfVllZbw71
 /6e8vhSMXOwGD0h8Gs1bDzkgaqrb+ePGuE2+xzjaW/49ld8+FkuGggQUApICAH0bkCEv
 8LTjzqoQiE5bUlXF6AePd/9VLPzXEgZTq9HxENIalN/p473S3aDyWt5uBmRARfUimTDg
 sePXgDM5sgxZ2oXIzCYcpLCSdO8v5x+ASX1RNt+WsGeD7Skw/4R/4EfLrQ/CYY1RNBjR
 pB6E/0t9MyxuyJ7bPmIjuC72yzHm3slUol9TzehpM1o7kJ+OvO7/SMSBiz+S8KDEIViV
 x1mA==
X-Gm-Message-State: AOAM531HIw6QUzD1Qj9qvyBQgRVBq5xU5iIQBQ1vjXtJ55RgJUP0QQie
 ZDYJeS+j+/e47sy1QJuE8i6VJQ==
X-Google-Smtp-Source: ABdhPJxeoFy9Xibfpu3oUK6Cb02FyClEqMnD3LwurqLe+iUl9cJaEWfclRXJgrnFyTpqHolYTF2xXg==
X-Received: by 2002:a17:906:3101:b0:6d6:5b64:906f with SMTP id
 1-20020a170906310100b006d65b64906fmr30322134ejx.513.1651130429559; 
 Thu, 28 Apr 2022 00:20:29 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 w14-20020a1709060a0e00b006f01e581668sm7859254ejf.209.2022.04.28.00.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:20:29 -0700 (PDT)
Message-ID: <d4fb371c-c204-3ab5-6f38-7c88de30b25d@linaro.org>
Date: Thu, 28 Apr 2022 09:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: rtc: mediatek: add mt6358 and mt6366
 compatible
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220428064637.28288-1-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220428064637.28288-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_002030_887401_A102892D 
X-CRM114-Status: GOOD (  15.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 28/04/2022 08:46, Allen-KH Cheng wrote:
> Add mt6358 and mt6366 compatible in devicetree-binding document for
> MediaTek PMIC based RTC. mt6358 and mt6366 use same compatible data
> to store RTC_WRTGR address offset.
> 
> mt6366-rtc will use mt6358-rts as fallback.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-mt6397.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> index 55a0c8874c03..5b012d222f5b 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> @@ -14,6 +14,8 @@ For MediaTek PMIC wrapper bus bindings, see:
>  Required properties:
>  - compatible: Should be one of follows
>         "mediatek,mt6323-rtc": for MT6323 PMIC
> +       "mediatek,mt6358-rtc": for MT6358 PMIC
> +       "mediatek,mt6358-rtc","mediatek,mt6366-rtc": for MT6366 PMIC

Does not look like in correct order.

>         "mediatek,mt6397-rtc": for MT6397 PMIC
>  
>  Example:


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
