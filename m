Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC3DC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoHRnRoLlzxAiSAqp4tivCtuegEL4xuBxbRKH0S0dSg=; b=p5WpUrFvUJdV3x
	kVySb67We6KchBQluUjyinE5RDcE4fDVAuRF4eLVzU3UUrpDwcUeP8dMi5LXvYgCI2gZFyQfFScbc
	HTCWFhSyPiOQzWsuf/Q8r7Sd9Kt+xrp7WGAxEANyBegLXDZ4Z4AhlAZnMLpBzocvtddpXLyikCv7V
	NeogyCN8t+E2iK6jCfP6rzmob/XfO7+6wy8LbsEPUwPQDyLfr1OA47p++DFhcKgmsHbQLPC/ihqDp
	gJ/aJGHz98bRKFZW7VjgPaqX1g0kvJ7CDBfGhSjwa78/L1JnkW1VgmDyVYYSA6B+vClvqrd20EZzm
	+arIZZyA+XC/0dt9coPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCya-008wkn-Sx; Thu, 09 Mar 2023 09:54:20 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCyK-008wcl-Dr
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 09:54:05 +0000
Received: by mail-ed1-x52c.google.com with SMTP id i34so4615032eda.7
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 01:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678355643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OoHRnRoLlzxAiSAqp4tivCtuegEL4xuBxbRKH0S0dSg=;
        b=y1ckPIhrxAMHTNj7vNntlrKmA7wNpobhZV8QaQYNPfyprD0NF6SszzPBEmhqUNgCn/
         t0FzR21q9C9TB9lVUSsju77PkB+m8os9Nd6fn3BSevXCmoe6dIOdsEnLSS2vYCPFW0XS
         g6Dq54fXTGPePcw5nxSrXTKQpFPgQnF0+OV3NqGGYZ86EG9QR0CRTgQx39Urw5gIttQ8
         bwXBt/jHU/SsU+HraeakfV+hYH4ggaBH1UBpUZKcNXFMdc4D4g2CW/FVom1TPQ5To8FC
         IEdIpvUMRkN+96EI7ux/eZSzCuzNoZzMyyyaM6jN6XKy1reYMmDY9+Ja6nZaCWvtaM06
         k+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678355643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoHRnRoLlzxAiSAqp4tivCtuegEL4xuBxbRKH0S0dSg=;
        b=aqszaN5kyP5XNavMvB2m482aMX80lEAVkKrCguTJa+GtEvdLTBsJKM6Rbvbpc4wp4s
         KGNqz4QR1Y88tTOTakmYwvSPXO9AmcWEBUqk/FMB0ZBAKgiXzEisiFwloyE9Ua56xzfW
         SEk/z7szbBUArgnw4aQ53QWNvD1l2S5/K8hOb+wblAi3JEmDOC/nTvFj5bYd8fn9ex5+
         vVJMWzJlH2sv81pv7YURUBTlilhK3QKEMdHPt7a6ObAzC8Q7Ue1g8w+nRUOsnKF7OKC6
         aJaROYnHca37JyGQOF9Up+8BuqOY8qP9Z/uacm12RWEmktstiJmPW4Spnj8bce8dtGjK
         xJVw==
X-Gm-Message-State: AO0yUKUM1N4uwmtxQjQXgd3Hq6pGS99otFQyUbBxo3iVjm2it38jKZXD
	h4Oto+Xaa5sHFsp+N/G6OURTqA==
X-Google-Smtp-Source: AK7set/ZIn/kXnD8baLDvDAitMbJdAzko6v7BA4mlUMGpJqJ/bRwwAyBuxpxpbqahDmf/rFNLs91bQ==
X-Received: by 2002:a17:906:304a:b0:8f1:937c:f450 with SMTP id d10-20020a170906304a00b008f1937cf450mr19012832ejd.13.1678355642859;
        Thu, 09 Mar 2023 01:54:02 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id fw20-20020a170907501400b00914fec9f40esm4216820ejc.71.2023.03.09.01.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:54:02 -0800 (PST)
Message-ID: <61539204-afbf-f504-dfe7-237824dc0d6c@linaro.org>
Date: Thu, 9 Mar 2023 10:54:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 19/20] dt-bindings: pinctrl: mediatek: mt7620: split
 binding
Content-Language: en-US
To: arinc9.unal@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-20-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230303002850.51858-20-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_015404_513239_40988684 
X-CRM114-Status: GOOD (  18.21  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03/03/2023 01:28, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The MT7628 and MT7688 SoCs contain different pin muxing information,
> therefore, should be split. This can be done now that there are compatible
> strings to distinguish them from other SoCs.
> 
> Split the schema out to mediatek,mt76x8-pinctrl.yaml.
> 
> Remove mediatek,mt76x8-pinctrl from mt7620.
> 
> Deprecate ralink,mt7620-pinctrl. The reason is, the DTs for mt76x8 which
> use this string will incorrectly match the pin muxing information for
> mt7620. There's a new string, mediatek,mt7620-pinctrl, which makes the
> deprecation possible.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../pinctrl/mediatek,mt7620-pinctrl.yaml      | 380 +--------------
>  .../pinctrl/mediatek,mt76x8-pinctrl.yaml      | 450 ++++++++++++++++++
>  2 files changed, 459 insertions(+), 371 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
> index 11530b29d52b..38b71c74b9a0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
> @@ -11,16 +11,13 @@ maintainers:
>    - Sergio Paracuellos <sergio.paracuellos@gmail.com>
>  
>  description: |
> -  MediaTek MT7620 pin controller for MT7620, MT7628 and MT7688 SoCs.
> +  MediaTek MT7620 pin controller for MT7620 SoC.
>    The pin controller can only set the muxing of pin groups. Muxing individual
>    pins is not supported. There is no pinconf support.
>  
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt7620-pinctrl
> -      - mediatek,mt76x8-pinctrl
> -      - ralink,mt7620-pinctrl

I see removal, not deprecation.

Best regards,
Krzysztof


