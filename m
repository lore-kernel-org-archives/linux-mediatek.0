Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A98EC77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRFtSx1Qrg+CDLZ/Fo2vJebkgNJBOCrU0gJGaDnKCY8=; b=EdEgLJ0jac1mOa
	NRyGrbR7FJKjJl6lQekQmP8h/7QoVls/cfzn/MX0fV4+RmYzHBjEr2z+q6otwMY7baWHi/7FkIABN
	WpcuM/v1ouAd5NtsaRoebKfEzKGBETcmhCqFR+BAWet/T0CltDMl0BPJEfH+IsEKJNWid7FXUQHGs
	qa71+oB6jyl4k/72B0mK4JsB4Fj7jK1516Y4wdkYFakd75JVpLrQSMn3zhBItJ23Gy2Pj65YjKiEs
	dK5lSBDOSf9TtYUuNTMdy/BhfI4DocJA5/vp+75+/V4G/l61hZUZi47nlQ8Jxlj1ZXGM4wqjyPm+9
	NeyN7+rA3o0f+b/i0exw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fKt-00B2P6-2i;
	Mon, 29 May 2023 16:03:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fKr-00B2Nj-1O;
	Mon, 29 May 2023 16:03:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f6dfc4e01fso35703775e9.0;
        Mon, 29 May 2023 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685376181; x=1687968181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WRFtSx1Qrg+CDLZ/Fo2vJebkgNJBOCrU0gJGaDnKCY8=;
        b=G08+hgi89y5+b84/X9EeIzk1I8MAfrsCvOe/SnJcgKvlNXijFcPaolDoL1ZFAsW2kR
         Gowl8hgzctVR63JTwgF6O8KCyFdcBK2I4xjpHXDeOjU0duYbjDzJ9feID3uvrBCdxfUF
         dJZ1FSvcPDAxFUsg4Ka0q1w5UlFxoUsIJAhTESUbOPRmpYv2tZtsd6tptDbKV88FzEY2
         7vEfm4JPR6VlvCwGweEW/xqXTxwawXAr0VPyRtkSrUniHeoDOukO6BhvfrfuaAI3uADG
         2zu7RiJCMmYt2RIIrlftoVkXHeG22QYSsj86VivItAatNlbqs0kAje2PDYgzfCXMr95U
         HORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685376181; x=1687968181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WRFtSx1Qrg+CDLZ/Fo2vJebkgNJBOCrU0gJGaDnKCY8=;
        b=b0LYINbTrdp8t7CawLmrOXjQxELUa7wlq6hJv1rb/zfD9TfAQYLCVY/X5H06pL+HD+
         trMqRBDC5bSovQBq2uHQEv6ms9oG9+235zAvLkls7e4U6wqJTlA/i3UsAAumsxhhSisN
         w/0ccorKgRhlRlJWF1tJ3cAk1iKuqrhmg86p8c/TI9SOSDL755/NWgHeOdXJsqNn8Aqe
         yUIO4SqwpHehAn46tQdrKDoFjJIcqmZLhEYfFUv67R28cHYalonKeMDLS1qDhEvfEXlF
         r+ywi1YXfvjnDnc+zO4F+SMDjY+iEf2ihxaOJdWJ+v+4jIDtUXJcUxMb/RtYTA4UDrGH
         IIIg==
X-Gm-Message-State: AC+VfDwjJNhUdhka6BibHF88bU/kVMaDa3ev46IGAYsu5dW03ZRn7m5u
	i8MBKMyuEOMal+7vG0A4T9U=
X-Google-Smtp-Source: ACHHUZ4uigxNzobgmnVYSy0x1Dll+6NuV5TAwot2deCigkpDBFRtQVP3fIwNi9DkuUHYGKJCqYBMrg==
X-Received: by 2002:a05:600c:283:b0:3f6:3ad:16a with SMTP id 3-20020a05600c028300b003f603ad016amr10116737wmk.31.1685376181436;
        Mon, 29 May 2023 09:03:01 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n11-20020a7bcbcb000000b003f427cba193sm18304970wmi.41.2023.05.29.09.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 09:03:00 -0700 (PDT)
Message-ID: <929d92f5-f656-95a9-a819-e450c48fc800@gmail.com>
Date: Mon, 29 May 2023 18:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 6/7] arm64: dts: mt7986: add thermal-zones
Content-Language: en-US, ca-ES, es-ES
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230421132047.42166-1-linux@fw-web.de>
 <20230421132047.42166-7-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230421132047.42166-7-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_090305_470638_1EF3FA08 
X-CRM114-Status: GOOD (  15.79  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonathan Cameron <jic23@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/04/2023 15:20, Frank Wunderlich wrote:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> Add thermal-zones to mt7986 devicetree.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 40 +++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index a409d5e845c2..845b29a9664a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -603,4 +603,44 @@ wifi: wifi@18000000 {
>   			memory-region = <&wmcpu_emi>;
>   		};
>   	};
> +
> +	thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			polling-delay-passive = <1000>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&thermal 0>;
> +
> +			trips {
> +				cpu_trip_crit: crit {
> +					temperature = <125000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +
> +				cpu_trip_hot: hot {
> +					temperature = <120000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};

We don't use above two trips. Please drop them for now.

Regards,
Matthias

> +
> +				cpu_trip_active_high: active-high {
> +					temperature = <115000>;
> +					hysteresis = <2000>;
> +					type = "active";
> +				};
> +
> +				cpu_trip_active_low: active-low {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "active";
> +				};
> +
> +				cpu_trip_passive: passive {
> +					temperature = <40000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +	};
>   };

