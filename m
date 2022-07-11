Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65DCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 14:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIAFLfCCstVMeweX2Ab1siE9p1+/OUf9lkXY0wvZIus=; b=2Hh586vIdECVG9fZ+2zxoEj970
	0CcHJYYsawGuKn2YaHNU21atSs3AyJ2TU1ebgIpj8UIPqNESDNC2Dp+uSbPphdMIRv7DP5ELwmI4O
	cc4SePVMDbsvJQuY0+Da1+jaVOU1G2L7HYXljBs+t8oOkDHuLd8I5rVkxBEvGXzCAqmRfJI7pj9KB
	qiNV5ejbkPdj4fQngw30jV0NVbP7/pXkwU37JKrO1LZx8Cn5HdtEstC4J4WDKO2R4NiECL/J+tBFI
	r6URmB1oQSHvxLfkLZmbMtmdYwc12bAuUVgUJU1oJbixZUkmmA6t5A1du9mlWikLZQN9PIOqoVyuw
	KQp+2mjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAu1a-0028tU-IH; Mon, 11 Jul 2022 14:04:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAu1X-0028sN-Fw; Mon, 11 Jul 2022 14:04:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id f2so7154208wrr.6;
        Mon, 11 Jul 2022 07:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=DIAFLfCCstVMeweX2Ab1siE9p1+/OUf9lkXY0wvZIus=;
        b=doyN/EGzYQwmb31Qvui4RHoImYKN2mpxrS770rB7oqfTCwtKecAYk7XK5nHAyciB9j
         nA1APLtNitFKoReEa8OSAA36uhyQeBRn5HCTYGjxKPKrruw1/RVlPVlVw2Rtyl8Tdr+h
         cQ/iXqqjSrnqPkrGbEyq3ZoVd8/03nR/nA1cD5qcH6XmGBErXPoWjWp43sDJpzR39FEp
         W0mUeX/ZlJd79U4JcII4j+dn4hWjMQHfmlsXLW5buyknCb71XUrhQGs078ea/zqNArwN
         ThisRukKDtbypj9of180SnLkYj6JucCgS0In0PztOFDgkKr/2YAXJEs11HdAV+LN89U2
         Q8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=DIAFLfCCstVMeweX2Ab1siE9p1+/OUf9lkXY0wvZIus=;
        b=rm8RwuaIhyBP1ieSeylrB5pReKjnbvrawWe5KUVwu/ObdYfcD2KqvoGdNkgB8GAtWG
         nZ8ipFrYowdZEAr2Z+sds1N6WqmjVMxnXNjGZPjBIhCmkdBykYwf6XvbfCvE0+qxB5dQ
         wBEK7rUwHNlJkWBv1J9HIVFMvZUa7WuM5EIiL5ff4hTs/Eg+425gyCLusNb0vh0bco4J
         uX5knnqzHB+/okns9xrccA/DEWN5e60byEyIR23wpLq0Ul6z/FQGGZUTJLQPv3vQosN1
         qfy0rbiXSe6vRLy5JlVndG8eMFwKBrzpNAGJpz6N53a1IYXFm1B11AQ9q7DmQc6jl1i9
         Obhw==
X-Gm-Message-State: AJIora8JOIdLHGU2zzvSEvlxe0dNOh9O9o6KjhF3kNJfJyF3/b5Oyjdt
	5uxKnDjRJjwzw0zO9hTE7gCkXXvXwLOY1oF/
X-Google-Smtp-Source: AGRyM1sfP4B2ggRzwlFtNzE5njlcJb0xyrOh+fqSIvv7emKj99E0h8HP5nFdmlvCbmam0md1QXj4iw==
X-Received: by 2002:adf:fa04:0:b0:21d:1864:3172 with SMTP id m4-20020adffa04000000b0021d18643172mr18334198wrr.292.1657548270179;
        Mon, 11 Jul 2022 07:04:30 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de. [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
        by smtp.gmail.com with ESMTPSA id c15-20020a5d4f0f000000b0021d8faf57d5sm5849112wru.74.2022.07.11.07.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 07:04:29 -0700 (PDT)
Message-ID: <d060ab80fcf8ede50466069c9021eda97e239fb6.camel@gmail.com>
Subject: Re: [PATCH v2 15/15] iio: inkern: fix coding style warnings
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>,  "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, dl-linux-imx
 <linux-imx@nxp.com>,  "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-iio
 <linux-iio@vger.kernel.org>,  chrome-platform@lists.linux.dev, linux-arm
 Mailing List <linux-arm-kernel@lists.infradead.org>, 
 linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, Benson Leung
 <bleung@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomer
 Maimon <tmaimon77@gmail.com>, Zhang Rui <rui.zhang@intel.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Eugen Hristev <eugen.hristev@microchip.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Benjamin Fair <benjaminfair@google.com>,
 Nancy Yuen <yuenn@google.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Jishnu Prakash <quic_jprakash@quicinc.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Avi Fishman
 <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@microchip.com>, Lars-Peter Clausen <lars@metafoo.de>, Thara
 Gopinath <thara.gopinath@linaro.org>, Cai Huoqing <cai.huoqing@linux.dev>,
 Fabio Estevam <festevam@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, Haibo Chen
 <haibo.chen@nxp.com>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Patrick Venture <venture@google.com>, Amit
 Kucheria <amitk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>,  Saravanan Sekar <sravanhome@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, Jonathan Cameron <jic23@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij
 <linus.walleij@linaro.org>
Date: Mon, 11 Jul 2022 16:05:31 +0200
In-Reply-To: <CAHp75VcnuAtc+n+nhQ16yP9S-veX2c6ruquSewtPJdcqQwpyAQ@mail.gmail.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
	 <20220711123835.811358-16-nuno.sa@analog.com>
	 <CAHp75VcnuAtc+n+nhQ16yP9S-veX2c6ruquSewtPJdcqQwpyAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_070431_550335_DAF1A584 
X-CRM114-Status: GOOD (  12.17  )
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

On Mon, 2022-07-11 at 15:15 +0200, Andy Shevchenko wrote:
> On Mon, Jul 11, 2022 at 2:40 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> >=20
> > Just cosmetics. No functional change intended...
>=20
> ...
>=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (name =3D=3D NULL && channel_n=
ame =3D=3D NULL)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!name && !channel_name)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(-ENODEV);
>=20
> After this change in place, I think it's better to convert it to
>=20
> =C2=A0 if (!(name || channel_name))
>=20
> which shows intentions clearer.
>=20

No strong feelings from my side so I can do that if a v3 is needed
(which, most likely, will be needed).

- Nuno S=C3=A1

