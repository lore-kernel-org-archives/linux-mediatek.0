Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F2AC47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 14:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKCwp0h7j0wQ8ptFHYyH1wL9D/pl1P6winLkZPVvdvQ=; b=Hw9a25HWCxUMCpto24UHu7/I8Q
	PhwEnfXUn/bGmwxlW9U+YwG9CrRD3dny8cuGXRrMfEKi9FKeeXRxOL9wrBwwDkAKiux8FHKHG/WIX
	ZfbFbddeYSRQzE2q62Jh5ExOwbunkFDdzDrT2p+3rN9HP9XUk4fYhTH8H6iyPlj/AVrPficybufpw
	/UY8IypaVFlkTTcG+Eut7t+0SDqIKjtFaumP3O0ZHh2JLYLHoipZS0N3hZRdgeEEow2M0R20HmL1e
	FZvSqlD1yKW8BmHqQXkWrF766SU/MiUorKuH3652B5VySAto98KFT4tov0l4MPFB4TuV7JhVaeoID
	r/Kmhkhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTNcA-00000004R6S-1tEd;
	Fri, 26 Jan 2024 14:55:30 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTNc7-00000004R5D-031U;
	Fri, 26 Jan 2024 14:55:28 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2cf2b218c62so4269411fa.2;
        Fri, 26 Jan 2024 06:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706280925; x=1706885725; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKCwp0h7j0wQ8ptFHYyH1wL9D/pl1P6winLkZPVvdvQ=;
        b=hdxlw1aTY1+z8WuaDYb0CISK0NGas+glLP87QvNkC3e2rdk4OUKb5f6HAbyvAkYdnK
         nQuoKHkl3jdjDGeotrXF+ZNqUvsnNfJdS2kZvNwYOxn5ya9ADW4/gOZaxuKSzSn4NcG0
         YvbQQH2gdbWpuBdK1APmrdyLtkYXKFhownn5S0at4tEzzWZzWPbnZLp+Sk9H44FQmUur
         2c7aRA6CvzGqJ4eUqVihllrTeGIpZ/oqTIPUN+BytFmNDRJfTkusmWvRK3nkL0eM0STK
         WH3Tuo398BMUqQx4/2/GhFoHENhOHLmtzyZ5w7auXVtT8C1R2+o8lkltR4L8W3v5AWWj
         vSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706280925; x=1706885725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKCwp0h7j0wQ8ptFHYyH1wL9D/pl1P6winLkZPVvdvQ=;
        b=K38RYegbAlF5e7blJeDK27D7c/14+am3aj3vixZX0FZqrbi+v5D2Jdly7MKY7fKxHO
         B4E848itQwdL8+fV+5vgOUgnUygI8p5Oa/E7mey5+xJgbkRfL4WwBnD2O+t8ZR4p46i8
         IbZGT6theuOoMPolFvrYrhaA8vb3On00OH08SzfgmuB8j2oEJVvxxq5Nw33OibsBhQIU
         PGtbTjpXg9FRwmF7H3OajlbiBHiGz0itxI56oryLHBCA0VuS9CZhZ+JwYNrPeFPkqJi6
         tZEkygZRnNznwOKVXXkWWTm1WeF4ty9ppRMUVuI/4Ww48Y8JlwXupxcsq4bJdIZAKL7A
         GUUw==
X-Gm-Message-State: AOJu0YyUZSw0OO2lTb3/kOywp17t1Ng44YuGC06Uea1uxjj9Y6WVG+FZ
	NcjoNv1gWR8wsddR6CnMtIzJ/b04hI/U//g2fCtf4gQ7Yqlf1Ocw
X-Google-Smtp-Source: AGHT+IFmLz6G8Nq8ruWrhsCMZ9dGCIAyuitqMMZ0UWNA5T6iguTMY4JVe3dKiRTTYXpZp+pJpu0UzA==
X-Received: by 2002:a2e:9684:0:b0:2cf:2111:4e48 with SMTP id q4-20020a2e9684000000b002cf21114e48mr599254lji.52.1706280924646;
        Fri, 26 Jan 2024 06:55:24 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id a2-20020a05640233c200b0055731d8f459sm672407edc.24.2024.01.26.06.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 06:55:23 -0800 (PST)
Message-ID: <aa7f0c6e-8f7d-4e75-8296-e968ac543218@gmail.com>
Date: Fri, 26 Jan 2024 15:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] dt-bindings: vendor-prefixes: add acelink
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
 <nfraprado@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231207080512.3688-1-zajec5@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20231207080512.3688-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_065527_071317_D42E96F8 
X-CRM114-Status: GOOD (  14.39  )
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

Hi,

On 7.12.2023 09:05, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Acelink is a Taiwan company providing network products (routers, access
> points, switches, cameras and more).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

AngeloGioacchino, Matthias: I'd like just to make sure you didn't miss
those patches. Other patches are already present in mediatek/linux.git
but this patchset didn't make it there.

P.S.
Other two pending patches are:
[PATCH 1/2] arm64: dts: mediatek: mt7986: reorder properties
[PATCH 2/2] arm64: dts: mediatek: mt7986: reorder nodes


> ---
>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 309b94c328c8..503a3caf6fc9 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -39,6 +39,8 @@ patternProperties:
>       description: ShenZhen Asia Better Technology Ltd.
>     "^acbel,.*":
>       description: Acbel Polytech Inc.
> +  "^acelink,.*":
> +    description: Acelink Technology Co., Ltd.
>     "^acer,.*":
>       description: Acer Inc.
>     "^acme,.*":


