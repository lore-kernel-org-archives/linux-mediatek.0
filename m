Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C138ED21694
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2Nzr/f3LnLUD1j4bkCrqVzP0/G5tRk6VST+iGhoZ4s=; b=nZOeCX4MIoudNqg3e2RR0EKcOL
	SAupZtx/1SpuxT3fg+CvT99qSJCpVb8bPmAy/p3xEWlpzHFx7aOv6zt5x8Y2qqGqF+qQUEHtVuH1z
	5aA6sDvJ5BVP4ut9LFqhZ/hKgWY7+ak0WXQwqNVjwsRs9pnlAKCPmXbiufQCy/KBXCJZM3Rdtav4W
	Nzl48Sj1Rh4yWOEhm27TKvelbzf+G4LMQxBhYT/lS7tBWxY3bEHv5Pem/8oW0Q55kdpHP+W0i+2iH
	KROSJFnSGMKmM0PcgfFP3qRRep1RlCLcLM415djJxPGm8PbTxfFeUS+enURxhUsjiRkPcaUc4TKN4
	rttw1PYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gig-00000008B6o-31iq;
	Tue, 15 Oct 2024 12:32:10 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gVz-000000088cp-3Twf
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 12:19:05 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539f8490856so2160675e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 05:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728994742; x=1729599542; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2Nzr/f3LnLUD1j4bkCrqVzP0/G5tRk6VST+iGhoZ4s=;
        b=AHy+l1NjNNz/dErGKBHucWg0pgzgXPVgqs87hRpuKirDU6+EjyQNeWMjRNKZULBg/n
         R5wciToLIoLH+3MxGOCmWYmt39MKP9QHqkkYFLzfLW3rfspCCuMTJCBvrCNLOev/ttPn
         cCT8NWCLQx9dPEw3unlRnH7agNO+4L/oq657E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728994742; x=1729599542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2Nzr/f3LnLUD1j4bkCrqVzP0/G5tRk6VST+iGhoZ4s=;
        b=BjH3C6liC2Hxs/1iqs1K+bVAjNA619UXjBf4rdhis6ewJm6GzRRojSOicBPxb2lwTL
         x6sIQpM+ay1b+itRVj/qCsfoXakvWp03mIqSQrLcJeeHCix8TjzUyBXcW6WFGfnSP2fS
         i2cDLJW919AKZh49inLiTVSH5inbd3/Tk642Fk4yv7bziBHrlX3hi9OgHWcn9uz7ts6Q
         Gosqx5I+YGmloq4yoF6P6v2Lz+nApJIWKvGyyBNO+cB22YtILm8Y8mWKPaDaw8lNxKnt
         KDUrnbro2eshIgmop4Tr7Wn0vAyjgjE88ZQmAsyKicla3FcOKQ8+dvAowDmHVlOIsVP7
         VZGA==
X-Forwarded-Encrypted: i=1; AJvYcCVIQ9giCDjlsQVUsLRuf2301xFSowSPNgSrQk/h41K1UplIleyA0Qe7marMBUoboRApr0bOxhwp28vdcJ1nOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVlElp+/yTTPMhllwNmpH0+jONkXUTDtooLCr1h02GbGakdcG2
	JYgbjUJ2cDL3aVny+z8vR2iPymNbytfz4tlWkWboDLYmsNQ+QfKgEKLky12OJKU56i3A1qsmuYY
	GWMzL34oh3gM+ABu1rHdzi0QUFEiUisBoyEY5
X-Google-Smtp-Source: AGHT+IHhelc1sPDiNO+kxEEhE8ky8z+lqqPZB1C0Uie/J5s8p86hdxcscCA4LhHzO10mmd95cq8TFxe0+nBzft1TCjY=
X-Received: by 2002:a05:6512:687:b0:52c:a5cb:69e4 with SMTP id
 2adb3069b0e04-539da599f59mr5899850e87.54.1728994742015; Tue, 15 Oct 2024
 05:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com> <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
 <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com>
 <Zwz_Kl7SwfL0ZaAZ@smile.fi.intel.com> <CAGXv+5H0Yvt1cwPOim-quT3C+=s9NapnryJhNxs_QW=DAyAycQ@mail.gmail.com>
 <Zw5QzP-5hnHW--F-@smile.fi.intel.com>
In-Reply-To: <Zw5QzP-5hnHW--F-@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 20:18:50 +0800
Message-ID: <CAGXv+5FuMjSaUJ+qDrx7Vmr9o5vJ9VW=tss1ezvdJyaZZouHKw@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware prober
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_051903_910905_DAB79E1F 
X-CRM114-Status: GOOD (  29.36  )
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

On Tue, Oct 15, 2024 at 7:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 15, 2024 at 02:32:54PM +0800, Chen-Yu Tsai wrote:
> > On Mon, Oct 14, 2024 at 7:23=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Oct 14, 2024 at 12:56:20PM +0800, Chen-Yu Tsai wrote:
> > > > On Thu, Oct 10, 2024 at 11:32=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> > > > > > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > > > > +   .cfg =3D &chromeos_i2c_probe_simple_trackpad_cfg,
> > > > > >
> > > > > >       .cfg =3D DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_s=
imple_ops),
> > > > > >
> > > > > > Or even
> > > > > >
> > > > > > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                 =
       \
> > > > > >       DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
> > > >
> > > > I'm not inclined on using compound literals here. "simple X cfg" wi=
ll
> > > > likely get shared between multiple |chromeos_i2c_probe_data| entrie=
s,
> > > > and AFAIK the toolchain can't merge them. So we would end up with o=
ne
> > > > compound literal per entry, even if their contents are the same.
> > >
> > > I'm not sure I follow, you are using compound literal _already_.
> > > How does my proposal change that?
> >
> > I'm using it where it makes sense, i.e. where the embedded variable
> > is not going to be shared with other instances.
> >
> > For the dumb probers, there's only going to be one instance per "type".
> >
> > For the simple probers, the config part is still one instance per "type=
",
> > but the parameters are board and component specific. There will be
> > multiple instances. Hence the config part can be shared, while the
> > parameters likely won't be.
> >
> > > > > With that also looking at the above
> > > > >
> > > > > #define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)                     =
       \
> > > > >         DEFINE_I2C_OF_PROBE_CFG(type, NULL)
> > > >
> > > > For the "dumb" case it makes sense though, since it would be one in=
stance
> > > > per type. But we could go further and just wrap the whole
> > > > |chromeos_i2c_probe_data| declaration.
> > >
> > > Maybe it's too far from now...
> >
> > This is what I have:
> >
> > #define DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(_type)
> >                         \
> >        static const struct chromeos_i2c_probe_data
> > chromeos_i2c_probe_dumb_ ## _type =3D {       \
>
> >                .cfg =3D &(const struct i2c_of_probe_cfg) {
>
> But the below is static initializer, why do you need a compound literal h=
ere?

Because .cfg takes a pointer to a struct. It's not an embedded struct.
The compound literal creates the internal struct, and then its address
is taken and assigned to the .cfg field.

Does that make sense?

> >                         \
> >                        .type =3D #_type,
> >                         \
> >                },
> >                         \
> > };
> >
> > DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(touchscreen);
>
> s/dumb/simple/g

"simple" is taken. This is "dumb" as in it does not need any helpers.
Maybe "no-op" if you don't like the negative connotation?


ChenYu

