Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CE0C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 08:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM+75qOkESHdT/LFEmzbTRIChEQ87MS6sqDcZEDZv3g=; b=X3yvwDrqPvdRaDfLscWreCwA+2
	11J3ooyWc8OkOMyWQB33e55EN5CPeBq8Q/K7Sq+YEKdyWCRtL9vHSSeCqoTtVuZnRWwoV9yEQewSW
	e685auzE2LSMgeM6k32f5w7VQACtMhjE2INunnJzKgkbq5xnGxGP+T0KGeG12rEWKBMcP1QxBUtL6
	SuhUL+T8OsZB3giHwqtzpjKcTU5VdrzFJrURz01589KdWWMsEXkOutWDAvzpgPIfAf95kuxB3CIff
	IfY2/XpobXUEj8zltDqU3eCfqKGmzyAG6xxr8Gy3nWhGBa+/e9ZRIEQqjkDUyirfCnMP+W49Prstd
	Yg6OzgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOQj-0068QD-7q; Tue, 22 Nov 2022 08:14:57 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOQf-0068Kr-Gy
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 08:14:55 +0000
Received: by mail-ej1-x62a.google.com with SMTP id n21so33916997ejb.9
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Nov 2022 00:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jM+75qOkESHdT/LFEmzbTRIChEQ87MS6sqDcZEDZv3g=;
        b=422yluu6GBF7Zr8QFIXloUOKlAx11LZ27aEbqh7AODAtsk61284Y3nnC+EgMqu/9WL
         6jS2Z79QFgqsYOKlQWq6JPzOBQcZlx5JIrOzqgveXm47bKryMuC5Xf5vrlJvt8kY8q30
         ZUX8nrNp2bxl4EQ9SdPNsbgF4Eudy1KG6fhl6775TBIErHLldgVq7KzcdAg3Uj8jtdWj
         MEhvKmxAo3OyI4JWdAG1OyRXomAEgtfnxhUzlipXJcOBQqEFazeagbMDnKIKK7bFKrDF
         2wL5qv7dljBITPw0xbj1QyPIE7K2gSV4Sjz8AN1RbNAUqDGOD2w/C/GmHzTKvFvSPG1K
         IkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jM+75qOkESHdT/LFEmzbTRIChEQ87MS6sqDcZEDZv3g=;
        b=2gdX5LDJu9FZfPaXpnSlPafRV+b7jYboRI4Qb1AMIAUTXNyM8hfJQjY839l97Gz3ZK
         Jrv07vtXyGzddyD1ccBXAnJoj4BTAbLFi5s43KIJcPpq7eg6qGUZy+/afkGO2Q33Qk4q
         D0nkS/0kzgupFV1yeJ7ivnser2sNBa8Fz2Yg6e6UDi2ZplR8Dxdzo/FcXmFKyVjZUBhL
         T0lsw9R5mc43hxAeje3r/oq7JSvGmMw668cDjppBgKqVgFdrCVvt1Dw7/fmOesSDqYZP
         Mg9AV93LQunjaKSPwCIJUQIQsRxGl1ly9IeGytNEunY3+Ig9Hw1imv07VcymqyNCbNHs
         cb3Q==
X-Gm-Message-State: ANoB5pneiyxs+U2BA9dZAQxRx8Ni5wyx/dBxcUrT3QImUeQP7FYgXcAm
	V1VTMynWYIod2VBRIzM/ARVN0XutkzcPwwxKX9gFMQ==
X-Google-Smtp-Source: AA0mqf714aLOvgKM5W9MtFw+gOA+gv/Zq8lXPGhFeko4gMI2aAQta5XL7+Zp40MYnqfj6bo3sT/69zgTGr4hP81odgU=
X-Received: by 2002:a17:906:4a55:b0:7ad:9ada:79c6 with SMTP id
 a21-20020a1709064a5500b007ad9ada79c6mr19023201ejv.86.1669104889006; Tue, 22
 Nov 2022 00:14:49 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
 <20221005-mt6357-support-v5-6-8210d955dd3d@baylibre.com> <47ae0770-1cd4-cfea-7222-f91d1d85f133@gmail.com>
In-Reply-To: <47ae0770-1cd4-cfea-7222-f91d1d85f133@gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 22 Nov 2022 09:14:38 +0100
Message-ID: <CAFGrd9rWHdwSaDv7L7XGnBiPp-HHXTqvMToeHLoQsH_9qxhTsg@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] dt-bindings: soc: mediatek: convert pwrap documentation
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Flora Fu <flora.fu@mediatek.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Tianping Fang <tianping.fang@mediatek.com>, Fabien Parent <fabien.parent@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Rob Herring <robh@kernel.org>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_001453_792503_CE7418B3 
X-CRM114-Status: GOOD (  11.84  )
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

Le jeu. 17 nov. 2022 =C3=A0 17:06, Matthias Brugger
<matthias.bgg@gmail.com> a =C3=A9crit :
> > +              - mediatek,mt8173-pwrap
> > +              - mediatek,mt8183-pwrap
>
> Missing mediatek,mt8186-pwrap

I add it

>
> > +              - mediatek,mt8188-pwrap
>
> mt8188 has mt8195 as fallback, that must be kept as otherwise the driver =
does
> not bind.

I add it

>
> > +              - mediatek,mt8365-pwrap
> > +              - mediatek,mt8516-pwrap
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8186-pwrap
> > +              - mediatek,mt8195-pwrap
> > +          - const: syscon
>
> Not in the original txt binding, maybe add that in a first patch and then=
 convert.

I think, instead of fixing a deprecated file, I should fix it directly
here. Actually, I forgot to
mention this change in the commit message, but I will add it for the
next version.

Thanks,
Alex

