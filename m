Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D115C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 15:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkdXtsR+D9e0XZ8MbC6ZfL77jSptLwDUTwJEoZqNsNE=; b=nH3CA0CtTal58eQZfGruuL51pa
	IVwR5k4FhJALGkCkL7MmRZUc7vQ+s1sYHiYxY1vXRyEfzrrFDsm5k6VAlRMNxu+fcQrEdhz0Ue/nK
	osawslLaPEiamZuH7qZXHuKDPGZArgxbGcw+4MUKfDygZXny3yn5d9LZ6nbiBtGlG+qolYYIqYien
	7mMfIa0V2OE/IbdoYRlSwEmpqf/FBT1WVEujnI5AzZ2R9SPSbkXNAbtxE85OqaWfGWyuQbAtL7hug
	b70Mgf00sF7tMJ+Y7S94XCUgQp9FulEoGfpAup73KCpVMWuknM5T8Gy8E9Z3dYhxYQQbEeOK6N/vu
	RTQcroxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocphT-005ZRM-KY; Mon, 26 Sep 2022 15:07:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocphH-005ZOi-6y; Mon, 26 Sep 2022 15:07:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AAE7DCE1158;
	Mon, 26 Sep 2022 15:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5F2C433D6;
	Mon, 26 Sep 2022 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664204819;
	bh=lkdXtsR+D9e0XZ8MbC6ZfL77jSptLwDUTwJEoZqNsNE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lAQ69Y/rtyIr+QSfvDG9Kv28y3+GGJLJUFUoCEzcWZtxn3xlued9i3NPs+NYy3sHv
	 srf0jN7iXOxLuuOZhbG/wjbn5dSKPXPxreDlVppO1QMSwb7GLgb4GGKRtlHjy6juzd
	 nDgiwZb/7Kx8ylOHuL2tSCTmX6oUZPA9q2sPu7JiHif86hVglj/6b7kDSgtyMo2aeL
	 0khbv0TX0sCZJHsF3fa82+Mip/RnnOtmZQlWZGUbFKyXdPODMRQIcImUzuSzpzAgfW
	 lXHHS1q4gUd0RKXvvRo5Y7z2EzWvMh7rrEblC3hJ29o+GlcuSSqXgFM6ErdYm6UJy5
	 b+/SpL1wjpbnw==
Received: by mail-vs1-f50.google.com with SMTP id m65so6856632vsc.1;
        Mon, 26 Sep 2022 08:06:58 -0700 (PDT)
X-Gm-Message-State: ACrzQf3y1YhOFjXanhSgQr7FZly1+AWKrwxHTSnv+exKIVKTVZsjiMpZ
	v/OwQmkYEfkF2eSQXzLwyaFAFQPN0uQm4/GdAA==
X-Google-Smtp-Source: AMsMyM6zXYIh7xV3Gqi/rq72oSjh7Ix4NEn30sPfktNCnXp2Z5fbbOdTSZxoEP8BiRL9Oc5jsWEDopMeu02sKX2u8AY=
X-Received: by 2002:a67:c088:0:b0:39b:1bb3:bdd1 with SMTP id
 x8-20020a67c088000000b0039b1bb3bdd1mr7845774vsi.85.1664204817888; Mon, 26 Sep
 2022 08:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1663926551.git.chiaen_wu@richtek.com> <9bf36f09bc5f002f2b09b7cc26edccf109516465.1663926551.git.chiaen_wu@richtek.com>
 <20220924155525.5663bed8@jic23-huawei> <YzFY5FI0PrZqdAiZ@google.com>
In-Reply-To: <YzFY5FI0PrZqdAiZ@google.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 26 Sep 2022 10:06:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKKJGtacbzGqCupFniSGha610L1cay2V+AK8vehTA=F=g@mail.gmail.com>
Message-ID: <CAL_JsqKKJGtacbzGqCupFniSGha610L1cay2V+AK8vehTA=F=g@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] iio: adc: mt6370: Add MediaTek MT6370 support
To: Lee Jones <lee@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, ChiaEn Wu <peterwu.pub@gmail.com>, pavel@ucw.cz, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, lars@metafoo.de, 
	andriy.shevchenko@linux.intel.com, chiaen_wu@richtek.com, 
	alice_chen@richtek.com, cy_huang@richtek.com, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, szunichen@gmail.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_080703_612447_4FD0C2DB 
X-CRM114-Status: GOOD (  19.66  )
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

On Mon, Sep 26, 2022 at 2:46 AM Lee Jones <lee@kernel.org> wrote:
>
> On Sat, 24 Sep 2022, Jonathan Cameron wrote:
>
> > On Fri, 23 Sep 2022 10:51:24 +0800
> > ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > > From: ChiaEn Wu <chiaen_wu@richtek.com>
> > >
> > > MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> > > with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> > > driver, display bias voltage supply, one general purpose LDO, and the
> > > USB Type-C & PD controller complies with the latest USB Type-C and PD
> > > standards.
> > >
> > > Add support for the MT6370 ADC driver for system monitoring, including
> > > charger current, voltage, and temperature.
> > >
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> >
> > This will have to either wait for next cycle, or go through mfd because
> > of the dt-bindings include which is in the mfd tree.
> >
> > Please make those dependencies clear in new versions.
>
> If the bindings come together in -next, then subsequently in Mainline,
> it shouldn't really matter.

Except that the bindings haven't come together and at this point may
not for 6.1. linux-next has been warning for weeks because the child
device schemas haven't been applied. I've said it before, all the
schemas for MFD devices need to be applied together. Or at least the
MFD schema needs to get applied last.

Furthermore, subsequent versions of this don't get tested and we end
up with more warnings[1].

It's only your IIO tree that the DT
> tooling with complain about, right?

And the MFD tree...

Please apply the LED bindings (patches 1 and 2) so we can get the
existing warnings fixed and address any new warnings.

Rob

[1] https://lore.kernel.org/all/CAL_Jsq+Zkgfq0q_XgpLEjHLPGSuG06L6y5YbzbiberNMWtAuJw@mail.gmail.com/

