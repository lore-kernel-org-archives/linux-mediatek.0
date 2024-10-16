Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8F1D1AD35
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlvkqeHB10TeR7p0qpAqomrEbyrl0g2iGDmWLXtmqe8=; b=P5JvyVlhV+z+WwkuDmvQTRHQhK
	XieEeOJ5JnTvjBNtnRsKvbicOUoHd0MSANIhlngl+K7yKFNEZUpGLDPdY18hgwSjea7mWejwr6CrE
	y6F3W7gJ0awA3ZMVHExYn9MHh9g0qMXmWW/jh++eCJOQ97D7ngKepOSO40M+qseyWsxWBVgpWdCpe
	T5nY1SIEVj+uvcPTJbQXbDjKouL40upzHiwFi2vPOQBEKZlLHge4FHcxUKy546TdCwWDiSUpPzbfM
	kx+hkz0FrAC8mo6elHGzB5oxLpFz8FObs98x7pOgyAtWbVzU+0JsFqytQklEE4XZynakcLFwT/buw
	T3fpouJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t10S3-0000000BFkU-2vfT;
	Wed, 16 Oct 2024 09:36:19 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t10KI-0000000BEWj-44VY
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 09:28:20 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539e690479cso4294731e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 02:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729070897; x=1729675697; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlvkqeHB10TeR7p0qpAqomrEbyrl0g2iGDmWLXtmqe8=;
        b=HqAYTusMqt2LwbZgEw0pjegEHopfr6qg20W/iVIIsP2JkHV20y91mR/MyqJ0FzWd0C
         DuTVqjoWHoAWTZa4y7E37/pVKM/VwSQ/PFe5IBxTdA62PVbYA5yWXINOJyR/izusTV4a
         e91xG1KtcsPwCul8d+j3CaMhjaeAIbtZtGBFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070897; x=1729675697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlvkqeHB10TeR7p0qpAqomrEbyrl0g2iGDmWLXtmqe8=;
        b=TUneFr0397uHLjfzvVr4dyoW5LK2lQkcjtfMWJxViLjDNCB/EnVno6w4XBs7J+HzY7
         0hLCpcB5abq/64Ku29re+oO5NXMJu/Qt2Hx3oVu2FWJSp85L4mbVwWDKFtgmUwtbSbkU
         quVlS+QjO0cv4dxVfslAx9VLlXuNbtEP895rV21UjERBSrK85I4mapCFJPcYbIeQZK00
         LyeNwMvM7bdcxNBKElYg3lznIK4SDE8qTtxYgF88maS7g4/t1y5Y0wVg2+60Kf0Spw79
         teCtCa96xEYjFWvOCHiIm/gA0K3ZUDRTUR1QigZMXZGnFmJvdXo8HIyklnDTzLOJLGEY
         icNA==
X-Forwarded-Encrypted: i=1; AJvYcCUQTE++0EtgvfklyV76k/IL1XpoK/f7jCgyZeEgZqC9iFag186+7x8OUFAPHkV7s/QznzmLPOU2gD2ZpSSMRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3f0xyC9eDCPqqt/f432B2ALx1kDdriSroGhcoX9kzzRLi3JSf
	V304MX3gvD9tSDGrtxXgpigZaN86r+c9/Bp88hW59X9NGHRxpR/EBhNzRxR1PFm29SMOm8OjwBt
	DRO/347P2hXCx9VgyfiqF0HuMagtr1ps9TeYb
X-Google-Smtp-Source: AGHT+IEaS5qJnG1F/Na+fPMzIxej3L36Oa+G1Du15MTwKWHu6l9SdRlVC+wBVlX0gEHyVjj7AKsa/2ZIQjZ3p9uU05A=
X-Received: by 2002:a05:6512:b11:b0:530:e323:b1d0 with SMTP id
 2adb3069b0e04-539e54d77bdmr6806437e87.9.1729070896644; Wed, 16 Oct 2024
 02:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-5-wenst@chromium.org>
 <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com> <CAGXv+5FW0UTjR_ZiqZ8VEOQkBemt54omtJe_aTj3jvScC-LuMw@mail.gmail.com>
In-Reply-To: <CAGXv+5FW0UTjR_ZiqZ8VEOQkBemt54omtJe_aTj3jvScC-LuMw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Oct 2024 17:28:05 +0800
Message-ID: <CAGXv+5GHDt3_Td8B441xv=-G1=LBfSXp8_sQ4XRRPX1f4VyTMQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
To: Doug Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Saravana Kannan <saravanak@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_022819_059960_B8A163BE 
X-CRM114-Status: GOOD (  20.15  )
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

On Wed, Oct 16, 2024 at 3:01=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Wed, Oct 16, 2024 at 1:58=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > >
> > > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_p=
robe_cfg *cfg, void *ctx)
> > > +{
> > > +       const struct i2c_of_probe_ops *ops;
> > > +       const char *type;
> > > +       struct i2c_adapter *i2c;
> > > +       int ret;
> > > +
> > > +       ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> > > +       type =3D cfg->type;
> > > +
> > > +       struct device_node *i2c_node __free(device_node) =3D i2c_of_p=
robe_get_i2c_node(dev, type);
> > > +       if (IS_ERR(i2c_node))
> > > +               return PTR_ERR(i2c_node);
> >
> > I'm still getting comfortable with the __free() syntax so sorry if I'm
> > wrong, but I _think_ the above is buggy. I believe that the definition
> > of the free function for "device_node" is from:
> >
> > DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
> >
> > ...which means it'll call of_node_put() to free "i2c_node" when it
> > goes out of scope. of_node_put() handles NULL pointers but _not_ ERR
> > pointers. So I think that if you get an error back and then return via
> > the PTR_ERR(i2c_node) then it'll crash because it will try to free an
> > ERR pointer. Did I get that right? Presumably you need to instead do:
> >
> >   return PTR_ERR(no_free_ptr(i2c_node));
> >
> > ...or change of_node_put() to be a noop for error pointers?
>
> Good catch! As Andy suggested, it should be updated to handle both.
> I'll add a patch for this.

On second thought, it might be better to change i2c_of_probe_get_i2c_node()
to return NULL on errors. That seems to be what most functions do. I only
found a handful of exceptions.

Rob, any thoughts from your end?


ChenYu

