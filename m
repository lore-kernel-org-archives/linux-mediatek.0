Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABD4C197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 05:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n47o3OCFeDC4YRz6dczMMUhasbGb5AVuJwwpKHI7eFo=; b=mgyHpvW/UvD1Dlbxit2YAc1x8u
	h6jS2g8d8ep1RNlGMFtvidhRSmQT36icRKTkZhMBBdAI0w8TpR9RpPa+Zap6Vv+BBMNvRo4aWtEBP
	/D5li5wgUMB7avAeuJ3yYQCbrnUMsVxI7hpcg3dkng2c8KDgr2/ETC0nQybdXKBCPmgjf1YsRvGKk
	BGtk1Uiav9E14TD2bMWQyvkmQfJfreQsFhS4RebttlStn2tlurZ+GTKYu9MuC4Tg89IPK/iHMYolF
	8um70ttTh2VjhngUMHwoLWQBwEu/AtbV/o8RkLCBK9QqdXSnqu3r3CEcj1lv9G+UF1yDQ10N+y7Fk
	byboVBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3UbZ-002Qxd-2N;
	Thu, 16 Nov 2023 05:07:53 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3UbX-002Qvp-0s
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 05:07:52 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso542728e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 21:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700111262; x=1700716062; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n47o3OCFeDC4YRz6dczMMUhasbGb5AVuJwwpKHI7eFo=;
        b=LH+JbCjn4O3QNpSz1qp3X+IZDQxPNTew4QNTtRF3ARlmoC9xSThk8wZRY1L4l10ov+
         pGCegbeUz6Rzt1ozABdq+a7AVQryuwfE9C2mHq8PdooQIk7XmCMhORca5IW6e0WBcge3
         Jdp5wjDMv5RixSAHoDTJLTlQ6eHvPgzl43QEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700111262; x=1700716062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n47o3OCFeDC4YRz6dczMMUhasbGb5AVuJwwpKHI7eFo=;
        b=huOolcSG3fB+/ue+czE8NzgRgKK2wyZ1fcOsyHuDpmjCOeQX0K4X1kMFr2fv7RFMb9
         nEsxQ3wiFeFd4x7dTnlFtkra0EyZ8HITojb7m1/nwvy/fAUpqfW00WPp97rBSqJygDRQ
         uMbM+U0RZu1f6NHBsccBLRUlUz14lLdlbPfzYHnOkCOiIyYCXsjDfLy95rGFwz7VSIpN
         pwQFNTc1gGUp0Qi6qEGX8jjDl3n6cDOjB79WVK/Ehthfwm5LhVJqmqxRi/Gc+WT5YJzJ
         5ITKAinPesuddtXDe0FsTmmbXVP6i3VMGfKBweHE/mBtO4+IsYTjC54aD6idzc8V+N9v
         oqkQ==
X-Gm-Message-State: AOJu0YwOFD0Mv6h3T5Yt+SXJ/zGLhKZtwKD2Z0LM378odcZTp59iYMtW
	M3+3bPZOmyleRKq8ZjEvOQf1v7L/BijbaBqZSrNtpA==
X-Google-Smtp-Source: AGHT+IHE03gJszw8lf/xHkWqpl61E8rAlryiMxaNRq78cfueM1p5kFwPjBIZVK5w9yvg2jCkjEB/Vh2Q6LEYk1Pq+cI=
X-Received: by 2002:a19:7616:0:b0:509:4980:7bf0 with SMTP id
 c22-20020a197616000000b0050949807bf0mr9759057lff.38.1700111261841; Wed, 15
 Nov 2023 21:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <859ac058-c50a-4eb8-99b6-3011ef4e7529@collabora.com>
 <CAL_JsqK64w3+r_LJZoh50PzAUcsvH6ahSDCqgSiKrD3LBAXE9g@mail.gmail.com>
 <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com>
 <CAL_Jsq+puq20EWkQg1RTs2zfmh4DGbqz1krp+19c=wPXnLT5dA@mail.gmail.com>
 <CAD=FV=X-17COQ2-tycV1bSuCrGy7MJ88Un8nA-a-ODexvgi9TQ@mail.gmail.com> <CAL_JsqKR_YD6hm4Lv+OuCKms8Ha61BZRKUuiLYPgSkz3_3NCFA@mail.gmail.com>
In-Reply-To: <CAL_JsqKR_YD6hm4Lv+OuCKms8Ha61BZRKUuiLYPgSkz3_3NCFA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Nov 2023 13:07:30 +0800
Message-ID: <CAGXv+5Gu4fmfriCh5wfeyqGPAX+LyLEDkCCrp4+_3XvS9-mAmw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: Rob Herring <robh+dt@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, andriy.shevchenko@linux.intel.com, 
	Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, broonie@kernel.org, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, james.clark@arm.com, 
	james@equiv.tech, keescook@chromium.org, petr.tesarik.ext@huawei.com, 
	rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_210751_312662_B5A4AB17 
X-CRM114-Status: GOOD (  34.07  )
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

On Thu, Nov 16, 2023 at 5:35=E2=80=AFAM Rob Herring <robh+dt@kernel.org> wr=
ote:
>
> On Wed, Nov 15, 2023 at 2:45=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Wed, Nov 15, 2023 at 2:28=E2=80=AFPM Rob Herring <robh+dt@kernel.org=
> wrote:
> > >
> > > > So if we're searching the whole device tree for "failed-needs-probe=
"
> > > > then we need to figure out which devices are related to each other.=
 If
> > > > a given board has second sources for MIPI panels, touchscreens, and
> > > > trackpads then we need to know which of the "failed-needs-probe"
> > > > devices are trackpads, which are touchscreens, and which are MIPI
> > > > panels. Do you have any suggestions for how we should do that? Mayb=
e
> > > > it was in some other thread that I missed? I guess we could have a
> > > > board-specific table mapping (compatible + node name + reg) to a
> > > > class, but that feels awkward.
> > >
> > > Node name is supposed to correspond to device class, so why not use
> > > that (no path or unit-address.) and nothing else (well, besides
> > > "status")?
> >
> > One problem is that I could imagine having two second source trackpads
> > that both have the same i2c address. That would give them the same
> > name, right? I guess you could maybe come up with some sort of suffix
> > rule? Like
> >
> > trackpad-1@10 {
> >   compatible =3D "elan,blah";
> >   ret =3D <0x10>;
> >   status =3D "failed-needs-probe";
> >   ...
> > }
> > trackpad-2@10 {
> >   compatible =3D "goodix,gt7375p";
> >   ret =3D <0x10>;
> >   status =3D "failed-needs-probe";
> >   ...
> > }
> >
> > Then I guess the class would be "trackpad"?
>
> That issue is somewhat orthogonal because it is not following the spec.
>
> I'm not sure mixing the 2 styles of node names is a good idea. While
> not used too much, matching by node name does ignore the unit-address,
> but I'm not sure we could ignore a '-N'.

of_node_name_prefix() solves that. I assume that's the intended use case?

> I think our options are either add something to the unit-address or
> use i2c-mux binding. Adding to the unit-address is not unprecedented.
> I did that for some of the register bit level bindings where you have
> a node for different bits at the same address. The downside is
> unit-address is bus specific, so we'd have to add that for multiple
> buses. For the i2c-mux, it's perhaps a bit complex and I'm not sure
> what if anything you'd have to do to manage the mux that's not really
> there.
>
> Rob

