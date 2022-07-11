Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4D9C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 13:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECHKwgZspv8UJP39cVbtbsQnGobQ6/Wz0Usn92hQ97A=; b=BAIvSPVby2P5okrCma0Bw3dhqp
	dIsEGkkfiYOY2+ezFJwIU0th9pi+8/+YpFsFKpt0LiGadkA7DIKhhtmOipH6oRagRweIci4RrWQRN
	xHnJxlt+xtCOboquldUqJODhzjW072EhoCqAvz04ZsRENJrIZDu4joB9PSXdYArRBEiy86GlKsSbK
	D74LTseHzx7kZF9HW/TZoePnVxCpdFfidIBsNhSmMp1YwUlhGY0VlbELkpCLGCDdNoQv/MwMTTauz
	Bflo3XMMVzeZIXNt8Xx2D/SrU0/dEj7r3/clJjkjZo9MBNQG5/ynwaSngfBknuQp6AsbVUFknL7d9
	BTMqeWVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAtHC-001qP5-Iv; Mon, 11 Jul 2022 13:16:38 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAtH7-001qLS-BP; Mon, 11 Jul 2022 13:16:36 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-31cac89d8d6so48531917b3.2;
        Mon, 11 Jul 2022 06:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ECHKwgZspv8UJP39cVbtbsQnGobQ6/Wz0Usn92hQ97A=;
        b=ZCLmgeg2tag0WI6PMv2dX5P6iXXKcdTl5Rjn3td1aaWFfg1rfbsiHVRsa4MA7RVDPi
         yZda18xMSj7gVReNgpkVS3IYfW2y4Yq9wBa4dHtxiS4ukAsi/+lbDWOqaRNhryL27qRN
         M8fdWOoG7e31my6wi3XYydpQ2QFFja+qmUq57YGYfq84IG56VWa8Y58yfZEvxGNmkdeS
         ROcmY65fp6mPo55MlG8kVk6cUjR/y+GmDOpFEWJ/AXDhnsAinq1CBLWopeF8ovwQO9wL
         pbNewu1TdO3bS8ZUkDr6fOjwRalFcjVymsMPQXeHZi+UiTUoMir4hJJt3YfEmkDseAno
         V+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ECHKwgZspv8UJP39cVbtbsQnGobQ6/Wz0Usn92hQ97A=;
        b=0f2aNw2g9Uf5gyoLSnzQsNENgTcdnkOAZ//kRGk6+toJROpAjHRugfP8xZvY23yOr1
         V7/NtWCfhhKEVQwVilIwdakCO9KQLNbu/0vjT7kp4oBaCdfvvQJGzPlwLSZrijwghhLX
         13hsbDkRYJHZJPeanwlk8vOelJy1p4sC021pCwzXVolFHNUgmBU7Ek6LwxQPSfM2Hm42
         UWGG7v+CVpHuEeKmgTBYQDc+4dfofAJ3mWyiYYFY89rmObV1FiaqX7THpPwN8FaaWDRi
         pglNP2kdo0nLqVh49ni7r1WoSBLVtnui5KUcMOo5j1JtAsMps9/gXbS/2agVeNQ7RTTI
         RzCA==
X-Gm-Message-State: AJIora/KJlJth5T4xu6N8G7Ht6oPDo7f9DZSWEnMdOp302AjIzo2tr6E
	CI7jXvMLWsoGeVDjOu/OC08Y/hKyK06LG8e+M7s=
X-Google-Smtp-Source: AGRyM1s4R+hHsfAdGALiyefnWI51ka7x2bN1wgGP0eXwiLSnuO4ulGqtLU/InSVBkkY/IMtwOpEFg5YKLeC9E1Jy29w=
X-Received: by 2002:a81:108f:0:b0:31c:d7ae:9ff1 with SMTP id
 137-20020a81108f000000b0031cd7ae9ff1mr18792069ywq.18.1657545391770; Mon, 11
 Jul 2022 06:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220711123835.811358-1-nuno.sa@analog.com> <20220711123835.811358-16-nuno.sa@analog.com>
In-Reply-To: <20220711123835.811358-16-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Jul 2022 15:15:55 +0200
Message-ID: <CAHp75VcnuAtc+n+nhQ16yP9S-veX2c6ruquSewtPJdcqQwpyAQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] iio: inkern: fix coding style warnings
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
X-CRM114-CacheID: sfid-20220711_061633_415319_9A0C7395 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 11, 2022 at 2:40 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> Just cosmetics. No functional change intended...

...

> -       if (name =3D=3D NULL && channel_name =3D=3D NULL)
> +       if (!name && !channel_name)
>                 return ERR_PTR(-ENODEV);

After this change in place, I think it's better to convert it to

  if (!(name || channel_name))

which shows intentions clearer.

--=20
With Best Regards,
Andy Shevchenko

