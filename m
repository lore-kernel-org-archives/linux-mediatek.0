Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47868C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 14:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CqAs9Ua7Pm8Q2XSJh/dswnbeNdXHzd1llWNOHbIuD0=; b=YwLyHZMo+eLyqDBFKEKOz8aq+O
	BMwTupPKIGA+3fQYcUf7gT6yW5r7zzryAsPNCruSdPu7lAOgQdvNNrXL0nucrOgBiWzX+pQ69UauQ
	qu/urhW2cH3NVNkyBjUDizbY5pn1wH+o+Yk5ebXhTJYOAsAtmVkjKETRDn+CBcQa+QcgL6mcKU3F6
	rW239nEcEIVgeg4fYTF2PIUo/m0CG2wYkMUqCBP2kFXyC89o7qb/+Mweh3+P+htxCtW3fNzFrAP/t
	o5ZDz6XoN5UfCL422Xz+PxHvT1nCXva3XPa0EwwvPrX4fd2iqMIzbFsFo9EGPUclX9W5/NvfdWL6S
	eLu8QQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRQb-00EMyK-3D; Mon, 18 Jul 2022 14:08:53 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRQW-00EMsx-U2
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 14:08:50 +0000
Received: by mail-lf1-x12c.google.com with SMTP id bp17so19540213lfb.3
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Jul 2022 07:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8CqAs9Ua7Pm8Q2XSJh/dswnbeNdXHzd1llWNOHbIuD0=;
        b=AZP+58llLmJC3ISGeRpqLe8S5SU5cyj1U9du0bCtxTz57c1auuFp1bdrqbtDZqmdH+
         jsoBPRqy9ceu6SiyC5bv8BCTvN4fTtcQb8pUA+539DHYzGFvk2FHHXWj+uTKBRwiUPkX
         yJd8kYfdlgQPDkA8rODq9IlHRtUkLX8P68eCbpivN4Cm3n+cCeIJfX9WggoGOe22Kyau
         Crn2aYQ21U+SKMhrcO+5y5LpZNWp+DhgS8aibz/SYGLlQzPHDvDpda+v7VDtly9UEXzO
         kJ8/IWI2xzQqXN+XzeRacveJoDw6jox0hBhtkS76wku+21Ff2wzlcHu2opjhZXXljR1J
         SnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8CqAs9Ua7Pm8Q2XSJh/dswnbeNdXHzd1llWNOHbIuD0=;
        b=FktoiwpWoLUUxZsjaOpXUSCrGIxho5C4pYVC4+q+7QzU4C9VgbqLW9UO1BlXBlZcNY
         jVUzAbSIt0N+AnQwEMpeEqj+d6Ffw+d4WE6AcDOouum+sGyIvwRCPbzlYsTNJ+7MVDLS
         wA++OL+XEOjvoybqc8NI5lX8ug+aRNNWUL9Wfd1qSTI2P20z74abQQvdbo6zdeyT9B+y
         2hrzQmPd2v/n78Fny/0+ut3uPH83ClIDdhbXxSmd/Im234n80oX3l/BmxVPzZMzvbrQ2
         ftpHfBLuTNZtAqB5iAxkqFaoXIxsdr1wLmmTQFPdPHqMh5RbcsUj9fHOOpAy1mOC/eTF
         GR7Q==
X-Gm-Message-State: AJIora+1rs3VU8JHh1uqbSzSB1GxPY8N4IyUeTwB6jH7Mz0o/QqSw7mP
	jmmHAFUJPZh25tgdohMxkWNPkQ==
X-Google-Smtp-Source: AGRyM1tMdIUR9jHUwbcEC9/NAS7p2+/gpqVLsPo9FDRHsddDPnRJMiUKece0HNK6p14XKK1PqS1IrA==
X-Received: by 2002:a05:6512:1684:b0:47f:5f27:b006 with SMTP id bu4-20020a056512168400b0047f5f27b006mr15108397lfb.225.1658153327547;
        Mon, 18 Jul 2022 07:08:47 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id p26-20020ac246da000000b0048a256f50b3sm2016576lfo.102.2022.07.18.07.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 07:08:47 -0700 (PDT)
Message-ID: <67c5ed4a-022a-e2b4-cbbb-ca6818bf4881@linaro.org>
Date: Mon, 18 Jul 2022 16:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: mt8188: add pinmux definition
Content-Language: en-US
To: Hui Liu <hui.liu@mediatek.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: srv_heupstream@mediatek.com, johnson.wang@mediatek.com,
 zhiyong.tao@mediatek.com, sean.wang@mediatek.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220718113813.23787-1-hui.liu@mediatek.com>
 <20220718113813.23787-3-hui.liu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220718113813.23787-3-hui.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_070849_020158_0EA464DB 
X-CRM114-Status: GOOD (  12.35  )
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

On 18/07/2022 13:38, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> This commit adds pinmux definition for mt8188 platform.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>
> ---
>  include/dt-bindings/pinctrl/mt8188-pinfunc.h | 1280 ++++++++++++++++++
>  1 file changed, 1280 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mt8188-pinfunc.h
> 
> diff --git a/include/dt-bindings/pinctrl/mt8188-pinfunc.h b/include/dt-bindings/pinctrl/mt8188-pinfunc.h
> new file mode 100644
> index 000000000000..bb764b67159b
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt8188-pinfunc.h

Vendor,name
mediatek,mt8188-pinfunct.h

> @@ -0,0 +1,1280 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license.

Best regards,
Krzysztof

