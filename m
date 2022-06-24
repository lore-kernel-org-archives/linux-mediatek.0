Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11E5CCA473
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 21:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGTylEOWtLkcLIsxYVoGzfL+q0nSap9+8NoSlXBuXe4=; b=galAVWC1ZmQ8AGqoOxllIXdiog
	gbfWMipecVSSP88BfjnJpYbq7qeELhNgfuQTSayyHfN1UvAUqGDa5nppElohUUKNjmF7aalWtRCKe
	kpLZuvUHaDmRzkDzApmZN9U6tuY1Lzi20Hqm1vRsW/GtvHtAw0c/mbEouquQVwT2H6l6IfN32hIHb
	R3m4wxCX6/5g/+yP/OiZ3SLmCf1eqwjey6XNuG4Jk1RklHpwBXAs4gnmmHw8HyiYueMYDsUl8//JR
	c29rovl1lMkgzveapVOkTcRG8Mb8AHOJVu8slgR7Tlbp5tEFdn35Dgk5n0VqIPUMglc//LHYa5pbO
	aduLsj2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4qyd-003sPO-3O; Fri, 24 Jun 2022 21:36:31 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4qyR-003sLk-EG
	for linux-mediatek@lists.infradead.org; Fri, 24 Jun 2022 21:36:20 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3176b6ed923so36404517b3.11
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jun 2022 14:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cGTylEOWtLkcLIsxYVoGzfL+q0nSap9+8NoSlXBuXe4=;
        b=cmDy8lsyV2rPNiNRuYkEb5rHWD8XZVHKqJZAeKf3TnWZFLlj+/DTdLUMbXEmtTuv9s
         4KLbNJHfJqFtWZDtoSIB0jA5BkjqsNets6Rbr/qrINRnJTlQirI2k20GLR/Ql3zSe9Wq
         Pb5aXUq1NZ5lDKQQMD7a39HTujZM62LjFsQtIqhJoX7pGAoQGMqpg1+inV2FswApITO2
         CmT3BH618Yqgt62CZsqxQ5e1jZosKUxMbd0fExcTgjLrAxPBxkG7CVcmjw/O8dvTmdbG
         l6UouC6UHf0T16KEM/mMUtmMtJOh0vyJl540PkTEmkGnFr3Ic8OHzXavkS9AsevSsxDH
         c7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cGTylEOWtLkcLIsxYVoGzfL+q0nSap9+8NoSlXBuXe4=;
        b=MSn2nOOzGHqw9X7VUfv03muuZGgz39NWLe+wRmyemfuDcY93dAbg4jUqQ30IB1w/9g
         XvVz6aUBRgOfN2suk50+TaCSzV/Id3+X0Gux08RqxF6cs2OgrNxVtMdVvKCBGZ7BQ8CB
         f+4yodMIRC4FNPDR6IQnLO/4+epTLP1abL9q29oBSoIrhx/Juo5P7JE9ih2ZTSunj/24
         3wEqh8VVD0ae4PyRy1qzL3ROgzGOyMwW8W7S5Vob171ggF7uCDMYt80+2waine3HPasL
         frm+3SvTpadZy6IBbYH4tRDeEjblyFtc1U5LaIkfndmmLZj6NpYEJFUCy4wl2V5Ps4Pz
         sZww==
X-Gm-Message-State: AJIora9HdZsFeMc7OzcURcZUGEBU09NjDuaPFzzD5En08nXkXOMopJIS
	sJfEKt2vTa5tM/VH9rtI1YdnhjZPSgkt5F2mQOG1wQ==
X-Google-Smtp-Source: AGRyM1v7bTPADut4sgzebmriq1YeKB4PBfCCubvcMefuaUSK78eOKMtZqJdaXmsewcrgPAHhOp3HhKhV310/qVQEQyc=
X-Received: by 2002:a0d:cc54:0:b0:317:752c:bcf3 with SMTP id
 o81-20020a0dcc54000000b00317752cbcf3mr1068283ywd.437.1656106577632; Fri, 24
 Jun 2022 14:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-13-peterwu.pub@gmail.com>
 <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com>
 <CACRpkdbzZqerE_2PeGMUWRbtjK=9P8V763cj83ZqjP4n6AVHAg@mail.gmail.com> <CA+hk2fZEG0TxMGhGJY21w=MmXgKsH5mYCYynQV1jbhpOCyf3qg@mail.gmail.com>
In-Reply-To: <CA+hk2fZEG0TxMGhGJY21w=MmXgKsH5mYCYynQV1jbhpOCyf3qg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Jun 2022 23:36:06 +0200
Message-ID: <CACRpkdYoR9SGQdxJQmUReP7SLk_BxG0yuTWAL__o90PuO8sCqA@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] leds: mt6370: Add Mediatek MT6370 current sink
 type LED Indicator support
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
X-CRM114-CacheID: sfid-20220624_143619_503731_C0095580 
X-CRM114-Status: GOOD (  11.78  )
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

On Fri, Jun 24, 2022 at 9:20 AM szuni chen <szunichen@gmail.com> wrote:

> > I meant this one. Move that into drivers/leds/flash
> >  drivers/leds/flash/leds-mt6370-flash.c             |  657 ++++++++++++
>
> In next version, I'll use "leds: flash: ......" instead of "leds:
> flashlight: ......" in subject.
> May I confirm that the driver has already in the drivers/leds/flash,
> so I don=E2=80=99t have to move it in next version?

Yeah you're right, I am just writing wrong comments today, it is already
correct. Sorry!

Yours,
Linus Walleij

