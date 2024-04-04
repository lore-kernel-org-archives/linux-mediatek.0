Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE18CD1292
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 12:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RSXGCksH0heR6DFO0nV01ue5V1oLX+iy56EzGNTxF0=; b=Ef/sXN+T49lRte+YVFvJIkoG7O
	xq0eikF/vkmbPPLHVSanvXGyR2oHkEuccXUaPw87Ia9VuOtOwq/WM8y00zKs2nrXWIJ8+NUVOWIPH
	oF97LmEWuQNt7IykuKxfQ0Nd5PvmK5SqbJ6uZDMHpcb9Ym5MaqHdqeotL1uppnDVDWR8KP5IyFAaj
	RthRbU0mVx1CULmxH0QgpTlxd3OmH42iy9SJY/BGRPhNOmANIodxfvfesorEOMIUAdaooAyhOQsKW
	j8c0AtIJA77SIerrWEC5xKCqxKdAko9Y3fmxSTOwrE/LS/fS4qu85gz6ObtVJtW9E+eq5Fko3lMD5
	hYnFHJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLy8-00000002Wi4-1bzY;
	Thu, 04 Apr 2024 12:13:24 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLy4-00000002Wgn-2g7Q
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Apr 2024 12:13:22 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a517a492055so135994666b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Apr 2024 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712232797; x=1712837597; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9RSXGCksH0heR6DFO0nV01ue5V1oLX+iy56EzGNTxF0=;
        b=DI8TQE4MinIG7//jyhPC/8cMu3ZH7RyqLnl7rn2HjBnEGIlWoRKVcFMUbI0jBJ139Y
         T8X60x0qyorspHnHv9EvVf9f4uJo454cPrLxODpkAKeFalWY8rkVTI+bHvo/GxI7kUFk
         y3c/ZUNT+UvAoYWdTRD+jqrh3wzn7sDfaTZwjrARZiFKeTemrUOtugEA9NWzGznszT+k
         OtnnkNwCRsiJD7ZSAd177+UcC+6eIoFDR4wDJKLIx0H+4SEqZDIHU9vQUypcbXg0K3J7
         w1zNgoXiU0COJ5uZKbnWNeY1DUU4/CMJwAAisGZfCU/jK0jiBxIoxoc0uTlJJZCCyfbH
         TGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712232797; x=1712837597;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RSXGCksH0heR6DFO0nV01ue5V1oLX+iy56EzGNTxF0=;
        b=o7Ql6kpoSjs05982E0328F5/2+3IFU/2H8q/027s8oye4Z1Tte2FZEzt87HdxhM5p5
         2J7D+1BT0Gp8a3wI2FqlktyCu4Brb4nLEzPAFF1FpUpBJjcbe1ZKKHEurppGwurSZXIB
         WEaryHr1HTiEriMZkoKLjO7MVynPb2ih7v1O6+OQjgz6APHlU8qzH7hq17kARZP0U1ah
         N9qgEtK/zIVJ25BiPENl22Q+lMN9Lq1k0MzW5xQ13R/U89pRJC/ruOyiwe4vO9rjJ16i
         GXNSQWlXmthZvWyRxKjfoKJNSgTtT1yBBbfJgLe6IcjPpm93udPAvzIs3ehVP5yfWW9I
         tMFg==
X-Forwarded-Encrypted: i=1; AJvYcCUZtRSWxac7CZ0IEHA5C+IHPngYwfsqblfNJUzd1HCI0PCnXwlgrZXD/B7t8rPRNxbsq4L4Qqb8qjarxeINbb5KYwScadaHJ/2crXjNMfPBtPWs
X-Gm-Message-State: AOJu0YzMTUjuPrpoEBNX/KxoS5dEEWWgMm4f5tuysVOh89U/YGze9bP0
	0jlq09WXjGkIcVAtj7Ta8fFZk3yF9cPCGJSun389tS9ib7Rlv1uU071FsCb9cG4=
X-Google-Smtp-Source: AGHT+IHCUc5CYkRQzEFeUFI3Il/6mWOMB6j8B2NoGbWe7A3ruzFAOLHpd7Q7peA3VEEF/HcXg2Rrcw==
X-Received: by 2002:a17:906:c0c2:b0:a4e:2683:53f4 with SMTP id bn2-20020a170906c0c200b00a4e268353f4mr1409092ejb.59.1712232797463;
        Thu, 04 Apr 2024 05:13:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id q2-20020a170906b28200b00a4655976025sm8920438ejz.82.2024.04.04.05.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 05:13:16 -0700 (PDT)
Message-ID: <f982de5a-a7de-43ee-82f8-1bf69a9a3f5b@linaro.org>
Date: Thu, 4 Apr 2024 14:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pwm: mediatek,pwm-disp: Document
 power-domains property
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 u.kleine-koenig@pengutronix.de
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com, thierry.reding@gmail.com,
 miles.chen@mediatek.com, xinlei.lee@mediatek.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240404081808.92199-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240404081808.92199-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_051320_694138_187C65BB 
X-CRM114-Status: UNSURE (   6.08  )
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

On 04/04/2024 10:18, AngeloGioacchino Del Regno wrote:
> Allow the power-domains property to the PWM_DISP block as on some SoCs
> this does need at most one power domain.
> 
> Fixes: b09b179bac0a ("dt-bindings: pwm: Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


