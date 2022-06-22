Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F0AC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 11:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlJPaWZrBAzG9zVsTlPDKOfBvLxqfXex9tzVExVOy6w=; b=PC5XHdG890CMNAPz/2iEsETCYm
	8PFyBBuVGN8g/35+FhhPI9p3rI/NPAKAjz7CU/R/LRvZJl2sR1cuPl5+psEEHv9tFGVKm/398Lubt
	LcheyyO2CVa3Tpci0LCHltRepJyGIzIY8S0aIhQD5//mvjwECvxh4kpW8Pr/jnrxC92u1E3SfTeGs
	1FQZDD0JhX6Xm6YNVuyXvur1FckinBeojUOgQgQ4Op1KnuXASrCmxyTCQUXu3/j6drmOwiatxA88q
	GuPii3XWcooR7wEM78w+XOJQHdaFELm/LhgzEtMaBrdVvLfqa2auoXjGfqITZN6b76+3Bu1qypinK
	b74WxXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3yDe-00A4hu-8G; Wed, 22 Jun 2022 11:08:22 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3yDT-00A4fD-2Y; Wed, 22 Jun 2022 11:08:12 +0000
Received: by mail-ed1-x52e.google.com with SMTP id eo8so23423562edb.0;
        Wed, 22 Jun 2022 04:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vlJPaWZrBAzG9zVsTlPDKOfBvLxqfXex9tzVExVOy6w=;
        b=l2D9wYP1r3RQtj7l6aaHLf2JXJZmHzq2H8bmoRYlR8YceEn2ApY30wqlSsH+ylJt3v
         aqxCRoD9MW+spCqGJUBmuQpRG3SMxRI2EtH0YHLlYeQm6HySHBGoEEsX4GrvimNBpPDp
         BMFdlqX7E5RleJMd2O1pKxntnwRzVnc3eoNmhcVe1GQeMkxZPcfcTniul2+fjAZBp9+n
         q5JWib1nloudfIx/EShgbGI45Qmb4v6ceOSaD3OCtmJi1fh8vKPJy61T7xxAgxdXs+GW
         wDDPiGpEKHqyne9YWzTjfnKj5X1syOEsP5jvhDFgxkO6tz1B6grNEHuy1uU0hXKo3H9V
         EC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vlJPaWZrBAzG9zVsTlPDKOfBvLxqfXex9tzVExVOy6w=;
        b=7VmQ5L5sMl5/qfgxi+hUGjfkePK8O9PhFxe7SQncK6Mcit8u6SnZNiPZ5Dc9Nw01gn
         Mq6JYdF7DSA/GVsKW7LiH7wfXggZzFQD8N1W2I/a+pS2/2eciJi9emH/IlIfBZWCVj1n
         N2irmrrt25zgbSdEsB/L7OV6UBuq1IQEBltl6oLL7Bh/3WsunXUyCshc28/S+UrEpK6/
         aeZWI0eK0ZzUmXaB9ARyuNMdVXgG1T3FsCTxVodtV9GGeAhYkivm/oez2LspFLDl2AGX
         m6q25pGGmHmLoBLN+nC9MRBQ+6cr50aHSGd5c1xkcLQ4RrBekZljTs25znQtE3UAwE5U
         orFQ==
X-Gm-Message-State: AJIora97vwb+56eX22cibA2n05N4TaWMoZaYif73z4dfpV7BmbgB/gX4
	tNY6pnna406XoYNWIAGTcrY=
X-Google-Smtp-Source: AGRyM1tPvqoJyTRlLUMrUILBK6wwNicXk74DfsMpdEzAjQEzwlAMJ5hbcjGcUi16hzG9hv0/UbZNMQ==
X-Received: by 2002:a05:6402:520a:b0:435:965f:e266 with SMTP id s10-20020a056402520a00b00435965fe266mr3371871edd.409.1655896089167;
        Wed, 22 Jun 2022 04:08:09 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906329500b006fe8a4ec62fsm9104708ejw.4.2022.06.22.04.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 04:08:08 -0700 (PDT)
Message-ID: <3a587e20-f991-adf8-fe4e-a09caa1e14c7@gmail.com>
Date: Wed, 22 Jun 2022 13:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 16/16] arm64: dts: mediatek: Add infra #reset-cells
 property for MT8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
 <20220503093856.22250-17-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220503093856.22250-17-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_040811_167941_262178D3 
X-CRM114-Status: GOOD (  15.56  )
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



On 03/05/2022 11:38, Rex-BC Chen wrote:
> We will use mediatek clock reset as infracfg_ao reset instead of
> ti-syscon. To support this, remove property of ti reset and add
> property of #reset-cells for mediatek clock reset.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

My understanding is that using the old DTS with a newer kernel wouldn't 
introduce a regression, correct?

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 13 +------------
>   1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index b57e620c2c72..8e5ac11b19f1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -10,7 +10,6 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> -#include <dt-bindings/reset/ti-syscon.h>
>   
>   / {
>   	compatible = "mediatek,mt8195";
> @@ -295,17 +294,7 @@
>   			compatible = "mediatek,mt8195-infracfg_ao", "syscon", "simple-mfd";
>   			reg = <0 0x10001000 0 0x1000>;
>   			#clock-cells = <1>;
> -
> -			infracfg_rst: reset-controller {
> -				compatible = "ti,syscon-reset";
> -				#reset-cells = <1>;
> -				ti,reset-bits = <
> -					0x140 18 0x144 18 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* pcie */
> -					0x120 0  0x124 0  0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* thermal */
> -					0x730 10 0x734 10 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* thermal */
> -					0x150 5  0x154 5  0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* svs gpu */
> -				>;
> -			};
> +			#reset-cells = <1>;
>   		};
>   
>   		pericfg: syscon@10003000 {

