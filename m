Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC74C761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 09:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhbtcZltj+ypNIMZCagCuTClsnuy+dnZITVz+eknFe0=; b=1w1Tsy9l/snwGox6h7dvZzyFNR
	a4oU1ad+oArqd11vjPZYLXrvyn9uHcGsjXvGBHRKPFkxiCadqNaPSfGhsj7nkO0T+izzUyVaCcLLo
	uAk7E5wMVdrrQtX2IQz3tAlnCIa6KhTgq1kZO2STjb9g634VDAIZSXDA5yRRj2jSdCKtlUVi0qRoR
	ZZZ3z17zo41wMgXFAzBE30tu3HBcebLz3bIFXwasZOtKyEA1sI4cJJBBPWhb6rnBlvVnsuiPV5Coz
	nCXcwaXePz3HYdpCNKWreYGyohnzs6+7QSXKjLzoKzCsjzVr2xe4yYeZsy6/7fqrOfQWbbSB5hVtt
	/u6H7xiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjG4z-00EcIO-04;
	Mon, 03 Apr 2023 09:02:21 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjG4r-00EcGN-0X
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Apr 2023 09:02:18 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5491fa028adso42240037b3.10
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 02:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680512531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhbtcZltj+ypNIMZCagCuTClsnuy+dnZITVz+eknFe0=;
        b=Y5nv9GAKEk5L0ugkpavxev1XuHuo/DIYsgiHvn8xtDzDiKCALFCZA9Lkpb/EsJXva5
         qnjInYE3ZQgXFmkE0f9Hck6AC0TP4W0hFdRLVV07ftol7GpvJ4BML7mcfdwJkzKlRGFD
         wPIX8aeQWgIipGbHef27DcCkbgzUpvQl1AqVf/kmll1b3uARGqeyk1F1UFkPCWgweY98
         /2XOvTtXlTPIZoVMEm2e68aI5QnjXCp09tEDO+SUltgJQKsH+7jI94KHQzIkb4qcgqo8
         cdP8xwYuMBRdAr3GY78JTpiR/Sy+/E8RbqA0ZWTlvyUUcQUmnlBDJ6/858x3tH1EaiII
         8I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680512531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhbtcZltj+ypNIMZCagCuTClsnuy+dnZITVz+eknFe0=;
        b=k4/0ZM9TYmbfRCmgnmT6Ej3n9gmusVy4xP4BviFcWntYNS0uu1X0ZC42kFFuTCrwf1
         SVQYTMIbDBL9OWMENOYd8kvuwSmqiAiLXHBXp0shTgCQV0i/c5qwIu3g6YjAeZH6j6Cm
         PJnVTWBAR0R7QHRRRT2/Qgg0s1apaCzBKRuCclv0KeU2MuyhIkeInp5lkx0Khzk4HmNG
         kpHVLpxBiF9q6VrNVG56ipiB7RRit6RBJe3ld6zSpr//3xZRf2r3GaDXlnbFiedMp2fp
         /MDFMtHQ+7eAyF5vko0wuFgnAXziw+XC9rOu9GORqHM6oC1ZK6LpCyROeWDp5tLcSCbM
         LHaQ==
X-Gm-Message-State: AAQBX9c6obYt3SF4iztnZDhzXse6tEDvv7l7/kDVcPjRgdD38yXhkAzR
	78As+kKxesvo9UH022nQq2myw4fY8WhNA3s8xhz22A==
X-Google-Smtp-Source: AKy350ZkpN9yjY1F5nTfy5VE/mrL48bstbRfecVOLioHamgr6vrDgn91occ4GlSBW5859XCRyPBnKjtEmV/heNbNH0Q=
X-Received: by 2002:a81:b617:0:b0:544:b864:5532 with SMTP id
 u23-20020a81b617000000b00544b8645532mr16893143ywh.3.1680512530770; Mon, 03
 Apr 2023 02:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
 <7hy1ncydtc.fsf@baylibre.com> <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
In-Reply-To: <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 3 Apr 2023 11:02:00 +0200
Message-ID: <CAFGrd9qLzcDJO_Fk_-B6XYuuxQzQoYLXmdp0Qj1Tszr0-sqNgw@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] Improve the MT8365 SoC and EVK board support
To: Kevin Hilman <khilman@baylibre.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_020213_419241_C3F47C38 
X-CRM114-Status: GOOD (  10.42  )
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

Here a build-able & working branch with dependencies:
https://gitlab.baylibre.com/baylibre/mediatek/bsp/linux/-/commits/amergnat/=
i350-evk-board-support

Regards,
Alex

Le ven. 31 mars 2023 =C3=A0 20:45, Alexandre Mergnat
<amergnat@baylibre.com> a =C3=A9crit :
>
> You forgot to apply the patches merged by Matthias:
>
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

