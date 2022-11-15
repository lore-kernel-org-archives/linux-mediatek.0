Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4792EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 09:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cj85LDuE7YSOIfXOLn4vE45URVWTJovLVTbN/ZWfzTs=; b=yrSH+KbVS7NGfpggb56wWs5ZCh
	b5Wd4JZmTnCTkb9hhmsUaK7zgeC3fEmkVjUni40DgJxk+9CwCocGLvEQDVAPyY17nhIlk7b9OxUJ3
	aW23j2Rse1LgjEwvDjPV2BwR7KCkzgrxnzkCGotd6JGBIVLwHOekJCghXc2Ed8bHlEUCzYQv6PRYR
	AlDmafyYSoQa8fZxNo6sdmXWqOPKta9YwDQiRXU/WZcbtlb16OXcH1+YuScC4m7UA2DQqJEwjjd0Y
	DLf++lIF4csudZhWA+nc+Cd79QKFtoSctUsNCL+M/vcg0dBIN2jawTw+HA/Vis9xNC0mbDG/BPJD7
	Yq2WXUMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousgy-009dyh-2z; Tue, 15 Nov 2022 09:57:20 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousV3-009X9Z-0y
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 09:45:04 +0000
Received: by mail-lf1-x12a.google.com with SMTP id g7so23596327lfv.5
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 01:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cj85LDuE7YSOIfXOLn4vE45URVWTJovLVTbN/ZWfzTs=;
        b=Wh3pTegPUo68mk/OqKJq6c1d4SGExhAXu4I4KNjU+iDU+D1lJGtgh8Vk+ceBylVCFe
         FRtK0u7IArav08eTDJMIktKsUhih6KxEF2m61BkEyvJZLtN8AWut9o65514pZraKtvLA
         VX6XVpSSEibim90aRBEP0KjMPkoUTM3h9x0iExxPtCayYkrrBnVDSwKLuAuSFfpFF4IX
         usWTYvd0flbb8MQ4cUPL7Q3pyshePLC7ydKWSU7/d25P1XlmfHWePiVx0QChbsn8hSZq
         epHSy7tT3fGWPlPJfZx38j3hQWQ7qbeGsJAvmV54et6BJYLlX0Iq7wuJZ5MX2ErGVoBE
         Uthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cj85LDuE7YSOIfXOLn4vE45URVWTJovLVTbN/ZWfzTs=;
        b=i3+RVVD/yy4OSlV57RaHysibcuIGDyy32gRlaSoZ/eA44ZvxVpNGDH8NoqNbSX3K2v
         DLpvkTgdtT4p8DX+oTNEN1kBfFrBHDdFWxWEcVetRNDF4AIoDEgz+GKvbcY26nHTVVcj
         E8zh0QTK9IUAyoDInzFxDPQCLrD92OHaqVbMdoYf8HRC03zhYfwk/cemiQyueh7IO327
         rwjpXvJR+Y70xanvMJtkxp8TLR19qY50gfvy0WMrC7h7zLKAe83sLCHxMJ944ND8HhHs
         EYjp/rY28pXkISO/Fsdtcz9Tui2oHsv1UOqnINq49/pHX4g51yM4NMVE3m6ZU6Ax0oYn
         c0NA==
X-Gm-Message-State: ANoB5plloCrsWQ3WEI7A6lR54nDbOyikRY+/12vePiQfsNwPgegVAPay
	jAQ723gWi4U2lzymIE9QZtVH5w==
X-Google-Smtp-Source: AA0mqf5Ou8AMwDJhWoIzU5Yl7Ly2rHt3VCJxLSXocSLvp/kMNI7tlSNFBzh/4RoT4ibDlBT0K1TTCg==
X-Received: by 2002:a05:6512:2626:b0:4b1:8279:a579 with SMTP id bt38-20020a056512262600b004b18279a579mr5084779lfb.418.1668505498315;
        Tue, 15 Nov 2022 01:44:58 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 24-20020ac24838000000b004a2550db9ddsm2129725lft.245.2022.11.15.01.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:44:57 -0800 (PST)
Message-ID: <9c883417-5a26-cc5d-a6c4-c00cba53f638@linaro.org>
Date: Tue, 15 Nov 2022 10:44:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 07/15] dt-bindings: mmc: mtk-sd: add bindings for
 MT8365 SoC
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-8-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115025421.59847-8-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_014501_216249_A9771962 
X-CRM114-Status: GOOD (  14.77  )
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

On 15/11/2022 03:54, Bernhard Rosenkränzer wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add MMC bindings for MT8365 bindings.


Drop second, redundant "bindings" from subject.

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 6f8ecb4788eb8..36f9fce8f4795 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -35,6 +35,9 @@ properties:
>                - mediatek,mt8192-mmc
>                - mediatek,mt8195-mmc
>            - const: mediatek,mt8183-mmc
> +      - items:
> +          - const: mediatek,mt8365-mmc
> +          - const: mediatek,mt8183-mmc

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof


