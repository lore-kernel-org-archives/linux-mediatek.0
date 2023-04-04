Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C25C76196
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 00:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISmF8nvjx0ybm2sJtfCgvvFezmys6zwifQtFbY4uoY8=; b=XeHlyFgTQk/nA9MmE1RwcA0tw0
	Eev794Fqtrwjv+IexkHv36wV1rSHz5HMESh1AhkU6IIuoInCvTMZTJNdDg1RgiuyttPxFeV/DT1VZ
	nmd4SQisHfysp4ZmOLNm4y4Egy9q3CrhY8B1h0ShU9GAjFORZPtDNEUSu0x4rjcC4V5nB1dVhYTCh
	8YbyMuzB+1aWmGp0FJCZE0KBlzB3JABm1b9/uNvM4KRQxgA+eURjJ67+iVxfN9vw/EO31e6S2+zUn
	PlUpNB96pLHmX+8GXRDBdS0Hseu5ImR4D+Hypz9E7EZwnn+woRBhIW2N230f6yWcLlKnJlR0B0/zj
	1p8jsCeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjU9o-00HEXs-0a;
	Tue, 04 Apr 2023 00:04:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjU9i-00HEWR-18
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 00:04:14 +0000
Received: by mail-pl1-x629.google.com with SMTP id ix20so29698778plb.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 17:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680566649;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ISmF8nvjx0ybm2sJtfCgvvFezmys6zwifQtFbY4uoY8=;
        b=MwdHJ64U4y9L9kZbHHfLVw/Yd20B0fWkelqUdVZKhghqkkLvcPVf5B/6AWkmBB4Iix
         +6tiPsqWaXqSXSn8S84GPwhqvDiSgDDTDKeDa2hvLDLi4j/+CCABcLPq8xaRpG0Pt/iR
         m3n/ZBnrLEegJD9Zp4IhyYwIdwet6dag19biR/jtwRQx3RjBfYuWQG3kN4WLeo20GAGh
         s//j38Y0q8steIx9r+nGeDisdVHWCpXQnX2VxW9sXQnriP1zNanKE+3pzzt6D7jTcNcU
         P+OKQEdq0B2mVWPvnZQ8CFsCe6JC6fhVy+6K1pAUcoLK6Sje4zLwkgVCCeqAr9kEdmp3
         SwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680566649;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISmF8nvjx0ybm2sJtfCgvvFezmys6zwifQtFbY4uoY8=;
        b=rzay3BHbXEuvA43hy3TWy6Cj0jA6dt4xQn1HoCNvC+V6F7sbtLH/ttselthb0sj/JA
         FNnw/NqjaBvc5Xrov6+r8TLvtRgxSsxuQqNkxVyTPW8AxTqkbWd/LuYvV3c6bkE4hLuy
         H2jOQDmQkJRmvby42VUXKjF1xOnJNjVTM3ProXt1Y4CnoEyQzHKLfqriQAemASSBDrKm
         q9joWjojvM737Eo8koTo1drul4vA1gV1oDDzngyRbIsMwzBWsxmNw9HItLwPt90CeAJD
         5uj4AVzfcwMQA+0r0HYhbQ620sMBBRBG8Wa4ji5+etGnUQJL+EF9XqNhdfyb6shULXd9
         96Uw==
X-Gm-Message-State: AAQBX9ezcvE6GvH7dX1JdFNeXYM8oEBfpsP+gM1iH4J1e30K4GQfTc0w
	PL9H8/BbvRBdQjwo2iSEHSkyyg==
X-Google-Smtp-Source: AKy350ZCXF7QNH2FUbpLyZBKB7LqVlEd3NIT2fIvf/7ilkhxZ2ZkkRksxI97+pH7cPZRyzcqEjxgZA==
X-Received: by 2002:a05:6a20:ba9c:b0:de:807e:620e with SMTP id fb28-20020a056a20ba9c00b000de807e620emr343481pzb.58.1680566649333;
        Mon, 03 Apr 2023 17:04:09 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id b24-20020a630c18000000b005023496e339sm6318991pgl.63.2023.04.03.17.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 17:04:08 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin
 Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Bernhard =?utf-8?Q?Rosenkr=C3=A4n?=
 =?utf-8?Q?zer?=
 <bero@baylibre.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, Alexandre Bailon
 <abailon@baylibre.com>, Fabien Parent <fparent@baylibre.com>, Amjad
 Ouled-Ameur <aouledameur@baylibre.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 00/11] Improve the MT8365 SoC and EVK board support
In-Reply-To: <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
 <7hy1ncydtc.fsf@baylibre.com>
 <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
Date: Mon, 03 Apr 2023 17:04:08 -0700
Message-ID: <7h4jpwy0lj.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_170410_606966_E0E32A60 
X-CRM114-Status: GOOD (  10.01  )
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

Alexandre Mergnat <amergnat@baylibre.com> writes:

> You forgot to apply the patches merged by Matthias:

Because they weren't listed as dependencies. :)

Kevin

> Changes in v4:
> - Remove v3 applied patch from the serie:
>   - arm64: dts: mediatek: add ethernet support for mt8365 SoC
>   - arm64: dts: mediatek: add mmc support for mt8365 SoC
>   - arm64: dts: mediatek: add mt6357 device-tree
>   - arm64: dts: mediatek: add pwrap support to mt8365 SoC
>   - arm64: dts: mediatek: Increase the size BL31 reserved memory
>
> ...
>
> Changes in v3:
> - Remove v2 applied patch from the serie:
>   - dt-bindings: mmc: mediatek,mtk-sd: add mt8365
>
> Regards,
> Alex

