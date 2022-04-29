Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF93BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 21:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQh1AW9h1gBI/TnvTkirTlKbu+rE0YQGiam95Qd3+x4=; b=jKX/mpWyEeiE3h
	FZNlo9c195HBXr/Zk7emHdYlbzC4/kLGvtVl/KJYxQI6FMhQUcRAI7/Z3egyOWmAUWyynsoT6A4Tj
	NsLcxmC+K+Die9tD0uE8s7SjXG65rZABVzvingP4N5oY9Cilm/n/cWIiK7us41gAugu0ykx4OFvzP
	hxKYzJ/9yUQarcu+E4JKe+mdEWlQxadwg57tYBI03ILb53Eb8VAtSzNPN4dnRAcRHq7/URzs4n5Mq
	2++BiVrS+X38A1PYIzDMi8H/rBRxF/SUiw+ggPu1Q5UjKzWa6gonXePpeXVq0sTPdechECXM3iA+M
	vF8CZh54NVa9HEKeB2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXvz-00Cka4-VR; Fri, 29 Apr 2022 21:13:52 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXvp-00CkVb-JZ
 for linux-mediatek@lists.infradead.org; Fri, 29 Apr 2022 21:13:43 +0000
Received: by mail-ed1-x52b.google.com with SMTP id z99so10411027ede.5
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Apr 2022 14:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oq0Zya7alVgrjes/Aox+txkeo77UdQpWJ11CNaZCjU4=;
 b=DSDaYI2+JOc5fVJeq4O73f88PTpo/fjuytmL6ZOqRjaI2Eyegq1yOrp93DIeTBrMOx
 xZgBDlf7sdT33mwl3sUpRzO0giyNNlS/dxV2yWOgTh9nwy/frejL36p9dkMkNwod3Xz6
 iwM2EXuiDQbWBDUpiFOq6N2ZOU+SB+7ZMt8CGmDtu6LddcKKsUug8DIUXdSU/Zg2n4jm
 dL+u8LQFc6C2F1ZtYwrqHkZFZiCrbAm+330p8lk7pPSacMviChAy44LsiTaJeyzkMGq/
 EIuW8+biX6E0jVY9bwX5M2SxksjrZ7ir/F1xlbrJC2o1tAGpCBo0nIrAvEUdam3thJi7
 70lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oq0Zya7alVgrjes/Aox+txkeo77UdQpWJ11CNaZCjU4=;
 b=01jkHG71ALr16/8g2d69L7EZohz7uIOLNMMM/+bIsHfoOL0F9NQwFBDbExw0suETc9
 dMdoge6GN9OxYrC+wkVogwHmu1LFbz4xwwI7X4ydbID9kvNi6kWREhvwORBaNrOrWp5n
 QRBA7EYGbAq/Jpy4Qy+mMdFmVZyWcgZ4QGEyxEsor1OGhQXNfIB0QEWgmvJwfhmay8h8
 KPLI10eFySP4aPGcGVVSLjs+g/bb4lGbuW2XLU3zY9orKTrtL3IJmPXthPqs4MiM3a2k
 ceyeL/hfv1ydwa/slHNOcpZI2MqZuXiqfukQxzY10ZscZ5x5zjF94zRuV4GEJZzEcptE
 Fd5Q==
X-Gm-Message-State: AOAM532qrF5Ql1r373pncSxXqEPWuKy7JGb7jvnx6CXgLOQ8nUez2AQC
 rWQzLWTU5yU50Dk3mlpqLQ+K6A==
X-Google-Smtp-Source: ABdhPJyVVhDYODMbBzhBifXA7nLpCfzCbTw5ofkKpFDmyCaG4pqIVxjAa/d1qFy9oGOViVNgIBZM+A==
X-Received: by 2002:a05:6402:51d3:b0:426:3a20:738b with SMTP id
 r19-20020a05640251d300b004263a20738bmr1249084edd.342.1651266813682; 
 Fri, 29 Apr 2022 14:13:33 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 e16-20020a170906845000b006f3ef214dc7sm952984ejy.45.2022.04.29.14.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 14:13:33 -0700 (PDT)
Message-ID: <839978c5-c337-7784-a04f-26b9883c703b@linaro.org>
Date: Fri, 29 Apr 2022 23:13:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V5 12/16] dt-bindings: reset: mediatek: Add infra_ao reset
 bit for MT8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
 <20220428115620.13512-13-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220428115620.13512-13-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_141341_670382_BAA7D2A8 
X-CRM114-Status: GOOD (  12.41  )
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

On 28/04/2022 13:56, Rex-BC Chen wrote:
> To support reset of infra_ao, add the bit definitions for MT8195.
> The infra_ao reset includes 5 banks and 32 bits for each bank.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8195-resets.h | 170 ++++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
> index a26bccc8b957..463114014483 100644
> --- a/include/dt-bindings/reset/mt8195-resets.h
> +++ b/include/dt-bindings/reset/mt8195-resets.h
> @@ -7,6 +7,7 @@
>  #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
>  #define _DT_BINDINGS_RESET_CONTROLLER_MT8195
>  
> +/* TOPRGU resets */
>  #define MT8195_TOPRGU_CONN_MCU_SW_RST          0
>  #define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
>  #define MT8195_TOPRGU_APU_SW_RST               2
> @@ -26,4 +27,173 @@
>  
>  #define MT8195_TOPRGU_SW_RST_NUM               16
>  
> +/* INFRA RST0 */
> +#define MT8195_INFRA_RST0_THERM_CTRL_SWRST	0
> +#define MT8195_INFRA_RST0_RSV0			1
> +#define MT8195_INFRA_RST0_DISP_PWM1_SWRST	2
> +#define MT8195_INFRA_RST0_RSV1			3
> +#define MT8195_INFRA_RST0_MSDC3_SWRST		4
> +#define MT8195_INFRA_RST0_MSDC2_SWRST		5
> +#define MT8195_INFRA_RST0_MSDC1_SWRST		6
> +#define MT8195_INFRA_RST0_MSDC0_SWRST		7
> +#define MT8195_INFRA_RST0_RSV2			8
> +#define MT8195_INFRA_RST0_AP_DMA_SWRST		9
> +#define MT8195_INFRA_RST0_MIPI_D_SWRST		10
> +#define MT8195_INFRA_RST0_RSV3			11
> +#define MT8195_INFRA_RST0_RSV4			12
> +#define MT8195_INFRA_RST0_SSUSB_TOP_SWRST	13
> +#define MT8195_INFRA_RST0_DISP_PWM_SWRST	14
> +#define MT8195_INFRA_RST0_AUXADC_SWRST		15
> +#define MT8195_INFRA_RST0_RSV5			16
> +#define MT8195_INFRA_RST0_RSV6			17
> +#define MT8195_INFRA_RST0_RSV7			18
> +#define MT8195_INFRA_RST0_RSV8			19
> +#define MT8195_INFRA_RST0_RSV9			20
> +#define MT8195_INFRA_RST0_RSV10			21
> +#define MT8195_INFRA_RST0_RSV11			22
> +#define MT8195_INFRA_RST0_RSV12			23
> +#define MT8195_INFRA_RST0_RSV13			24
> +#define MT8195_INFRA_RST0_RSV14			25
> +#define MT8195_INFRA_RST0_RSV15			26
> +#define MT8195_INFRA_RST0_RSV16			27
> +#define MT8195_INFRA_RST0_RSV17			28
> +#define MT8195_INFRA_RST0_RSV18			29
> +#define MT8195_INFRA_RST0_RSV19			30
> +#define MT8195_INFRA_RST0_RSV20			31

These are not proper IDs... don't work-around usage of bits with fake
reserved IDs...

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
