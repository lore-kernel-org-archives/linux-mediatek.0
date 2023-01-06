Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6849CC4708D
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74dZ6pX8Hzz0wsD+Rsd26TBqQcFBKeyHe2CX60hOkAw=; b=thtxSVZsbnC1rRH4BTfzVNno0S
	nBTk6J+6OWfdIUoYerlhtEQ0vgZ0TN4PVjnQsgu+PKsinqWZWwlHayzr7CKpneWlu1OXKusM+/SCv
	JkrvFfVr7ts/DkFdjwAPLNlVxshU/bANUPpiBZsKTbgkmg0ZChid0rlsGVYfG21xq/Nyc8dbpAtXX
	pWdFlr3y6qdKTSvBuXmxPappY9ZoLwDgxeVsXp5uhvLjlFqOfMMHD/hqzdjfAjTsTX8l29tvXwgAy
	r0dmkSUANx7V1Ihy51E9IeObwc5ZyrIhwm7+PjE7lDnLEYl81j6/M28X/hNLp6BZNhc8G2sL6fgug
	rU/Zy9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDmHX-008Eo4-8E; Fri, 06 Jan 2023 12:57:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDmHD-008EdE-Nb
	for linux-mediatek@lists.infradead.org; Fri, 06 Jan 2023 12:56:53 +0000
Received: by mail-wr1-x42b.google.com with SMTP id h16so1174999wrz.12
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Jan 2023 04:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=74dZ6pX8Hzz0wsD+Rsd26TBqQcFBKeyHe2CX60hOkAw=;
        b=QvgwMKcl770gVhG3ElVmYe9D+yX6RxX07iUym3DL4v75V+bUiMIk6d1XN30kz72hkD
         guv87kWgeuYsJ5q+YAPrxHZf7JrtCAqn6vcKzvy7y+YaiCHOf3AC2Cq5RZIhqXX+q6SQ
         ue/VYGO1uOIk8WHNuzC6w112PN5Mtpl5kohZBkoKEVph/daoBycoFGJEf55BHMMMskZj
         MvoTGP0uJV8caK2M/a9mfD69LRwOl5TgAJ5zK7pwRxtwr8L/vtCBGP7GTqsBE825gmcq
         Dsul/1R2zcqmm3O3Ff8NqBS5lwXnuC4oKBQZF2ESgqniIa70YpdraMXTWUgCSwRbvFwi
         Gmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=74dZ6pX8Hzz0wsD+Rsd26TBqQcFBKeyHe2CX60hOkAw=;
        b=50DBgmK+x6/BgzsWMzzt5slIp0hfMHr8yxKuNCTov7ijpCg0R4vzhU7z7ZtsJitmjJ
         oI+V+UoLO1gfh1eXFQZ/LYMCkxWhLrp/fY+6Rz/UlsfFhLCnQZ+RURH5l6TA71d9m5+J
         jO6f+RGtbJnqVBI5z4ViyM2klUdHI2O9YjDsYO1nIPMzggb3e9l9lm6cZM//E5/UuUWP
         1hV4nfSV8oGjgjWzlDIILmCLNN7r6dgEWgakComMltTgP53Eg19vnBq2/IjkZE79keRa
         CgjVGKz+exNH8N1Y9LIR4IFsqgKDB+RQrLoK82j4kJ9+gxA8wjvJRCXv5XU0l5PvutNj
         g1xA==
X-Gm-Message-State: AFqh2kpJpgLABzqyR9z4k1gFQ1qtibH6kT/SB54ehHL6PWVyDrdUQ+8J
	yiR8gUOg4P7Jr1Goa1vE/PmQtw==
X-Google-Smtp-Source: AMrXdXuiv7CJBvtiOg0LAC+AjzfIEkruZ3G21KfoSikp3a4fKbahEWvyGwVK+J0sGjtgBgZgW/5o6g==
X-Received: by 2002:a05:6000:1109:b0:28d:b028:b16 with SMTP id z9-20020a056000110900b0028db0280b16mr17595490wrw.32.1673009807929;
        Fri, 06 Jan 2023 04:56:47 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l13-20020adfe58d000000b00296730b5c3esm1106814wrm.102.2023.01.06.04.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:56:47 -0800 (PST)
Message-ID: <fb2a4f7d-f35a-2c48-ad31-3138a4fae247@linaro.org>
Date: Fri, 6 Jan 2023 13:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: enable USB device port for
 mt8195-demo board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Miles Chen <miles.chen@mediatek.com>,
 linux-usb@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
 <20230105092809.14214-3-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105092809.14214-3-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_045651_785130_81633DFE 
X-CRM114-Status: GOOD (  13.65  )
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

On 05/01/2023 10:28, Macpaul Lin wrote:
> 1. Enable USB device port (USB port0).
> 2. Enable u2 speed for other USB HOST (USB port1/2/3).
> 3. Configure mt6360 (TYPEC) related pinctrls.
> 
> Note: Full dual-role switch capability requires TYPEC MUX driver and dts
> update will be send in separate patches.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 51 ++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index 07a864cb8b54..207bb5f4c58f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>  #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
> +#include <dt-bindings/usb/pd.h>
>  
>  / {
>  	model = "MediaTek MT8195 demo board";
> @@ -380,6 +381,22 @@
>  		};
>  	};
>  
> +	mt6360_pins: mt6360-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO100__FUNC_GPIO100>,
> +				 <PINMUX_GPIO101__FUNC_GPIO101>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	u3_p0_vbus: u3_p0vbusdefault {

No underscores in node names. Also does not look correct naming. Please
run `make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +		pins_cmd_dat {

Same problem.



Best regards,
Krzysztof


