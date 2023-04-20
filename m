Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B87C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUjeJFJdOehqKEp3EDu0sSCTfsxNh9OJznbyLrn6SLw=; b=fsYfeVHICNa0UsDdOE4rVLnLUg
	VDSesAnNaP+ZR/oCC6henXfhGI/ds8E5BWsIMpZEvhHqIHROEkz/L2wv1s530TkMGB6M/tvmd4LNO
	hQSV6mt4c/YuRp02WSqmBqhIo0M+/XqjTLhvX3UQB1UA4iRxwJdB/PGHx3XQikYb5yZ20xDIKdIB4
	NjnT7AFVayn6HBde+GfUIiZNCgx1rmBlAE3qBsgo4uYQaoll4dw6QXmXsLnQ7RNGQ7bugCLNuOFrp
	2e4YXxtVOLHg1Ungwmh47JMUvK2fqNMJf4ab7avoCalMwRcWkjMyeMxW9N9zLY0HHtLPwbN3TEmSY
	x2TqO7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppWXu-008Sbv-2x;
	Thu, 20 Apr 2023 15:50:06 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppWXs-008Sb6-1d
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Apr 2023 15:50:05 +0000
Received: by mail-ej1-x62e.google.com with SMTP id xi5so7279713ejb.13
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Apr 2023 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682005803; x=1684597803;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUjeJFJdOehqKEp3EDu0sSCTfsxNh9OJznbyLrn6SLw=;
        b=m1uCicstQI0hGkjAbWwIjd6vTdAVf/qeZzy2/WT9nB1gaGJ9o3ZqJPJmXWHfBHS1VJ
         3NsRzNmjx9ceKmK3fkJ9sDCBkMYhsIGmtCH25In5054W972Ukpvzh7O/qgdXGM/hkE41
         /17KDplrFzJ1ZoNlsFQUo1AxzDXRMFX6DnlVstd73ClggwDM+BlTOxAyOYeuWV1ZJqAs
         8nY6t14Q1+BTBF9UkHCyCC1FVIzqIX0JjWiNtg4FZII1mMhufsmrOxPf8lvHf16cN6yi
         hKsIZ0g7PCGyMrR4XOkoz3/X4z8D4KnJx+VgEoAeDs1sX+noLysE/wYOiZz8Sc5Uzp7+
         Sc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682005803; x=1684597803;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUjeJFJdOehqKEp3EDu0sSCTfsxNh9OJznbyLrn6SLw=;
        b=DZiME8buvfroM1oYP8nzHMQZROsX4EleRo30PRn1eK3ELlw1JF1YDdvUWCq3LBfqAO
         Fy6udPXtH/FA+WCeVLCVKxD1fYSky6xjfMZcwyso2rhYAuoX41D2HpnAQn1vqEuQOY/a
         2hMoJeKQIzh9MPHTuWNry0zsFk5pWBAjHybcOrjAWHctLYUYsR7LN6zHqGgu9adN0d43
         cYZW5oK2kNkgmQVyH5FpXkwhwfcs1nir+Up7Gqf4uJw9p5GqqFMeutMRukR1HhtoJRF5
         i0BiqyVt1td29NzyvTRS0xzHWpFFtDVJU284QbbZzO2+Kmo+9+roO2Pd8ar9a89N4ioX
         ntpQ==
X-Gm-Message-State: AAQBX9er+WMa8NOHhAUJ9bxkPIG3SCGZBehagB94kR0Jsc2m8pmcbdaZ
	JxLwdPWglrXdUCcRMFo2730GbQ==
X-Google-Smtp-Source: AKy350YDaBKhwl+5wu1izAvYdwnvSzsDrXYRCK39dnDeHVpecX+2NV53mczkEOPg1LURkaolRvl+xw==
X-Received: by 2002:a17:906:b20c:b0:94f:3804:5cd6 with SMTP id p12-20020a170906b20c00b0094f38045cd6mr1813554ejz.66.1682005802986;
        Thu, 20 Apr 2023 08:50:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771? ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id qn7-20020a170907210700b0094e44899367sm838732ejb.101.2023.04.20.08.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 08:50:02 -0700 (PDT)
Message-ID: <2adfd25a-c4f0-db3f-2148-5fd150a6a49e@linaro.org>
Date: Thu, 20 Apr 2023 17:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek: Add mediatek,mt7981
 compatible
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 John Crispin <john@phrozen.org>
References: <cover.1681932165.git.daniel@makrotopia.org>
 <4877689269af862ea9ddd199d8aa96b2d7fcf6fe.1681932165.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4877689269af862ea9ddd199d8aa96b2d7fcf6fe.1681932165.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_085004_560487_06752D61 
X-CRM114-Status: GOOD (  11.94  )
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

On 19/04/2023 21:24, Daniel Golle wrote:
> Add compatible string for the PWM unit found of the MediaTek MT7981 SoC.
> This is in preparation to adding support in the pwm-mediatek.c driver.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


