Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA68C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfsviaYrCHk+orZnQxhCW/tSY7SqhA88C4nRk5RLhn4=; b=jkwsenChHJIK0UK1/loJijJrGW
	toDnlNLGx81ZMe1v4s+TeaitzYnW8z++xIGuMHqq8uTYE0MD3tvVi3V67wx1WLflpavlyICIlu9vi
	1x7nqMo3Fjp2pUsi4mWOxrZdyQqBJNkTsrSrm6iH74SMyH8ctm6ditlzc/h0xP+4YjwrqGm4MogIO
	y0i8FklGOuBRWm4sBfc75fT2I7pnnk6Zx89Qd+kSWYIg7x0rYXrOhEzbhU67U1BE3cSdO1JH0nLQ4
	6MeeCbF0lXh9GN+H5yHsBr3I6rx/A6siaOWahV3ABRwR4ncFgjbh6e7repsNjA/dAQCreDRbOfV40
	g4pMmytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQPL-007l21-RP; Tue, 22 Nov 2022 10:21:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQLE-007j2A-Ep
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 10:17:28 +0000
Received: by mail-ed1-x532.google.com with SMTP id s5so19906002edc.12
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Nov 2022 02:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfsviaYrCHk+orZnQxhCW/tSY7SqhA88C4nRk5RLhn4=;
        b=nsZaO2DRwFAc4rjB6uyOdsgV2qnJRlhTAaxcp6DcNAUBBj2nPshRzUP4N/D6Rxd8rA
         ky/cOc0LG5gTFprBYSy6bh/RkbcZJONOdOXu30UM7fNd2l9IY7ySOuHuVBssSTQ93ZA1
         prNTPcQAeUK5BGT6J46WNCFi/fjn3Lru9/agxjDreFNjtjQzfzRmBCOEHZN+3VPQ6Wat
         ParuKV4Ci6bOD5Ylx/v4RMfLShM2papdJvzXOaa4rXEQw3v9TfVS9fXbg2zgiWFpPuZw
         Ax+dP/MXKqqESw2wPBUX3MLYYHavKeUJcdXgnc5U1EdrswtoJEPo4wmqPB+OSbc77Dj0
         dQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfsviaYrCHk+orZnQxhCW/tSY7SqhA88C4nRk5RLhn4=;
        b=5m7r+WyFltfWLLlxPLZg+mORGQKCPYGIKsV5cKXbK0d78dBGKp6kAj3PA2nbF26W/s
         eFPMtSVyKE7zqnO4zd0Hi7bhph6IruK39426M8EuWFo5JoDa01pCvmhqEb1TVCUJIyqk
         qt+fdFfypBPEQ22s2+ySqYCcXgF88isiwcudQgrMtMpCGUbrbSFemvcoAIROb72TVkf9
         cGY1UgBKUEEDuxwqDERAgzj+Rn0qdo0C3IT3ES/G1EUXfx62FzFhIGVb1zkP6j4XJTNy
         lNI9Hwue6D4nxUWpJgXeo5ffe3Vk/hNUSgkQ6Z0nGLF5GyQj09EwFuFAEusnh6c1cLQt
         q2NQ==
X-Gm-Message-State: ANoB5pnXXaP/lcJqx/AL61gDeZzYvJknnJK5LsslreJwGx4OdfW0OiYq
	l6GEkpu5EGp+1c9ukUpZwSGo2MIzyckSybSqvG0edw==
X-Google-Smtp-Source: AA0mqf4jC92x9fBcJ6kZVpXXpGOto9tN/vDeHuKP47U3FQADYdyZsI9IQuoKOU7TlLdKAIR1mXQ8TVvK2WabZCkVSOo=
X-Received: by 2002:aa7:cf07:0:b0:469:5aae:5807 with SMTP id
 a7-20020aa7cf07000000b004695aae5807mr11819758edy.133.1669112241094; Tue, 22
 Nov 2022 02:17:21 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
 <20221005-mt6357-support-v5-9-8210d955dd3d@baylibre.com> <d61d8c22-fce5-74d5-6d2b-0eda6f2ace9e@gmail.com>
In-Reply-To: <d61d8c22-fce5-74d5-6d2b-0eda6f2ace9e@gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 22 Nov 2022 11:17:10 +0100
Message-ID: <CAFGrd9rcDyZxnL5W0PvGyYyq6s+=imqvxM05nOeAqL4trgCDXQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] regulator: add mt6357 regulator
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Flora Fu <flora.fu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>, 
	Fabien Parent <fabien.parent@linaro.org>, 
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
X-CRM114-CacheID: sfid-20221122_021724_794860_352D8880 
X-CRM114-Status: GOOD (  30.17  )
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

Le mer. 16 nov. 2022 =C3=A0 15:17, Matti Vaittinen
<mazziesaccount@gmail.com> a =C3=A9crit :
>
> Hi Alexandre, All
>
> Please, treat my review more as initiation for discussion than 'hard
> requirements' for this driver. I am in no point or no "confidence level"
> to give you any requirements ;)

Hi Matti,
Understood, thanks for clarifying this.

>
> If I read this right, the device has separate register(s) for writing
> and reading the voltage? I wonder if this is a completely unique setup?
>
> If this is not unique, then it might be worth adding another field for
> 'vsel_get' register and a flag in regulator desc - and modify the
> generic regmap helpers to handle this in common code if the special
> register? Not sure if this HW design is common enough to warrant the
> added confusion though. You and Mark may have more insight.
>

I didn't write this driver and when I handled it, I found this weird.
In the datasheet, registers access are read and write.
After some read/write tests in the registers, I understood that read
vosel_reg always returns the wrong value.
That's why the debug register is used to get the value.
I'm not sure I understand your proposal, but it seems to add more
custom stuff and modify generic regmap instead of using the generic
regmap which already allows us to customize get and set functions
properly.
IMHO, modifying the generic regmap isn't a good solution because I
think this HW design isn't common.

> > +
> > +static const struct linear_range buck_volt_range1[] =3D {
> > +     REGULATOR_LINEAR_RANGE(518750, 0, 0x7f, 6250),
> > +};
> > +
> > +static const struct linear_range buck_volt_range2[] =3D {
> > +     REGULATOR_LINEAR_RANGE(500000, 0, 0x7f, 6250),
> > +};
> > +
> > +static const struct linear_range buck_volt_range3[] =3D {
> > +     REGULATOR_LINEAR_RANGE(500000, 0, 0x3f, 50000),
> > +};
> > +
> > +static const struct linear_range buck_volt_range4[] =3D {
> > +     REGULATOR_LINEAR_RANGE(1200000, 0, 0x7f, 12500),
> > +};
>
> I am unsure if we should aim for dropping the REGULATOR_LINEAR_RANGE()
> and using the LINEAR_RANGE(). If yes, then it might simplify things if
> new drivers used LINEAR_RANGE() from the day 1. If we don't, then it
> makes sense to keep consistently using REGULATOR_LINEAR_RANGE() for all
> of the drivers. I am not sure which way is the right way.

Good catch.
LINEAR_RANGE() is defined in "linear_range.h"
REGULATOR_LINEAR_RANGE() is defined in "regulator/driver.h"
"linear_range.h" is included in "regulator/driver.h"

Then, I would like to say that regulator drivers should use
REGULATOR_LINEAR_RANGE(). But duplicating the definition is weird,
this is probably something which needs to be fixed or clarified.
Also, that means mt6357-regulator.c no longer needs "#include
<linux/linear_range.h>". Then I will remove it.

>
> > +static int mt6357_regulator_probe(struct platform_device *pdev)
> > +{
> > +     struct mt6397_chip *mt6357 =3D dev_get_drvdata(pdev->dev.parent);
>
> I am unsure what data do you need from the parent. If it is just the
> regmap / device-tree node / device, then it does not (in my opinion)
> really warrant using parent's drvdata. One can often get away with the
> dev_get_regmap(pdev->dev.parent, NULL).

Ok thanks, I wasn't aware of that. I tried to apply this change but
I've got a kernel panic at boot because "mt6357_get_buck_voltage_sel"
needs to retrieve the regmap.

