Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CE2C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 12:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVRPkDEbACvmkZC8kApIS7yMdkHthYtuVHRwDkmsTFY=; b=z6GyLAMWcW5f5Ym5nHyXbeFhM3
	y6UpGtA1CK7Pylkq7OprwDwHq1mQ9HqYshYWh0UBX0xMv9Ivbpe3UFY0G1KNySWq9wOZopZsetj9/
	KlHbaJktrjJd4Bu6x8DUsgKnl5HU9+eEuSSLJZdeS8Vt9510ijeFnW+bGgavybaNh2aBbWaYTUCpT
	N/nkzLC03+ELwuziYH65Jv0n18sxdjMuiwhoxdOvAkcR8xE0zAKHpC0AABJnX+dU8/sA9P1OyCBbj
	r6OqRLvUNAoLlDWx1+JIYICMnA1hCIFnE6/EL6NyCz8yX0ccVwDS4YeDwJb7kaY/8fc1H7d5BNA31
	4NsO4NpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiE1j-004AxT-PR; Tue, 11 Oct 2022 12:06:27 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiE1a-004AwJ-C4
	for linux-mediatek@lists.infradead.org; Tue, 11 Oct 2022 12:06:19 +0000
Received: by mail-qk1-x734.google.com with SMTP id 8so828098qka.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Oct 2022 05:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVRPkDEbACvmkZC8kApIS7yMdkHthYtuVHRwDkmsTFY=;
        b=NhH0A06ZPTKy45tcwzqP78rP8uzdihSRJD6UVIGQ2MBlCI+YSqrT1HQVWUnG8YAcAz
         gPj/dwH7zowzWBnlmrUG0QyMpQEWPR1mid7e0+IeeTlzWVubMTzwtKjlqtpEAVEPnesJ
         RE4rWeqdhXj4NMbVcXvcXxueWvvP+HJ7QmW/i93RLKOenyQmJ+7YrXQaCTWII3oF2LEs
         AQ+4sKPQSqXi4e4IvbmQ24fUD2rpEw7Jf/10Pbc7VtClMuNVy8p2YvX4ZF5JvyAYac8M
         OVgtlrgxYEytL0G7Itva+hbTYfuZDSINva/G24TC48CsG3eR1P84ktPC750qZSZnGFB6
         ZSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVRPkDEbACvmkZC8kApIS7yMdkHthYtuVHRwDkmsTFY=;
        b=5y3CFFZFjgSqP18ZAw+9e0AiW/4MC50I92TLykhBIXL7HdxCTlROb7TBrusEPdxPYf
         BlReOMdR38C4Gf9qGeM/EGyi604F9wI9CQR9ma+AXzUXQg9eCIhl6sDLmbhFb1eVKpRf
         Kvy6WCTMJpAaJNsC598p7AleJiLaLgI+1je7TDEi0IsXxRYP5wjmfI8heS1yllO+/riD
         6bNoUng/ePRCBuPALtb+EYoQDGBN5/K8jx1KBoLXS896FYKla3HCJrHaEKXFlbdsqlMP
         ygnoa4NsqSxLRRNJk+fEc4GaXF8BKcuPWifFp0ZfSJPLf0jCISJopXQha0c6xSi15vx4
         dyHA==
X-Gm-Message-State: ACrzQf2Gn0hGW0dV44vNotfAmplIlxZhFFFFzl7RN9nXzb9aEPsz+8Dd
	bztjR0EWWVSXYTT6+Tcxb9Tq9Q==
X-Google-Smtp-Source: AMsMyM6OjIpqGMDaEgzj3/3BoL+9VrEq3Jr15zfY2zwCSrdjnFPPz0n+ElpXLJIs9GfTLc4SnGylRQ==
X-Received: by 2002:a05:620a:1b9b:b0:6ed:35f0:9b56 with SMTP id dv27-20020a05620a1b9b00b006ed35f09b56mr5955854qkb.196.1665489974107;
        Tue, 11 Oct 2022 05:06:14 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id b26-20020a05620a089a00b006ce3cffa2c8sm3428470qka.43.2022.10.11.05.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 05:06:12 -0700 (PDT)
Message-ID: <9afce114-1a0e-a0be-c07b-a78740e2f108@linaro.org>
Date: Tue, 11 Oct 2022 08:03:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 3/5] dt-bindings: regulator: Add binding schema for
 mt6357 regulators
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: broonie@kernel.org, chen.zhong@mediatek.com, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, fparent@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org, robh@kernel.org
References: <cdb4e9f7-c7b3-3a1f-bf61-e42bdb021570@linaro.org>
 <972ba839-2fd3-2b45-3477-0c7e3d32f149@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <972ba839-2fd3-2b45-3477-0c7e3d32f149@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_050618_415752_92A978CA 
X-CRM114-Status: GOOD (  12.69  )
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

On 11/10/2022 05:30, Alexandre Mergnat wrote:
> Hi Krzysztof,
> 
> Thanks for your review !
> 
>  >> +
>  >> +    properties:
>  >> +      regulator-name:
>  >> +        pattern: "^v(core|modem|pa|proc|s1)$"
>  >
>  > Why enforcing particular name of the regulator?
> 
> The regulator names are forced to match with the datasheet names.
> 
> I think it's a good practice to increase visibility between HW & SW.

Enforcing is not a good practice.

> 
> Also, that keep consistency with other Mediatek PMIC schema.

So there is a bad practice and instead of fixing it, you align to it... No.


Best regards,
Krzysztof


