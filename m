Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403E2C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYaSNvD865fCT97F0L2xR1Bm2H0BYse+wXALebMN8Dw=; b=2PhULrc+xYQbKsVkY0inWn8DKb
	8MfmFwEhylHlEc7pgx9h/YP9GTgdAC4Xnz70nZMAHzEk0oUMQXu2qZQzE7AQbE9mgVOBVP+L8wDT2
	JpPd5IQrhsH5rRwKXUzRjh/qpsbdcaVDU9l9Co2UBH7b7IayeGN/TQ1uFdHMs7U/x4H+hJrr6AFlX
	bSgAi7HoZdTiSFkJ+s0yrd9O8n1MJWUU2uQ4oSQJD6Hw95qfLGtgIcgm9UImUuvv/fju9bp152lOB
	UtjHEF1zmU3tvjv2VPAvFOYvLKYtonrV/MTJJw3JpepslGF8NIrAhBBChoPdG4xD81CKyCmFeka7r
	Fqo/FBIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmro7-005LCW-1z;
	Thu, 13 Apr 2023 07:55:51 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmro4-005LBC-3A
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 07:55:50 +0000
Received: by mail-ej1-x62c.google.com with SMTP id jg21so34891889ejc.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681372547; x=1683964547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYaSNvD865fCT97F0L2xR1Bm2H0BYse+wXALebMN8Dw=;
        b=YeoNBncNdratOA+nG4/QQmfDFmk+aRb6ZOjShBnjbxGcAIXWr5CFcu8lH3rlDEVkJS
         +OOAyx1sXYEyOOmDuET+oXxmkbJNH5bOrZCe7KHlRKgTHwjdAFiW6QDtz6vXm1P0Yk1E
         mZoySTs564ndc1owes8C21jnstyzCwwZX67tza3wC65AqZqLQnX+GdOhMuvKE7oAZt/W
         VeMrqSK8TTAWHLXG095rRnX6IQY8TrdiIRphf28Bx0fYCk7s5dR0FqLqsG67iq1jhNgI
         3/bPm0sEj/+ex3x4ifW5lCtyLkiV/GGYMOKDbTjLs1oRnp8E2BQTRfQDwVHEenbh0fWM
         kJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681372547; x=1683964547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYaSNvD865fCT97F0L2xR1Bm2H0BYse+wXALebMN8Dw=;
        b=NsN+IW8xWFu2opBtLf0xRx0InQ0sg5mPNGfrtGtqLUpCKHZJJkQm03/JBKI2YEZrST
         AM/4jZSbrJ9+TYZrzYHioGBgQoj9r0LwHQjY5g2qH7sl7VtRhj4V1FbPySQEyoijTmkT
         S66wUBhQQQzOjKPQ0YIBNyJwjjvLEiht8G2yyS4Z3DBRItBLW/rKRiA7fzrQDd3f/DlN
         ptiPXmiL0WUTXo3KPsbHDI6L/VjfnZboOVIPW3afcjwH4Mam5Rj1L16+bbLIOxAc3epD
         S5ziA9dkKcj7cX1yrmRnFHV/udpGYARm3n2l+n4aC9Wzap1NwNctJdGPsjOtWGUmcKtJ
         hPMA==
X-Gm-Message-State: AAQBX9cdC1bUmDlXT9vXL6ayfopSDiIWsmLMtk2HOaRfatw8fbX3O3Uu
	jHqKibTalsusmf9WLcWa9t46DA==
X-Google-Smtp-Source: AKy350aKrgFbJ+g45nZKrL/st5lbS76IIsZLLcs6i317bpl/6vAUsECE0H23wl9cmPxFfPxWYwk2lQ==
X-Received: by 2002:a17:906:9e1f:b0:930:f953:9614 with SMTP id fp31-20020a1709069e1f00b00930f9539614mr1570602ejc.1.1681372547646;
        Thu, 13 Apr 2023 00:55:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7? ([2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7])
        by smtp.gmail.com with ESMTPSA id lv25-20020a170906bc9900b0094a77168584sm569716ejb.125.2023.04.13.00.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 00:55:47 -0700 (PDT)
Message-ID: <e51d76e6-2fa9-7081-7d52-f78f70080c1d@linaro.org>
Date: Thu, 13 Apr 2023 09:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: dsi: Add compatible
 for MediaTek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, shuijing.li@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
 <1681366162-4949-2-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1681366162-4949-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_005549_023867_5ADD9437 
X-CRM114-Status: UNSURE (   6.61  )
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

On 13/04/2023 08:09, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dsi for MediaTek MT8188 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


