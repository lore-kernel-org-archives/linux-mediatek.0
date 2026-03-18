Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304431088E50
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 23:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXk/XAl/MQx/OXuZk0UOeHJIU6eSq8cRls/Q/FJTwAA=; b=XBwypLu/BNTl48PFN1HOFTO43M
	mbCzZrESHK0OFCbspU5SMo5whGplxPjFbEdhwDmyxyviOI+gYuNV2VzsWoecZ6C5FbS0+0M4YsOkr
	W8SPeut4pop+H9hfg7QDxxH4Fd/MFllXPhXxpzSAt+yy0JfUSMeGOtzXDpiP65irorHHARTuRjzew
	T58Jp0fbeaMzvf2ps6ayDY+qN+ntvDQPvGI7Hs7ttX2/7tyeLMhFezxQeb3eu5vSqcLmSbFxY5xSX
	KiF0QarBd7fKUmFtrdL4Q/I83XoWaL8pR21GxPpaPsiL82Uwt5U41huBvCVjjpjHgN1e9cHx1Iru4
	vrygPFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zsg-00000009SRZ-0kGR;
	Wed, 18 Mar 2026 23:00:50 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zsd-00000009SQu-2IwK
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 23:00:49 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7d7b685faeeso237588a34.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 16:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773874845; x=1774479645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXk/XAl/MQx/OXuZk0UOeHJIU6eSq8cRls/Q/FJTwAA=;
        b=ptGkKrZyvdJNruHJjX31Pxysv1OTS+DH2yCt5tqrX7JxN+0AilcJCQzUig8T4PCfCx
         u3+h9V0iEnJy+cgkBZ0mGU/k2tadC0VjqCMdiqt97QIdb972PwxVMl6AsySULniwJdzK
         khErgcf1Vhf4f90mEsye16Rg2DtJdp6YVyRwCHhy+R4s/BuzrMwe4rujpmC4pfJIbxVc
         A+gGETXJPASrCafa6c8VLbRJpgZzawUJ25MR0w6d8rMVJ4zuXozrx6WauSCVfFB4K7R8
         uVAPNxUEe7mt4ldn113zT8dgfOBPd5fxQVhFtyHJqCjOvIMfLuSzvl+GS/4NpdtOFoTr
         iypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773874845; x=1774479645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXk/XAl/MQx/OXuZk0UOeHJIU6eSq8cRls/Q/FJTwAA=;
        b=aMgbUv47p73h9qtZMM3qTJUX9pJnKQAsqxh1MxudkFSNJGVtLrpq551CEb431XV25G
         PkObBlqX9G2grG7jCo0ad2ojOmyjk7jDU/d2tIV0qDWfFswmCix7kSzcm9TfMoG54/38
         COy+wAL3VR5cgDDWrU1//+T7BzSP59MD1jEQ2xt8m2KZ5RM23ucGsXMf6tSAvSbBxp2P
         bR7KIADOgp5CNDNoZHb28y9Unk5Tde5MzdH1gIS6dK9GQAgJIm0kZp4r/992AmIpU2OY
         xPlrz80VTdJgPSBvR1eI00PjfGtrmmViz+Gi7nXWcMhtiNgX1oWMarnhwfL4plyNJQ35
         k+3g==
X-Forwarded-Encrypted: i=1; AJvYcCWWvDBe15Q+ZScbsLYngVzED+1HotIebZn4AB/NcEF7r3VO9edk5TYix286wINl/0XxG4eairiiUJ0RPpqSyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOZr/RWk7bkAxxE2tQQoPAiO7olRjwAVRlAVt+QDy4e5yJ94nB
	D2A2xK6z99FBkGuMyCKtRm7EPQijoqiMKrHLF/Qiat+IRVNrVVw97rUltlZbBvMhjwk=
X-Gm-Gg: ATEYQzzMco0JXweDkc57coLK0mOxJL2BN8oJta+LqSvOj6tNhz9BV+wzNbM9lgCeNW/
	WhAkWllP1njD5Eoiq+BY3wylqeywUqOnyNSLTqFK+X2IuEvRfDNBuG6ozidrYvuSik6fp7VgjBw
	uVCaZkThQvu6MhKq3kCEvXjgYLpTUmHYx7XW1rYa4Ou+2VubQnfPf8Lxn1XCngLXXqH6b0BDETt
	siIwwljlBz9zQR4LtzAc96uMiDMss1fM5eiwEylc/nfx1+i/BQ1mu/V3EFocwq8TVMVHQ38WFtV
	HtDQOvMW9QpRgwHjEHp7OGvGqi8SwaLSA9B9I9Sdi+6aacc4cm/3zPXesJOkky8GCJrPEIO7hbG
	khpUMwjnNrnh7wc9RtaTCx1f2DIoMl7S1vZwCc6u1HkLl32gISK/3TbkLSP503ihY1Q4XTtSeFP
	zTMw6IO14Gqcd+JtpOHuymXCuem+Qt5Z+8gH4Br6tW2x5Jqf8Vigm04xX3JoytTI2LbG6v/SN0o
	w==
X-Received: by 2002:a05:6830:730e:b0:7d7:4921:897d with SMTP id 46e09a7af769-7d7ca2bda63mr2987245a34.0.1773874845232;
        Wed, 18 Mar 2026 16:00:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:244c:fc8c:8216:1344? ([2600:8803:e7e4:500:244c:fc8c:8216:1344])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7c9950d99sm3182160a34.6.2026.03.18.16.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 16:00:43 -0700 (PDT)
Message-ID: <4cb07b9a-249a-4c13-b09a-6dac9f72265d@baylibre.com>
Date: Wed, 18 Mar 2026 18:00:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mmc: mtk-sd: Add support for MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: kernel@collabora.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
 <20251203-mt8189-add-mmc-support-v1-1-f5ce43212fe9@collabora.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251203-mt8189-add-mmc-support-v1-1-f5ce43212fe9@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_160047_624790_200A92B9 
X-CRM114-Status: GOOD (  16.66  )
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

On 12/3/25 5:45 AM, Louis-Alexis Eyraud wrote:
> Add a new compatible for MMC IP in MT8189 SoC.
> Even though this is partially compatible with the one found in MT8196
> SoC, the MT8189 SoC register layout has some slight differences and
> additional features.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 6dd26ad314916a3e40cf55ff69a7d93ed63dbdd4..eb3755bdfdf7e001602c3eb870898275085df3e6 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -25,6 +25,7 @@ properties:
>            - mediatek,mt8135-mmc
>            - mediatek,mt8173-mmc
>            - mediatek,mt8183-mmc
> +          - mediatek,mt8189-mmc

I think this can be in the group with fallback to mediatek,mt8183-mmc.

I was able to make it work on U-Boot just using the existing match
for "mediatek,mt8183-mmc" there.

>            - mediatek,mt8196-mmc
>            - mediatek,mt8516-mmc
>        - items:
> @@ -192,6 +193,7 @@ allOf:
>              - mediatek,mt8183-mmc
>              - mediatek,mt8186-mmc
>              - mediatek,mt8188-mmc
> +            - mediatek,mt8189-mmc
>              - mediatek,mt8195-mmc
>              - mediatek,mt8196-mmc
>              - mediatek,mt8516-mmc
> @@ -240,6 +242,7 @@ allOf:
>                - mediatek,mt7986-mmc
>                - mediatek,mt7988-mmc
>                - mediatek,mt8183-mmc
> +              - mediatek,mt8189-mmc
>                - mediatek,mt8196-mmc
>      then:
>        properties:
> 


