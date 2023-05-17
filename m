Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C453C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=757JBJxgRWVinuPZFHNhDwrpQbzagkxwUnhVEdJlotA=; b=O+gAMWCa6Gpf1/esSivq5JfMU0
	e9bKOzAoy4+VVUmBH5+GRZ8wtjXrymSVntdjxFnGuM5EQ8fL1XQ9gsFVV7weHkQH6O4gw045e/FFw
	8Ulc8zysc4q+S2NCmb5qyYoyvS0Zj8DkSRHLLfiV46PahIx52kdaFjrjbPPCznb8qarkooImT+5A9
	U3ilX2SstdZ5xfmrHhhZhn3EYTxKxWeLJVDoCq7S4HAQ8imREO4IEco5+SCL9nIFc6HMbExby4dse
	azPaxSBEVPMKhyoRslrAMyfvX4Sx7OxPZhfvVbGdBzKliWls8U7IynpayYZr7juYDny8j9961DEiw
	pmvuV1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzChm-008tnP-1k;
	Wed, 17 May 2023 08:40:18 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzChj-008tm4-0c
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 08:40:16 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-510d967249aso67066a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684312813; x=1686904813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=757JBJxgRWVinuPZFHNhDwrpQbzagkxwUnhVEdJlotA=;
        b=Sm26zdi4yXWmd/d5jNfPI+ohb2rArHlvywdRT2QtSF9RdznkTFYFLJw5eixE0xpD2D
         3DIuKF8aZGLtDWaN5Vz2s32vbMTLk+1rsQrL9DDe+rueBVKOJtq1bqPMHy3QU4u381wM
         GX3cAIMXuyEG1WuPyAENLUJZeywDLLOz5bSJiti645EOHFNTKKf6WToE7UamrRM56gJT
         DtypxiEf9FwRmPmnInm6WVJMLs+9k/FXppKdCoZckAWIZSgCIzIiBTrwBwB1D5dMlm12
         ptVtQo+A6X5qP+n29tfqHa6cUyTbPPD4eCJqlDUm1AAQlvGc8z9vwAD2qqMYWYN/veje
         ZknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684312813; x=1686904813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=757JBJxgRWVinuPZFHNhDwrpQbzagkxwUnhVEdJlotA=;
        b=jRl57SeAsZiZNePBE9fxGiq6sSPK6+PCY+oRq7xjbR9OmtI4zNHCtofX7YO6RyoffP
         0nRUV123Aipjjs5isNiuz5JMy7TkK+x8fqYEULr8VYdlTaieki+aulB1iF3V37TppAJA
         2w4GNYqIx2/r2xu8O8TqZ+9L7s/IKi4WjD69sG7g96Q2PL+B9Le0kz92UTJqQmCfCgZ6
         tjMBE3XL+nOKoPFd7/zfttz6ijCekAZLSHqRfftoGAQgsWrc+oJbnGNwE79dJs+V9A9k
         QBDXhGaR/Fwu32cZ0oUO92MNw/6lsviiTaonHyY1iGX1E+0XnbO2otWXGiaiepxZrrh/
         JVug==
X-Gm-Message-State: AC+VfDzv+9MbDDkcAIMCUrmWLXEg0q7pyCswKtYgUTSvfPg1O9XZWMYj
	+JO+olbLlUd4UagmVSygRE1z3A==
X-Google-Smtp-Source: ACHHUZ6MmcsQD6x7J6FNqyzT+Zg/rDHY0Azqiv9uIV7gCqHJk7KqXU7NawbLmhXBHUzQBiHfFpn3Lg==
X-Received: by 2002:aa7:d1c6:0:b0:50d:975f:3729 with SMTP id g6-20020aa7d1c6000000b0050d975f3729mr1577173edp.11.1684312813416;
        Wed, 17 May 2023 01:40:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id o22-20020aa7d3d6000000b0050696c2d2f6sm8771234edr.88.2023.05.17.01.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 01:40:12 -0700 (PDT)
Message-ID: <9c7ff0f1-3d2c-b83a-a47d-544c76f29663@linaro.org>
Date: Wed, 17 May 2023 10:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] clk: mediatek: mt8365: fix the clock indexes
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230517-fix-clk-index-v1-0-142077a1732b@baylibre.com>
 <20230517-fix-clk-index-v1-1-142077a1732b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517-fix-clk-index-v1-1-142077a1732b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_014015_240318_95374B24 
X-CRM114-Status: GOOD (  25.70  )
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

On 17/05/2023 10:28, Alexandre Mergnat wrote:
> Before the patch [1], the clock probe was done directly in the
> clk-mt8365 driver. In this probe function, the array which stores the
> data clocks is sized using the higher defined numbers (*_NR_CLOCK) in
> the clock lists [2]. Currently, with the patch [1], the specific
> clk-mt8365 probe function is replaced by the mtk generic one [3], which
> size the clock data array by adding all the clock descriptor array size
> provided by the clk-mt8365 driver.
> 
> Actually, all clock indexes come from the header file [2], that mean, if
> there are more clock (then more index) in the header file [2] than the
> number of clock declared in the clock descriptor arrays (which is the
> case currently), the clock data array will be undersized and then the
> generic probe function will overflow when it will try to write in
> "clk_data[CLK_INDEX]". Actually, instead of crashing at boot, the probe
> function returns an error in the log which looks like:
> "of_clk_hw_onecell_get: invalid index 135", then this clock isn't
> enabled.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

This is huge ABI break and I don't understand why it is needed. Entire
description above did not explain me that.

> 
> The simplest way to fix the regression is to remove from the header file
> [2] the unused clocks.

??? The simples is to revert the patch, so you won't break the ABI.

> 
> [1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
>      mtk_clk_simple_{probe,remove}()")
> [2]: include/dt-bindings/clock/mediatek,mt8365-clk.h
> [3]: drivers/clk/mediatek/clk-mtk.c
> 
> Fixes: ffe91cb28f6a ("clk: mediatek: mt8365: Convert to mtk_clk_simple_{probe,remove}()")
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  include/dt-bindings/clock/mediatek,mt8365-clk.h | 361 ++++++++++++------------
>  1 file changed, 177 insertions(+), 184 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/mediatek,mt8365-clk.h b/include/dt-bindings/clock/mediatek,mt8365-clk.h
> index f9aff1775810..fd59c8bdeb24 100644
> --- a/include/dt-bindings/clock/mediatek,mt8365-clk.h
> +++ b/include/dt-bindings/clock/mediatek,mt8365-clk.h
> @@ -7,147 +7,142 @@
>  #define _DT_BINDINGS_CLK_MT8365_H
>  
>  /* TOPCKGEN */
> -#define CLK_TOP_CLK_NULL		0> -#define CLK_TOP_I2S0_BCK		1

...

> +#define CLK_TOP_I2S0_BCK		0

Why? This is really broken. You can remove the defines, but re-shuffling
everything?!?

Best regards,
Krzysztof


