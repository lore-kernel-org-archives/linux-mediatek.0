Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852CDCDB482
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIfc9x+57+MR4MQsFxr/3D1qUh4GWaKbi6uC5iQj2KM=; b=cp5LKM45DbHc1aPHSF1Bh64K1V
	NpvbXYeYt270SmiYYDd6E0e286RyQOJAdL2TP0h3BfYbVBz9EQuPVVjsqYYnNmAPQtBjW1fF1gDSp
	QLfXvFHM8L227Jwewg6++U+FuikajcyWxiFdQT29GJO+C3T9vYYMIlfvNqsjndnAplnIJzs93r3QL
	CFn53oTfOebJYoF6YgSDNH2hmiwn3eFLP5ls2KczC+RIygwZghndWBmhBbz8390tzMnGljQUlmQ5x
	7uC9XuX7k11KNiHKhMqLXXuZIBezc6GjrjQnlJ8Wm1aUY7rsc/bh6z2zj6xp88YUZRHw6WGX3L0BD
	V14S2BZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2Io-00ECrs-1t;
	Wed, 18 Oct 2023 08:53:18 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2Il-00ECr8-1f
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Oct 2023 08:53:17 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a8628e54d4so30647937b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Oct 2023 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697619193; x=1698223993; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIfc9x+57+MR4MQsFxr/3D1qUh4GWaKbi6uC5iQj2KM=;
        b=fUPdg079kxGuvtCgShFgOQ00oxXc+dy2GVbqHW5dCs5n36eiQSwcxhLI8myfxJiQVk
         A/pW4h91f/jQTAVoUYg1fdSDfnnvnAy3s4zr5IzUmB0oKmDRnDZf93bnoY8H4qWzPquZ
         YsYp7h2AAl0bwVVaG8+RHMiA9tocgjeM2GJH4H9JzINmxsJpblv+rWOd65OTY61EBcP2
         RHXrU84hnYx85yUeeXcjzaa3gvj5k5U2metPwmgpCv3lWALd74srfbGclG0ep0QcxNoV
         aJ90v+yUm3P8csXIB1XwN4jI3lLzruOcn8l1UNWktIbTYXb9+gosvgrn9Nrx5RF7dxf7
         aqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697619193; x=1698223993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIfc9x+57+MR4MQsFxr/3D1qUh4GWaKbi6uC5iQj2KM=;
        b=gkq4XqZAW3eEfhOjGOTuLdsFS0KergLYvriFQMKe6EPFxJeRkn33Bpc6INRMPAetd7
         ewx501NKip0K1yzW0QAQGTNn+VZYNIXZ5xUvXHJ8MI4LRb6FnwohOto7Fm9iPizkR0PZ
         rFpPb3OzVSecHqfWqOld2U26jXCPUUriYZTDlENh6IsKPZUGqBsgAT+pkGKH6zKojcQL
         wc9AnVkGueBASaKWzHJ2i8npc/TlSdn2zsDZB9r7X3NhRrPxQfZh8nyEL7GWm9g1CVxj
         DQPm5PDbSXoDIV10vFa6gGz5xNG2c106UUOFPHy9g9gAbOKJQoj4zsIcIXcGIWb29urw
         2T1g==
X-Gm-Message-State: AOJu0Yzz8IXLdZbEjyfhZG3prIVtxRWGIEvxRZ6Uu0FSMrBsvx4L0fPu
	cWktsBkppSh1kMh4dvERjFisl2/xyoZIqJU27tL1bQ==
X-Google-Smtp-Source: AGHT+IFeFSERqZ0ts/x8xJld6sINEyqZb9YdNFdgX/IXWU45eqvj1p1KrrBezJyPl0/qLY0DPRMIhme6p1Fr7jMtf+o=
X-Received: by 2002:a05:690c:ed1:b0:5a7:cb5f:ee0a with SMTP id
 cs17-20020a05690c0ed100b005a7cb5fee0amr4033573ywb.17.1697619193088; Wed, 18
 Oct 2023 01:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
In-Reply-To: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Oct 2023 10:53:01 +0200
Message-ID: <CACRpkdaie8-0W+=9AD49KqyW+-Zrtkhs8BjHJCVDrkxF6hVAkQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/8] dt-bindings: net: Child node schema cleanups
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	John Crispin <john@phrozen.org>, Gerhard Engleder <gerhard@engleder-embedded.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Sergei Shtylyov <sergei.shtylyov@gmail.com>, Justin Chen <justin.chen@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_015315_580727_016C18D0 
X-CRM114-Status: GOOD (  10.62  )
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

On Mon, Oct 16, 2023 at 11:44=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:

> This is a series of clean-ups related to ensuring that child node
> schemas are constrained to not allow undefined properties. Typically,
> that means just adding additionalProperties or unevaluatedProperties as
> appropriate. The DSA/switch schemas turned out to be a bit more
> involved, so there's some more fixes and a bit of restructuring in them.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Oh this drives a truck through my Marvell binding work. Luckily it
also solves my most annoying problems so I will just rebase on this
and continue, all good!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

