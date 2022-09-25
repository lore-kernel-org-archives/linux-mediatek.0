Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B99EC6FA82
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Sep 2022 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOQ18uD71Cw8c6NYAIsA0fwMWSjBMgkiFJNuIRqvHns=; b=ka+JQD6lcxuRrLS2qDBC/1jgrQ
	+ondCnB7lrPT51IzRMFablJmlZvSGBH4NP/zzfAkDV1yUnXU616SpDa+lUWtM4C2dPFz3dX6HOWXd
	GimsWIqkD06BpeTzEYFCuFyxccEGSopZAuIZPKsbGm+6Wulfa1DD+TfjRq71VYJHbgoFliJT0WGNP
	CcvkjLu++7GzQxERBq9R0w3bWkauuLgbLnuJK97NoVTJTpMB+WDBgQEn6//bm7Mp90XQa3KyQpH4/
	snSD4kpRxOU2dbrjD76iR8EQTxCYWRh/f41JHa/sedzQhD+BAnOyN6KX8ivJjKHvMxpCI41mVwgtX
	e48VAvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocMWj-00BzAw-6S; Sun, 25 Sep 2022 07:58:13 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocMWY-00Bz6C-3D
	for linux-mediatek@lists.infradead.org; Sun, 25 Sep 2022 07:58:03 +0000
Received: by mail-lj1-x232.google.com with SMTP id t16so329073ljh.3
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 00:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=aOQ18uD71Cw8c6NYAIsA0fwMWSjBMgkiFJNuIRqvHns=;
        b=w5PKuCKsWy0fzkRzBxaHO6EX1SP1e9B7jSRg2VsIlcAU1a7cImbYte+pvJv86zsnOZ
         pWdY0fZjOoBE8/roNFKZOrK0uaAY6SOQRh3TT4+PKlMbC35iFYF+Z8WP2nA2PGQqebPD
         Zpo0h/PQMlxMTZXlPWuRRo7ldNbyVzW74jieuPURJBnSTAjWiOLS77oWegoEzc59/w0a
         kdske1obWXTyVrmEcOVSybu2l+cbMoopIHOTB0II3SmYXv/ji+jXcwab4pxe/msw06CX
         vGGzOcEfnQBSSEjfTax+sFQ8kbL+c+4WSafMkPzguymGRozrV0jIZVcZZrezW7xjQigY
         roFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aOQ18uD71Cw8c6NYAIsA0fwMWSjBMgkiFJNuIRqvHns=;
        b=hRH3b+Av/5qLPDoWN6UcJOnIsUOaEC1+ATq8jC5YRZIFU0miH2svQptvfdqHNP3FVG
         Xy//4s/qBpkxTNxmpWb+z00R9yvYLGziC6urWfgh3ANrlCzc5lwi717yRjXfPrxw1+6/
         Z1gnytDxaOKsmm5gA0+APRsNUFivJITpcQ58Hu4rDC6KA6js5CvruYzqy4Vo3EgMiQfN
         mJMZgeTMfUxLqAa6dbC0CKJMvpE5Uug8LZw6xeJDyrVwFYsbEGQhIwo9IyTHqULTVqhf
         CDQ6lSy2E6WrBKCRP+sMbyyb2kqW1/7Dqlj+jAhdZfSzOdEDLc0cLbvLAoNR6ayu1aY+
         tkGw==
X-Gm-Message-State: ACrzQf3zemefshwkoPRaUMoKcJLqs7cQ9PaT8H2IVsq+HZXZGfNgE+/K
	9eGFtJ/UyVuo1WBe5bPLxgCd6A==
X-Google-Smtp-Source: AMsMyM4gl3KT7W/oNLZQByjKULcu2XZTzg5qzaQvvdGiUCf20TWpaFmsoVQElRlxY0uU8oxzgPOTtw==
X-Received: by 2002:a05:651c:383:b0:26c:4e23:a4bb with SMTP id e3-20020a05651c038300b0026c4e23a4bbmr5624788ljp.530.1664092679066;
        Sun, 25 Sep 2022 00:57:59 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d25-20020ac25459000000b0048af4dc964asm2144459lfn.73.2022.09.25.00.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 00:57:58 -0700 (PDT)
Message-ID: <a5838d66-21dc-4905-03c5-ea049e3bd055@linaro.org>
Date: Sun, 25 Sep 2022 09:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 1/1] arm64: dts: mediatek: mt8183: disable thermal
 zones without trips.
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 daniel.lezcano@linaro.org
References: <20220921-mt8183-disables-thermal-zones-up-v2-0-4a31a0b19e1e@baylibre.com>
 <20220921-mt8183-disables-thermal-zones-up-v2-1-4a31a0b19e1e@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921-mt8183-disables-thermal-zones-up-v2-1-4a31a0b19e1e@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_005802_167269_6A3353BD 
X-CRM114-Status: UNSURE (   7.69  )
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

On 21/09/2022 11:05, Amjad Ouled-Ameur wrote:
> Thermal zones without trip point are not registered by thermal core.
> 
> tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
> only.
> 
> Disable the zones above and keep only cpu_thermal enabled.

Please test your patches before sending upstream. :(

Best regards,
Krzysztof


