Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35091C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vsv7dr3uzhUIk6MaDx153ivgxegdosI7Dsq/3/yc84=; b=FH1qOa8mqy3DGxX69Ax02j5/Uq
	SslrM0H+dHujD3P4LEDPaFN9FKiJrOk1RmI8Ycm80It8X4qv1cLr2Bcid37rsxg+X5P4WL3rHcBCn
	xesm1Dgxt6FCFO1ZHj9P7rmQt4AlHee7jP+K/w8HtP2/P+i53qxu8UPk86362c7bzYUK8R3YvAshd
	YwSj/Vgf7gy5xBTV00noP/bIwOF9kuC37Hgs4SYNfz1/EWnVVEuW6BYtkwXKgyEt2KFDloRUlwZ0X
	moDoQan9nRCNjgnijcLbhfSIjWoNHirH8dh/gWRz055DQWprtUKf9jdWGy1TaL8yvUqZaUZTNz6ub
	QVuwwsQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o286b-006dxJ-Ko; Fri, 17 Jun 2022 09:17:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o286P-006dty-3l; Fri, 17 Jun 2022 09:17:18 +0000
Received: by mail-wr1-x432.google.com with SMTP id i10so1197568wrc.0;
        Fri, 17 Jun 2022 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4vsv7dr3uzhUIk6MaDx153ivgxegdosI7Dsq/3/yc84=;
        b=ACBqxDq5QRbxMPRA+U5PmidBuoHJTv2BC8lJaw1nDyLaHxEIQnEbVgh1x+mlou/rkt
         mpMX1ICEMpkO/miqr5zblcumCBy1wNo90e4UIpwCqBap8reJuYojFB3S4xiXCzpN5lHz
         D1MJN+rWmHVdTmPS/Cu2Ip+wJ2npZ3xU5pHFcIlDHEHX6OdsqwvkZhYaABTrA9g23Sxr
         3x1ELieftG0IeDNRbsW3DE2oakM0Q6aBJDnIGTUSyccEivRbUMcMAOta9CCBSDE3u0Vh
         PLAr5yoDQ2rsKSt3GuZA32Dcl3bqUyoCgom7QI3GqQzEaUgsMZWYav/WoksfO/RixGrq
         djeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4vsv7dr3uzhUIk6MaDx153ivgxegdosI7Dsq/3/yc84=;
        b=fq3UHVH8H/K6Jb5XARATDGRGlPr8HWDKyc6esLxVb+puT+Tk+hZl5kueBytv3C2hUb
         6HSRqvBNHRpy/hWtoq/gq7Jqvm5SavadAZEO39GEnu52kg0oUr9GxAy073l53QnR2u58
         t7vqtPgz/BucJpe08+xIpaJxgyn2fa/fCOTcd9t4x2/6LxtXBSNBox7XhGG/AeIUf+6f
         7/Tdg8klye/Nx4HUVrMV7LCeKKZUqQ2AzXbDvvCoT7qQt4fVLXbK4DM8k69aeqqqJQRH
         YGzjKMQ3k54wxvroZN8acq75TX2RGTZYPa8zLttFu5CYr9jvcKBdBg+FNK9iDnchuStf
         4J7w==
X-Gm-Message-State: AJIora+awGX+jhcidfmxM2pU6rJp1K+7ESVzI+nch7eqTpwi8cC0VbK/
	9FCcfnICv+ZxXJ6pfMUw5RGDuXoHxbs=
X-Google-Smtp-Source: AGRyM1vtqhqNcKCv+Vd5UmcqgXsk7sCKRe+BlO71XkYROhDQY11lTbjAf8DBCYy7gmcuH56g07pzQw==
X-Received: by 2002:a05:6000:1445:b0:219:f383:40bc with SMTP id v5-20020a056000144500b00219f38340bcmr8645124wrx.53.1655457433484;
        Fri, 17 Jun 2022 02:17:13 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id d18-20020a5d6452000000b00215859413f3sm3980329wrw.107.2022.06.17.02.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 02:17:12 -0700 (PDT)
Message-ID: <074b6829-c5c1-d3fa-d4b9-8b0ba001eabe@gmail.com>
Date: Fri, 17 Jun 2022 11:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: mt6397: Add compatibles for
 MT6331 RTC and keys
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 johnson.wang@mediatek.com, hsin-hsiung.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220616091531.12646-1-angelogioacchino.delregno@collabora.com>
 <20220616091531.12646-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616091531.12646-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_021717_200733_B52426B6 
X-CRM114-Status: GOOD (  15.59  )
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



On 16/06/2022 11:15, AngeloGioacchino Del Regno wrote:
> The MT6331 PMIC provides many sub modules: regulators, audio
> codec, LED controller, keys, RTC and some GPIOs.
> It is always paired with a MT6332 Companion PMIC, which provides
> thermistors, WLEDs (display LED backlight), secondary AP cluster
> regulators, modem clocks, battery charger and fuel gauge.
> 
> Add the necessary compatibles to start implementing the basics.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/mfd/mt6397.txt | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 293db2a71ef2..f637bee2f3eb 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -29,6 +29,7 @@ Optional subnodes:
>   - rtc
>   	Required properties: Should be one of follows
>   		- compatible: "mediatek,mt6323-rtc"
> +		- compatible: "mediatek,mt6331-rtc"
>   		- compatible: "mediatek,mt6358-rtc"
>   		- compatible: "mediatek,mt6397-rtc"
>   	For details, see ../rtc/rtc-mt6397.txt
> @@ -52,8 +53,10 @@ Optional subnodes:
>   	see ../leds/leds-mt6323.txt
>   
>   - keys
> -	Required properties:
> -		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
> +	Required properties: Should be one of the following
> +		- compatible: "mediatek,mt6323-keys"
> +		- compatible: "mediatek,mt6331-keys"
> +		- compatible: "mediatek,mt6397-keys"
>   	see ../input/mtk-pmic-keys.txt
>   
>   - power-controller

