Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BC3C77B72
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6wXzbihncvcxRC0lYLMU3KUwnKB3HO+StuX3H8os6c=; b=LJCp5oqAXMVGyVmw60w+G73gSc
	bxv9NA5ekpHwheYZls7KP+cXoIA6lyFIKAhkI87ITTqy41p5PxhTn9F85EaylLo3SPCS0jrj7wHDX
	drQvOEkJWhU82/MV1BvDZh1BKyWs6YwZDiop/01NmfHoOPTv49YXdBDDHvK1zyftncJ0s0Wy4m0vt
	sCcmxRO3YM6ysKRW3L5qQudSWv6LqDMm6XtzmJkQVa5kvQo2YTj/gPDhuJL3tU6QA2EKB5ydLdQCi
	6UC6ztWg6x/wirWRpnVrSd55U7keq1V4HO5FveJhdrGU/N+9Ne+4vi84l3jG5OfM/Jm1aC320IyH3
	wlaV+DsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZjo-0039Kg-08;
	Wed, 12 Apr 2023 12:38:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZjl-0039IV-1t;
	Wed, 12 Apr 2023 12:38:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id v14-20020a05600c470e00b003f06520825fso11521049wmo.0;
        Wed, 12 Apr 2023 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681303088; x=1683895088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d6wXzbihncvcxRC0lYLMU3KUwnKB3HO+StuX3H8os6c=;
        b=arIcxUv7A0B1RO+picV/yuY6t7RmRY6+5qH4Ts1uJHrZCltOnQkN//6EEcVVeuNoyd
         s2CalZ62oQ0lhT9948PMDOTCc7VfANNrKnEXKDnmTt5Y8WaOXH/Ah6z2wZ3PkhSp4qSk
         u8QJa1Q2erqT0t5MG53kb3upBZo4BNlTsti79f/hqvJxTtvCa1c7Wr2Euuke/tkd7Iaa
         X+Y4HEKJNyc3uhbjzPEWxLz8tldOJH9QBiV8iYTbVucNWkiLRAwnslwDsF/02sdXIKxK
         XPGWP+a5BxkJknwCFV1EIZzBYi0/Xa2j3vbcbtz5mmSWyOKN0dBgmnn0SL89+cxzLM+R
         DiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681303088; x=1683895088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6wXzbihncvcxRC0lYLMU3KUwnKB3HO+StuX3H8os6c=;
        b=um+eckgrjUc4P+II/bjLUQoZD/JZHpNYt44B4sDrZNnCsiaaGAgRhneyzkCfyXzVl0
         9Karp/v9e0SEAJRz+KcKCBHE7RpYioTxTPba3xtwOVQgu2qkmJUvr1a0hK8M8spQWrvm
         SxbxqvhHw4wiEr7ikUOsJUOoXs0/57qd1uoiyfCqcKPsALjzp8CKthPKK4r2Z+UIoXVO
         CiJ+5ZA8FySxc/TUsiwkx2ZY43VXgIeX4qKrCc3hfDP2rFO3boP/l6yYxR/xJyEVYDyo
         narIzU2cilWSd/FPbaJpOah1yr7F6AmeHPwmScONJHG+9B3myA5DTkmKDi+jlSp6PC/q
         a2pA==
X-Gm-Message-State: AAQBX9dI3BMo+LYXsLtIKy9zkDIgUFge/q2UmJnltA3LQJNLUe+oQYoC
	o3kH31yBGPoFdSj9zWOukv0=
X-Google-Smtp-Source: AKy350bhfRzY5aSzG4wwinpVBd7GLK8Egpwb3dH450L2hyjxKWMM4P3MVEj7kxheu5R0ei+xUrknrg==
X-Received: by 2002:a1c:f613:0:b0:3e2:201a:5bcc with SMTP id w19-20020a1cf613000000b003e2201a5bccmr1804437wmc.33.1681303088188;
        Wed, 12 Apr 2023 05:38:08 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b003f09d51a4edsm2333476wmo.48.2023.04.12.05.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 05:38:07 -0700 (PDT)
Message-ID: <32ed4eca-106e-8c05-31de-881f7119f954@gmail.com>
Date: Wed, 12 Apr 2023 14:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 13/27] dt-bindings: display: mediatek: ufoe: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
 <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_053809_625932_5DC646B2 
X-CRM114-Status: GOOD (  12.93  )
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
> Add a compatible string for MediaTek Helio X10 MT6795's UFOE block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,ufoe.yaml    | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> index b8bb135fe96b..282925a73804 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> @@ -24,6 +24,9 @@ properties:
>       oneOf:
>         - items:
>             - const: mediatek,mt8173-disp-ufoe
> +      - items:
> +          - const: mediatek,mt6795-disp-ufoe
> +          - const: mediatek,mt8173-disp-ufoe

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   
>     reg:
>       maxItems: 1

