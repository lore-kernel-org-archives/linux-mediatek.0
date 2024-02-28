Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B8AC47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 18:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Geinf3iXIsRtEPoobTh+JUtNobeS9O6vzLYAbzH6HdU=; b=I/CHNsJjytmZxmky8/OdsVvIYz
	Ruk2eB4SVB6pxEnIu6LJ+cXAAxeV2kf+MqktzipoHvKNvbzL2vXLYm8ZoZ/QV1zBaNe1bq7q5vfIZ
	+8s5nODBabZkzimlF21ASrF0UF3taJV9SVTfDrCbTg3tUcmzQx6mVmUhgB3wCuKpe0ZK4p5JvdqzO
	4Zu2Hq77EUuVhnELddbyjEkFFZizYUi3TwQOw2GrMAMLI6QyyHV8AKRToQr+arFhKHmxLQpqZ9dof
	u44pN14bSL9iXsjug/piKv1EZKUXsl2hjRpvDmdl8EBt+zt9lQdeCvcJex5ESA7bu+3p2KGX1hWpa
	XHlpHEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOKW-0000000AQBF-3Ozt;
	Wed, 28 Feb 2024 18:06:56 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOKT-0000000AQA3-3veC;
	Wed, 28 Feb 2024 18:06:55 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a34c5ca2537so16095066b.0;
        Wed, 28 Feb 2024 10:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709143611; x=1709748411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Geinf3iXIsRtEPoobTh+JUtNobeS9O6vzLYAbzH6HdU=;
        b=QBtAIPIdo/CXWW0yucyUOrSFZBMrzVQiyvIEcDoR7xGIvsrZmHAVgsItqVC3ecWyqR
         AXG+cboCLiU99YRiy5QWpzJFdj6knqBAwQkMH/OgK+VptDJqN8Z0SaHgdSgSmPTxp3Xt
         0nU4zCc20dRXTCIfKbUB8Fva5F7qJ4NcVw+AcGnkzCpWqj16TBLC/aq7YZCc9Wko5Rjz
         RhRsbYBCEGYhNpEB/7bpJqwZWM350mJYe6sLBpVOjvTCtvXfGIRmEHEH5DF1oi8UIBL+
         AiSIrQxvWz4kwPktje352xir+Ybmfovgb49mbSaizZqhbEkuEB4vVeWPJSGjhJbfJQve
         vS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709143611; x=1709748411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Geinf3iXIsRtEPoobTh+JUtNobeS9O6vzLYAbzH6HdU=;
        b=wxd2t0yz7p2riPhqkxPYCQqCv4uy2C0S9TtjhdUF3qcRlrU3RP2Q3bpw01lIlI7/JV
         5EmCS4ZKng0cWsSe2OkIoB6QHDMYA3oqKN31RkTTsS8vepWeYvsBs3594gDBCMy7M4DR
         k54ApPgEcm2i377qcRo0kq9cmCAgz/hfPKvOLGm8xLLH6uhQ3wvOxOJ4xWxcy+TaEMdi
         nt+hdEj+FDa46vcgq4z3RiMFDwMYbYwFR+vBgHMArciNn5zbc0GNxNWI+oZsqqrszaU0
         /2gU/adlCaGvV/BLfezqDywm4cX42J/EUQmqfaQqxKkMBgMUITaK13WsC/EY7eG36kbr
         e8EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrqo1BTZ+VKho5a3jJ8dODAQ4LX2q3lE+habHBsgUDH/wfCEG8yiWm8QwiJESOqRBYBiehp8OSDvj/vTwVIJW8DVkAMMmWaOOZ/mWYl8DdVkEEh0KfJ4YHiycTeq8mWwp2J0mxs8AQNm35Yy940iddJrjS+uXTma8=
X-Gm-Message-State: AOJu0YwRxza08PYuwUuMUeOzg8+H96UBF6z6r7BfSPjoMRfeP1ejbNX5
	n52UL8kcy94IXxvcXDjLtPNHqUHwphYZ7vNZeOWGWDIziGx19gP4vBdiCHF/MCiP/UWbFoknh/i
	blTSWRptCBWJk7z8jJs1gxIJljlk=
X-Google-Smtp-Source: AGHT+IEjnw0tJc9UdPr6IJqBYIx7kpdEGy3PmCOgMXNokVl6z9lw/zArTEKFrql0wiqYP6S2cV4Pdu06JjQh1v2y2DE=
X-Received: by 2002:a17:906:ad99:b0:a43:ebbb:9e78 with SMTP id
 la25-20020a170906ad9900b00a43ebbb9e78mr339746ejb.55.1709143611218; Wed, 28
 Feb 2024 10:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20240227013221.21512-1-zhi.mao@mediatek.com> <20240227013221.21512-3-zhi.mao@mediatek.com>
 <CAHp75VciCJuoOwC8ozanWYqSCM=vWpiaqymJ2-gQfrSt5Ts6fQ@mail.gmail.com>
 <b4889fad324ec88eb3a22f51b0aa512cc93bd2cb.camel@mediatek.com>
 <CAHp75Vd=X9e4rOJabF4AbzGRZAF4BiNJa-C4ivOoQb7kAMy3vQ@mail.gmail.com>
 <Zd8g81wBXyfMvPhB@kekkonen.localdomain> <CAHp75VfXY=Hv_o_CYe8sNYoBa1vtYWuk4Sz1M91XUp0cf4HjnA@mail.gmail.com>
 <170914163823.252503.15921889437591940623@ping.linuxembedded.co.uk>
In-Reply-To: <170914163823.252503.15921889437591940623@ping.linuxembedded.co.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Feb 2024 20:06:14 +0200
Message-ID: <CAHp75Ve=gRhRMN-3JyEZ3EX3oU72buGhGTx6jukgwOzO=KRjNA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] media: i2c: Add GC08A3 image sensor driver
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, Jonathan Cameron <jic23@kernel.org>
Cc: sakari.ailus@linux.intel.com, =?UTF-8?B?WmhpIE1hbyDmr5vmmbo=?= <zhi.mao@mediatek.com>, 
	"heiko@sntech.de" <heiko@sntech.de>, 
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"yunkec@chromium.org" <yunkec@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>, 
	"gerald.loacker@wolfvision.net" <gerald.loacker@wolfvision.net>, 
	=?UTF-8?B?U2hlbmduYW4gV2FuZyDnjovlnKPnlLc=?= <shengnan.wang@mediatek.com>, 
	"hdegoede@redhat.com" <hdegoede@redhat.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?WWF5YSBDaGFuZyDlvLXpm4XmuIU=?= <Yaya.Chang@mediatek.com>, 
	"mchehab@kernel.org" <mchehab@kernel.org>, 
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>, 
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"10572168@qq.com" <10572168@qq.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"macromorgan@hotmail.com" <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_100654_000767_337500D3 
X-CRM114-Status: GOOD (  26.88  )
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

On Wed, Feb 28, 2024 at 7:34=E2=80=AFPM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Quoting Andy Shevchenko (2024-02-28 17:17:12)
> > On Wed, Feb 28, 2024 at 2:03=E2=80=AFPM sakari.ailus@linux.intel.com
> > <sakari.ailus@linux.intel.com> wrote:
> > > On Wed, Feb 28, 2024 at 11:22:13AM +0200, Andy Shevchenko wrote:
> > > > > Another, I also reviewed some other sensor driver code(such as
> > > > > gc0a08/gc2145 and imx/ov), they are all the same.
> > > >
> > > > They are also problematic. So what?
> > >
> > > The situation is the same in a large number of drivers, also outside =
the
> > > media tree. It's also not trivial to figure out which header should b=
e
> > > included and it tends to be that if it compiles without warnings,
> > > developers won't bother trying to figure out what should still be cha=
nged.
> >
> > I spent about 20 minutes reading the code. Yes, for inexperienced
> > developers it can take 3x longer, but still, much longer time was
> > spent on writing that code to begin with. So, the headers are a part
> > of the evolution of the code. And now it's pure technical debt with no
> > excuses to not fulfill.
> >
> > TL;DR: It's (rightfully) assumed that the developer *knows* their code.
> >
> > > I wonder if this could be automated by using the C preprocessor and a
> > > small Perl script. :-)
> >
> > There is a Google project coming from Clang people or so, but I have
> > no idea of the state of affairs.
>
> I've used iwyu (include-what-you-use) successfully on libcamera. But I
> don't know how this would translate to working on the kernel, with a
> more complex build system.

Jonathan tried that once. It needs to be heavily tweaked to be used in
the kernel project.

> But indeed, tooling already exists [0] to do these checks, and is package=
d
> in distros [1]
>
> [0] https://include-what-you-use.org/
> [1] https://manpages.ubuntu.com/manpages/focal/man1/iwyu_tool.1.html

--=20
With Best Regards,
Andy Shevchenko

