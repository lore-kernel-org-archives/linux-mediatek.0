Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47767CA0EEC
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63a3mA2Gm93WC1jW1PtjeC3GrBOcYzQQqgqOV2oqNY4=; b=H/Z/fyMOvAmltCtxh2o6mmeyRA
	iLJQ3s3EvnYJmQ8Ho/4fawzyqyaVxAmwy9V4F1TWUuJ68XT4L2/vikuLWMIFmc/NtPUgPGTyZedMB
	0u8RA2ANselztdvOdBjdc8Q6hxJVl80a/LQ02I6NycTxUEl5wMyANeOk8w0O5bEkaWHSApYncXJ+M
	0Rt9H21HHAU/ASzAnOe8mJ9UMq9kdoZ1LpC0K8pP6VkyB2+Emf0J+CnJlV3Mln+98pDqluMV1b2az
	ea59eYD5oetpWJT30M7UIylbYnqnvXluc7jhEadDTRI0k97H+FCX64dYEXpbiKad0rBNolDye/EHa
	WWTOXf1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4Ur-003bPi-0f;
	Tue, 12 Sep 2023 14:36:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4Up-003bOF-04
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 14:36:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-403061cdf2bso31476775e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694529364; x=1695134164; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=63a3mA2Gm93WC1jW1PtjeC3GrBOcYzQQqgqOV2oqNY4=;
        b=MemJke7XA7Ge723m/UPPgYuUjfPPWrjSd8JfNd4r5cujy+vDuVN9hx7hECmNAuaSPm
         U1Hwt80GZ8tgSIpV3zBE/c//pvJf641IuMKJqqklHTxMil5WG1E0n3ooTP0p0gudIiKZ
         zNB40O9JoIsojCuMti4WkH8EJP9dwZhCle470Hb9n9HtY0BesMX11oIoLxrwbRv8oo7u
         2SSFGTLzlreX9vR0HOD1hpMDOsYtkAVVmOK1lawl9PfflOl/pjfQPXMxt6vrTHwW4hvr
         6V7kftSgEUBb2jZMW6Ob3kkwGZlotXteiAnQhhpDVnDRt+/+odzPHvwL825WZXbQ0xPY
         BT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694529364; x=1695134164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63a3mA2Gm93WC1jW1PtjeC3GrBOcYzQQqgqOV2oqNY4=;
        b=tnxF7OblxrXpg+7ufwy1NBGsO9UrsS5OnqrcfQ4TbxGNghwskkMMVz0ABGgI835XEZ
         akjVME/HAK607XtP5EDYNeeMkasVwVS60MFGVpuIgagEwjL6imrNjE2CMFGO6UmDfn4e
         rsOzcG8MfRBLsKioUiSBCA8qqeE1/nKR6/thVYLInCy5pX2bzZmIZDq1afiqm1kATQCM
         vaBFGQvUwX3Dj9TuPArzMXpdt/w4F/FwRZ07NGa3Vf3/MAGhkIwiX2wA5NCwLXX8Ruj6
         hvUD5ppgYBndZwaescRndmPRD4wN6OVB/JBif8IYd1Xnr7g+PN9EkCh9wnBR385JVl7t
         OITQ==
X-Gm-Message-State: AOJu0YxMGRIp4VwICfVNRTWhoJdWX3xFzEaYzdO+rKYLUDPKUcpGqAdM
	bxr9Ql0NaHIOe7SNUgE76dWXig==
X-Google-Smtp-Source: AGHT+IE7WN5e4H2gz+JyHLx0OAeAEwbWuRgiz9o8yiPITiOChVzW8ZB+w6eNBncRVidGP784GMnbGQ==
X-Received: by 2002:a05:600c:2205:b0:3ff:cadd:329b with SMTP id z5-20020a05600c220500b003ffcadd329bmr12297748wml.31.1694529363781;
        Tue, 12 Sep 2023 07:36:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id p7-20020a1c7407000000b003fe23b10fdfsm16254627wmc.36.2023.09.12.07.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 07:36:03 -0700 (PDT)
Message-ID: <8404a761-8d13-e2c7-1655-e465377867c4@linaro.org>
Date: Tue, 12 Sep 2023 16:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230911115717.26184-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911115717.26184-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_073607_057881_D5FD4F12 
X-CRM114-Status: GOOD (  18.49  )
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

On 11/09/2023 13:57, Macpaul Lin wrote:
> 1. Add compatible for MT8395.
> 2. Add bindings for the MediaTek mt8395-evk board, also known
> as the "Genio 1200-EVK".
> 
> The MT8195 and MT8395 belong to the same SoC family,
> with only minor differences in their physical characteristics.
> They utilize unique efuse values for differentiation.
> 
> The booting process and configurations are managed by boot
> loaders, firmware, and TF-A. Consequently, the part numbers
> and procurement channels vary.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> Changes for v2:
>  - add more detail description for mt8395.
>  - add bindings for mt8395, and mt8395-evk.
> 
> Changes for v3:
>  - add back bindings for mt8195 compatible.
> 
> Changes for v4:
> Changes for v5:
> Changes for v6:
>  - No change, update Reviewed-by tag only. Thanks.
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index ae12b1cab9fb..2e8ad49c3479 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -248,6 +248,12 @@ properties:
>            - enum:
>                - mediatek,mt8365-evk
>            - const: mediatek,mt8365
> +      - description: MediaTek Genio 1200 Boards (Genio 1200 EVK)

Drop description. This is an entry for multiple boards, not only for
this one.

Best regards,
Krzysztof


