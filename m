Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AA9C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 08:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TU3iTOgUKCrTzkxasHDvYAEVuyaSKUnPm4hRffDvfg0=; b=w37JN5ZCRk9a6X27mSZpCyrLRk
	AWOuMZKu+eLSwAFSxhiVCxUJzl+waxUa5ja4BNsOBJCOrtzOyXYn4hE1qwg6DI+owrJisKJakXPUM
	ukiotpMEUWotyj62mwxr6Mjgm+BKpfC9AMjMX2e+MpSmkv2JTJdqv3i3+H8e/HjC3XapRpIQgqTJX
	dM4bdfu+WAgDkLD9wqaFWrfUrBoDBOtpOEfdzheokPOINSMOnLiW/7meMwoD4pMolX+4244RlgHNE
	SRmQZcvS4S/2Z2w7vFderJDUCG4cIopHnlFr4XKefrj8aYQW1+sU0t4p2ji1r/7oijoX+kWJZSr0/
	FWlnT2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3YXQ-005ULb-Of; Fri, 09 Dec 2022 08:15:20 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3YXF-005UDz-VT
	for linux-mediatek@lists.infradead.org; Fri, 09 Dec 2022 08:15:11 +0000
Received: by mail-lf1-x135.google.com with SMTP id b13so5883171lfo.3
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Dec 2022 00:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TU3iTOgUKCrTzkxasHDvYAEVuyaSKUnPm4hRffDvfg0=;
        b=aUBEkLHMG2a1aqywjROvKDCIe9ylxqURVXAp8duIfrydYO/Faf9AThcdockIisPXdC
         qxFezRTBRK8LHAlZx+trl6j8CpOkjldoIzNt0QKbrbUcNlpj2Q4j5/VUbRHoxeY5F1OY
         G0ZSG4thKqKkkEjRsoHIgYUfSLZA1H6jUgp7ObtGzIB3rjKjnOHRfnlvW5qO+MjGKc3d
         hXJs6sv5h8XQhLlevPcxk2i9M2+9F/IN2tzGlbUweA88xW0cAzvbGobLwNS6oI4nHd/B
         N1RqeF10Psn7QtA+jH/l5BkgKLoRrmrz2oX+lsg44+bkinouLR8v4mOgaW/5O/II4bVr
         p4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TU3iTOgUKCrTzkxasHDvYAEVuyaSKUnPm4hRffDvfg0=;
        b=F0DMuGMU7RFS0rooXZMQvBx6a3CqjzpvIaXxytC8Ppa7NJrmRYiI/snNjqZrbgih7B
         YZtQEzUCh8gEg9g12gf/e+PzWJ0pcGe8cbohBehbMeezYsRsLwZIU5lmOfHP85gdFe70
         rJ41Sts6noTfCdAE6mWakKR5ueDUEbbDVQ+JeHTlKHMJmp8uH5sGDETbYPjDhJJw4Oxe
         Zft0kkdFK2xdgKWNQHtfmTVDTKxYW52cs6fSbC80gXsK504w0b3qkXITt+8uLqP6GrZk
         uLDL9ZJUm4wbEv+7G0yhQTQj5IcHeSI7dMgWKT4A3iPSEIj9mXkjX0TT/dwuSTqEPPWw
         aLXQ==
X-Gm-Message-State: ANoB5pmnhY4pL5u3daTM+XlyrxSBc9pqg4stJeyXT7LlXD+jVpVfprjE
	+b2LMNKy2DwvAmP1+UaOU0uS4Q==
X-Google-Smtp-Source: AA0mqf5LH0oaXBX2oMln8F2dI/6wLckfhiUbmEX2RUMeqW67bVLpSEOEn0X/W+YSDlUTzAcknDlmew==
X-Received: by 2002:ac2:59c9:0:b0:4b5:6d7f:8cb3 with SMTP id x9-20020ac259c9000000b004b56d7f8cb3mr1162314lfn.11.1670573706925;
        Fri, 09 Dec 2022 00:15:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u27-20020ac258db000000b00494603953b6sm164105lfo.6.2022.12.09.00.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 00:15:06 -0800 (PST)
Message-ID: <6e5a2d2a-6d97-a84e-97c2-819053f1dd59@linaro.org>
Date: Fri, 9 Dec 2022 09:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 1/7] dt-bindings: arm64: dts: mediatek: Add mt8365-evk
 board
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, khilman@baylibre.com
References: <20221208153041.3965378-1-bero@baylibre.com>
 <20221208153041.3965378-2-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208153041.3965378-2-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_001510_086126_1E4FE825 
X-CRM114-Status: UNSURE (   6.15  )
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

On 08/12/2022 16:30, Bernhard Rosenkränzer wrote:
> Add bindings for the Mediatek mt8365-evk board.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


