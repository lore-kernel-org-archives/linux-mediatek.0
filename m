Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481C2C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3cWuiVsBA+DxTai60AWhDn/fRpeEo8zydPZYQwQBPs=; b=pxTBjHlbBc33Qleg7h4ZobMasZ
	mD61NaOIg31zaJv3+xVtXyWCjtvZjwcjSg5XP7WHTAopWTNW7iIbfaHgDh9DtcTW1JZ5ShSIOFwYS
	Dj9j2fXatNtgpxTTe3/42CXcFhKlc4qQjliKs5WhlsfSOYlGFskGSB2QKI//78N9z8n6o/DWplDUz
	CjK2imU1qVLR/KuD3fI+e3MYnQ9LhPOwIOSFfrdKGDlir6s9AFLX2t9qRiFOSLMeuW1JhxoSingtl
	+4g90cnkkCzMuDpUgDCPYmvrhAcOg3kEUDfwZ4ggM63TSxxPqThTqsVIU4H8KTxt9M6sKMnrtmApG
	RvS3bn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4dcQ-000ysJ-Me; Fri, 24 Jun 2022 07:20:42 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4dcN-000yqP-NI; Fri, 24 Jun 2022 07:20:40 +0000
Received: by mail-io1-xd2a.google.com with SMTP id z7so1823583ioe.11;
        Fri, 24 Jun 2022 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T3cWuiVsBA+DxTai60AWhDn/fRpeEo8zydPZYQwQBPs=;
        b=INkRDWkgz7QnDYd6PfjGcOd+HtbGBuFAFVtHSry5oK+uSexxmKolSWc9+ahE6Bsyiy
         zARECUtXVj9Yxu3ivS1I4Ikbz9sEucWs/6ZUfMDlGUc1ip2twYgPIYULdbUypI86mIzl
         mgKyYU2J5DhoBlb4HK7R3TEsu+SHK4XuGA+Sy+iylrc+8UWz0NCSlrofWvh89/4vykAo
         bPzchCxSebnIj7stqgMYl19bvM4RMlQ20oNFDZeXuyIbbF87V3BWpZnr0GOf16WkU7KM
         cHqCSrIR2+2R/9pWLaP9povhX5tYXh1/3O3+jKfQ8vWGEl2U54uG0vtizyP5hjPfZERr
         EwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T3cWuiVsBA+DxTai60AWhDn/fRpeEo8zydPZYQwQBPs=;
        b=jF9LuDviu9yc7c2vsNMbtvClFBE38CveZB+j3gUgHESVsFY2l5m9Rco9DDYMd9tFcX
         nSF8+oYZ8Wujt71y9KdJpDmPSsf47cr7Y7r+5zfLeIenSCxngAqPW9e9F3e0it0TbMsT
         zil2skKMJ+ZEHbfBV8FVI9kieou4Yd9NnYg6Ph/NYjvLYv4guGrSQiHpfglXPk9tvaEv
         ayNyhOBov5GKI+szXc5lfFAwP9crd9vHqM4PG4y9Bn259h9TgZl5i99hwEhwbhDaKooY
         iBYZz1xf9RmrPE/RA0vdjbzAXN7VyiIrzPZZgQ4SWUwSrhNgh7PE654xhXkZo0A1cCIS
         zwCw==
X-Gm-Message-State: AJIora/pi/QLETxDFiHo1WPOPP4U1+8XdSQMNGSi7sUYWNrbLgJJNDEo
	5qO+EXqxRbwcV4Z3fqnQe+kpKFIAC5DvQts5jg0=
X-Google-Smtp-Source: AGRyM1v7K77xAmtUTEcEzoILdxRbEp2wv1joH1sI9ISqx+ur3eoSMLzrP7D8toJkzHB0bsYtmy7vVz+n8Z+nifA3RX0=
X-Received: by 2002:a05:6638:430e:b0:332:586:5182 with SMTP id
 bt14-20020a056638430e00b0033205865182mr7357424jab.225.1656055236048; Fri, 24
 Jun 2022 00:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-13-peterwu.pub@gmail.com>
 <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com> <CACRpkdbzZqerE_2PeGMUWRbtjK=9P8V763cj83ZqjP4n6AVHAg@mail.gmail.com>
In-Reply-To: <CACRpkdbzZqerE_2PeGMUWRbtjK=9P8V763cj83ZqjP4n6AVHAg@mail.gmail.com>
From: szuni chen <szunichen@gmail.com>
Date: Fri, 24 Jun 2022 15:20:24 +0800
Message-ID: <CA+hk2fZEG0TxMGhGJY21w=MmXgKsH5mYCYynQV1jbhpOCyf3qg@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] leds: mt6370: Add Mediatek MT6370 current sink
 type LED Indicator support
To: Linus Walleij <linus.walleij@linaro.org>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	devicetree <devicetree@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, alice_chen@richtek.com, 
	Linux PM <linux-pm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	ChiYuan Huang <cy_huang@richtek.com>, chiaen_wu@richtek.com, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_002039_824328_7F2B4FF6 
X-CRM114-Status: GOOD (  18.51  )
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

Hi Linus,

Thank you for the comment.

Linus Walleij <linus.walleij@linaro.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=882=
4=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:25=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On Fri, Jun 24, 2022 at 8:23 AM Linus Walleij <linus.walleij@linaro.org> =
wrote:
> > Thanks for your patch!
> >
> > On Thu, Jun 23, 2022 at 1:58 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote=
:
> >
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Add Mediatek MT6370 current sink type LED Indicator driver.
> > >
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > (...)
> > >  drivers/leds/Kconfig       |  11 +
> > >  drivers/leds/Makefile      |   1 +
> > >  drivers/leds/leds-mt6370.c | 989 +++++++++++++++++++++++++++++++++++=
++++++++++
> >
> > There is a drivers/leds/flash subdirectory these days, put the driver
> > in that directory instead.
>
> Sorry I'm commenting on the wrong patch.
>
> I meant this one. Move that into drivers/leds/flash
>  drivers/leds/flash/leds-mt6370-flash.c             |  657 ++++++++++++

In next version, I'll use "leds: flash: ......" instead of "leds:
flashlight: ......" in subject.
May I confirm that the driver has already in the drivers/leds/flash,
so I don=E2=80=99t have to move it in next version?


Sincerely,
Alice Chen

