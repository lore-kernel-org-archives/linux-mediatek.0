Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF77C88E53
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 19:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=; b=fCQ9JYu2Coyuufhy9tpDng9eog
	rJMcdZ3hiSPWzCMZ3pq4ZVZe3IXnDjQAhdQEwLQeupA0ZYTX1B8V2B8ne9P31vvzIO3ppufm3tUuY
	OQ90Vc+MI633X7/w+d3/O4V20zXWSH9KWkK5C4EqUeifQBDyFBLcL5Kr/4MBsVgfzLVjOD03O7Zh9
	599Wvj2Rvxyb2uEUO+JE0NthEi+jX6SbgTa7r9/FQhiuIsGpzJUGAuC0I6kbnrbJW7SVMXEuDVjSs
	vPrkwtAD4jxyvgY0Somv9bVZ6OfBlQ5K79mTNpl9sOGl4ijTUjd8Tjtx9Ne9C2n+SOfWL6otnQAp+
	M/Vh9Fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T7a-000000015cU-0mWR;
	Sat, 12 Sep 2026 19:10:42 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T7Y-000000015bj-11tT
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 19:10:41 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d43da99easo9280167b3.1
        for <linux-mediatek@lists.infradead.org>; Sat, 12 Sep 2026 12:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240239; cv=none;
        d=google.com; s=arc-20260327;
        b=PtMYpxLhjP2fvkMStMCdKBQpf+vn5hkakZk0jKvrz+i+RbDFIq0INW+pQQncSvj79D
         P8/vqfgKzkHJREiOlJHHHmP0BvGp4gkBMdWnAQQbjmkV5hrBhlTJj1xBstH1iothXWLf
         0dH2hR5pi9a3w0mcU85XMkOcLaE/BdaHmJKGX3pgWyML/r9lssSLA1yQA3+sFvcB1qEG
         BLCO8nAeRuhA41UhgfFDFGx6J1qzBV4q+opkDe1yP0mnL81tbjZdRIaAeQpDy594P5D4
         hHkxe+B2qZlN3VnlIGv7vIogBkQed0ugONtx9l/ec8BLnlLoIex//CaCGcYCQAdXfhxW
         jlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        fh=XRJe30VH8+PdgTuisqfOmdbvEFZ0GsyWR/coR5V8JAQ=;
        b=E7cks5t3dQI3hpS5vJYTAjsPpv9SMIHRYUv+0TQcZ372VV1aW+wkPQ4aLuKCOMygF4
         b2rolIAeJKCj6Am7dBnU2xdk3bBT/o/44foOkEuZnlDp6yUGcNJP3HgqyGp/8P7hD8Ga
         tSSvI28/eSj77Zw+30BAsggMT5cpF/DeiJi/zjv2bWoi5mPi1GsjJz2LuBo6fexccw0B
         FW0OWS3hRug3Jh/HuPqCSC4VAWeUay/McauMpCF+1TY7UZLtkD/MNmVmh2FqeuU/6iic
         0AacBSx175TOeqobVxAZE/otv/kRbfDQ+pjPcr8h0QPlyw/6Z7BEeRLQEJcTeqcfNAWJ
         qQLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240239; x=1789845039; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        b=SNTXpD9CK1l4Iw54m9lW7ijAMByZZ7ZTIll/gqqaqCfBYKyXWNZ76sg28lYIbyP8vW
         j2Erykz0e+k67nGBsH/96dOUWPNCi6YhUncBFPu5Aj8Z4qFMl/q5S2qjKeg95xPmeGsV
         v+gVusfxi5hOf/G1DzPTfFlvMR8/5liOSKjhTD1hnWIth26f0wJOuhcQmqIxaPlqXb/f
         j03H6jRazOafRA285TGsteSkcxcNm0Y8B7+RCznZ8fLQXPFXjNyxvKIlQLXI4vy5MwWm
         wiS3PC6M9IoNgzYDG3Zo3cnszUQeK2hHcgdKpgMzoDyYB36TUT11WFHxF3ZgIv/OuWPa
         oWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240239; x=1789845039;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        b=BI7zrCs+65joowkH3wbeTy3rze6BYlLd6wAZEFqx0Ut1DRwm2j0dOZw+y5Yy4fC/xS
         OtxOMoJu/45nyjvQrmCIoqJQNQqqVn3i+GMVIqElL2cAVTTTJa5W16DnjfjVAsFnXVEW
         3vCHi2An6mIXnOlxOdW3Om2HbrfLSd4t9f3sBTEZhcqKo3jOIVtdvGDA4p67+MeSNoRn
         JOp4hW25Tb2ptFyX6RM1aVbNagtbVdaEPLso0dZT5tRsKeFOPa6xGkNT81a2wAuw5xlc
         kZD3Rx07H/gQUqEvd11TMysAsKPonNPD1rQPt6w9mlN27O0iNljQcAHNVs7NNTPdteIK
         iAAw==
X-Forwarded-Encrypted: i=1; AKwUvBy2PvJ+nY2VKBNsI99oI+Oq/d+zw8QX+UIdcBPMKBVGppNBGCfQDFW06A+seei2r+Qmz4ENrjwpzxYGmGS5TA==@lists.infradead.org
X-Gm-Message-State: AFuF++n99SCF9d0x5tTbIy3saj8BCGk4SrWWKik1gsvJagty4ZfZYswd
	h5tqPGV14y9sFWpjPvRBCTeuHiVcUAylsZFSsxtw/qKxV8QWI5iKErNl6Zogp6LBfWNcZ+pAQIp
	PoTpFjSAaOfGVqOndWOOAbDbVBkpq2zQ=
X-Gm-Gg: AYBFou1OOFC4vhCufE9/Li4TlKZspcxIn9Dh/lkOf1QTG7EH/6p2FZ+BIOjcYDxLBV+
	Y74IrtvmZzzNSTojfp+svOuFxORmYfrLp1MomZwCAbYo4t8bS+Q5FBHMi2Nc7+V/aXsqvxypf4c
	mLhM/lVV6e7A61E18/jbsLKa/ALaqhzQIG39J1Tu/lKjFTSBuxG3zZjslj5acMTwHJx3RTROxJz
	QHL8f20wy5Nr2PodFrL8EDiRGV9S5TR0EqtOWXJuHlRxRRWtcuIvmmx2lagF+B8dOqeGnGZaKIB
	3CjFWSaNwxdv3GVKOZwqIFJrFl1qkPVzy6dPSloey3FcwdOsjL0Z
X-Received: by 2002:a05:690c:9a91:b0:873:5bd1:98b5 with SMTP id
 00721157ae682-884b200e9d9mr29464677b3.39.1789240234520; Sat, 12 Sep 2026
 12:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260906061755.5103-1-sumeet4linux@gmail.com> <20260906061755.5103-6-sumeet4linux@gmail.com>
 <1a5fb9bb-d057-4579-8b2c-b81aa16a61cb@kernel.org>
In-Reply-To: <1a5fb9bb-d057-4579-8b2c-b81aa16a61cb@kernel.org>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sun, 13 Sep 2026 00:40:23 +0530
X-Gm-Features: AcwNN1WFgZ6qmRCXqz0Ywv_tzPCCXsJ0jqSiA_xFTFPzs4rsV6HyVJPe6GfuozM
Message-ID: <CAJ9orWRgatqn5gLx5+eDu7-T4s2PWcoVQPvuyMBgEp-KwDwkfQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] power: Use %pe to print error pointers symbolically
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org, 
	thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org, 
	sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com, 
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_121040_288735_0E8570E7 
X-CRM114-Status: GOOD (  14.23  )
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

On Sun, Sep 6, 2026 at 12:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 06/09/2026 08:17, Sumeet Pawnikar wrote:
> >       }
> > diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supp=
ly/cw2015_battery.c
> > index 1bcb60cf763d..48643f7bf503 100644
> > --- a/drivers/power/supply/cw2015_battery.c
> > +++ b/drivers/power/supply/cw2015_battery.c
> > @@ -658,8 +658,8 @@ static int cw_bat_probe(struct i2c_client *client)
> >
> >       cw_bat->regmap =3D devm_regmap_init_i2c(client, &cw2015_regmap_co=
nfig);
> >       if (IS_ERR(cw_bat->regmap)) {
> > -             dev_err(cw_bat->dev, "Failed to allocate regmap: %ld\n",
> > -                     PTR_ERR(cw_bat->regmap));
> > +             dev_err(cw_bat->dev, "Failed to allocate regmap: %pe\n",
> > +                     cw_bat->regmap);
> >               return PTR_ERR(cw_bat->regmap);
>
> return dev_err_probe
>
> Instead you should use dev_err_probe and drop the last argument.
>
Sure. I'll do this suggested usage of dev_err_probe in different patch
series for *_probe() functions update.

As of now reverting the change for dev_err under *_porbe() function
and planning to post V2 for this original series to use %pe for review.

Thanks,
Sumeet.

> Best regards,
> Krzysztof

