Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A075C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQi24hZ8qM1oW3SIEmbO3Vbi77+YdvqxsA6f0CmI3ZQ=; b=d/E5XNIhKgX4/tLohcJhb2CEjA
	LwZGadQJABsEBlUf2SoGHDGpS6x5rrsFSKLTWkSXhUrLhLgOmKINzm54tsRDVGBUd157iKfZldc8U
	3EBi/224e9RbvxbmVkY6fkmVkW+x9DWh4IgmtJLmGt2EukKanajGVuPdjZf6hqwjOHCgvUv/xUweT
	ugsw44iAO87JaCvRFrPf3eJy31+bGy/NkBWmDsT5STwjW9on1T2zai/8494O5KCCNecbLbv9SXpj9
	m4CK+oEbezg2HwGZx6xgFgmikFxKNrvH1t6tVO4XNJ8XAZUmt5QMxpAd0JTEK0drOiXNfeB3imE8/
	09NzJ1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnF3Y-008lgn-1c;
	Fri, 14 Apr 2023 08:45:20 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnF3T-008lXM-1b
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:45:18 +0000
Received: by mail-ej1-x62c.google.com with SMTP id q23so34341776ejz.3
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681461915; x=1684053915;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQi24hZ8qM1oW3SIEmbO3Vbi77+YdvqxsA6f0CmI3ZQ=;
        b=QkSjGapm2yICXR8TRzydwyFQoK1DQjUHDthBi1uSy4S3BJDAzE6gZvKmxVVRA0EOgX
         IOQE5Z+2j0dfTH1ViDxtyNr3NXw8cfyhZ7DNVbrnn4UeDhuaWgmjyJvdbxV4pUJ9F6QN
         GWklXLRqFwRq6sZYAzVmZkO3/nmeLEvwDOEcH+CTyxKQSA0XwuTuFZv8ENQ1ryaH0Zbw
         gu+zvc4nTo6Z6Ot9GBp6KzYHD2WS0nSeUH+w8ppB75fHbCQcw3WRKxUPLpBsgZgLveV/
         puptndWFp5Y0Y6JpQp/jqoi/xsd3D22rMdALcbF+TPM7MekbdiXqjvUdPzOVwmNoCYZT
         V60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681461915; x=1684053915;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQi24hZ8qM1oW3SIEmbO3Vbi77+YdvqxsA6f0CmI3ZQ=;
        b=AY7DHkHHsZZyd1CSIrs+8TnemYR1Jw64w5tAUVq4TfGRwSMs8hM3rVcXK6TyXqPwva
         GRTIFYePsNMlKHjYwRDv1wGu+EixLCuLnq8xVkOE4bJEKUX/wwwEWA7Tx+Xc+DWBFF8O
         azfb2wBMOJvXHzBkDxQ03vqIZvwmM1yOoD0+u/U6pmSraSmBg2vl/6a/yLMvl9QCvUsq
         O4JBtF3oI8LPqvVKVOyBofQFph/Skg3eCr56j+5CsllJ4uPy76sY+TAHMr6oHU1kTtWH
         gNG9smf52k3hUuVJRpyFcyMCP2hLCV1ZxURhOxUBpKZq97QNqaoY5S8r2hjsIVQQ0dzR
         RoWQ==
X-Gm-Message-State: AAQBX9fn09KAev2/146mQ/4gra57sIwJk9RgRsVmXcbuilpG7njd3u5G
	08Ams82woSiX6bFkgyFNqZSkkA==
X-Google-Smtp-Source: AKy350aTjtwNIDMwN8ZlXb38r4s/wrVWtQuLY6J9Mtd85Z3UUSRWT2tyfVutkOUFmvCkD+hAfLERwA==
X-Received: by 2002:a17:906:140f:b0:94e:2db:533e with SMTP id p15-20020a170906140f00b0094e02db533emr5322939ejc.49.1681461914929;
        Fri, 14 Apr 2023 01:45:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id c21-20020aa7df15000000b00505060e4280sm1862013edy.94.2023.04.14.01.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:45:14 -0700 (PDT)
Message-ID: <05d0ae30-1f1f-0bbd-c98f-70d50924afdc@linaro.org>
Date: Fri, 14 Apr 2023 10:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 14/27] dt-bindings: display: mediatek: od: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-15-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-15-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_014515_535405_5076D0F6 
X-CRM114-Status: UNSURE (   6.93  )
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

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's OverDrive (OD)
> block: this is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


