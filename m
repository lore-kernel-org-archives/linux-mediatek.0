Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E588AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 13:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZOXSRSmgwM/8CfCPUrZ7l+OIh1asVluDdyFXnWqD8E=; b=PmGeB47Q23nXXuLGNG0D/Cq7+9
	qERVUfoZRmIasaxgauXl3+aVUHITKP+hpuzoVCmbUGIkL3AEqxmtEd97kri1bLHb28w02S3SDKBzr
	vo/vN6PRtxGOiFC4Fh3/a69Dsamawm6eavfL3Ob5K5w9b4am8bgsUFNUpDwhN0YVf4Vw63cr4IEQk
	IbyFZ8kuzccsq/rMZnkjuZDav2+Y5OfLmF/X53k6uGn41nklDjndMi/H0BIzjulUY3wwRgxMP3Wc7
	KP1/sQmZRgsi+mGC3lqbLFZ9YwFErbdXPWXrOSPdEu0chsVKl0MhGpKo4XkIFhOgbkp7DNC0tcl7x
	3UdQRVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAtBE-001oCG-Nn; Mon, 11 Jul 2022 13:10:28 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAtB4-001o76-9W; Mon, 11 Jul 2022 13:10:26 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-31cf1adbf92so48269047b3.4;
        Mon, 11 Jul 2022 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0ZOXSRSmgwM/8CfCPUrZ7l+OIh1asVluDdyFXnWqD8E=;
        b=dJra3IJxOrzyO+7mkYfwJM+xkVjzbjwnshtKynJEY1d9HigyxWdhK/P3oXcEKtAwf2
         n0DGV/ppHdqO8+FJPsHVKM2viLcDrzrD/8N47vVpcxI8crZMoTcyG7GabZh66TgDQt5K
         vR/OejvhThCm/ej8J+wkLbdDy4W/ha21NgDgri/u9j0L83H7+q9NKgUOANZtb3iQeb5m
         p5azi6yuxgVK5tVtUrkEqXMghbb7Ofd2Wahz6HtCDfF99Vp1EADGzIX2hVaA1X+UFnUO
         Wv0TU96HYsKm2m1KnTL59Uo73M2HzpiYTf5Uqn3AdcZn42/FTSzvlq1rPQklocqPCM7c
         omEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0ZOXSRSmgwM/8CfCPUrZ7l+OIh1asVluDdyFXnWqD8E=;
        b=H0/gKXneHvTegFVgVM1Ohool+Xzab8KsGkXML/KCEYdYER+6rvXT0+pJ1G/nHebQAj
         wKo1UbFBc9uUfrsrmFAk902UqtMp1x8F+rmHDzZjFisADp2Qj2Zs4dgUH5AS8Onmt2BD
         2nQI35t5gJ4YcbxsYpAxkKZ+jDKWM9ATmZ/+3tbJ21VIb+qPPFAmErWbRcxGsRU2xu5I
         a8hxHc+sbJ1hdnUgvr3tfbLGOGmIioocTSbYXClnyIkbHSZDRy/BYX9lIFH7GX7u92fD
         XnYv5kOH4oh+z+qDjjSygYD5E3NF7k8TZq82SOch6C75x1xY8T06juC7zzPvM5nHry4C
         z3xw==
X-Gm-Message-State: AJIora+2yRQaOUsFBO3LX1mz8X3Cuy+EAxbLoGu8Obb40tCNz6d1tfM/
	hqaOtP04RooVMdQxQ9THcZ3da6R+jlld7KazlGM=
X-Google-Smtp-Source: AGRyM1u1pNjRlMbjWdZEYceQFq+a842D/zBdsYQozhXo4zH7jPGpQ6tqGeQop8qO1ntORr3Ei1MkK2BI3EBjQhr2i6c=
X-Received: by 2002:a81:4bd7:0:b0:31c:91da:5a20 with SMTP id
 y206-20020a814bd7000000b0031c91da5a20mr20757632ywa.131.1657545016097; Mon, 11
 Jul 2022 06:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220711123835.811358-1-nuno.sa@analog.com> <20220711123835.811358-2-nuno.sa@analog.com>
In-Reply-To: <20220711123835.811358-2-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Jul 2022 15:09:39 +0200
Message-ID: <CAHp75VfUNNAEDuxMfYeg=ZkD-nrUcnc13g+zGBLufayavm-QUw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] iio: inkern: only release the device node when
 done with it
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-iio <linux-iio@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Benson Leung <bleung@chromium.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Zhang Rui <rui.zhang@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Eugen Hristev <eugen.hristev@microchip.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Benjamin Fair <benjaminfair@google.com>, 
	Nancy Yuen <yuenn@google.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Jishnu Prakash <quic_jprakash@quicinc.com>, Christophe Branchereau <cbranchereau@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Fabio Estevam <festevam@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Shawn Guo <shawnguo@kernel.org>, Haibo Chen <haibo.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Patrick Venture <venture@google.com>, 
	Amit Kucheria <amitk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Gwendal Grignou <gwendal@chromium.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Saravanan Sekar <sravanhome@gmail.com>, 
	Guenter Roeck <groeck@chromium.org>, Jonathan Cameron <jic23@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_061018_375939_935434D5 
X-CRM114-Status: GOOD (  13.00  )
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

On Mon, Jul 11, 2022 at 2:38 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> 'of_node_put()' can potentially release the memory pointed to by
> 'iiospec.np' which would leave us with an invalid pointer (and we would
> still pass it in 'of_xlate()'). Note that it is not guaranteed for the
> of_node lifespan to be attached to the device (to which is attached)
> lifespan so that there is (even though very unlikely) the possibility
> for the node to freed while the device is still around. Thus, as there

be freed

> are indeed some of_xlate users which do access the node, a possible race
> is indeed possible.

possible ... possible.

(I would drop the first one)

> As such, we can only release the node after we are done with it.

--=20
With Best Regards,
Andy Shevchenko

