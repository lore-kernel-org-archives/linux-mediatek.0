Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE42C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 08:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBL11i9fNS27loi0emWBWEgDr/mEHlYTAb/S8cELX2g=; b=evZsEDZaCwfn822akO+xSN9SB/
	TzXYJ3TVgooZGAqizZS9ohtzhNWB14EdTcDJtE5x/2twf2WNH1hliczVdXiEoy7bJBn+2xSVlPKZ1
	uXrysZ3iTSi8mPn1wjipuO2gsnhWHJuyVb1KdON4i4w1Rgq1ZsW44JCXXs3easawu3YbTQXipBs7r
	P7tSX1nFsJQuzxAGRR2F9EQ1naFJDEQl8Tp6Visgwll9F1zlxnVqvrXiwJ7hIDGsrxhGE1M87jH4A
	24KMWqKvEA+k3A+8Bg1Qb77UJ8jtV4p3/Gu6Sbz0iHfGRzo/XJ3Y6UnGIvGYbfPqVGhU+KG39y0If
	xgLvjTNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1petvX-00FCnD-04;
	Wed, 22 Mar 2023 08:34:35 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1petvS-00FCkc-0q
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Mar 2023 08:34:33 +0000
Received: by mail-ed1-x52d.google.com with SMTP id x3so69495253edb.10
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Mar 2023 01:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679474068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBL11i9fNS27loi0emWBWEgDr/mEHlYTAb/S8cELX2g=;
        b=hIjnO2BduDViVVsMJOLDv81RmGXZTyW11ztNDNTpZkRRUmoQFOdLABlIf2bBNZDoyt
         AIZ5psXlw6W6M4qkGW9j4gFmkcCeQkuw68dmC5wJ3MLFe5aZdBiQDDu3nrdNb9b9331C
         FXh75HJHNI8nAH4cOmDxinBSa2gq1OaUI0DoCsiiRjazHfFBr4GFBzCpthPPMwiwuiT7
         oFxcoqVdogxDLw7GjaM8BPYOAtuU1w2PYcv9lQC84/185oMdnqThskZ+9XON7wpEswX7
         7N6rD3wKmZ48G5ycOV+fax7DqXjbBN8eW5944xyZB4JiLLt24CpOxHCERSbSaz2tiI7U
         AhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679474068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBL11i9fNS27loi0emWBWEgDr/mEHlYTAb/S8cELX2g=;
        b=mUv92M/ITIl3y7bJBinxEfFVit07cScLq3fn1IaCuzI5+Zr1OmPRpczY200E3qOek1
         7vPep0nO7KKE1oQ0KDisLDw2RwwzEJxoUTGxGuQDJC+JNuZu+fIa1X+fL67ibkJf3YyB
         /YHm3DXHfWteMHOao07yLxi2vL2Y6JNYYXjSQV7obkeG0kLdxO99DoGo9dDEnfJmR1XR
         oRkvCAg9W7ts9Gy+Ocmc3WxaP9PX7NfXYa1PVJ/GWyaHT56CSlYabEsIQ4ZLykmhIxbX
         nbazmP6cJprB/cf6G3C0bbaPwU5kcSzhCfdfmOAclgw75F1aRz7V79Xeo3LLq/LbX4uF
         QuOA==
X-Gm-Message-State: AO0yUKURpNvCcKaeYeZJyYdNGURN/EPqgSZR7KB5226KkOZwzMZkWKVc
	iDebDqXvJA2QUIm0lCBdunH8Rw==
X-Google-Smtp-Source: AK7set/RU9ipTFuWd8LW1NBalKnVQgSATdNpWtPSW0Sl1wR/ejVp2PL48iiRRMJ7g8DTcDY0vYEfig==
X-Received: by 2002:a17:906:b007:b0:931:d277:78a4 with SMTP id v7-20020a170906b00700b00931d27778a4mr6126792ejy.30.1679474068490;
        Wed, 22 Mar 2023 01:34:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id qx20-20020a170906fcd400b008eaf99be56esm6997168ejb.170.2023.03.22.01.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 01:34:27 -0700 (PDT)
Message-ID: <83eb4c5c-b4ea-1fee-7212-c88821b90771@linaro.org>
Date: Wed, 22 Mar 2023 09:34:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/2] dt-bindings: reset: mt8188: Add reset control for
 DSI0
Content-Language: en-US
To: Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20230322032202.12598-1-shawn.sung@mediatek.com>
 <20230322032202.12598-2-shawn.sung@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322032202.12598-2-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_013430_299268_F03057E1 
X-CRM114-Status: GOOD (  13.27  )
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

On 22/03/2023 04:22, Shawn Sung wrote:
> Add reset control for DSI0.
> 
> Signed-off-by: Shawn Sung <shawn.sung@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8188-resets.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
> index 377cdfda82a9..5c9e74130ef0 100644
> --- a/include/dt-bindings/reset/mt8188-resets.h
> +++ b/include/dt-bindings/reset/mt8188-resets.h
> @@ -33,4 +33,7 @@
> 
>  #define MT8188_TOPRGU_SW_RST_NUM               24
> 
> +/* VDOSYS0 */
> +#define MT8188_VDO0_RST_DSI0                   21

Why this is not 0? IDs start from 0.

Best regards,
Krzysztof


