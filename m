Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F488EB8FAF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RFjlJFCPC0cFB7nl+UKfpa8lGL9BW79DIGhjR08yhs=; b=QyF1ZN7uwcrsWvE9BrmKq48FpM
	uO7sp4BmlaaTV9RFD126QCesBrNgYDS6CW2w682UfcLpU8axr/fRZggQC4/x1odY+7+BZqSGQP4za
	q1I5t4EVDveRtmU4NGLAGHmODv1yo7Ywk3rVa3PuHhrcBjp9JFXZTNhI3eM6xQHoWbIAEt7Wg5X2Q
	89Gg/xjeZHYgTnbm+THApaSBkUgJZ99K6HFig36Uy7nAPAfg/uDTZOENYP8flLu/je6LgKdOa0YQj
	T7aTblNA900VmftpIJgXQXqxciw7LFqVB4edSkQRNQMcRBpgb4K7Yom88dkYBtnilu4FTAIlvwxDM
	R5jT9tkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqyr-008wzn-1a;
	Wed, 06 Sep 2023 11:45:57 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdou4-007w2m-13
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Sep 2023 09:32:53 +0000
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so1564205a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Sep 2023 02:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693992769; x=1694597569; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1RFjlJFCPC0cFB7nl+UKfpa8lGL9BW79DIGhjR08yhs=;
        b=OnVqdkaN/t/NLa7vlLU0fe4n1kExQTv4m0B5R4fVtgdcdFcU/9ROMvKkjgN+Xo2fnD
         eMNtIGNUW3GRrGRt1XBKN8Hevf9CkH2R4aWpJ5PRSFitt0RSd/vZj2CXUcxxS1OWD5AR
         riP44qI5g631JqmucdT0WRD9rq3WblvJp6hz0s6cnPfQ2wiT0rU6xIYyocHXV6/4o06L
         kT5Ryx8EYIYrACotx0G3aTFQj5hI3zd8is1WiDVFXMiBhSgBpU4m5bYM47qO45osPx3a
         F3U0TBHakbQJdpxjxBKRLr/QJZXPZZFkEDTWuM00Occ5TrGLeLFrlaOS+2hJJp//rDqu
         RF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992769; x=1694597569;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1RFjlJFCPC0cFB7nl+UKfpa8lGL9BW79DIGhjR08yhs=;
        b=Xr+GxLT15W9nViyOqJyQOp7d1ABEi0lhxI0DXSmq6MpAE7+FWJBYCHeeF/M/wZLoJw
         NQdn8aVXFX24dgRbPzLOFFgyrV+/TB1JP+nJUcf5HvU6y8PUtUinjbKCUuM4H0ton9IG
         Hvl4WlLeG8fIBGNxOBX2RA3ulbFLRha8h/NQENdpeP3O1geFe214mhHSBfHU9o8ErJuV
         MS6kIutVjCeP8vPYEhORQNgmn8zUJOfjagx2STpr3scSyS+oFanUTBFQ9mbOGDemjvxk
         8WQoYqYPypHAIHxcPDIxA+7RAoYmhBoSy9G0R6ung51kqggcv4+MwICXzjDkDBIvUeic
         nF0Q==
X-Gm-Message-State: AOJu0YzaHypMGtPOdgUcj8kmyUqNPV1HKeN8jGNO+v2KV63E21XM9mIM
	i89ep46DXiRbZ5mh7pMkVuFrjg==
X-Google-Smtp-Source: AGHT+IFH22HeZBUv9SCW8pQB0gqyGQb79qyXqVsMorJy10kXv88hv5Dm8psdOKRk4xCU6hyl04lIyQ==
X-Received: by 2002:a17:906:738f:b0:99c:5056:4e31 with SMTP id f15-20020a170906738f00b0099c50564e31mr2404848ejl.15.1693992769275;
        Wed, 06 Sep 2023 02:32:49 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id z16-20020a170906715000b0099cc3c7ace2sm8901841ejj.140.2023.09.06.02.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 02:32:48 -0700 (PDT)
Message-ID: <fbad941f-232b-9f56-5de3-98a16a8c4d89@linaro.org>
Date: Wed, 6 Sep 2023 11:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230906092527.18281-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_023252_397247_65C8E1D4 
X-CRM114-Status: GOOD (  17.99  )
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

On 06/09/2023 11:25, Macpaul Lin wrote:
> 1. Add compatible for MT8395.
> 2. Add bindings for the MediaTek mt8395-evk board, also known
> as the "Genio 1200-EVK".
> 
> The MT8195 and MT8395 belong to the same SoC family,
> with only minor differences in their physical characteristics.
> They utilize unique efuse values for differentiation.
> 
> The booting process and configurations are managed by boot
> loaders, firmware, and TF-A. Consequently, the part numbers
> and procurement channels vary.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.

> 
> Changes for v2:
>  - add more detail description for mt8395.
>  - add bindings for mt8395, and mt8395-evk.
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index ae12b1cab9fb..d7a20df640d7 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -248,6 +248,11 @@ properties:
>            - enum:
>                - mediatek,mt8365-evk
>            - const: mediatek,mt8365
> +      - description: MediaTek Genio 1200 Boards (Genio 1200 EVK)
> +        items:
> +          - enum:
> +              - mediatek,mt8395-evk
> +          - const: mediatek,mt8395


I don't understand. You said last time this is fully compatible with
mt8195, so why it's not here?


Best regards,
Krzysztof


