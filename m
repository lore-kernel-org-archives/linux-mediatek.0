Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A184FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QSUZB9iTsWPGYoZidyRTQejU8FhJSpc3buo2oOlQKk=; b=4J8LVbGIWglCHI
	VBQCE3xprYwKOMCcu0W7LNpetTNvVadcPlj1jJxvXPBvbdgVRDRv/e7U52H5hetpmH71Yl5yNlAxo
	Pc4MSb9J0t1ZhkbGIGFz4+wR1ZqVj7mZDlQrVqy68n6Q8yxEsMsSf06pguCw3QoYyBf1dN0xI1eQ0
	Va+WjpJGjruRBexsB7fzwfFj41oCt+GTuFTWvYOuAWdrijqTl06vRv5i6LVq129CF5IAvvx48nFIL
	MLUbo856D96HxKEzOFpBD/oRhaFZIDB/3fpDa6Iy/8qPe1sEfRk6EKVHUd9S4rtToOnb0cSWj7rd8
	5MD1yPIMRKO7wwvA3cUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJyyy-0033CO-IW; Tue, 15 Feb 2022 14:39:08 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJyyo-00337c-JD; Tue, 15 Feb 2022 14:39:00 +0000
Received: by mail-qk1-x730.google.com with SMTP id bs32so17458533qkb.1;
 Tue, 15 Feb 2022 06:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K0ow2l97FBadE8xYyNQO77wV9BV8c9FeJliZ8Zblp7o=;
 b=OvCv7l+IVLWiIYmrA/eyOyIiGsNr6rEC7SJ7SI0ykniYkMXuIlbJcyiIniSJZegR2Q
 ltJkoPKJSaCAcHmU2ItgB4h4Q2BMMyJpPrb5qq2ol+JxDJQhMIir73svlUhYVpbFqcEI
 tJVivfur2J2rZ4jI/Uqc9oeXE3FMfu6wIDttguFk/9lgOFkcevAPJYhU6Zj7Fx8tZCuW
 ehg5xjdZQpWY7QJ1PPdvodk1qObW598mPzqHm2H6yM7E6tmgab8eRc6qu2hOx6UhhA7v
 NZkXXBD8h4kSdipkJVyWNWpwOCY2NbcsJRpT8LKWTFz26koS2tf+T93JWDH2qnn2Vihr
 UoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K0ow2l97FBadE8xYyNQO77wV9BV8c9FeJliZ8Zblp7o=;
 b=ot5lj0H7T2D5UqWfF9dW5mi/uzIXtH9ZDsZ2b5Ut7wG2MB52WvCV5aDKd+0300u6hn
 JP1f336yQVOh1xnXgJ6qiVOdZAH4zsyc8xWeUdXncJrnSBIuo8BayEsEZeC/12FZwAZQ
 Spr5Tm6rwv1ThIzX7d6ZjVpxGAqeG4IRDcwgj9D/JZAlXYjUR81iDRUtUK4pZ+KArKmq
 e61tOeo2574eDF5t1A8x+xXLfCbQ/Y/1ELQNgp3g7vo+q7ZNP9e11gYmS+gdxxSQehAt
 /Jwfp9QT+BjSu7NIkb0QCjAJtMBN5GpFTmriETUa4tzrZvnLM9Z2vc2zs/5uUXiODVw9
 I0+A==
X-Gm-Message-State: AOAM533NXRqwAQTJuDwnWFfAN7xJspOg5mAK5NJ2UxiSet1bQjUu6rr9
 3Rf1/woyPeNyNtsA5gjgA47RCe4LKlMqUVc1VdE=
X-Google-Smtp-Source: ABdhPJzqxLfXDw78xLjeX6QcKbH1M0Mn2Y5YmSQ2IiVXkB4upL2T729wSv3PGfvAcUcBZDUXQTcovh+9YqwVs83tlCM=
X-Received: by 2002:a05:620a:4042:: with SMTP id
 i2mr2065887qko.592.1644935937193; 
 Tue, 15 Feb 2022 06:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
In-Reply-To: <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 15 Feb 2022 14:38:45 +0000
Message-ID: <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: Simon Ser <contact@emersion.fr>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 LAKML <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_063858_692471_AB9CA4A8 
X-CRM114-Status: GOOD (  28.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 15 Feb 2022 at 13:55, Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, February 15th, 2022 at 13:04, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > Greetings everyone,
> >
> > Padron for joining in so late o/
> >
> > On Tue, 8 Feb 2022 at 08:42, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > drm_dev_register() sets connector->registration_state to
> > > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> > > drm_connector_set_panel_orientation() is first called after
> > > drm_dev_register(), it will fail several checks and results in following
> > > warning.
> > >
> > > Add a function to create panel orientation property and set default value
> > > to UNKNOWN, so drivers can call this function to init the property earlier
> > > , and let the panel set the real value later.
> > >
> >
> > The warning illustrates a genuine race condition, where userspace will
> > read the old/invalid property value/state. So this patch masks away
> > the WARNING without addressing the actual issue.
> > Instead can we fix the respective drivers, so that no properties are
> > created after drm_dev_register()?
> >
> > Longer version:
> > As we look into drm_dev_register() it's in charge of creating the
> > dev/sysfs nodes (et al). Note that connectors cannot disappear at
> > runtime.
> > For panel orientation, we are creating an immutable connector
> > properly, meaning that as soon as drm_dev_register() is called we must
> > ensure that the property is available (if applicable) and set to the
> > correct value.
>
> Unfortunately we can't quite do this. To apply the panel orientation quirks we
> need to grab the EDID of the eDP connector, and this happened too late in my
> testing.
>
> What we can do is create the prop early during module load, and update it when
> we read the EDID (at the place where we create it right now). User-space will
> receive a hotplug event after the EDID is read, so will be able to pick up the
> new value if any.

Didn't quite get that, are you saying that a GETPROPERTY for the EDID,
the ioctl blocks or that we get an empty EDID?

The EDID hotplug even thing is neat - sounds like it also signals on
panel orientation, correct?
On such an event, which properties userspace should be re-fetching -
everything or guess randomly?

Looking through the documentation, I cannot see a clear answer :-\

Thanks
Emil

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
