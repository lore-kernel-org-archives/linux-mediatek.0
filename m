Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24807C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WiA14FgpimI5L3ZVhEB1NA/wpO1CeVzl/FJNDVpq/9A=; b=ZpINlMgHcslsCx
	zrC11o0LgdUQ+UovKB8u+iOmVe4ICJBQICZSTtb8vIGwpdnwHKDLAnXbWVTHJ1uu1Oc0j79nv2w/d
	UupjCrStb1ElPM3WhKpMOsswZvs1QYdBP5eK9ekYewRb0Ti55SYOXuH5i+SeLZXhcn3Mnf8cx89jU
	0Cp88AoxrBaNX0eFMBpGqwW0nhS8AVQts0frjS68RmTPWPJQBrkdk0MXVAA6QAMWtjPD1lTSYFs3M
	RqGJODtzZJlmEhb7gRTNDJ46xIV9bhjntbyDc0Z80w4sGBKkZkONH5KZQCPmlD532M22oppRcPCEu
	svo/oRhl7fWvfe79DAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njyQ9-0057g5-36; Thu, 28 Apr 2022 07:18:37 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njyQ5-0057cz-Pg
 for linux-mediatek@lists.infradead.org; Thu, 28 Apr 2022 07:18:35 +0000
Received: by mail-ej1-x62c.google.com with SMTP id l18so7702346ejc.7
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Apr 2022 00:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mBaBjlFs4Qhyum9X+FB4PBgRB7fsIlzVMQhpW1H9ZZ4=;
 b=cqS0hTiH1HfntnnTaStANQsQu27QSlSciZVbyV3aDN8vNZVpLYWulIuZ2qgoMNFiB6
 H+8hhB3oM+M/FruD3+bj8674Jl6s74Bwf9oaXeSwRq1O9qpOBJRcS/3zx8p6dSYx04by
 E/Py+F0tqz2GEc9qT7CAhjplvNC0vZiEi6G/TTGkrp76nnLc7CRJy5x2JFmiglMlqAEu
 1bx9ImhNooMrP29bnJxQuZxAO5NcvpCYBXXHF1r4ZpeCubDA/77j9pKAUAPdw6XlxU3u
 SyTI0Do40VglihVO1CY2kUPCpkYe0r5AAmPRUBxHiC9DWtLSHGAhNvaDQmJkfqnt0LEf
 xDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mBaBjlFs4Qhyum9X+FB4PBgRB7fsIlzVMQhpW1H9ZZ4=;
 b=XjraZWiRADQRyeIQQ3+bzDc5jo42g92UeC0daY2iK7mJn1KfnpapMiYxc8IzRM4hpj
 iFPBWWWuq+FNLWn52Zft+lzG8dMBI8yT7MyYQSAAcTIKsSXQyF2LVRskuDHs3RLlQwBD
 uoSirD8uHXRi2DGVrq4QBWDV4x7g/YfRw838qfYvhSEoLnErPg/iEZW9OCb3NJbEep+Q
 ii8kPkCSpxTykYuLrCk/4av2JJYgnvyo0CiAb83WDfy4j2nTvo81fCKb02yEdy+i8bcp
 KL4oaDtH+GLueZBFpMiM2z5vNPyur8KqdqMaV6PlW5lKutktXQwVcXb2Bs4Ol/VXOprz
 hHkQ==
X-Gm-Message-State: AOAM530kB2pAk3rYqRyyK0pWUd9Ppc59Zb3ISyM/cgB+/EHGFkLu4n36
 DgMQssbs5oZWe7OmmOeQBWbwMg==
X-Google-Smtp-Source: ABdhPJwVuNe9f876NcOK+Qs8PuIFfo1l1GuseRL4xqp78YebmrHyUPTihDzB8RCfU4QhFE/K1Vah/w==
X-Received: by 2002:a17:907:7202:b0:6df:83a9:67d2 with SMTP id
 dr2-20020a170907720200b006df83a967d2mr29760294ejc.327.1651130312292; 
 Thu, 28 Apr 2022 00:18:32 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 q23-20020aa7da97000000b0042617ba6380sm1024491eds.10.2022.04.28.00.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:18:31 -0700 (PDT)
Message-ID: <d96797dc-8fbd-fe1c-f970-2f6fc8ca5b69@linaro.org>
Date: Thu, 28 Apr 2022 09:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 12/15] dt-bindings: reset: mediatek: Add infra_ao reset
 bit for MT8192/MT8195
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
References: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
 <20220427030950.23395-13-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427030950.23395-13-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_001833_897306_A748047A 
X-CRM114-Status: GOOD (  15.65  )
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

On 27/04/2022 05:09, Rex-BC Chen wrote:
> - To support reset of infra_ao, add the bit definition of
>   thermal/PCIe/SVS for MT8192.
> - To support reset of infra_ao, add the bit definition of
>   thermal/SVS for MT8195.
> - Add the driver comment to separate the reset index for
>   TOPRGU and INFRA.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8192-resets.h | 8 ++++++++
>  include/dt-bindings/reset/mt8195-resets.h | 6 ++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
> index be9a7ca245b9..ee0ca02a39bf 100644
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
> @@ -27,4 +28,11 @@
>  
>  #define MT8192_TOPRGU_SW_RST_NUM				23
>  
> +/* INFRA resets */
> +#define MT8192_INFRA_THERMAL_CTRL_RST			0
> +#define MT8192_INFRA_PEXTP_PHY_RST				79
> +#define MT8192_INFRA_PTP_RST					101
> +#define MT8192_INFRA_RST4_PCIE_TOP				129
> +#define MT8192_INFRA_THERMAL_CTRL_MCU_RST		140

This is still wrong. I gave you exactly what has to be used:
0
1
2
...

It's a decimal number incremented by one.


> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
> diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
> index a26bccc8b957..a3226f40779c 100644
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
> @@ -26,4 +27,9 @@
>  
>  #define MT8195_TOPRGU_SW_RST_NUM               16
>  
> +/* INFRA resets */
> +#define MT8195_INFRA_THERMAL_AP_RST            0
> +#define MT8195_INFRA_PTP_RST                   101
> +#define MT8195_INFRA_THERMAL_MCU_RST           138

Same issue.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
