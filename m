Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E2AC004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kISsw3ka351W71cdTlHfeqvj1tDvB34A5YrxX8eaPhY=; b=I7r7y9A/vthm0V2HV+d3BHi/u6
	mwC+uPTaDDTcOzXT5V8WEo7cOZzLnN3zkUG8DH567yDg/LRKlt19arjiPmV07yA02Zo5ZHVXEXnIh
	iNnsPMl4nT/9U5gsvS4yitfYjF255ziM3K4E3hgy7Cqfd4x1ADthDiskUD4nJCgHSjijN5hHlj1VH
	G+tbOxVHFqBVVVT7ZwbUtQqsuTDU5Zhktf5hAg9oD3CBrY6QcK1uS/XEiG0xui3PtzDqulNgzrKY2
	8VMrW54pihalK0Iu3EMSJVB67C6PN5yR9/ove/g5zJuWW+alVXsvserrTcYrGF7x8qFb+JyKavAP6
	JuPleQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXqB-0060cl-AV; Thu, 19 Jan 2023 16:32:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXpp-0060Sa-N9; Thu, 19 Jan 2023 16:32:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id j17so2018212wms.0;
        Thu, 19 Jan 2023 08:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kISsw3ka351W71cdTlHfeqvj1tDvB34A5YrxX8eaPhY=;
        b=NSkj7iMOP2CnoZNIaPDjSKL+KKbshuGz1XlGid8CesKFWQes8jnfg7LV5VtSmrraMS
         4tR3Ms9c3Ea8vM5JnC4FPTfui6ag0x7JhjwkdG+EhvtZlddPLFr1VYagyWzDyxLJX/NV
         OgWCLU8qqBpnGmAvPLyEXPJbtgPiSsXtFDwcggKhzVYAYHGbYubjEkp12f0WK1NNymvv
         /jvkTZr+i5oi9sYME7TkSchyaT/pOjy5TG0ciQRQwiLiHXeeMY7268YO+ZosuXuq1tGA
         mpUg42XC2S12FRBRwFo81tmmkDCFCLzwniZxI/NU4Y2gDmmrWvefRcxBFnqkWDRFiNR9
         q60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kISsw3ka351W71cdTlHfeqvj1tDvB34A5YrxX8eaPhY=;
        b=sCUvVHHHrXPoZvY+wW3Ekf/FWssxAf1c5C1K83SIktiagfH8bal930H0iGvEutrxnw
         8Ts4A6p82LIw3eQwKbU1jA7QY/83hMiP5s4ZDYFi8OOH0XiqCLdQWc0+0/hPoLGpfymz
         dR/GTbKywBdH61EIgjgSB74ONm/Uu2MhgHqTZxICiqSQ7cXBYEs3xAtZM0sfY4WIIo3y
         +BOCMd99Twyce6iYOT6YrCmN3pcHXb4MbhNLBUHaV1s7e41X6/kIFLbPZz2Se2hepgll
         CUyW9fLlEIwbFew8+tDhFElYHF3rO61vnuQV+wvngud7zS2qEKpBz0Rd1jWcQlLKdzBT
         0UCQ==
X-Gm-Message-State: AFqh2kreX8PtDaxtjnOrlb3SuW5HA34SEk1wUwA5iWXPMK52ylDNQTUr
	7xA2hGca9XzDj3wHEmFIQeU=
X-Google-Smtp-Source: AMrXdXv9EBtbXnsYULYPFoJNloy6O/ErN/hAcWIoch5i2nj40w/DPTMPhwgaX6fLP3mKWsam8/XI7A==
X-Received: by 2002:a05:600c:c16:b0:3da:26e5:10b6 with SMTP id fm22-20020a05600c0c1600b003da26e510b6mr11197814wmb.30.1674145935484;
        Thu, 19 Jan 2023 08:32:15 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id fk6-20020a05600c0cc600b003a84375d0d1sm5193380wmb.44.2023.01.19.08.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:32:15 -0800 (PST)
Message-ID: <c0026ce0-caca-1ca2-dc4c-72d14078de6f@gmail.com>
Date: Thu, 19 Jan 2023 17:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 8/9] dt-bindings: display: mediatek: Fix the fallback
 for mediatek,mt8186-disp-ccorr
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-9-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118091829.755-9-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_083217_857979_6574388C 
X-CRM114-Status: GOOD (  18.08  )
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



On 18/01/2023 10:18, Allen-KH Cheng wrote:
> The mt8186-disp-ccorr is not fully compatible with the mt8183-disp-ccorr
> implementation. It causes a crash when system resumes if it binds to the
> device.
> 
> We should use mt8192-disp-ccorr as fallback of mt8186-disp-ccorr.
> 
> Fixes: 8a26ea19d4dc ("dt-bindings: display: mediatek: add MT8186 SoC binding")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index 63fb02014a56..117e3db43f84 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -32,7 +32,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-ccorr
> -          - const: mediatek,mt8183-disp-ccorr
> +          - const: mediatek,mt8192-disp-ccorr
>   
>     reg:
>       maxItems: 1

