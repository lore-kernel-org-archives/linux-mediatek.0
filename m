Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5A6D1AD24
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 08:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPSA6U2IhZgMRSFXZK5Yj7RxoQjZFaD6SSlWNz1Yb8o=; b=UKUCRefU5jTJQhqNUaLNY/+acg
	cOuRmZBi0Av8AA2gi8JH4x/6JVwk/iUMmAA4K5daZBHVhe+Jj6UP71ZOIar878CX72TC6DQoHUo5R
	UdGZxbLk1gEpXzHNhwgyvrjAugQ52bcDWGoRXkETid2KPVjYR/WOYRQAE3gctsKaMIAElXKdnHJ+g
	vLeogkuDtx9E2RRE3rmL6KBPYc9GpR85egnTLcwwQsaL3swvi9q/hZFciro6wFOVv5vKf9nCgWdbk
	rcXxuAbEAaf7PFJ57RO1js4fb1TavGgj6v9Sk5IkD1CUkW8MzK3mEaXD+qp2FiuMUXNUXlACDNLt+
	hFIoKG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zC4-0000000AyhJ-0Tvj;
	Wed, 16 Oct 2024 08:15:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0y2Q-0000000AmC7-0LIm
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Oct 2024 07:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aPSA6U2IhZgMRSFXZK5Yj7RxoQjZFaD6SSlWNz1Yb8o=; b=H5Adr+zpvC44gknc5J+oZk312t
	31QbxqY4k/KeBAxqZsXwVDovv6mw1q8O4AUejqKOW3jcsxMhF+oFuRAJEjygy96L+h/LYJWV8qxat
	3Gup+9LIvk5k2D0BiYTXsbrVBiOweeJGEKcASRHPJrb80acUVzKlu05K4uAyMU5a2nnSgAmCs4hjK
	OijNWtLqPlxjJFpOdSRsyr1pYbEZZDP4J08GXYMpIQrhSXXRxi11MyGUfKeVC5yJtpcVOGPkKpoSw
	N6FaslMWsfkZ4jEsVevZnNegC+aP+s++lgmbhQfilI4fVGOFOn+vPWghCmANxI9PYHBtuBmWv2as8
	/fTO4zkQ==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0y2H-00000006joV-41AU
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 07:01:38 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539f58c68c5so5170662e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 00:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729062089; x=1729666889; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPSA6U2IhZgMRSFXZK5Yj7RxoQjZFaD6SSlWNz1Yb8o=;
        b=HZ5l4NwoIcz23NZz+Q+1yx79aERwD+o5//5FxIOliWxzI/ai8WJQvTbHF/ZlLc1n2U
         Nwdk9GWCT93YO8ywGRl0u8o/ip8ETtCZjmRVvdoSlKaE0WHorvIyQvLMgyWYqTq59lG/
         YqKmq4HcDsC/zk7ClVNRKkCGt2yG1JhZoAT3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729062089; x=1729666889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPSA6U2IhZgMRSFXZK5Yj7RxoQjZFaD6SSlWNz1Yb8o=;
        b=vF49pgLpwP4BlEM6tyOpIZHoZzFw9mJ/4DFxl0fGtXjoaUkBaw95JHsVArXbgAHD0V
         M02KKBE9cYu/ROnshkyUcpXxRxGo0/WSqR4TIdTKkacrjfWLDb0o3mAiZ5UJiGxHI65h
         Nl9yYHiy+SJ9QfqMf/DDtATWqVLlpVNGWPtZAoYb8a/L7hcLWgCru3TM0pPpKqdelst8
         SOBW2jIM81V1d5AskVYccxFpBoY6t2aV0ri9jtVvPAYXViLef1XDYqu1fQOp2q4F/9wX
         Fwf8E6CBDwXlAIk6MWhfYsYJNR5M5zzX24I33d1oDtjekwmBwJx0ink2TwP8kcm51TG9
         Przg==
X-Forwarded-Encrypted: i=1; AJvYcCX4bedXPr7b9sMckjTYEbrXD6cSJHNEM3NtzdrZpzJ167xe8DvwfsVgKfp+I2ExEEJZA1z+ND4c9Yu2GnXI0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFWgqTycDWhAGWrK/9gdR+c6qN0eEy2OAbG9cdolO0m467TUW5
	9WcdwY+0H0eQXTc4MPZdoT7tTp7vxQBQitTutgmDFjkQBOmlcp0noRrJX/wHtzPjIs4kIcYLuT2
	yoMxaeI5PlKqTjNDiUxphdOxSJWc3pAqP/VIh
X-Google-Smtp-Source: AGHT+IF9nGtCldCGOeLQrTN0Aa5+OFXxu1e3xzkOPVJhXANUIs3qmwtgnQsHFXF0n+2Y3Vn8cKEwmSavH38AfXohfvY=
X-Received: by 2002:a05:6512:2398:b0:536:741a:6bc5 with SMTP id
 2adb3069b0e04-539e54d6122mr10014310e87.12.1729062089143; Wed, 16 Oct 2024
 00:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-5-wenst@chromium.org>
 <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
In-Reply-To: <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Oct 2024 15:01:17 +0800
Message-ID: <CAGXv+5FW0UTjR_ZiqZ8VEOQkBemt54omtJe_aTj3jvScC-LuMw@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_080136_161524_C7AFFD0C 
X-CRM114-Status: GOOD (  20.59  )
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

On Wed, Oct 16, 2024 at 1:58=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_pro=
be_cfg *cfg, void *ctx)
> > +{
> > +       const struct i2c_of_probe_ops *ops;
> > +       const char *type;
> > +       struct i2c_adapter *i2c;
> > +       int ret;
> > +
> > +       ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> > +       type =3D cfg->type;
> > +
> > +       struct device_node *i2c_node __free(device_node) =3D i2c_of_pro=
be_get_i2c_node(dev, type);
> > +       if (IS_ERR(i2c_node))
> > +               return PTR_ERR(i2c_node);
>
> I'm still getting comfortable with the __free() syntax so sorry if I'm
> wrong, but I _think_ the above is buggy. I believe that the definition
> of the free function for "device_node" is from:
>
> DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
>
> ...which means it'll call of_node_put() to free "i2c_node" when it
> goes out of scope. of_node_put() handles NULL pointers but _not_ ERR
> pointers. So I think that if you get an error back and then return via
> the PTR_ERR(i2c_node) then it'll crash because it will try to free an
> ERR pointer. Did I get that right? Presumably you need to instead do:
>
>   return PTR_ERR(no_free_ptr(i2c_node));
>
> ...or change of_node_put() to be a noop for error pointers?

Good catch! As Andy suggested, it should be updated to handle both.
I'll add a patch for this.

> > +struct i2c_of_probe_ops {
> > +       /**
> > +        * @enable: Retrieve and enable resources so that the component=
s respond to probes.
> > +        *
> > +        * Resources should be reverted to their initial state before r=
eturning if this fails.
>
> nit: might be worth explicitly noting that returning -EPROBE_DEFER is
> OK here because this both retrieves resources and enables.

Makes sense. Will do.

> > +        */
> > +       int (*enable)(struct device *dev, struct device_node *bus_node,=
 void *data);
> > +
> > +       /**
> > +        * @cleanup_early: Release exclusive resources prior to enablin=
g component.
>
> nit: change the word "enabling" to "calling probe() on a detected"
> since otherwise it could be confused with the "enable" function above.

Makes sense. Will do.


ChenYu

