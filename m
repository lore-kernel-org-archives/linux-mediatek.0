Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AA5C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKIh7Rn2uY03gvMDxLSAjGI/gyfIpOz2PNRYMB/8BVY=; b=taz5NsxPmXv0ajKcZUCp/PJ3/T
	22A25oR5S11W5yZNdCEtFWSmbKGxthBKnahO4FDPJlrUicv/DWAt8rn4sFr6vh/P5oOjqOA343DXo
	wzMxv4EDaetvSmboVevLrLpDOiiNZuLrWCvHg2TEeRUCRXbYOrcvK2M+zfVU+d80eq+RxRmlHP9Mv
	0J7WQH5hMaoxjCKpvvGzCzaOySzZbrU70nRBWqGYIvhSmDX6LTnwllXPAoQospv1wCAgnLF6FOZBI
	BrhKL02hc3ZOLC467R4KjoD4WSuGWje5GxcTB3Gqg0i/Rq008X+uQ7HwbSgcpfpqIkMBhd0dflyT1
	YHEnI0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otVHo-00GJXN-4d; Fri, 11 Nov 2022 14:45:40 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otVHl-00GJUG-6K
	for linux-mediatek@lists.infradead.org; Fri, 11 Nov 2022 14:45:38 +0000
Received: by mail-lf1-x12a.google.com with SMTP id f37so8617315lfv.8
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Nov 2022 06:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKIh7Rn2uY03gvMDxLSAjGI/gyfIpOz2PNRYMB/8BVY=;
        b=zMLqECAHr+5NcQNla/y7bj36+Jihm72LxNXySqm8xh+3R51WS6kmb8BtZlvnSPqDe/
         igKUE/GAiR9gOUGc4qHV9tkJW/7sbMSEYiWS0UIQYo1Z7/kmm6k5wASAJOJKomoVAY47
         Kb2GD5r0gu5itoPz6sZK49pbQhiySjQsFbvaEAnLSVpbI0fwR2LDfRE//v5AjgFf+DD+
         waGekmsiQWHluWL22/FWNtkd/9TBklGK4p1GLIPqkb8dKq8tCscS52QU5WvSegdzfiVX
         aYhHp1GTJg5XGXC58x1ppi9ZDqYtjsD7f3qL4rLaZ5BbJqNFlsPuI6//YxkETH8shZdL
         P8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nKIh7Rn2uY03gvMDxLSAjGI/gyfIpOz2PNRYMB/8BVY=;
        b=fhs/WLumGpn8dkyJXkyEeCwaiHwxsThQw60Z90yeMs8iAtqzeLN1AN1OhFOhuNVgtC
         v4U16Livrl5OWXIefCk5NRHVeW90MaQ+3Lnar27b1oPqn2IgJcVw2D94sUB/bOx3RhLU
         q6KMIbaiV7dw2VFwLcIQurKd0109mrIoZCS9PL12JntLwBMiz2pLLLDqXP4BBgmCX+3P
         PLSKiDHnb9T/TRIoZIDsuZd02uR5mh6tyRWHUhc8srcw64eXo/+2RSkoWRCDrhYdOeXS
         h6dVCUPE8dItZgg5Ak9fQWIVTsPoTr67d1dE2qCN+fvUYBNZ4pXtqoR4010g3rd+GM2r
         hV6w==
X-Gm-Message-State: ANoB5pnN7QX7YUeFPsTh1iuVBk+tMGSS2tsLCOA1y6mEcswEDWjpoWlC
	qiMmx3/7y0EvsLx/syfERITnoQ==
X-Google-Smtp-Source: AA0mqf4sgLsj52HWaY59vMgHa4fGiq4HixM8ZVYXfqlh1s69CeMqoQVflfov72D5yRE0mhynje0tUA==
X-Received: by 2002:a19:6d0f:0:b0:4a2:23b0:b850 with SMTP id i15-20020a196d0f000000b004a223b0b850mr780143lfc.60.1668177933536;
        Fri, 11 Nov 2022 06:45:33 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id n26-20020ac2491a000000b00494a603953dsm361574lfi.89.2022.11.11.06.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 06:45:32 -0800 (PST)
Message-ID: <72093230-9da4-665d-c177-055c0a5e33cc@linaro.org>
Date: Fri, 11 Nov 2022 15:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/9] dt-bindings: regulator: Add binding schema for
 mt6357 regulators
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-rtc@vger.kernel.org,
 Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-3-5d2bb58e6087@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005-mt6357-support-v4-3-5d2bb58e6087@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_064537_264472_FB5A5552 
X-CRM114-Status: GOOD (  13.63  )
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

On 08/11/2022 19:43, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add YAML schema for the MediaTek MT6357 regulators.

Use subject prefixes matching the subsystem (git log --oneline -- ...).
regulator: dt-bindings:

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../regulator/mediatek,mt6357-regulator.yaml       | 292 +++++++++++++++++++++
>  1 file changed, 292 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> new file mode 100644
> index 000000000000..3997a70a8b6c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> @@ -0,0 +1,292 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6357-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


