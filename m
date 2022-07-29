Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36542C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 10:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zk6yHET57f/wYXBe4yiexZ1AAMItVqOz1Jv1kut5E8E=; b=sTXrqIcJvMLZ60rPmdfCxK2BEF
	PiGX8OhObNN9QXf6o8VGqjIwzZ/w4AOaxTCs1aY/K8jvp4CLRE/8iV6BM6DdE565z3r43uIjBcZkX
	5lPEJNhvb4rOAxdNODsic9KxHjKC8CEjITV4qX7hs7MI/ijfV9eYnN6x4ZOgrdaIShFs10fmfdtI7
	C/qvHCGXZud9z5LZuoZyraIS6fl1DxaefZ5TNBWaok81pv35h9we/9rJxw/zXe8zx/io1EshOVwGh
	jJZ5JjzSQ3G0veHTsF3Q6aP3PqqP2Yaon1Hzb48mhuQ/47u6iy0sCDLonsaNiWVtT/Wkv12XXyrHl
	s9kAPxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNKk-0047He-Fl; Fri, 29 Jul 2022 10:35:06 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNKZ-0047DA-3U; Fri, 29 Jul 2022 10:34:56 +0000
Received: by mail-ed1-x534.google.com with SMTP id z15so5290380edc.7;
        Fri, 29 Jul 2022 03:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=Zk6yHET57f/wYXBe4yiexZ1AAMItVqOz1Jv1kut5E8E=;
        b=IsM5N0dJ2jSYwlQl9rbwt+OLNPEKaCRVIniuh9/fK2UA5cEWqol8qEt2eY1KAFImh0
         xgKtFlDvRwmal8EgGb4Op+XBno/E/HH8Bxy8BPnkUU2nIxz44g1exMkT0mBgnzczAkOM
         jEEdvopg/k2e5S3/4OLDkdml7fNMgGZXJmK2pxORFJYNKUIs9dcrZpTPKP/PyTRRiDnU
         4AbNyblEPeQVwrctPIK+zUGSC8WmuyEHQXK0TllYSTMZqHtKbYQ+rO3pNAksc0uoqvC9
         H7uLLtXO9go/uW0Ye5nZLjgde4OuJHwsb257PiiTAEQZboCcDlee7NJuUdg+WQoQdZGF
         8sKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=Zk6yHET57f/wYXBe4yiexZ1AAMItVqOz1Jv1kut5E8E=;
        b=px8XQ7Fqr0pRy4MdPn3InEsd3aMNoZmsws5A9L+pMrNlk5hbcsoWDjHo+H8vpYPgS2
         EWSpRSNlPcyNxc5mui43TDuvEHbvuQ4XGrbnJ0ez0jFWpw8KZWiUmCMMz0CHb1Ba04kr
         1DkAJCN0AGKDm6Y/tzctp4cWdP/TyTPeZ0447U3E8XcR7pylyX/cHA6v03Q6RFG7/32p
         FuF24m+FMi5q7kTd0HSRJgVl4fGC0/hLGb8fAttilxLUlZHpM4jgUg3Q+vQAXcvOYq0w
         wnF7pxpt6YWxmViEHWryj4EKe5QTSKTtuB4MZIUrAabefgmy/AfX/7tD0eFUfH7mi0ix
         fkrw==
X-Gm-Message-State: AJIora9RpR6BZtdpAEAfLJq3v1xxqervwzlh97CxrdbaSDZtodIfO4wc
	MJ65zM3sK1kvUNtYFe2y+D7PfW+Gqj/x6HzJdTo=
X-Google-Smtp-Source: AGRyM1thJcc6VzDaeaE+EySViKuCRpu348iS7jC1QI3PpaFzkcmRpNMn9JsAnkR2MfsFuw188nD7QnVuUJohoFdGXiU=
X-Received: by 2002:a05:6402:501d:b0:437:e000:a898 with SMTP id
 p29-20020a056402501d00b00437e000a898mr2923947eda.265.1659090892398; Fri, 29
 Jul 2022 03:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-13-peterwu.pub@gmail.com>
 <CAHp75Vf85_uzA9fRxTizbPJxODcXFpM4wuU6DxP2j9UA47B_2g@mail.gmail.com> <CA+hk2fYcw0szJ7bBvfEjtyUE_Z61_A1vFWmPSdhe-gmd5jbC6g@mail.gmail.com>
In-Reply-To: <CA+hk2fYcw0szJ7bBvfEjtyUE_Z61_A1vFWmPSdhe-gmd5jbC6g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 29 Jul 2022 12:34:14 +0200
Message-ID: <CAHp75VctFBkPYumu-4+iGNATt=zE7HJ3n0kRSdDduJZ=h6FDEQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: szuni chen <szunichen@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	cy_huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_033455_165428_D6A065F9 
X-CRM114-Status: GOOD (  13.64  )
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

On Fri, Jul 29, 2022 at 8:17 AM szuni chen <szunichen@gmail.com> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=
=9C=8825=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:51=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrot=
e:
> > >
> > > From: Alice Chen <alice_chen@richtek.com>

...

> > > Signed-off-by: Alice Chen <alice_chen@richtek.com>
> >
> > This SoB chain is wrong. Prioritize and read Submitting Patches!
>
> After reading the Submitted Patches,
> ChiaEn Wu wasn't involved in the development but he submitted the patch,
> So, ChiaEn Wu <chiaen_wu@richtek.com> should be the last SoB, right?

Right. Submitter's SoB is the last SoB in the chain.

> I will revise SoB to
>
> Signed-off-by: SzuNi Chen <alice_chen@richtek.com>

Not sure I understand the SzuNi <--> Alice transformation...

> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
>
> If there is anything else I need to fix, please let me know. Thank you.

--=20
With Best Regards,
Andy Shevchenko

