Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BFCC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 17:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LA2IwV0qcolNLpB1WThWYRy5+wWU9V8bs2U66OhQBA=; b=4asb2hXLAVvcOmAZgsajJFYx8x
	LldTB5JXOWWXUbL6rfRaO5CPNNLyfhCHD9+kLzLqJnR95r35tARhVRpMpTY+Ozb8HGsVeupPoiNst
	VKPGs1SCTlZcKkcz9JcKLv/AVr//uyScHWrmNB2hsGrgbk8iV0AT0srR6j28IPZ2oBTi9z7Xez3Yw
	xYvA7roubf1pAr8p6UmZ03H/b+rvg+vYLX8INjj/5rF26TjoeXuVYNvunOA7XOiTbMu4JluXZ3R93
	ksADy3jQ6W6rmM5vlIYk9lkuBKTILwBYMupanOECA/xejYpDWErdynNTuL1Y8yzDexmN2SA9ucjl/
	cKWvXEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phvu5-004bOS-2C;
	Thu, 30 Mar 2023 17:17:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phvu2-004bLo-01;
	Thu, 30 Mar 2023 17:17:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id i9so19853020wrp.3;
        Thu, 30 Mar 2023 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680196650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9LA2IwV0qcolNLpB1WThWYRy5+wWU9V8bs2U66OhQBA=;
        b=J93NMGFeVYKEAydswJOWeQn7uOTHHaHwPHnMxNLbBnZY5llx4YPlkkfXPhH9r1dUfl
         K+JSR2TT+0Vz/JEGLx+X4k49Pui5CsP+7JVlD+VG1La7bGar1xxyfZUU4shACBypaMM5
         cwh63GiXqAIVe8o2dZm9M1SiPe6u9Obarf0RlindwdSet6HJhhK06JqjLnzqe1uhJAvW
         0VFUQqgQN2YsqGndsiaoLqWq2N12blhh0ZIIb86hGhFjL6Hwf5BxrItcyRY/Cf2vP2eQ
         jgLDDObaerOSC0vCGMeMiENZI6Ced0MRzsE/zy7e1jQ0kmzTiae5PB9/HbDTXsn4uV7y
         7RZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680196650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9LA2IwV0qcolNLpB1WThWYRy5+wWU9V8bs2U66OhQBA=;
        b=6mkaXb+xjCap59YuOVOVjpIw8ChVIDY6N6oSGS29hSiqjk2SQ+C2a0G0uKHXKUg0j/
         mTrQoyWB4M6l6h6gbQaqV889C8hUJayYnapHDUYlq7vXTtyBwWdXK6wkdhRagrpHbVn8
         2kD6zAmjOIKp/6RlycmmsHhHdB87sIzhHwG0y7a1mSdb84GRuPrzZQoAeQRY0AHZPNmS
         8w5L3xZX+s9VDhr0l4XGtC7becMJDfKxyCgfx28huwFkhsYUVH3/R9yrxNHC1Sc9fDFC
         r3H4v2FVSWTxM1YNW/sErvLVkFqJa0Q2SvhMflGfnnO5PQrI04ubzTL28P5y+ZyShxzd
         1hIg==
X-Gm-Message-State: AAQBX9cELGtPhzOsojrCcTPT+nAyZXDLsL/Ie0bg58GL/vsHT6gD9SIY
	7vYcnah/QIAz43uB/71VVHM=
X-Google-Smtp-Source: AKy350ZICVwELuVoiqheQx2dXbJAbjZbwpXeu5bLm0jH0vGD3tsNDeyb3+BPitPCwxq1WSnym4K1+A==
X-Received: by 2002:a5d:62cd:0:b0:2e4:f53a:45a1 with SMTP id o13-20020a5d62cd000000b002e4f53a45a1mr1712752wrv.57.1680196650320;
        Thu, 30 Mar 2023 10:17:30 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id v6-20020a5d6106000000b002c55521903bsm33155272wrt.51.2023.03.30.10.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 10:17:29 -0700 (PDT)
Message-ID: <b0ef2a0c-9390-65d5-56ec-f7293b87f20c@gmail.com>
Date: Thu, 30 Mar 2023 19:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 02/17] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-2-0003e80e0095@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230203-evk-board-support-v3-2-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_101734_042473_3F652C36 
X-CRM114-Status: GOOD (  14.86  )
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



On 29/03/2023 10:54, Alexandre Mergnat wrote:
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
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> index 4b96884a1afc..101871ec6693 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> @@ -79,6 +79,9 @@ patternProperties:
>   
>             bias-pull-down: true
>   
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
>             input-enable: true
>   
>             input-disable: true
> 

