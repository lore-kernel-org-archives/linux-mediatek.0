Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD89C77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2Jcp3MHbUi0An/a7aTvvHXRZrnAjkyy08HzPYUNJaQ=; b=qKWBLPYDtRmzueQT2kJYzIqDl8
	z0BJNuj7uD/wuDOyp/Y1WaqQBhY4wDRkie3D9ox8y5aA53HNamSufqTpOHBdfJ7HEMM4toR7uR5aj
	keLecTrncCrfiHVD980+KA1fPmIaFBJ+oKB6NudPW9B4NIPWQ3E/F9ymis4h7NaWekOGn0q58pK8/
	51S4Mfd3JW/ZFm3TSuG5gw3Yp3vYaT0kkl03Fg9fu6/SMN+8bKHjxlDEvM0ob24uRRUvPyU3Oa7Xz
	uqDkcAYCok7X/kdnQfM0xo5NyRcdpvVW167AvZVU3gGSBHJS/CGJSTIOmkF7hbsRn6xCxIwNIk+yq
	nEnSjnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEjX-008g70-1K;
	Fri, 14 Apr 2023 08:24:39 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEjT-008g4I-30
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:24:37 +0000
Received: by mail-ej1-x636.google.com with SMTP id fy21so756889ejb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460674; x=1684052674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e2Jcp3MHbUi0An/a7aTvvHXRZrnAjkyy08HzPYUNJaQ=;
        b=rOK4LSiTwFa45v7CqOu0/5w1TpdCvImZLKI0EreaaDS4Qt8uwnG/N6J8+2tejZ0Ncx
         Vu2pwvpPgpVPBZq0kLQBHW6NYYiF5FVcS0HyUTJqmrdDJrKW7ItcUjIC4JkDbd5VLnjK
         jQPtltLGQj9//1ahJFAjqgXcv5ZN0eTiR4+ifdVmQRSoodnUG9sBuhBHSnJGoC8lSra4
         z21dv4CWbcfcU15KeXgSir6XRYKF+TPCryNDhGOOI68A844uJlTWWJzf6D7mT2tRgvuX
         e9ohtOXM0207XaiaLqe6FZHBL1QoaUkHNH+IvgYyuQNxKFlk9QbNq5rZ1AE9zbbsKyRM
         UtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460674; x=1684052674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2Jcp3MHbUi0An/a7aTvvHXRZrnAjkyy08HzPYUNJaQ=;
        b=GSGCelayu3DnJNSOX/Cq1RcchYzSEPDHRisIu9YXuG4JkDKYDpoK2a/T+LOpTm7/G3
         2emPqQ1v80Xly6v3d0yosxjOCg93tnI4z8UBqoraRnmM4mcSWWwhZvjU/B3DOyEWeskE
         02uW7kJ/Viomqz0W3kmYQ8CycSTJ+ir6P8EqjU7l767L9D9Aa6gsk+WGsjTrfGn3b3Qc
         CoFNV0ynn2F8LbS6TxDc8Zgqz36+RyWawOilyMXVKmNE4ACSWcyLdGqTIsqTPCt2G6Y3
         ehgjvb/eCxtEsV0IDPU7H3NCpukzuu3OUkQzj/WjFyK0N9kAjSeaN9B1KxXA0qWges10
         PZiw==
X-Gm-Message-State: AAQBX9dkYrwBRvTsEs8vB7jHQbIhE9rwqFG9n/I2SIov97yAQjXis7Xh
	ogp17p0e9nWSJU6VVRDi2gx4sA==
X-Google-Smtp-Source: AKy350aZW4Ylqj7ITSxe6hxQlasg4qhTISV9/uV8NXP7fxhQ71VUUtZk6WFshZK1/CWOD71AeHcviw==
X-Received: by 2002:a17:906:4312:b0:8ae:11ca:81de with SMTP id j18-20020a170906431200b008ae11ca81demr5357467ejm.34.1681460674536;
        Fri, 14 Apr 2023 01:24:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id h7-20020a170906584700b0094e597f0e4dsm2062292ejs.121.2023.04.14.01.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:24:34 -0700 (PDT)
Message-ID: <fb79c6df-6a7a-7988-0c3f-6fbdc05a593a@linaro.org>
Date: Fri, 14 Apr 2023 10:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 05/27] dt-bindings: display: mediatek: dsi: Add compatible
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
 <20230412112739.160376-6-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_012435_968171_0A8EC4DF 
X-CRM114-Status: UNSURE (   7.27  )
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
> Add a compatible string for MediaTek Helio X10 MT6795, using the same
> DSI block as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,dsi.yaml        | 19 ++++++++++++-------

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


