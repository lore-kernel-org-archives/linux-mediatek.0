Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2883CC7618E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j798mRgzagav4OXiZ0yBmBHNPfVDqUqZ2VrQzSezYUw=; b=EWJGA1SkwCN0Rf
	n/mL8YJNAmlfaJnYvMfqhqPjpC7uLqJOwnEcxH2cQCcqVIpAhqz8ZRXzaTiFXJJ4wWzjM8ZrBkhzr
	lyVne/q7O0h9cWsYntoSrfRvZ0NChQon28nRz815QwEJOXkRlpPbkgq7cGTOemtUzdecYcNuMOolF
	+eOP2OW20SHNUTzgV99Vm/usSloamtuvhNa2hc+DIP65T5OBgk6FPMeXbWrcMxRrJSHffm7VecqJc
	NhS1QI6ZepInURy19aiqcVIgCbccRg8AlUGhOP5KjmBV29M0byYum6ZD70M7S+cRTxaz4cmfc96er
	XM/niFaw/D4Q4bGDjN3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr0jk-00GyGO-2b;
	Mon, 24 Apr 2023 18:16:28 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr0ji-00GyG3-20
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Apr 2023 18:16:27 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-32b4e379000so13341755ab.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 11:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682360183; x=1684952183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j798mRgzagav4OXiZ0yBmBHNPfVDqUqZ2VrQzSezYUw=;
        b=G9KdJUHkkTe/bsKhq9J+4u0KFgFeFlCihRF4Y4sDSojvSCKNKBYWjVPGn4hUv2QAOt
         HaEbHGEhDVK4SDeNjFnDo4iuM5w1pYk3ZsnS4tlp2M53c7dzr6a51F2A4gQB+IgzDSyF
         0UtGy+7aTo2bjwqw63zoPf4pyKYVWE3MBtywk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682360183; x=1684952183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j798mRgzagav4OXiZ0yBmBHNPfVDqUqZ2VrQzSezYUw=;
        b=QxMBugrBZoUfMnA1PcJTl2Jw3mLupP9i63XiIs5XLY6P+PNYjxKS3hwBm+7RgBSe1u
         zuUC7Mh3UMcdk7i0w+ydZpxGLXbZuFiiAmfeFcG84o8rv0cPaEqBB7sfgCVvYbwnvZjW
         kIvoBSxWitim2/47u6Gv3hCeZagdbUrrf9rArJPHOUmbGfVdIU9qTQKOoRDU915OnJ8t
         pguWiq/5LswNWyQmYUMumuZXc0jC3CVii7jbJ2fOFjoIZ39z9mPe+sUnyArqIkX1SiHt
         mYn6BAG+GFGD6UZ2DnZgqXSxjXf68uROc4vYxBHU8mzQa/hptVz7lGys7D4bknQA/sfa
         JyHg==
X-Gm-Message-State: AAQBX9c6j+wkS9PqdfmjifTyyuHFBpruaogXEp4Zl1312qyqbpTNgKnp
	eq463CNoiej7CcYD3mO/70+pvpqvZuMP8Iky/1M=
X-Google-Smtp-Source: AKy350ZrTxE+n75VrnDCeX592GuCGN7/BhPRdMmXqJWBLkfNJPNpIOew6QlpXV1Wl+JI/+c5WDMDwQ==
X-Received: by 2002:a92:d686:0:b0:32b:f9b:82fb with SMTP id p6-20020a92d686000000b0032b0f9b82fbmr6277423iln.7.1682360183125;
        Mon, 24 Apr 2023 11:16:23 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id cx27-20020a056638491b00b0040fa19472bcsm3505782jab.92.2023.04.24.11.16.21
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 11:16:22 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-316d901b2ecso1108405ab.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 11:16:21 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b83:b0:32a:f2a9:d1b7 with SMTP id
 h3-20020a056e021b8300b0032af2a9d1b7mr19498ili.10.1682360181408; Mon, 24 Apr
 2023 11:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-3-fshao@chromium.org>
 <ZEX5tc2LSZoVswc2@nixie71>
In-Reply-To: <ZEX5tc2LSZoVswc2@nixie71>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Apr 2023 11:16:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XnrSskS=0UKRGGPBxSnPYQtUkJeoBm44bDnwKVBHJLyA@mail.gmail.com>
Message-ID: <CAD=FV=XnrSskS=0UKRGGPBxSnPYQtUkJeoBm44bDnwKVBHJLyA@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: i2c-hid: goodix: Add support for
 powered-in-suspend property
To: Jeff LaBundy <jeff@labundy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_111626_686575_3A1696FA 
X-CRM114-Status: GOOD (  25.88  )
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Stephen Kitt <steve@sk2.org>, Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-mediatek <linux-mediatek@lists.infradead.org>, linux-input@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Sun, Apr 23, 2023 at 8:38=E2=80=AFPM Jeff LaBundy <jeff@labundy.com> wro=
te:
>
> > @@ -37,13 +38,34 @@ static int goodix_i2c_hid_power_up(struct i2chid_op=
s *ops)
> >               container_of(ops, struct i2c_hid_of_goodix, ops);
> >       int ret;
> >
> > -     ret =3D regulator_enable(ihid_goodix->vdd);
> > -     if (ret)
> > -             return ret;
> > -
> > -     ret =3D regulator_enable(ihid_goodix->vddio);
> > -     if (ret)
> > -             return ret;
> > +     /*
> > +      * This is to ensure that the reset GPIO will be asserted and the
> > +      * regulators will be enabled for all cases.
> > +      */
> > +     if (ihid_goodix->powered_in_suspend) {
> > +             /*
> > +              * This is not mandatory, but we assert reset here (inste=
ad of
> > +              * in power-down) to ensure that the device will have a c=
lean
> > +              * state later on just like the normal scenarios would ha=
ve.
> > +              *
> > +              * Also, since the regulators were not disabled in power-=
down,
> > +              * we don't need to enable them here.
> > +              */
> > +             gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> > +     } else {
> > +             /*
> > +              * In this case, the reset is already asserted (either in
> > +              * probe or power-down).
> > +              * All we need is to enable the regulators.
> > +              */
> > +             ret =3D regulator_enable(ihid_goodix->vdd);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ret =3D regulator_enable(ihid_goodix->vddio);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> Please let me know in case I have misunderstood, but I don't see a need
> to change the regulator_enable/disable() logic if this property is set.
> If the regulators are truly always-on, the regulator core already knows
> what to do and we should not duplicate that logic here.
>
> Based on the alleged silicon erratum discussed in patch [1/2], it seems
> we only want to control the behavior of the reset GPIO. Therefore, only
> the calls to gpiod_set_value_cansleep() should be affected and the name
> of the property updated to reflect what it's actually doing.

This would be OK w/ me.

