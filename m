Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723DCC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 18:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD6ukNMqLh8xbe//OUXBkQeWDIWWTPMulfjrGa4ng0w=; b=IpG6gPDuUjpgCBqEyw5+H2OHA6
	sOqIOr0xmSMcSx193dLRXuI6Hj+y9gAaq8gsLuj+M+Uff2s4Qj/iF41AiVC6kKPQImKpjxcWlmZHp
	8csMVa3kiwEXcdd/OWKWDBHNQcP4kzH454gRHxhzIDeJuq3Q9+SjXAbDPg6Z+ysRM/Zwe/PtYij9D
	k9u0Wu6S/x5hVrCiKK7xQKYM5AjyBLU37zWRbNYM/AJQF5HpisD150F7Uf6CBil9IKCTGy6IOU7Mi
	hzvNaZiaLAO6eCuPZHVZf8zzTiFna2PC/aj0T/fkR6nN/dkd/U81ScxgXipMm3okokTNnUc03+bLu
	ZnxEty0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piJVN-008SKZ-1C;
	Fri, 31 Mar 2023 18:29:41 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piJVJ-008SJ7-1h
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 18:29:39 +0000
Received: by mail-pl1-x62e.google.com with SMTP id o11so22103674ple.1
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 11:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680287376;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qD6ukNMqLh8xbe//OUXBkQeWDIWWTPMulfjrGa4ng0w=;
        b=a1QkDGheT3QBrNx3Yvty8V1ssg8DNrPBx3dYwUndKpW7HhbFMJgO0r5VaRrTn0nWpi
         5U3lyCwtXBy52UxklvBXq4btDufWfBNmlC+zIvBcke56G1Wb0Jp2F4JhJMjy6gWkgzXY
         jRrXbAUavMRWXfI1fxAOLBMhYe31hTcZPR/lLf1Tegn79Muzj57yYoGDEjUhE0/OjXJc
         0M61DLvGPppGGWNdq2cr54xrwZ4fkTyLk/0gw/dP3JvixY5R6KNY1kvDqAb4kamS7vi4
         WOnMuu0xtTmP3V1IxRKwa/fGDw0YIg6imHLpFP4pPWZJf2+llXO9IqXIFIP1DmMIHDNt
         Lg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680287376;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qD6ukNMqLh8xbe//OUXBkQeWDIWWTPMulfjrGa4ng0w=;
        b=V1FPVfXuWrn8zMfEDqRNayOZ8WRiMUfkuJWQffSUJ6uOCR/FLVAyK8t9G6YADQ1Z1u
         G7OBRug1UIIhBG6dIU+/PF79GE7O2PUqu41JJiJrLLR225odxVNm0Uru/NKrkbgoyZD9
         JzY3rFEp4W/1XJGGjhIzrT/iLmTeZS0uBb/5104a3Q/kXbzsshVXHz6JDbNYtfSIss9Y
         NFerV7dIqkNpfYDAiTfRrgRraha7jYW9O/yVoD4n0w66mLQ4K0fah3Zeauln6V0/fI/Y
         u2lrFyW3am1wmZ8ISm5pa0BO1VSERo3cdxwvZcNs4yT/6tyoWcCj/1cbcj3hxRsFhETI
         UCGQ==
X-Gm-Message-State: AAQBX9em8KzT4Wam1MecZUkdGlG8+ZB0TwhVvbXyQP4m+2qE3WJoLeDT
	GiJ0QNp5aJTMOI0sR6VJtbApnQ==
X-Google-Smtp-Source: AKy350YF3V9IxWphaTmJMfqBFHoz7qLNFdg6GAUKjgLhJVUjrrPAR5aJl3+woMpnhIhzBhL5GaEMbw==
X-Received: by 2002:a17:90b:4d89:b0:240:e532:d868 with SMTP id oj9-20020a17090b4d8900b00240e532d868mr2812574pjb.43.1680287376091;
        Fri, 31 Mar 2023 11:29:36 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id iw4-20020a170903044400b001943d58268csm1900704plb.55.2023.03.31.11.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 11:29:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin
 Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Bernhard =?utf-8?Q?Rosenkr=C3=A4n?=
 =?utf-8?Q?zer?=
 <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur
 <aouledameur@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 00/11] Improve the MT8365 SoC and EVK board support
In-Reply-To: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
Date: Fri, 31 Mar 2023 11:29:35 -0700
Message-ID: <7hy1ncydtc.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_112937_561546_155EB69A 
X-CRM114-Status: GOOD (  15.50  )
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

> This commits are based on the Fabien Parent <fparent@baylibre.com> work.
>
> The purpose of this series is to add the following HWs / IPs support for
> the mt8365-evk board:
> - Watchdog
> - Power Management Integrated Circuit "PMIC" wrapper
>   - MT6357 PMIC
> - MultiMediaCard "MMC" & Secure Digital "SD" controller
> - USB controller
> - Ethernet MAC controller
>
> Add CPU Freq & IDLE support for this board.
>
> This series depends to anothers which add support for MT8365 EVK board
> [1] and the MT8365 I2C support [2]. Both are currently applied.
>
> The DTB check may failed/warn about pinctrl binding, but it should be
> fixed thanks to this serie [3]

It's not just the DTB check that that depends on the pinctrl binding
series.  Patch 2 of this series touches the pinctrl bindings, and does
not apply unless the pinctrl series is also applied.

IOW, I needed to apply [1], [2] and [3] to mainline in order to apply
this series.

After applying the dependencies, the kernel fails to build:

../arch/arm64/boot/dts/mediatek/mt8365-evk.dts:15:10: fatal error: mt6357.dtsi: No such file or directory
   15 | #include "mt6357.dtsi"
      |          ^~~~~~~~~~~~~
compilation terminated.                      

With lots of dependencies like this, it would be useful for you to push
a temporary branch on mainline where you've applied all the dependencies
so we can better see what the dependencies actually are.

Kevin

