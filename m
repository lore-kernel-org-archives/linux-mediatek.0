Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E393C76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 19:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjIeWljkDiGyVmX8p5PiMW5AuNIJngh/JEy2k4kLvdY=; b=Vda8a9kfw7OfX9BPABJPbdyUqj
	R03n0NG0KnnMmwTDZXN3i6ROIXwHEa1V5/BJgt6ei/pHaDKT/2bMheQYBi6GbHgOcNkqkwc3/tYLP
	JRycYBERTjeeDOdLhTMtN6owpQ87so2ckjNlWx4maN2PvJ5YIWDUv5ikyc8TyDw0kZc+aVwrLDPD3
	JqBYbK6Q6GjVjI+O8/VqxLF40z4un1fbUUCMhApqzZ9jfCgt2JCNkm8OeZWF0YPwSUuVBFl30w4gz
	ARZMlNiEL2REewUO2e36u1RyCTwTeXOLEmkVVCrb1sG9Lfumli/0jo3LE5EYm3qBD6fDAG+G/lOu9
	mVfafP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUyl-008MKV-2k;
	Thu, 06 Apr 2023 19:09:03 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUyh-008MHa-2Y
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 19:09:01 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5047074939fso2302888a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Apr 2023 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680808135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjIeWljkDiGyVmX8p5PiMW5AuNIJngh/JEy2k4kLvdY=;
        b=Lx3ugf/d11TNRbx8QoXYNh2DV52F69YHH1k8fmUCKqy5Yv1vwlecJ2GMKtqL17fuWu
         U/gxeR51c6dX346UvGryYnG4TsJjKpISIKh0IXjMQv4sFxbrKmUplnpkMOyKGQ3oihBm
         JmO14GNMY6yvTk8gI3YiKgOizcGkjzh71fD6UvJLJED+pjoApwXwmgCoZVCH4TejvtLg
         Xgrk1ncncV+PAStXrbgkLuvEoKDByI3cvBcSkwJIrcXJIg6NL6lxRoXVeg2UFJU+ap8u
         6ptcU3bmgij726ejGmGfdXlu1XkLpe36ahIJoGLp8gAuH/X3DhRnOD4iVl1OqL3ClEtU
         B+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680808135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vjIeWljkDiGyVmX8p5PiMW5AuNIJngh/JEy2k4kLvdY=;
        b=h/iSsI9tIKUZ77EQndWZ0KfFPjeK2ldA3jYXo/zoErKv7cWGqDePWQe7l4Me7P2d6e
         4rbxIvWjacn1TZLk8GUgMr9F1kPBv2GdHp+L0ev2stYJ112rLTWuMC8z1uB6u5DtsYVu
         CkKp5JD5RYZuCP7hKJwbQ0nkOWQlrYQKT4kMLYV0X1KM7WaWYU5aJZeWW6ujaMJdHhMA
         Yly/oK/BmyPYdN+BmfGR0TxlV4vIdbwL8f+ANmPEouiqBaFArGKXsb37QwTbIvE1IHyI
         5QkKpU2PWA7id8R8dfu4u7+IadNfIoVsLLTbDULEmHanU748fMsBOVRcWJKLAcVA0NY2
         dJkw==
X-Gm-Message-State: AAQBX9fVqAa6ICeB+hEiUMEj2geG1HlrETg+QrUMM7ccQsy2/wrcD+Eq
	IWG9RalvnRJCs1YwLkH/nTYdqg==
X-Google-Smtp-Source: AKy350b2MQipma8N3wDe2Xv4yTaCDB5UeFUQNpadW9SOXDpVOEm+DLx1Mh2NrS3v/9rJea1inAeWag==
X-Received: by 2002:aa7:d948:0:b0:502:7d43:2ce0 with SMTP id l8-20020aa7d948000000b005027d432ce0mr5234051eds.13.1680808135616;
        Thu, 06 Apr 2023 12:08:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s19-20020a508d13000000b005023dc49bdasm1048166eds.83.2023.04.06.12.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 12:08:55 -0700 (PDT)
Message-ID: <d5769d8f-29f3-063e-0562-487b1b509d3c@linaro.org>
Date: Thu, 6 Apr 2023 21:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/7] dt-bindings: net: dsa: mediatek,mt7530: disallow
 reset without mediatek,mcm
Content-Language: en-US
To: arinc9.unal@gmail.com, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
 <20230406080141.22924-5-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406080141.22924-5-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_120859_833645_966A8537 
X-CRM114-Status: GOOD (  16.54  )
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

On 06/04/2023 10:01, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The resets and reset-names properties are used only if mediatek,mcm is
> used. Set them to false if mediatek,mcm is not used.
> 
> Remove now unnecessary 'reset-names: false' from MT7988.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 9d99f7303453..3fd953b1453e 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -282,6 +282,10 @@ allOf:
>        required:
>          - resets
>          - reset-names
> +    else:
> +      properties:
> +        resets: false
> +        reset-names: false
>  
>    - dependencies:
>        interrupt-controller: [ interrupts ]
> @@ -324,7 +328,6 @@ allOf:
>        properties:
>          gpio-controller: false
>          mediatek,mcm: false
> -        reset-names: false

I don't see such hunk in linux-next.


Best regards,
Krzysztof


