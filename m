Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF2C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=; b=Jt8E3CDuc6u7RyO9v9p1AZfCuG
	RSEqrNpco2tUTDHvyW9msQxhGjNXX6WoyIluRyI0sCGA86OqTQnVVvk1AxBgKsg+2zdeL2UXgiUYG
	Z1vqjXOXxsB+d6lsLlvWCQZM7V8IEkRi7HeQCf7Zn5OzdWPsjVPl4Oa4M87AsH2KGHeGX9a7bu0+N
	wWgBKsIKalS0yFntymwQMeMbZAEKYafWiX1jg1rqINS3BUppXfpTNCnEqd9XKxtF4H6dKj9CPankG
	PeQu8VGF4pSUuJsCSFuYgyYmPUiQ1fyCAOQNPoU5JKGG8k+pG3QtTAjWkV5Ebgk6dkHbyebuz2Ct0
	Hm79//9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Tzp-00Ex4l-KZ; Wed, 15 Jun 2022 14:27:49 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Tzm-00Ex2u-IK
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 14:27:47 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id u99so20783490ybi.11
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=M0lG3b8vfMcZ/7Ka36O1ZxSsUemkOvvlFAQXkpVQ4QpCs+1BTt67QSw4HKiQD5WOcb
         52snuFlKH/21oU1OKHImIEHhsr/qfhoQOlanFV+m4TeEl8ICjJe2Sd491tUIQIDSw5Bq
         xHExXe7XqUhLlIhXKD4i9kKCqB5PLrMMw5aIrSuv673UinrPE2m5a9fMdvB5OZ6CYFIq
         /u1FbiRcfzMPM33M1qWbZlUZBeX0dAiMnD8nksss+jrH8U5wAD3bdbqxbououS4Wce5+
         si5vaEILsaJTJRlA5Tvc5IU5RHPyGLfiWb4X0xjPRiEJMgOmZeod+1F/8J2LCdxK/urt
         bp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=x3O3c9yZ+WyeNB7QLe1647xj36IYAayyO5gnZX1mTCvyyl6Q8SOUA+q8gjm3tNTv8M
         kbd8eUx4xPzNWwmJ5IYx8GXix+M73dMv1sh5PrTFrMbOFsWRot3tWCRZZn3swMcW/KNi
         i7EbZu+2MR4I1apCbYSZhbj2XdgbJm/mlLrgA2hxSpdX1TPmvCZssdTZAzpAM+tJ1HYw
         MCHFONJ9HmIbPgE4lBlFXKv+kUWJOXKwb/hTkE/To1f+0mL9gnol6lfEfdBVc2XgJfA8
         2vRi8JhX3DVQBniLd6Vwi0CvXcp4QVyeTF1muq1mme8kyZyiQIjr2vSg0XCnjqi35lGh
         lxLw==
X-Gm-Message-State: AJIora9Ij6kh5q1iRO+zeF39yWI5Pm2Xerv62j3UTZbNeRHwx7/fgts7
	P5ssRAAt/oQ0hkPUNPlogbnfpWszu5MKzH+9JkvWQQ==
X-Google-Smtp-Source: AGRyM1t0twq2NH5TwVMffJ95BCvjUqTPe1/bY9PSUuCjeVYRJKVWPPGecH5Bnr87yp5uioRcTcWI/9qkOUV49rzlV5c=
X-Received: by 2002:a25:8387:0:b0:664:7589:27b9 with SMTP id
 t7-20020a258387000000b00664758927b9mr86691ybk.291.1655303263361; Wed, 15 Jun
 2022 07:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-30-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-30-nuno.sa@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jun 2022 16:27:32 +0200
Message-ID: <CACRpkdYtBY9bWevrWNL+mXz8LbsdDEFmGvrmPQ85Mn=yZ=FyHg@mail.gmail.com>
Subject: Re: [PATCH 29/34] iio: adc: qcom-pm8xxx-xoadc: convert to device properties
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: linux-imx@nxp.com, linux-renesas-soc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Cai Huoqing <cai.huoqing@linux.dev>, 
	Benjamin Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Amit Kucheria <amitk@kernel.org>, Andy Gross <agross@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Benson Leung <bleung@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Christophe Branchereau <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Jonathan Cameron <jic23@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_072746_650287_BB876643 
X-CRM114-Status: UNSURE (   9.54  )
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

On Fri, Jun 10, 2022 at 10:49 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> Make the conversion to firmware agnostic device properties. As part of
> the conversion the IIO inkern interface 'of_xlate()' is also converted to
> 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> dependencies from IIO.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

