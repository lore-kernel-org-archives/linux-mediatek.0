Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92BCC6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 20:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9bGoBe8wCBmkc6gud9Cy1Iqu9DMXje49H2FW2XThhI=; b=fHjzdyQAFh/7U6b4tGlH3qQiyH
	9OTuJ9PJp/OvXLASfHK6nUFsxY5/85F62qhn5ze2xCnH2XrOQAK5En8ERJ7I/amHpDWPw8JfcWRcV
	xq0DeqYsQKMMEHqHSTGu7uGMzfbsINJmc9zM11nEjUDy4bBDbRW8nKw0fFY2CSTmlVx/7GmzF8TUi
	Umy/q+m91fGn813d5Fofar0RLlQTOwnNK8is8J6iv0aprmXhkPwSHGY5TaKgUI3CzyXpap2IT4lXw
	BMpeQXvut8ceR0iyr1rYUWbmrnHL3+kp2QBMZvG+hQuGobeImI+ozPOI7wni3c6A4j2hGWcYYX8jj
	ZxnbNWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYZGn-009Tp7-Hc; Wed, 14 Sep 2022 20:46:05 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYZGk-009Tfp-HM; Wed, 14 Sep 2022 20:46:04 +0000
Received: by mail-wm1-x32a.google.com with SMTP id ay36so2872058wmb.0;
        Wed, 14 Sep 2022 13:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=m9bGoBe8wCBmkc6gud9Cy1Iqu9DMXje49H2FW2XThhI=;
        b=k/LW+8FU6dXTiCSildtV6+lus8xNFn/xqGPYUXzcghwZeYb6llePcT4d7wf0rZbEXX
         hyppBJay9AZGyBAsr8kHRkKFM0j9D6+yLwXVYrftrkWLHjzvaZbEH2dj2kRk5YGz+C4A
         jj6ktBTgFgGl0j5aqSOdDtqj3HMK43KfFdOk1FIneIRFyeNLS7YalGI5t3khH5lIgrId
         b5uD/UFf44ISwEcj9Q1OXjluUCNAYiu+0vT3jEZhqfyi4/i3zbLiurGcVdppBt3gDfvV
         GMUhEDVbNCshYWBKs85YZ4BsVeqk/duyZnAPsCHEwlQfcvOJxbEWW6kJDuxpHaqZ880s
         CWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=m9bGoBe8wCBmkc6gud9Cy1Iqu9DMXje49H2FW2XThhI=;
        b=oVBOhO4OFU38pGEKJO/lKzqD7z1nyHhdmNcTMQ1ZZbkMlbyn52WK/sSf/UKybF+Ri+
         uRzSoo/fwMls8kVL2iYoHCbKedxocLMFbzU4h+Hoqiq6OTIbD0aBfQvUjs/T9C3ZqYat
         7B3fzymIVZ6DPq/WI+CzXuUCHGP9J587x4f5z3oL/5yiIaJ22jhULwyHtq+GYu8AbaFX
         IoBi5ac9NjpTLyvVZptt0CXgPeJtnBIgLbo+gyeDFHm7zXp0VOI0v9k70k2snskWYW81
         3ABIhU+OErhDgGtiWB/OE7Lago1AJlsj97DJjVnjsAkMEblEFA7gTwGb7fdhA5mOb1Bq
         dThw==
X-Gm-Message-State: ACgBeo3JzS8IUNVW+zthmin2ceRti7e77qrk7nR90cpbGbKgCTByXmsY
	nQYbBP4Dez6lTllScFumZX0=
X-Google-Smtp-Source: AA6agR5j+dsaEcuIMXF56rsR2ctpU5gvF4j1nF5xUwvAX9FmtpqOU5JxXYVEgUIZukydfLNl1VMa5Q==
X-Received: by 2002:a05:600c:4a9a:b0:3b4:78ab:bae5 with SMTP id b26-20020a05600c4a9a00b003b478abbae5mr4551567wmp.114.1663188358968;
        Wed, 14 Sep 2022 13:45:58 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id d13-20020adff2cd000000b00228dcf471e8sm215086wrp.56.2022.09.14.13.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 13:45:57 -0700 (PDT)
Message-ID: <1b3a880f-06a2-1865-3791-03021aa34175@gmail.com>
Date: Wed, 14 Sep 2022 22:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 5/5] dt-bindings: arm: mediatek: mmsys: remove the unused
 compatible for mt8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
 <20220914182331.20515-6-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220914182331.20515-6-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_134602_605227_02F4757A 
X-CRM114-Status: GOOD (  15.53  )
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



On 14/09/2022 20:23, Jason-JH.Lin wrote:
> The compatible properties of mt8195 have changed to mediatek,mt8195-vdosys0
> and mediatek,mt8195-vdosys1 from mediatek,mt895-mmsys, so remove the unused
> compatible.
> 
> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index a53b32c0a608..bfbdd30d2092 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -31,7 +31,6 @@ properties:
>                 - mediatek,mt8183-mmsys
>                 - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
> -              - mediatek,mt8195-mmsys

Should be part of the first patch. As described in the review.

Regards,
Matthias

>                 - mediatek,mt8195-vdosys0
>                 - mediatek,mt8195-vdosys1
>                 - mediatek,mt8365-mmsys

