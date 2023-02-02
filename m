Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A467C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Stgr6vfm0HEaVlIajYL/GQy19ItPErkJb1Nwjrj3VxQ=; b=Y0jJ/+/vOzFho3q4sykm0LldOb
	/QwCUQ4Lm+Uu3DLL8xWryAkRs2x0UkSHHpMSj0/fpfLgNFyET7X1ceVX8Vtig6A8RxRFpp0N01Zlo
	znPuVrvEPG7kMscgz1C6Qe8nlBdEFJFjHUuKvWgb/KNO9rLScGfBVPgZjWzk+jdb94PnCyoU71fxh
	bb8bYsfMm88q+I004/gWx88tGTJNOSzGJDCuzDPc5QJZfVTkUFIGH/3xdVgfMUZt4f5djGwE56Enm
	sKEaOYjcIO3Sb+/FOoAym8993bG1vM06uGTveAZPj8NA9Cb2zpDCVJ0NPC/OqKw1WlEI5AQNHH423
	iS2UkXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWJy-00FHH9-QO; Thu, 02 Feb 2023 09:55:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWJv-00FHEN-Ta; Thu, 02 Feb 2023 09:55:57 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d14so1140189wrr.9;
        Thu, 02 Feb 2023 01:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Stgr6vfm0HEaVlIajYL/GQy19ItPErkJb1Nwjrj3VxQ=;
        b=DGhHNeY4428AtR6ijDYnRHS5YEzktQbrxXUDsprWPLMjaYEw4F7GnvFM70lJcYjj8h
         8i9qBfZfaPI7Sf+L4NdYZ5yB/FZ+H3VzuvC7ytWVjqxxBlVzm4imYkn9ExZbcW8P1jgK
         reEzD0Vaf8RJY8ArKFVPeerkK8hOGFZZBOmPYZRnQXl0zfy4kX/t4aWWRY/27RgCPLPT
         36P+m7BvZihLipw+MSMHUe2U0tVmnbAUoMolYY1kxSfzb+TYMOZNjQOPlUhXVSsktM1g
         Z2l9r1JB5GxwtDozt2s3JZMUEfcwGlfvK5DcUT+REC4KreDg8CC344ipcaqk8q+LNqXo
         jeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Stgr6vfm0HEaVlIajYL/GQy19ItPErkJb1Nwjrj3VxQ=;
        b=WfAyOkWdSLidYncMWwrdGseW2A6nej7TNDS4pCrbZZ5qWBi/Vy4okG2FhyJQdCvc/p
         sQXVO73Z1kftkcTvjk4cdvOM4MH3yoyeR8oVM5yd1V8LyVwxpZXhjDWrq0kqQVB+qbDK
         Pf2HOEyQ8IRSjlH5gDR2NLMHBnh8wqTNI8IRTqLsp9pAgRH1/aV4beeSPpK/tUgX3c/V
         DLpUCt89oFuKbaWsnse4RvoC4mnm6cgiabJmTmlWmjjAu8qgGICf5APEOY8BftX4zPTa
         fM9YMpj2ojSRh4n0Ju2P1CQjjnseCjNuU+yvP9GNbr36KhpIX49pzrWV23hEDN+4fP1Y
         MhjQ==
X-Gm-Message-State: AO0yUKWUjKL+CtFR2Bu868IJcGbeBShxhs98gHY2qDQUOzNNAbBI5lYz
	CivQBRVMA19hu7RmD+tQuIE=
X-Google-Smtp-Source: AK7set9+0KCJ4iG0B6Soqhj9NDaWHm930UPc8+G8z5nT+EeUjOSrCYTZjIZIelt1X/dZTH3B2Fl4nQ==
X-Received: by 2002:a5d:4e02:0:b0:2bf:e1f8:c4b6 with SMTP id p2-20020a5d4e02000000b002bfe1f8c4b6mr5026167wrt.52.1675331751349;
        Thu, 02 Feb 2023 01:55:51 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p8-20020adff208000000b002423edd7e50sm19640568wro.32.2023.02.02.01.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 01:55:50 -0800 (PST)
Message-ID: <44654beb-58d3-ff50-e495-938538c065cd@gmail.com>
Date: Thu, 2 Feb 2023 10:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: pwm: mediatek: add mediatek,mt7986
 compatible
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <70fe0b606d988958b87f89828b8728e2f68eaace.1675278958.git.daniel@makrotopia.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <70fe0b606d988958b87f89828b8728e2f68eaace.1675278958.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_015555_998580_021EBD0E 
X-CRM114-Status: GOOD (  17.37  )
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



On 01/02/2023 20:25, Daniel Golle wrote:
> Since commit 241eab76657f ("pwm: mediatek: Add support for MT7986")
> support for the 2 PWM channels implemented in MediaTek MT7986 SoCs has
> been added. Also add the compatible string to dt-bindings now that
> they have been converted to YAML.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> This patch has previously been submitted, but we decided to deferr it until
> after the conversion to YAML which has now been done via commit
> 3e98855ca0cf ("dt-bindings: pwm: mediatek: Convert pwm-mediatek to DT schema")
> See
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/Y39PjU1BqBB8tZ98@makrotopia.org/
> 
> Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
> index dbc974bff9e9..8e176ba7a525 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
> @@ -22,6 +22,7 @@ properties:
>             - mediatek,mt7623-pwm
>             - mediatek,mt7628-pwm
>             - mediatek,mt7629-pwm
> +          - mediatek,mt7986-pwm
>             - mediatek,mt8183-pwm
>             - mediatek,mt8365-pwm
>             - mediatek,mt8516-pwm
> 
> base-commit: 66eee64b235411d512bed4d672c2d00683239daf

