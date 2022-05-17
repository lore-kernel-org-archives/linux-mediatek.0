Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E5FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bT7Cf0kL2oCTL4SOyxICgfAc/NKGrAFd1poJ1kjzv8=; b=5BH92Oq202hmSz
	L70nez2V/kMFkKZRjfRllrjMGkbY5m3t0NlrrxdKJnYlYwRggcWMt6fhQCNrk0fFIggiRxCADxO9Q
	xdCofvT4c1FpZutAu9KfVTTHMXzkBQU4WZhlLzJeYXv7HjrVJZHMqQ74IZ+qqJHngKdbybV7LaxX1
	OiHyaSHLvNTy3Cv3fnzheavelbFLtVjsRypM0PkijKaHN0TTLlCt+l5xNapy2IB5YfUk6Xdt/PjDn
	7emhWV6tfmj9Oi0rWWtME2ZhmutFwCGBbWEqZH3TN0hL7qJjvzEHn4sA+XTWrZD39rlZwBqAsgHp+
	pzTvLzS1zi187AaH7yOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqyIF-00ETS7-V8; Tue, 17 May 2022 14:35:23 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqyH3-00ESdG-En
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 14:34:16 +0000
Received: by mail-lf1-x132.google.com with SMTP id b18so31652307lfv.9
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=i7zyBF11Q2Vl2Fn+mqi0uKcM3WsZAR1VgADTgLmAWKM=;
 b=JCpSk0IGHnwfJTk7xQhJe8A+lFomuiac/OqKtv6lqPa9YRBRc6Oy0LsPRvupnoGUl5
 4PfRwcZrn4Haar93JXSl4ALQqT1DVsfdFrAJNzt/ot9BFe0O6TiqWjycRaO87u2A4WDx
 Rf7T6tFEbSdsmJyfKg2M2cq3FkJTiztv+oMb+vcTV2T4U303G93rrs8qi/PYVF+CniPQ
 eTUVG5bd8aoQ3p5tU2YNJHXLytDO8D/tEUaDYyRv4HksDgXF+RP5zNP/W7Y/LUvIbhyw
 1NcfZl0Guvv86a6A6VONM9dBMgs4kb1ThWETAmhIXwd9FeNfXyyxcAHmHwt4vhMSz4s4
 bK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i7zyBF11Q2Vl2Fn+mqi0uKcM3WsZAR1VgADTgLmAWKM=;
 b=or9KXQ4oeHHB9WmPyLRfcomdrHb4+B0vGe58A/gkSSBYDyCJ1pApsdAKjwwIbT1Pvt
 cOZNTbuesrQmrQF0n27OkRWWn+5QudxxqvraNOxGASqUZEoJkKJQKN1R36me4zn4GYip
 SPI725XFluPTRQ+KiXg3f/8iMKKer82xrAFMUSXwaHTb+5uFgpys5yQwpofB8YSQby0Z
 6JirLA5tyTcusMBugMp0LZZnWXh6mdrg2fPUokI1HQPMhZj7l8l4gDkeqeF/gcHB8ShW
 C+BD5gZjPbt9Fpr6LOpuQBVpFIMn+uXG0IktR+OWaO+Uc+GeH0iMmZas6krX65zYinWU
 XsjA==
X-Gm-Message-State: AOAM533l7SEbtO2Q0T+LYEf70WpjN+yXCIczVuuxBiLIgXwclPP8fWSm
 hflEKYRxYHDxXGslVOx5V1BlRA==
X-Google-Smtp-Source: ABdhPJxmyXlow8oB2WHW+IPzYvMvUo7PgS65PH8PfGpbQdVffrPDgyMeyka8WdFf8rtH5SvKTFfMHg==
X-Received: by 2002:a19:5043:0:b0:472:36fd:4fc2 with SMTP id
 z3-20020a195043000000b0047236fd4fc2mr16723908lfj.258.1652798047702; 
 Tue, 17 May 2022 07:34:07 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p13-20020a19f00d000000b0047255d211c1sm1601365lfc.240.2022.05.17.07.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:34:07 -0700 (PDT)
Message-ID: <1cec6a09-9d80-99e7-ccc4-c918c6be7dbb@linaro.org>
Date: Tue, 17 May 2022 16:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/6] dt-bindings: arm: mt8186: Set #clock-cells as
 required property
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sboyd@kernel.org, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
 <20220517101514.21639-3-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517101514.21639-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_073409_577198_E3F03922 
X-CRM114-Status: GOOD (  10.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17/05/2022 12:15, AngeloGioacchino Del Regno wrote:
> This is a clock-controller binding, so it needs #clock-cells, or
> it would be of no use: add that to the list of required properties.
> 
> Fixes: f113a51aa2cf ("dt-bindings: ARM: MediaTek: Add new document bindings of MT8186 clock")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml  | 1 +

If these are clock controllers and new bindings, why they were added to
"arm" directory? arm is only for top-level stuff, not for devices.

In the future please put your bindings in respective subsystem matching
the hardware. Fallback is soc directory, not arm.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
