Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608A5EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyK3BidgXxixuZrAM9KK/EHXaa+kHXgf2/8oda8qsKE=; b=uYB38qpx7c1PGulc/edoksLV5v
	5XTSJ80NJSWa1VZmd4EcROxC0f5RiDoPmm1oG+TlaFulZEBAWrjhj51fPHuOYc8OTW5xwA+Pg/ISl
	HvWfn7/bsU3SqTk4FX4/fP2+xUthIWEaP1CIIsXQqwKdl4n0Cut9Ce/yb4jwWYurkbALuqtMFAfTp
	OkZWKmj+FQqbYmy4H7/Tz4JxY9s11/SezVn8B3XooOo/Jarq9Pr578Ek907vpBERlnC6sK1RbXdV5
	ddANRHbOJGX2aBl5u5NRll5obarPM+H6a/Zd/ILWbpzTYffAVe2EuPJXco7A70gpnmxsBoouMzNYB
	H47u3YAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdXr-0004C9-0z;
	Mon, 11 Sep 2023 09:49:27 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdXo-00049q-0d
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 09:49:25 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99c93638322so904403266b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 02:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425759; x=1695030559; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vyK3BidgXxixuZrAM9KK/EHXaa+kHXgf2/8oda8qsKE=;
        b=qo02eYbDbtAryEv+MaWKKz9m2EprCt09UEYvwonIlX4K38C8zwwnBU8e+8Q2df5WFZ
         q3NA7A32rwPgOKTDLDvvNjT5DiOXhMnVi6pJNbMjROqClH0KaKc29CwjzCLQ2otnCW2R
         W5UAnRMTo3DLC86hlIm/K3sWtwFYbEapJ+VP8NP81IDX6Xm1LviLv4q1BsdbdtehCoIL
         JTioKd6jf2fUb28ZeoyIJCYynQUfPESg7K3+iL/aT93jNvKyFP51Or9vkKJxySPuXhkL
         a5y+JPLElqSlbqQ3tir5ZiLJygKLAPnhCh3rBqyxSXoU7wu0AfpAkDs5tw3ueBVNAPOI
         GuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425759; x=1695030559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyK3BidgXxixuZrAM9KK/EHXaa+kHXgf2/8oda8qsKE=;
        b=fcQA/19nJ4NGlzJTl1O+XE8YRMjYoS6T1ksuM3y2ueKzuVIJG0fOuHf9Y0UqDStgKl
         Q4GtkBXUrREvCDbU56A+b8Y5QA19Hs644cxYc4xSFRHOdteEhMKYbc9RheD+urt/Mi4f
         9l4EI5JDgivC2DSShYIsG+HPagnaYQp90hKdVlZUsj5j7RO50PVNaBViodYif/aZwoK6
         Jgr9UXJ2bXvvG3Ci6ZpSsd+i3nXy0x7a3/0hO4ntAT+tO0g25McrrFFkZiH45hZ4iWOL
         /gE7G/2mwBM3DQCG0vp/xK/Ew4VrLepvX5UlukSypi6z4zM06kbQUrxS/HDXKXL8f3SS
         5WwQ==
X-Gm-Message-State: AOJu0YwwJH3+fkK7i6510GHLLMX9YjbOlSa9C2qKhsv7qz9JdZqOJoiR
	y3l5Jesd1JksDp9Cme4zjev/ow==
X-Google-Smtp-Source: AGHT+IF0eAg3rbqM0cYf1GKEx/klkn6QYNhBM5luwQhzQPxpsJHoR2ZDxfOVJVSwtzNPJyCgxfVVkg==
X-Received: by 2002:a17:906:32c3:b0:9a1:b33a:e464 with SMTP id k3-20020a17090632c300b009a1b33ae464mr14227042ejk.31.1694425759428;
        Mon, 11 Sep 2023 02:49:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id l15-20020a1709060e0f00b0099bcd1fa5b0sm5067137eji.192.2023.09.11.02.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 02:49:18 -0700 (PDT)
Message-ID: <53cd72f7-5a8d-ee9e-4d8a-f5159cafb3e7@linaro.org>
Date: Mon, 11 Sep 2023 11:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] dt-bindings: arm64: dts: mediatek: add description for
 mt8365-evk board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230911081126.18463-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911081126.18463-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_024924_233751_F4B3567E 
X-CRM114-Status: GOOD (  19.39  )
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

On 11/09/2023 10:11, Macpaul Lin wrote:
> Fix the missing description for MediaTek mt8365-evk board.
> 
> Fixes: 4f5fc078ac6f ("dt-bindings: arm64: dts: mediatek: Add mt8365-evk board")

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> change for v2:
>  - rebase this patch to follow the v5 patch set of mt8395.
>   - depends on https://lore.kernel.org/lkml/20230909132819.21626-2-macpaul.lin@mediatek.com/T/
>  - Fix description as a single board.
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 2e8ad49c3479..b163995e32d5 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -244,7 +244,8 @@ properties:
>            - enum:
>                - mediatek,mt8183-pumpkin
>            - const: mediatek,mt8183
> -      - items:
> +      - description: MediaTek Genio 350 Board (Genio 350 EVK)

Drop, no need, redundant (copies the compatible) and your other entries
do not have it.

> +        items:
>            - enum:

This is still confusing. Why do you have enum here with such description.


Best regards,
Krzysztof


