Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59144C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/cG1woHh53iE47t9IaTZRCKGzkSSa7msGm/VhK5acs=; b=TyD5KR7VSPBDWOD0njOu6SG/Lt
	PbMtQaCdBDK0C00+fvsQokcH65xPhMPy+M85BkyMFJ7LLIFa1QpJ24vW6Sro3+hqX9mg8SqHpOTPD
	ohKeisVQ1pQ29wgPf1ZRL8CUuKtG+xd+VvXClt+PkXa9UxHXc5R2hIlM5nPCEwGQrU2KMqoK8y+Ub
	wP7B//Rq/ffqCp+z769ZcrzhtToDZ84m3TKtCnxtTTgtlxw/kzsIRFJVyoQ1jPFeIEdaOr+pkAI9/
	0++V6HMYP88uILRIXfwOpW30H0GSzrhz1eoXZiB2i6HqVjsg2Dl7AHJTJIJA4RrVgQlZr5n1gpWrL
	KhS5nQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcR59-00DQtB-0c;
	Wed, 15 Mar 2023 13:22:19 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcR56-00DQsC-1G
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 13:22:17 +0000
Received: by mail-ed1-x529.google.com with SMTP id o12so75450308edb.9
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Mar 2023 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678886534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/cG1woHh53iE47t9IaTZRCKGzkSSa7msGm/VhK5acs=;
        b=Pow9GvwqHtlC0BOvs0ezBbgaYHV1fPye+3TLKkG54DJjkKbhnZ0jvlBHw2AU7b8xk+
         xlyLpnuvF6TO4/Xlw3hjx/D9jn9U7lh1TOA1VhYXCwT/ENqpDfkaXE7uTOM0lEPv8BY0
         X9hSLHtDIH1hLGjLbyDwUMNaL6t86ek10Oh2x2ou4ZAG31I9uaPyQUD82MQdcHZb5nrQ
         y0pe/Wjfscfxi1+n0D8qW/ARD3wKOPhonm6yf60hUOlHOAQR8EE1RtDTN9czBoMNJDoy
         uwl9HTafH1IbiWmNx7Eh9Xl9w4Ko+C6+AiB1IvBGOriWO7bHbDy7EVEpCj+Fz6GIQYA3
         2LdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678886534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/cG1woHh53iE47t9IaTZRCKGzkSSa7msGm/VhK5acs=;
        b=XDL8crEOCmb2KiiyjKevbefwWekXPJAcVz2GQr77p8K2XarFeTt5NQZkv22qEz5ZVN
         aKOMBPqQkg1RuFDVZ6WUmMtMFySFbmap5MX9qdTP9eA6ZmRD53T1UQn5/JggEGuiMPbD
         NJze+mAKCchuo4W/CIUwf52DtafIowik0f5AF9GtKgN4+lsTU9dv3kzgKARo8RoZQ64+
         8hqB7K+gWoTrWbbj2znkednEv5EwLgSA2kcKO9h+YmOfr7Zl5qkthgZ2pUJN0EDv/qtA
         RTcJVjHe4NCK2Ksf+VWjVoFP0TAQ3D1iryQ7AOefalkmc5vv8XXCTvblPQI4gbDtYdkU
         vXRA==
X-Gm-Message-State: AO0yUKVifxsm0Bq5NjDtN3jAoCggNwYnvmxNnIgghGY3dV/prRjzX6De
	+RLgkw69/SMGkFuX0/T9GreUKw==
X-Google-Smtp-Source: AK7set9OR91fwXBsgIoFh/ZQ0DkKpqVOc2a+qrrIMeS4gnjZr0ycWRM6ou2nEein8GfBPtd1Otjl3w==
X-Received: by 2002:a17:906:4ecc:b0:91f:9cab:3edc with SMTP id i12-20020a1709064ecc00b0091f9cab3edcmr5490125ejv.51.1678886533882;
        Wed, 15 Mar 2023 06:22:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id v10-20020a170906858a00b008d173604d72sm2534521ejx.174.2023.03.15.06.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 06:22:13 -0700 (PDT)
Message-ID: <d356f2b4-354a-d4de-6e7a-6392d1943cdc@linaro.org>
Date: Wed, 15 Mar 2023 14:22:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/21] dt-bindings: soc: mediatek: add display mutex for
 MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-15-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-15-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_062216_430601_914871DB 
X-CRM114-Status: UNSURE (   7.93  )
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

On 09/03/2023 15:23, Alexandre Mergnat wrote:
> Add compatible for the MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


