Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17B5C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 14:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPaU0ihKUwES7YP9bj8Bd9C2gOMIphuLTRBALZi26BU=; b=nSidJAMGtT9l3U2lkREULpqOND
	YAJxZ2TZSpSPLOjxwRb886GD300GIWr5acsRmQC+GZt/BtRe+9PqxNe1VdM+aEeybCDuwSKd9KLS6
	vCrJsEJeQ2Fd117xb24owirV+V/Cv2lQ+NFSB36KUOxNR3xTXVRCGyF7JTkXyLvsFcVLQdkwMqztw
	l0MMp2OYuTb8LBzZX8ezQyj6v6715Ye2ETKt+EssX0aHI2Xa4dw+m22Ooge2H7EVHyWbfwY98Fa/y
	2mV351bvmCmI1jZ6fsD/WMRteUOMOW8pLQrGl6HX+f8gcQI1NuRXHm0KVvmM/Vky7Ol02Dom5BqXO
	tDogSaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqdi-00HaQJ-DW; Wed, 23 Nov 2022 14:22:14 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqdC-00HaL9-I1
	for linux-mediatek@lists.infradead.org; Wed, 23 Nov 2022 14:21:43 +0000
Received: by mail-lf1-x135.google.com with SMTP id r12so28419606lfp.1
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Nov 2022 06:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fPaU0ihKUwES7YP9bj8Bd9C2gOMIphuLTRBALZi26BU=;
        b=gkSrT0okjpIU3rS9gH1VkF40Y8OTIsxn1QE4ZRCvUuMZ4BQvzLb70BOcrnHYGI3xn3
         JaWnc6IMI7X9X9RKfh+gll6/e3c0oPzTX26soNTwc1aV8a1hpxYimq+ZT2V3Veg1wvTn
         yDFRMrPWTUvVt9L+Lir8BcYe05hUxNyMDdTTVsncUVoWTJZVLUZuvzhIQ4SeyNHDb8NZ
         7baJRQJaJOZ2Yv2pbWOtmr6YFXAXgNNXBAMr/JRuGXve+WHa7oT3RnZ1jskKOrpbQHPr
         8ZjrJqxZaBRPAKj+rfu2axf8G43ocj2BUas6cC1gpfQ4nUkzWWgpFcifDjJLKAsTorVp
         +ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPaU0ihKUwES7YP9bj8Bd9C2gOMIphuLTRBALZi26BU=;
        b=mLAArQ7LaaRfIknVL/rk3osoOUkIjKUIl3l+NEvj8T55JDBU4p9EdHPzNZwUtAA7yx
         vy0IAUfAjrDgddOai6berDGNmHJZcXcp1SBNQUSlbdprTICD7aIX2FbDXo/PbPRlSNOI
         u7d9X+Xj6VzqpxyO1a/QAj2ynwan/UqNUduAPaAn0BkgR2y78KdlJ+1Vvbt8YCCKa9Nv
         aGizuHgLJxaIEnxqB/iL5OQssSjOdYqFQ5jldCHBa3sJxYRcEakQ0KxHV0UVQHf3hNnN
         cg7bzZw0Mx/2S9Vi2aQO+ohTqgvdyWvNjIB+UZpnvsQMQVpDSGtVwmyO9Q9hndc9IfQ8
         ee2A==
X-Gm-Message-State: ANoB5pnWrBwbAxBJ3J/P7yGnESlgXRaMV3H3Zny9ThK7OLUomc+TwCNT
	ynUwGBPDzj6aV+qlPFbcY3i+wQ==
X-Google-Smtp-Source: AA0mqf65BASzQ9odKyts8fSIaGACST3o+M+biAHrkO6WGFuKG27m2PLivwFY9m7W+LJd4EblbphEMA==
X-Received: by 2002:a19:5047:0:b0:4ab:7f8d:46c with SMTP id z7-20020a195047000000b004ab7f8d046cmr9176339lfj.383.1669213299925;
        Wed, 23 Nov 2022 06:21:39 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w1-20020a05651234c100b00492e5d31201sm2900837lfr.7.2022.11.23.06.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 06:21:38 -0800 (PST)
Message-ID: <b8919fea-a787-58df-ec47-eddbb493e6a2@linaro.org>
Date: Wed, 23 Nov 2022 15:21:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/4] dt-bindings: interrupt-controller: mediatek,cirq:
 Migrate to dt schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 tglx@linutronix.de
Cc: maz@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, youlin.pei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221123112249.98281-1-angelogioacchino.delregno@collabora.com>
 <20221123112249.98281-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123112249.98281-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_062142_600631_FBC1B96B 
X-CRM114-Status: UNSURE (   9.88  )
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

On 23/11/2022 12:22, AngeloGioacchino Del Regno wrote:
> Migrate mediatek,cirq.txt to dt schema as mediatek,mtk-cirq.yaml.
> While at it, I've also fixed some typos that were present in the
> original txt binding, as it was suggesting that the compatible
> string would have "mediatek,cirq" as compatible but, in reality,
> that's supposed to be "mediatek,mtk-cirq" instead.
> 
> Little rewording on property descriptions also happened for
> them to be more concise.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../interrupt-controller/mediatek,cirq.txt    | 33 ---------


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


