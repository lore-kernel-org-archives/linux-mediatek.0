Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C2AFC6184
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 23:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgrnQAkPxnP9xr/uHfnesOWhy4bQylWu/nCRFkQoiTg=; b=stlPXKwMFPjRy9MRhV84ecvBlW
	ZI2OabQxNfhCvSW6NqRTL8abOi9Yl3Pc5zhj7VsILqCZxn4vxisX9QAAC5qoVhJGUcs8OgTQPygHZ
	HUy8iQzpMIecw+C8rvuGtX5i1NSuDD8N+JkJCQ/ZZJZUdJZeoN/zILshv5P9mqzHP0Le9eGoJlTz7
	a2gVrWgerNo3ABnp9DiV4nMxc0aSyowZjTyLzo1A0ggWrFZxhjUQ7yKuAO1cPPYYumqP6uxEboStW
	U5Yeo0O/IZG2TpiDxXJwudKiPuhY1dVRFHzAq6Urmj+oAkWlCS8qrU20ogMk/sk1hbgObd8WQnLhX
	LPCr9oFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spFyo-0000000HNIl-39Eh;
	Fri, 13 Sep 2024 23:45:34 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spFx0-0000000HN2M-1797
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 23:43:43 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-458366791aaso14110491cf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 16:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726271017; x=1726875817; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgrnQAkPxnP9xr/uHfnesOWhy4bQylWu/nCRFkQoiTg=;
        b=V5YKf/vCkGtyopCNVl4Mv4cy8t2ntrx3eSACbtoAZlb4+JiYHUCahwFzbz8CxTwH87
         2HaCkYChX2mGIjoBZJyt0oZr4iSiJPieo4EwNqyJANi30QjctcKbRqAbblxhgNYZBXXb
         4LIMam51zHXGCnrI4wj5iI+7QEouRbf09Wq8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726271017; x=1726875817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgrnQAkPxnP9xr/uHfnesOWhy4bQylWu/nCRFkQoiTg=;
        b=cv2ln+7GiaG/g8eOw6hFyeh0+z7X3VrhlC22vYTl2prOckuD9+476KjnC6wuAXA/Ds
         1PK0CV685jc7MKtLbF07sCHUx9UqNF8B6QM0y6Krw6PNN5KInMaHP+Pk/QH/hPcxgvrC
         6imK/wVGEFAd41w6qVKi9z1vPF+AfSTj/PcByRKbdjdheHqDZQeMdQJNZrRcMJGuR/Du
         E1apU1k0pBB75OnaTHJK9q0oKvS+Jowz+A7pPXU/CcBKOPR5Hsuno79HwM8NnJKD1Oxg
         /CwMmojMMOaQZ2Vk4uvHoTEko0zOBSnK+g+ftV1agGNz2Jao4fsA6hluUNxOpoLYIso4
         yMtg==
X-Forwarded-Encrypted: i=1; AJvYcCWNO7SsjC0YpX8832uePwXlU3vOfqnejcrwoRfDFKxLtbqlgK4bFbn9J2mDtlyNzaWYjRZfLg/KEEvD1u9hfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTUXQnsP1eFYp9TRdzb1IRS4/ydh+Fl/CVGtjAtMLKcDWdy9QD
	BO3gL+18ssJEXSzzhlRL5cvLIiQSAEK1gmQG3WxXW7ZGDUpvGdeOtPH0K56h70u3VhwMUzeEgH8
	=
X-Google-Smtp-Source: AGHT+IG2viS6/v0vgNNYFbu8ectjaafW1wzqYXokbJ959G/xpuv60O2dettJ5/yrilRV51SvqiRi6g==
X-Received: by 2002:a05:6214:3da0:b0:6c5:517a:56d0 with SMTP id 6a1803df08f44-6c57355a87bmr135341926d6.13.1726271016975;
        Fri, 13 Sep 2024 16:43:36 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c6421b7sm1357326d6.58.2024.09.13.16.43.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 16:43:35 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6c352bcb569so14293216d6.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 16:43:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXt2ZXqNQoCaF0IgS/jWYcZEHTA1w5Rc7QZNg9fHjSNKTVh1PY+0EthOH/26e69KQjf6IGYXSpDWsMU8t+Ng==@lists.infradead.org
X-Received: by 2002:a05:6214:5f07:b0:6c5:de4:3edb with SMTP id
 6a1803df08f44-6c5735881a8mr122878276d6.29.1726271012120; Fri, 13 Sep 2024
 16:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-10-wenst@chromium.org>
In-Reply-To: <20240911072751.365361-10-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 16:43:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
Message-ID: <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware prober
To: Chen-Yu Tsai <wenst@chromium.org>
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
X-CRM114-CacheID: sfid-20240913_164342_327572_8B7AFDB3 
X-CRM114-Status: GOOD (  15.83  )
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

On Wed, Sep 11, 2024 at 12:29=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -8,6 +8,7 @@ obj-$(CONFIG_CHROMEOS_ACPI)             +=3D chromeos_acp=
i.o
>  obj-$(CONFIG_CHROMEOS_LAPTOP)          +=3D chromeos_laptop.o
>  obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)  +=3D chromeos_privacy_screen.o
>  obj-$(CONFIG_CHROMEOS_PSTORE)          +=3D chromeos_pstore.o
> +obj-$(CONFIG_CHROMEOS_OF_HW_PROBER)    +=3D chromeos_of_hw_prober.o

"o" sorts before "p" so "of" should sort before "privacy"?

I guess it's not exactly all sorted, but this small section is. Since
it's arbitrary you could preserve the existing sorting. :-P


> +static const struct hw_prober_entry hw_prober_platforms[] =3D {
> +       { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compone=
nt_prober, .data =3D &chromeos_i2c_probe_dumb_touchscreen },
> +       { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compone=
nt_prober, .data =3D &chromeos_i2c_probe_dumb_trackpad },

The fact that the example is only using "dumb" probers doesn't make it
quite as a compelling proof that the code will scale up. Any chance
you could add something that requires a bit more oomph? ;-)


> +static int chromeos_of_hw_prober_driver_init(void)
> +{
> +       size_t i;
> +       int ret;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> +               if (of_machine_is_compatible(hw_prober_platforms[i].compa=
tible))
> +                       break;
> +       if (i =3D=3D ARRAY_SIZE(hw_prober_platforms))
> +               return -ENODEV;
> +
> +       ret =3D platform_driver_register(&chromeos_of_hw_prober_driver);
> +       if (ret)
> +               return ret;
> +
> +       chromeos_of_hw_prober_pdev =3D
> +                       platform_device_register_simple(DRV_NAME, PLATFOR=
M_DEVID_NONE, NULL, 0);
> +       if (IS_ERR(chromeos_of_hw_prober_pdev))
> +               goto err;

FWIW if you didn't want to see your prober called over and over again
if one of the devices deferred you could just register one device per
type, right? Then each device would be able to defer separately. Dunno
if it's worth it but figured I'd mention it...


Also: as a high level comment, this all looks much nicer to me now
that it's parameterized. :-)

