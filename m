Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E31C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 21:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3sawmvHmy4jfklEX8DAyzOJkmnIdi8fLX86o1nRLFo=; b=U6M4NkVJyKMV9b
	X3XrbM34QdTiN2ElRMo+YdFKNK2jOekF5iK6O1b7X//HiPmxP4WtH8yrbcRyHA4WgFK+z8ywqFQQN
	M6IPeB2u1CMINfNG6qRzWNl2XjdwxSLMGsdkazDlNW2UNXTbm/zVvOm2oiL5CLUfwUTOelN7N2HMs
	InSysGoPjM+mOiQ9wf1X1wQ9orsZGB7zQ6EKAttIq8K9Oo+bR/cP7EQR1OipVReRNPU+aTCCf60Fx
	gejJm1Or906odbzPupkJvpLteVXlmvjrSuXZPVWJ10Jlrm06slZcCq25upVpOpU5OSma/Oeuo0WSf
	2f3GgyFMkPdDQ1c3DxGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXwM-00CkiP-VF; Fri, 29 Apr 2022 21:14:14 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXwJ-00Ckfy-Gs
 for linux-mediatek@lists.infradead.org; Fri, 29 Apr 2022 21:14:13 +0000
Received: by mail-ej1-x62d.google.com with SMTP id n10so230061ejk.5
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Apr 2022 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5KwQXg3kAfcueRIgWTz8+NJpII/FC8wWWYg6Q9Nthhc=;
 b=mSmefWgKqpjdEIThnO+p+FrR4IlVHz/aNeVt5V101jsLbtXHw+BYZRl5xTcyqyvWab
 8aEoiEpPi2yHf/oPuQxhTjAs+GVRsCA37+PiwXGepxyti1yh0+uQG8b+xCfrg3R4QHYt
 UfMB3qpecwjcCrFylGBsw4ZtR/ZrEP5/DjDmigOc7q9cWfgQ02tqgJFBCsuD7s5sYH86
 U0MLJXTBJ8I6pCZJ5Rtl7YRdHFiRLK7A6iYSSTX2/P+J++kFRAHDulh626RT+UBUwq3J
 g+07638sGr11NU+cC4r2BCmznCcOb4BJU2B12C2q7o1zai+a/zoq6w5yJG4ErEOK5Fky
 CRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5KwQXg3kAfcueRIgWTz8+NJpII/FC8wWWYg6Q9Nthhc=;
 b=B6LLp8aOjBoRmbpRF4ZEMsiA6Tc/z2Mg8Z8jMGxMDKfU9aynwA7UdrpejlDv8jHtjE
 ieJdTAUG0Ej0uOPPkxA/u9pCCncPccAOgGnBCZbdoYyZuaYcimSsT/3Ncx85hxhghHfg
 Dapq/cbNZxbDz68LGHvE3+JEiFgl59BOhXR6AehOahVaIdkCqWQMQ/SkPE87rBiyKNJn
 IczGZJCtMrH+UZ/H167Rer9dQkFIoAWbQ/zLSEHY2UAb7z/I65hlUMANENbTVtnDfU2R
 JjnEv6ZkfahZsNWDAraT9ue2JTkPOkoit+MsI5nWqmjsCxw/3T9xCrP9nt+t1qpyKRvh
 fdWg==
X-Gm-Message-State: AOAM532RxmuX+Zn6vt/tvRaHkhqXxBgj/Xd0+M/C4vSGMfOQZK1gVsA7
 PU5spcsngKqREbVbS89CEywd8w==
X-Google-Smtp-Source: ABdhPJxA3AMKRcsX7oz+W7wdrr79LG0j9RCZsK//gaPa8R0aALk15ZUNTze57cPZ6d9bBthB755RpA==
X-Received: by 2002:a17:906:5d11:b0:6f4:a04:6b44 with SMTP id
 g17-20020a1709065d1100b006f40a046b44mr1130215ejt.167.1651266849614; 
 Fri, 29 Apr 2022 14:14:09 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ze12-20020a170906ef8c00b006f3ef214e68sm967751ejb.206.2022.04.29.14.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 14:14:09 -0700 (PDT)
Message-ID: <6f70854f-1b5d-5445-5b63-23d7899f6871@linaro.org>
Date: Fri, 29 Apr 2022 23:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V5 13/16] dt-bindings: reset: mediatek: Add infra_ao reset
 bit for MT8192
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
 <20220428115620.13512-14-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220428115620.13512-14-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_141411_614102_03C02944 
X-CRM114-Status: GOOD (  12.13  )
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
> To support reset of infra_ao, add the bit definitions for MT8192.
> There are 5 banks for infra reset and 32 bits for each bank.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8192-resets.h | 163 ++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
> index be9a7ca245b9..5863d138568a 100644
> --- a/include/dt-bindings/reset/mt8192-resets.h
> +++ b/include/dt-bindings/reset/mt8192-resets.h
> @@ -7,6 +7,7 @@
>  #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
>  #define _DT_BINDINGS_RESET_CONTROLLER_MT8192
>  
> +/* TOPRGU resets */
>  #define MT8192_TOPRGU_MM_SW_RST					1
>  #define MT8192_TOPRGU_MFG_SW_RST				2
>  #define MT8192_TOPRGU_VENC_SW_RST				3
> @@ -27,4 +28,166 @@
>  
>  #define MT8192_TOPRGU_SW_RST_NUM				23
>  
> +/* INFRA RST0 */
> +#define MT8192_INFRA_RST0_THERM_CTRL_SWRST	0
> +#define MT8192_INFRA_RST0_USB_TOP_SWRST		1
> +#define MT8192_INFRA_RST0_AP_MD_CCIF_4_SWRST	2
> +#define MT8192_INFRA_RST0_MM_IOMMU_SWRST	3
> +#define MT8192_INFRA_RST0_MSDC3_SWRST		4
> +#define MT8192_INFRA_RST0_MSDC2_SWRST		5
> +#define MT8192_INFRA_RST0_MSDC1_SWRST		6
> +#define MT8192_INFRA_RST0_MSDC0_SWRST		7
> +#define MT8192_INFRA_RST0_AP_DMA_SWRST		8
> +#define MT8192_INFRA_RST0_MIPI_D_SWRST		9
> +#define MT8192_INFRA_RST0_MIPI_C_SWRST		10
> +#define MT8192_INFRA_RST0_BTIF_SWRST		11
> +#define MT8192_INFRA_RST0_SSUSB_TOP_SWRST	12
> +#define MT8192_INFRA_RST0_DISP_PWM_SWRST	13
> +#define MT8192_INFRA_RST0_AUXADC_SWRST		14
> +#define MT8192_INFRA_RST0_RSV0			15
> +#define MT8192_INFRA_RST0_RSV1			16
> +#define MT8192_INFRA_RST0_RSV2			17
> +#define MT8192_INFRA_RST0_RSV3			18
> +#define MT8192_INFRA_RST0_RSV4			19
> +#define MT8192_INFRA_RST0_RSV5			20
> +#define MT8192_INFRA_RST0_RSV6			21
> +#define MT8192_INFRA_RST0_RSV7			22
> +#define MT8192_INFRA_RST0_RSV8			23
> +#define MT8192_INFRA_RST0_RSV9			24
> +#define MT8192_INFRA_RST0_RSV10			25
> +#define MT8192_INFRA_RST0_RSV11			26
> +#define MT8192_INFRA_RST0_RSV12			27
> +#define MT8192_INFRA_RST0_RSV13			28
> +#define MT8192_INFRA_RST0_RSV14			29
> +#define MT8192_INFRA_RST0_RSV15			30
> +#define MT8192_INFRA_RST0_RSV16			31

Same problem as with previous patch - these are not IDs, but register
values with gaps.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
