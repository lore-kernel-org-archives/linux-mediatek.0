Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84177C74A4B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHBd3Y0VvrBuq7MZ50gDgjgTfAiwAuooNzx/I7JEUXw=; b=3QmkbEJppcH1U8hFrZ2E4Xx8Q8
	2rnex4O+/IlYzUM0dXCT5DiZcUqXl57wiOZJ/nEn0H/zR0JlA5q1I3TNTWQxI2+QU661Tp7xJtPmB
	7ZMApNyqBl95ZoL+kxG4LbajV0HFZRhPWFdQGLvVlX6yfwvLHD3mP2D+PJ/hrsGHaxwaHKg7zm5Te
	n5CJF8wvW9t0e8tfiCIoVi65ptZ1hpvg6HlpL2P96eSdAON7xdxMirzHNgvFFYSyRiUENMKFoicrs
	9DKL2J8aswanmIQlVvBIJE9uO8BLLnlPj1lHCCLDUyHeFTNoYlXaxzo5OQWVpCggnMn0xR+y+V8+t
	Qt/CFruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYB8-00DfJd-Ov; Fri, 10 Mar 2023 08:32:42 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYB5-00DfGy-N8
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:32:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id cy23so17228481edb.12
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437156;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHBd3Y0VvrBuq7MZ50gDgjgTfAiwAuooNzx/I7JEUXw=;
        b=ZlWttD2E/fTc6sozsXYMOODaiBWhScr+YjJItVN2GefRH0xMUdqwOZf8mE7FjehfuQ
         9uTTkBaSBSi+znvYbHXEKAOvqQ7huiNNmdgyCuyC2J86I+9grR6wR6V/j+IU2reXffua
         RbLfMFlxGQNAU2knCQCVMa3Yp2rOhkmFhWdiOZaNg4oYsuQZWhjOzQu4ZBOBOtK4rSV6
         Js1mBHru/S7XfykzdxLGLlzwNXq5t5zIGEIlE7fcxAhjKseDLIjR+G9zLIqe4NvQ75Sp
         DmwySuInWyF9kLDeuhVoPKE+JphSSizzKcaAyNNzzKeiq5QiRRN7TVLz5yxJbdWTyJ8z
         8XMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437156;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHBd3Y0VvrBuq7MZ50gDgjgTfAiwAuooNzx/I7JEUXw=;
        b=wpnsh8eru09S4GQPPPG5Ngr1xMeePfwNT5NKkdPvdXjowo4Fkob8Rj9k8gwUaOqDXH
         3E3C0n36ofjhs0/niUO1t/8Pt2yAVxviAtjrssVWRdAM0A4yBt72QoN9zg2NNH/3GFSH
         gwmL2eg/rg4FICg4IuIdRIwLqscTFhP6g0OQCrYBJv2iKobLvm3HOV5jLRfD6D8H+YaE
         WgLkmbtKBESvMLqcDDfFyS3vgMN3/1Xw6RwMunTnEdPlRjxaesUaLDVS3WRLbdrsqk59
         kv5GjFtP/kfMWaTW7fv8q+7ZU2298lLtBfnnqTJFm+zjVYgawpmT/whezYGflfKQ/6g0
         OVAQ==
X-Gm-Message-State: AO0yUKWy4ETeKmZbeYgr0KvamN/+6fCrN/2pmKcaMHNurDmfpYHxecOw
	IbRXOimn9DUjLY7TF+m8X7bw2A==
X-Google-Smtp-Source: AK7set97xnKWsVre6NDR3NC+jr6Wd86sRJG6DewHgTjoe4XcRjSjYtnBHv4PeuEjxhBj7P+etdDudw==
X-Received: by 2002:a17:907:608d:b0:88c:a43d:81bc with SMTP id ht13-20020a170907608d00b0088ca43d81bcmr28538165ejc.58.1678437155821;
        Fri, 10 Mar 2023 00:32:35 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id e11-20020a50a68b000000b004bb810e0b87sm539370edc.39.2023.03.10.00.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:32:35 -0800 (PST)
Message-ID: <3b7c6f28-57bd-33de-5531-8c4eae8cf6eb@linaro.org>
Date: Fri, 10 Mar 2023 09:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/18] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
 <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_003239_811147_95768F69 
X-CRM114-Status: GOOD (  14.32  )
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

On 07/03/2023 14:17, Alexandre Mergnat wrote:
> This SoC is able to drive the following output current:
> - 2 mA
> - 4 mA
> - 6 mA
> - 8 mA
> - 10 mA
> - 12 mA
> - 14 mA
> - 16 mA
> 
> Then drive-strength property is set with enum to reflect its HW capability.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> index 4b96884a1afc..101871ec6693 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> @@ -79,6 +79,9 @@ patternProperties:
>  
>            bias-pull-down: true
>  
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]

Isn't this conflicting with mediatek,drive-strength-adv? Your commit msg
suggests you add a missing property, but I would say nothing was missing
here.

You need review from (pinctrl) Mediatek maintainers how the bindings for
all Mediateks are organized.

Best regards,
Krzysztof


