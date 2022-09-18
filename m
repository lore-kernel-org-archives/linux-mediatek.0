Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F8EC54EE9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 09:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEB1dZFh6VkoKbzfje7Er0GM6QVtyW+eiZmJagi107g=; b=OmFfBmnMqomXMK67Eu0ecQ3jj3
	ZoUykQXoq3aqgIFJFU7H1jKB0l9VkdfjMKiURAOTIrhlneXOh/8j4pc2xvYThUDMGjtm3uEsIAorO
	EL2cKk6bABwnM8FhE3LxkoUDyVLIDQ+HYQ1LpTOHjzXAOaxICIwO+DYPGWjOV9zzJ9eYwzzXpYWxO
	lQjqeomhWmy/mrYl5qKi9ohbm32xFZXWiLfyaW+gUEKSpd/cGrj4w/duL/f4zhLhvhf37esdYtj/E
	NXq9f3hztU0nHE5A1AqOqhn0pKmat13rT+GHf0/gO31sSCoC6Lau8ZET/YWFGwEbtpGzW7gzTbD0U
	s7Mf27+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZqlN-00EPuA-Gy; Sun, 18 Sep 2022 09:38:57 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZqlK-00EPqp-Df
	for linux-mediatek@lists.infradead.org; Sun, 18 Sep 2022 09:38:56 +0000
Received: by mail-lj1-x230.google.com with SMTP id j9so7666487ljg.2
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Sep 2022 02:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=HEB1dZFh6VkoKbzfje7Er0GM6QVtyW+eiZmJagi107g=;
        b=CzWhBYgYvdFJIunEEBf+SPmuuK9hsQ016YhNMThGUC1fP7UuRwT0WUerzIK+bGwtWn
         rx0EoU3vzqdAk0F6dwu/7wFhmkiL/r/lq5wLOqqhJ+WFgHCrECPjZsZJsQ5DlcWCEsoE
         Mgk4G8KiJVXrrnpDPXSwsa56ydIVmtscGEZrh8cIZS/Aw38jOc8rPyuBZWF7/5nRKMM2
         hfhJTEzy+H2u03ypmvbKay5BzZ8ps3mal6V2TCzMe0up67YNraNZGxMl0j5fW45nEZac
         ESt5v/NVCbSgMmy7UEkfI8BkyWlvPvEFp3iacwh1U8pMzuuzCLZkyNGRWqQldaRSjFfs
         URKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HEB1dZFh6VkoKbzfje7Er0GM6QVtyW+eiZmJagi107g=;
        b=KOjE0xVXKt3OHwVL3omzzZHHStLPx/tgnPVVJfe17NN781D8VoKp5J/Z2hfTEMLbDE
         7CzTc/D60Z2rAgZREfCNxQm7qAosv6K/X7emAH0kGt+IUkEEc7ehSJcdxxf17ihH5reS
         AFH99d0KQ+brfbo00hcyDrXW5behEb9VLU3vcUm92ZnYJjh3Ii9Q+Rx2peDoZO9raUmD
         FT3vng8Yj6nEzeWOgKkIZ0R1GFB9B729xIOBrIHAnmUapIdFNMn955QHpoRNinPEjnO4
         cLuCC44vH1w1nTkoLLbGDIq03UATT1hcsJTAVo04lFJz2UagT5Vs0mseWLwdIZIAJjRi
         KtTw==
X-Gm-Message-State: ACrzQf2Zzzf0Uv4Q4MWHHH1wrOOfZWs7NC67nOfPydfvmgMeUd1b/cvK
	Cuk8/RhKHq68qi+ETwJYeV4cCQ==
X-Google-Smtp-Source: AMsMyM59+gIAACAOz0Pj09IsVP4jC7D3hEx4CoPctx8Y09MgJhm0bBnlHW0nHkX1c/5BtZ5lHJLm3Q==
X-Received: by 2002:a2e:a4b1:0:b0:26c:521:76b5 with SMTP id g17-20020a2ea4b1000000b0026c052176b5mr3629219ljm.258.1663493932400;
        Sun, 18 Sep 2022 02:38:52 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p14-20020a2e93ce000000b0026c446918acsm537430ljh.134.2022.09.18.02.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 02:38:51 -0700 (PDT)
Message-ID: <78a0e713-2691-677b-e749-fde609944a7e@linaro.org>
Date: Sun, 18 Sep 2022 10:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com,
 sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220914124552.16964-1-johnson.wang@mediatek.com>
 <20220914124552.16964-3-johnson.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220914124552.16964-3-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_023854_517959_A3617471 
X-CRM114-Status: GOOD (  15.92  )
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

On 14/09/2022 13:45, Johnson Wang wrote:
> Add the new binding documentation for MediaTek frequency hopping
> and spread spectrum clocking control.
> 
> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,fhctl.yaml | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
> new file mode 100644
> index 000000000000..7b0fd0889bb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml

Name of file matching compatible.

> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,fhctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek frequency hopping and spread spectrum clocking control
> +
> +maintainers:
> +  - Edward-JW Yang <edward-jw.yang@mediatek.com>
> +
> +description: |
> +  Frequency hopping control (FHCTL) is a piece of hardware that control
> +  some PLLs to adopt "hopping" mechanism to adjust their frequency.
> +  Spread spectrum clocking (SSC) is another function provided by this hardware.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8186-fhctl
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Phandles of the PLL with FHCTL hardware capability.

You need constraints here.

> +
> +  mediatek,hopping-ssc-percents:

That's not the correct unit suffix name.
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml


> +    description: The percentage of spread spectrum clocking for one PLL.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Best regards,
Krzysztof

