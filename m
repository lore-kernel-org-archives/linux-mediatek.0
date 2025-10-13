Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9628DCCD183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=; b=kYeJaa85DZI/XecH3Tm994aytr
	aK94gPEPsB/z4N91IpHL3HmcOFKBUTzsShsxYQNBcahKcuSU8RZ/eDh/Sk+KsbuHVxQiMqUZdSNfz
	mYxJUmmL3QjglnTg5oDU92mSP1RN7gvQPhg+hv9OHUHqPUy+YTrzmMsd4EubVv3OSJ74sakLzPzpX
	+XHDjxSucFnknaROhxmYyVz9D9zKXOELkyPonFaXxoG5D2hPn/RTKWMIcf9BZXs2Tiis2pc537e64
	8090O98fPOFlUIZ0uWaMepsug89whgvFNPOHVJZjV5eLH6ETwY8TZTGxjdT2We73mqwHwj8J/oLXu
	x9f5A9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LDg-0000000Dq6C-1PiF;
	Mon, 13 Oct 2025 16:16:20 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LDd-0000000Dq4j-3vds
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 16:16:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-afcb7ae31caso947248166b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760372176; x=1760976976; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=mIvWw3TsS+sd1c9gyUEmidQlrie78Csue78Nmloro9bLnCZQDniHLp6s+/RehjN5o0
         iOpfN2YlpD5L9PJ1Zo/0PuSALvPRIf/e52v4MvATRDShnEtRSdsFQsuMN9FcPgBnz+fa
         v5mzRzJMA95569WkWgl5tDE2CCa09EXNOQy2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760372176; x=1760976976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=CkE1JTCBFQ2bAmQvyMdrutw2b9fvid/G7d5SEg/q1Q/KHpVSIjsfuqMQHdkxi4HHNt
         P2lMKNr28W6LJGe8Wc0ZoqMSxB9U/o/9e1qXHt0oMPTxAQ+QuhTxKnb9iUwHDFqFP8p8
         tnsl9ksEC1XXIAnX8DbPUbrASIv5nurAp5Wc0bBzdKhwEY54VFP+swdQDEHeLozajghu
         Xe28iSpxIcfPL0IsqNoRL8rlAhs3LYcoI3hHb1DHADwNBWvs5TH6zUH0QBhg/R74T45/
         eahtzPmqcOHvArSVCScr3J4TRTCoUN+6SmQxpWz+hop7NobrRtyh42Ch3T2kaZU92G27
         Vhuw==
X-Forwarded-Encrypted: i=1; AJvYcCW9F2atzYQo+lovryji5Ompy2qazuVSD5EY4u/G43M9zA98v5Nj5SplI6iSA86cvDnWC/18XQp+SogOp8JX6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6uRj3wtI3O/5N2BpDO8ZMsEs72hn9BX6q2WDBcu9007BPJu3W
	ZKiMqqjHpfP3pVoBfpEJIKFr9JePmsNNcxvZiH11PQYj9kPslvx3jR98JHUyi/REU3N5FveyyNI
	7WSBpm/QK
X-Gm-Gg: ASbGncvvBJDRF3GJo4MdOUY2ehavygIbEvfbtHu5TwK8vlu4V1ZhAtW9aENZ6IGQeuK
	kojcKjm0NEjHQKScItjqljzH6fhppps5bfDZgeiAhI4KleFqm4GoZAVzdfkFaCDAABSjyQBfeyf
	CGvOBeXbna7B7Jejzdia8lTGE/39gE+3QYOWXPieJ+vWIeGP0nsN+7t4dI1sXKnaFpdp7BMGksR
	ruwi5V5qGuRHhDLRk9dn5NDWXi48AcZnhKOrSog3QwrT6M7RRNPacd9aqWIbqJutk+Qt/yQl+oV
	j+9YkTmubEF9JBAv+sCMwD8Xsg00f8Gwr8vZg5I4JD2xUFep/gjAdIKm3lCKpS60RlRL54JpI5W
	gvoD0VymF5Pp9O5biFbTjT+UdTkSKnGt6RGtFgo4Q+gNbpewu29DCyTSHZEjkbEmaP4F0m805MD
	+LPPNdAcvHLbpeB8JbCFvP3fPd
X-Google-Smtp-Source: AGHT+IGG4ojP8Ay1Jfsa2S524llo7wg3ElsGchO0LG9+7boVH60zGQzpixjhjF+spxEm6FnG8R8bBg==
X-Received: by 2002:a17:906:eec7:b0:b46:8bad:6960 with SMTP id a640c23a62f3a-b50abfd69e0mr2424883266b.31.1760372176005;
        Mon, 13 Oct 2025 09:16:16 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d65d6d74sm957769666b.29.2025.10.13.09.16.15
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 09:16:15 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63bad3cd668so1794584a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 09:16:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdlGTdh1lANpXVU5nUSKi2+rnB0b7ZBrvMqDJx+QyzOFTW6dukFsYLMqvsHUAUCNbbYJyoqQuVRensBmP0+Q==@lists.infradead.org
X-Received: by 2002:a05:6512:1095:b0:58b:75:8fbc with SMTP id
 2adb3069b0e04-5906dd8ef00mr6030162e87.50.1760370658194; Mon, 13 Oct 2025
 08:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org> <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
In-Reply-To: <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:50:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
X-Gm-Features: AS18NWAjEedfD0tRDHHy9p2HIYCpNxcTQpn_Xf2f0oNW4TLvTJ881tcLSkxWDmQ
Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
Subject: Re: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_091617_992971_60F8EC15 
X-CRM114-Status: GOOD (  21.32  )
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

Hi Frank

On Mon, 13 Oct 2025 at 17:36, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Oct 13, 2025 at 02:14:41PM +0000, Ricardo Ribalda wrote:
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR()
> >
> > This patch fixes this cocci report:
> > ./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/input/touchscreen/cyttsp5.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Suppose it will go though input subsystem intead of media.
> Need post seperated at difference thread?

Indeed, it belongs to input. if there is a v2 I will move it to a
different thread.

Thanks!

>
> Frank
>
> >
> > diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> > index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
> > --- a/drivers/input/touchscreen/cyttsp5.c
> > +++ b/drivers/input/touchscreen/cyttsp5.c
> > @@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
> >
> >       regmap = devm_regmap_init_i2c(client, &config);
> >       if (IS_ERR(regmap)) {
> > -             dev_err(&client->dev, "regmap allocation failed: %ld\n",
> > -                     PTR_ERR(regmap));
> > +             dev_err(&client->dev, "regmap allocation failed: %pe\n",
> > +                     regmap);
> >               return PTR_ERR(regmap);
> >       }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda

