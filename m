Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3041C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpIC/vheFt0sfkteBFunYkR3K/TvtDGb+njBwXb1bVw=; b=v3f2QY+rCT44epGef3Y0+cf9fT
	AM15zvhij1haHkwartggKgCBht0A+FgFQVU7Ugolnr/naTt3VRpiCHJanVfa+rQ/rNQfwbgTZFGKa
	QzLcS79+2u77i63L01ZvN/n7fscOKiyhCI+acPGg0cvkcNbo17fnpM/TnCpLXlSv1wqFNmN3V9Yf0
	7Kmz4aBtVhA86i39Y6yF/lTjmMPvqww7xOtePn/6PvKjzQGf0Z1uh/6xL5/aWQaCOa6uJY5ex5Ywm
	l6g/9BBXwoTxip+g40HcDEhQ4QZ6UAUxUaEyQV4dGMUSdKtI1WC3kFeqqmLYIw1CY89/LtMfLJAJU
	OdSo3muA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM01C-005Pco-2c;
	Wed, 19 Jul 2023 05:46:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM016-005PZZ-1N
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zpIC/vheFt0sfkteBFunYkR3K/TvtDGb+njBwXb1bVw=; b=ne6taG7AARn3dvqRXTkUReBVrO
	VY+0ECeVjT1lszXiMvhDwqXHRckc0UKK4W4xuVH0h72ktrJ1VZDoi6uloy2APboxfp1GnB8Gdvo8E
	bBzPQl5YboSmufwNVqsLZTxHiqZ9JY3IBf5OeShz1udWkT6kx0KsHWR/qLMvJBRErgTZOs3zXGHaC
	GP4f//aa8kXSoDdo6ImBiGvjq9WfEHb6Pd8g2XAhRga9ejFd4czvWhFydcrJJj+i2ChRxyqfXATUp
	5mV0HDvO96WwHmljqw4xwEmhKE4cB1O/i2icGeCy9F6MOSYma44vtzqsfOAbeONSYN1mazQwM9CC8
	VIc+bwCA==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLULR-009HMk-1d
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Jul 2023 19:57:23 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so6629393a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Jul 2023 12:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689623720; x=1692215720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zpIC/vheFt0sfkteBFunYkR3K/TvtDGb+njBwXb1bVw=;
        b=B0ly1khsPWB96zrFc7dyjFKzz+VKXdbdmOleSWMI9iPNVnQJ9BaryBnfDkWN1vlW9C
         qFSSeSyyLeZup1VbUMoFERdX+KS2zyerrB+4REY29FQVbJ7nYdGiLw0hq9i53CmAIJ1D
         DjV2mZy1X6V+dbJscHvd40lhUsd0z42cMbmLefuXI1Y9M668Wu68QY9tDUXMhg+NLKUa
         lawvu25/DOCqKm86OCV9hh0jjVACEQTPva599OrfrpTGm4T/G2936rqcgedBLJ0cY0Nc
         XtxP0Vb/qk+AakD8LSHG5C9uaLo641EIM87qYBQjjI1lUqIpQ0NwDD2CDCnZdYkYca1m
         xewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689623720; x=1692215720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zpIC/vheFt0sfkteBFunYkR3K/TvtDGb+njBwXb1bVw=;
        b=Y7cDt0VQ8t8Bh6b2LyoLYBONravyQfjPy0/MBJw7NbjW63fmtIrewBDWg5VNyPRtY2
         ADM63NY6wvAsG8eJ6zo7M043Pon8nkuHbU9xaEI7l6vRX+fI/Af6aYI9m5NkOI0R/PlH
         VH68Ymtz+h7WSsQ1YWBOmGMA3lQky9gEaNOYsOQ4VtKzFDTee+IWtCIi7gYPqAiDP//d
         nF5DztU6+HegFE3nmqT1meeeo539PS7d4xgfF+sw+6Ihts282VQcFhsFl9Y/ylXh/E9d
         VbOLqAIO7PWfFmQq7uSZAcmKLqydXFEHXOb5VpfILGUY9UEZtfUH5NxpsNeRvHytsykg
         +6Kg==
X-Gm-Message-State: ABy/qLauWq3B/hBHX7ei5CXH+RuWjzwaf4XSSz5Y+n/IlgkdpEJLWzSD
	XgwHI03IKo57fWO/b6VSefnQVg==
X-Google-Smtp-Source: APBJJlH2ZBow7cATyCQicXDgX7fUHJgqQSPkaJq+UqX1f6NKkgZ6Mmi+m6jeuqTzgET/pn5dMaO6Dg==
X-Received: by 2002:a17:906:77cd:b0:993:d9a5:dafe with SMTP id m13-20020a17090677cd00b00993d9a5dafemr12994208ejn.14.1689623720587;
        Mon, 17 Jul 2023 12:55:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id y26-20020a170906471a00b0098e78ff1a87sm85676ejq.120.2023.07.17.12.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 12:55:19 -0700 (PDT)
Message-ID: <9e46c996-3e3b-b437-f2c4-2ca86a1c7e6c@linaro.org>
Date: Mon, 17 Jul 2023 21:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/4] dt-bindings: soc: mediatek: pwrap: Add compatible
 for MT8188
Content-Language: en-US
To: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?=
 <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230717120300.21388-1-jason-ch.chen@mediatek.com>
 <20230717120300.21388-4-jason-ch.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717120300.21388-4-jason-ch.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_205722_179444_F2E97B89 
X-CRM114-Status: GOOD (  13.84  )
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

On 17/07/2023 14:02, Jason-ch Chen wrote:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> 
> Add MT8188 PMIC Wrapper compatible to binding document.

No improvements here - the compatible is already there. Subject has the
same issue. Explain what you are doing and why.

> 
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> index a06ac2177444..4737e5f45d54 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -41,7 +41,6 @@ properties:
>                - mediatek,mt8173-pwrap
>                - mediatek,mt8183-pwrap
>                - mediatek,mt8186-pwrap
> -              - mediatek,mt8188-pwrap

Look, here ^^^^

>                - mediatek,mt8195-pwrap
>                - mediatek,mt8365-pwrap
>                - mediatek,mt8516-pwrap
> @@ -50,6 +49,11 @@ properties:
>                - mediatek,mt8186-pwrap
>                - mediatek,mt8195-pwrap
>            - const: syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-pwrap


Best regards,
Krzysztof


