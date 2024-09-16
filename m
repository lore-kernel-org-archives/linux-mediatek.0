Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51244C3ABA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 14:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mKFbvl3FRfknVVQd9F2VGjZGmbz4CE84EcQSXZolvo=; b=X2IFDh1w9M9qWS2Aav6GYQipCD
	+IRynKeuZDxzUzXhIV5HVnxik2L4gzsczWGSovsEfgTiqbhrU7cTSbKAnALUwhUnntXXZlGR41iQY
	kdsaQz3E3S+e5iryhmnwI4g8ucnC5D6FqVB4xCGljSPB2FqXHRd/fF0/r7E7mPdDTzfvVuq87OfG4
	gBfQqwYKdiymrtX9HmCqnTicciCbrPGIQnA6enlo1fVU3Wo9DJf7szvVc4FR7W85QUdXX7I5AgbV+
	BIKZAkBZYsoKVAIr8NYAvb3GW4TJiGX9bw2gQ9URxN1FLLiK958hi9JTga5ghkySEkf0Q47dKn8bv
	5dkZuu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDBz-00000004H8D-3gRV;
	Mon, 16 Sep 2024 14:59:07 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDBx-00000004H7O-1k8j
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Sep 2024 14:59:06 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-536748c7e9aso5375613e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Sep 2024 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726498743; x=1727103543; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mKFbvl3FRfknVVQd9F2VGjZGmbz4CE84EcQSXZolvo=;
        b=O8uDIwibqFffXNjj/uGzMI0eiZC0yiDrJl5jN3xNwZ2AXHhNxUhrHQTo7J06thK4Iw
         eY0Stain3wjwzeO3Es9hszBtze3WhfhUKJ1p48Nu3icCTHKELR/hWMChSHo+QxokpTpY
         +yVhjHvw7+iUsZNrHLcKvebSK/KLQXlGGP3WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726498743; x=1727103543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mKFbvl3FRfknVVQd9F2VGjZGmbz4CE84EcQSXZolvo=;
        b=Mdta68VLa2ySwBLJ//5oqDEKnJ0OBLtuAjUms/+QmJwEkZ9hwEWSdnTdwyfmZHr6bM
         XUlgWXccsvYFozW0QG8FQcKnMl53S4ztMT5pvUp/0y2O++uclvoISudW9qBddlyJqPuj
         yn8nOHCQo/zbe83tVeR0qmh8ZkybayegYzJf10Ndm3fHGcTJm5K1KFG2k7uFCafQAdxo
         o9ZFzJd9BitKyjhP7wBa+BGuVn4gdj8aTH+VdI7tGA5uV76wKPSoBI99KYKGcQGT+pui
         fGqrK8vJJxJo/aAyNfVlUNDxA5iUDL/wUreH5DLYWXpFkDr506GlrdB2VaS8vvzXryA8
         I+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyBK/DAcIhSxrIC+YqizLojStRU3NJliHOA3mNaDygNWo3Hbohp3LgTwhC9HJi1e4kc03HvQaI/p04wOOA1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrTPPorji/qWUwtDw48ehp2edN4L/53t6qNvpsVVuGEKst8vdW
	OIevCFY6N37nz/9uTsgTZ6XPp7ALtnfXnhqb3S+zSfeQm0lJuP2a2Q27fp90LokCxgmKxZJPXaN
	qKCvMgPQLWYV6mS0eCY446IogmqxPREZP+zxF
X-Google-Smtp-Source: AGHT+IFzocyQXiHJ7IGC6/o9lODvUjZ8bZDDkxYaKMNeJriFadvyYRFY1CoEermaKv4PHMS4vAciuIhFJjjOmqh9esA=
X-Received: by 2002:a05:6512:3f18:b0:536:52ec:2870 with SMTP id
 2adb3069b0e04-53678fcd14cmr8312496e87.28.1726498742804; Mon, 16 Sep 2024
 07:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-10-wenst@chromium.org>
 <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 16 Sep 2024 16:58:51 +0200
Message-ID: <CAGXv+5HRLHV2tDZxiqFRhz1p+_bhMzMXoJMBnhy-R=8C4hBjnQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware prober
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_075905_514667_B246119E 
X-CRM114-Status: GOOD (  23.95  )
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

On Sat, Sep 14, 2024 at 1:43=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Sep 11, 2024 at 12:29=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > @@ -8,6 +8,7 @@ obj-$(CONFIG_CHROMEOS_ACPI)             +=3D chromeos_a=
cpi.o
> >  obj-$(CONFIG_CHROMEOS_LAPTOP)          +=3D chromeos_laptop.o
> >  obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)  +=3D chromeos_privacy_screen.o
> >  obj-$(CONFIG_CHROMEOS_PSTORE)          +=3D chromeos_pstore.o
> > +obj-$(CONFIG_CHROMEOS_OF_HW_PROBER)    +=3D chromeos_of_hw_prober.o
>
> "o" sorts before "p" so "of" should sort before "privacy"?
>
> I guess it's not exactly all sorted, but this small section is. Since
> it's arbitrary you could preserve the existing sorting. :-P

To me it seemed more like they are just sorted in the order they were
added.

> > +static const struct hw_prober_entry hw_prober_platforms[] =3D {
> > +       { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compo=
nent_prober, .data =3D &chromeos_i2c_probe_dumb_touchscreen },
> > +       { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compo=
nent_prober, .data =3D &chromeos_i2c_probe_dumb_trackpad },
>
> The fact that the example is only using "dumb" probers doesn't make it
> quite as a compelling proof that the code will scale up. Any chance
> you could add something that requires a bit more oomph? ;-)

I only have a hacked up thing right now.

This is the one I'm using to test things:
http://git.kernel.org/wens/c/5c2c920429167a15b990a7cf8427705eec321134

About this one, it seems we can at least merge the device trees of
each product into just one. The touchscreen or trackpad (or lack thereof)
is probed by the kernel.


This one I only started looking into:
http://git.kernel.org/wens/c/42c21929aeb3c7ca7b0ce9cacb1d0ff915d3c783

About the second one, AFAIK the device tree descriptions are incomplete.
Only one of the trackpad options has the regulator supply described.
The regulator itself is marked as always on, so things currently work.
Some work will need to be put in to research the schematics and test
whether things do work correctly.

> > +static int chromeos_of_hw_prober_driver_init(void)
> > +{
> > +       size_t i;
> > +       int ret;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> > +               if (of_machine_is_compatible(hw_prober_platforms[i].com=
patible))
> > +                       break;
> > +       if (i =3D=3D ARRAY_SIZE(hw_prober_platforms))
> > +               return -ENODEV;
> > +
> > +       ret =3D platform_driver_register(&chromeos_of_hw_prober_driver)=
;
> > +       if (ret)
> > +               return ret;
> > +
> > +       chromeos_of_hw_prober_pdev =3D
> > +                       platform_device_register_simple(DRV_NAME, PLATF=
ORM_DEVID_NONE, NULL, 0);
> > +       if (IS_ERR(chromeos_of_hw_prober_pdev))
> > +               goto err;
>
> FWIW if you didn't want to see your prober called over and over again
> if one of the devices deferred you could just register one device per
> type, right? Then each device would be able to defer separately. Dunno
> if it's worth it but figured I'd mention it...

I think that adds some unnecessary complexity, and more lingering devices
in the system. These platform devices are not removed.

> Also: as a high level comment, this all looks much nicer to me now
> that it's parameterized. :-)

Thanks!

ChenYu

