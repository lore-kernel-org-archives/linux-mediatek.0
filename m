Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3958C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 12:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cz3uhrF3VEXDKBXjF0La1zsgMx7cZf2E4vnPYJ5dMzw=; b=upPWJnvXykEZY+
	Cju+Gd1GMpuiOgWKc2HznQjIDNQ8Nk4HvVfMAKslrEbROpl8NuaYrUj41CVWfdYuD6iZaBSzQxEl7
	VoW7S9+EZcVmfXlf1eiHKe66cJnI7rMtdgfAOL1uUEDQiGK5L1JQ9KT5PyNXTZiQrRqkVu8ThAnFd
	y27VOHv6Qrjv/NXPXG74jvyXx0/zMbvU80C0clpAYtWhiY84WBAmBOvrol3U8cveeqojpuPNXXIYB
	g1yoe7mEPqsCrV2RI1ai+4YRvIXsc29Fb2sOuwpdNxkt04lndzGeNFYjUTXk7eZaGQuznA2B4+1nZ
	anG2hoG0a0NXx4eLu3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neFOF-00E0St-5E; Tue, 12 Apr 2022 12:12:59 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neFJi-00DyZi-VU
 for linux-mediatek@lists.infradead.org; Tue, 12 Apr 2022 12:08:22 +0000
Received: by mail-ej1-x62d.google.com with SMTP id u15so18242786ejf.11
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Apr 2022 05:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FVIAFXOAOIOJ12nQCzBaSLbjoQdLOUEfCpAYk7lvVm0=;
 b=wiq7r7lJ9yp4D+OTk6Q+grZtg+6hq66kaQ617FTJRbbWhq3zokiAI6NetHVKCiiTOs
 PgNso4cqG3b3rjuEmJ3tOXQF780QxzQQfmemyq+gAXtF+njCdkYjrh0n//BczmzGhvYt
 o9HoH7eK0OscJUIU+0cy4HN1em/lNWxAvzmEWNBSKaEuoaXMcm8iJcwQ+qLiMnwTdWy5
 RsQWdVjmDbfdxTAIGv4L1fxsxncFbzlPz1JXUXNsFI7E9aqXFBBD9PJwTgyX72D3istU
 qR66DWGnHQNIguDYzO+Z/fQH0ZDdNNKjc4Ijo54HZpO0eawsoi7IgfHKOWaL0vu6wrPM
 wkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FVIAFXOAOIOJ12nQCzBaSLbjoQdLOUEfCpAYk7lvVm0=;
 b=VopRS+4RIGwxllRNmCHoq3maLsteiCmUWYTEf0/RKXVfJguFi05M6SNrbKegCcVdph
 mWh2m9zfu9DOUKh1ytDS2N8dCbLfP8/PuEcjo80q6qeD8fM4vxEVDdoXS8T0AfPTeJpo
 UtSHHY7AFcVsvm4ruvf4ZzjeWcMVOkMscl2qMD2k+s35oUuUqotKuOaqNgocvgbhTS/J
 tOidldN17bhnnVp4uhk0jk4uLApz/NiQSLVBogmfEUyXkvtXnMs2woW5gyxS0fjRGV/G
 bB7ITZD/0GoftO1ANQ2gE95g0ESemikxpzqYXsL3ce4gC6YHZsAgNtPhrmov9CzeBdKQ
 P6tQ==
X-Gm-Message-State: AOAM5300x5biGnLZapbx5AGF8kWqByvHLhdRR1nm+cnhHzyLSEV96FLZ
 XGj4322mf3su6Pdt8ftp2nu7QQ==
X-Google-Smtp-Source: ABdhPJzxIrYJdlH/eCTtNSEdRrdTB/9sY8VsfheBg/P8DvRtlxoanCO5xY4tKvGm7nbJ/6fv1ySp5w==
X-Received: by 2002:a17:907:160a:b0:6e8:3c5d:9ce5 with SMTP id
 hb10-20020a170907160a00b006e83c5d9ce5mr23459258ejc.606.1649765295635; 
 Tue, 12 Apr 2022 05:08:15 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 b7-20020a170906708700b006da8440d642sm13294798ejk.113.2022.04.12.05.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 05:08:14 -0700 (PDT)
Message-ID: <215584ce-da8f-d4a1-a557-4cd2abc35e49@linaro.org>
Date: Tue, 12 Apr 2022 14:08:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: add mt8186 svs dt-bindings
Content-Language: en-US
To: Tim Chang <jia-wei.chang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com
References: <20220412112127.21570-1-jia-wei.chang@mediatek.com>
 <20220412112127.21570-2-jia-wei.chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220412112127.21570-2-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_050819_493493_60325161 
X-CRM114-Status: GOOD (  14.17  )
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

On 12/04/2022 13:21, Tim Chang wrote:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Add mt8186 svs compatible in dt-bindings.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> index eecfec13ee8b..122ffabb2be4 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> @@ -10,6 +10,7 @@ maintainers:
>    - Roger Lu <roger.lu@mediatek.com>
>    - Matthias Brugger <matthias.bgg@gmail.com>
>    - Kevin Hilman <khilman@kernel.org>
> +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>

It's perfectly fine with me, but it's not mentioned in the commit msg
and some acks from other folks might be useful.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
