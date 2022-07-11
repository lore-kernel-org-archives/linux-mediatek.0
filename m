Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007A0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpuAbJzOZmkFVUVRYRfhJb2EZ79ErPrcazI4dJRRIZw=; b=nx8YilENjop62P3rbPZ7AX7UM1
	dUnQ32YNfHBNxXr2xxNjGJhZKznIfzSVtMWZzyoatgmkQsxUSQw4mPBzeYCie85iHBJdmkk7nsgJd
	OvmOEAd+wgoBUXItUVE8Xj+6Uh82O6waf2lGrsOh/egfPaqdbRbBxZSXZ4icFSeTYfk1Dgw7stzbJ
	CCS0xCXjpuyMIN6r/GC09/nqKrij890qjETZdZJcKB655MdeeR8wAm60+shApLs0jbuzABiS4Cz9k
	R0KbNCNajCTcJOarzeLt820k1ZRLVQs5Z5WKyfHvkwgpQrt7Yc7tG17YRr5HUG2U3XCIF4vaW7yOJ
	Zksqw0wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAu2v-0029Oc-A5; Mon, 11 Jul 2022 14:05:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAu2q-0029Mc-Pf; Mon, 11 Jul 2022 14:05:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id d16so7139373wrv.10;
        Mon, 11 Jul 2022 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=OpuAbJzOZmkFVUVRYRfhJb2EZ79ErPrcazI4dJRRIZw=;
        b=AxqKn1jFCUvR9r8eF6G9LQNJai0j26cooZSTaW/y5LjqtvcEM/8McIf/+yQzlzaUFd
         LwcEnbV3x0T98SP3+BJlr0dZ/4NoEFEHYkvinYuvlXRJ/rScOUvz84TzCH0CqciB5xr3
         70JCY+zxyG19vqUL7fnu7cTlKI0FIx088QGgbn+DUglz7JpgcVQ5PpQGbQcOhaZFlPbl
         Sj/1dCgEulNZFTYu6gtOT+azXEODMFcBsZXMw1Holn5VdIjBppSACDRDbXOOwlKV+GrT
         gUqBD8ESK3VZeUfDigHKr2IQSaYpAIV6HBehOLe57cJG8VwM+8e6vaZ86/RiS+6W3xCR
         PgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=OpuAbJzOZmkFVUVRYRfhJb2EZ79ErPrcazI4dJRRIZw=;
        b=J8Yc3keIL7S+oZgKOezMi+QN0xWAsl0ASWmaBKiRliO18UAiSthYEKSkSEEsNEnkzp
         R7p4ZHJBR/GT6Aq8d+Tu9ReprCmb+wnF6jcbdszFTEwiUdcz62fOw8xEVNcCam17IeJB
         Cc0QaASyuQ26+NOYEk1SCaFcQrITSLCrKJBY8IxHkKVzb0XTWiwXhSRzRc7Gj6krlf3b
         Zeni/Dlu06TzVlZPLiT3TBpPbIlSzpqzYjsTQKKyuTii1c3BA3F3enV5F6aCn+AAcqTx
         UsMriihIWfbnub4mv43IX2OV/HPPc0/8j6FLgdrnZ2Am8X6mRPUw1ZoYGA9hgReqqmTB
         UFHg==
X-Gm-Message-State: AJIora8qTWGqfzeM9iz0mt87R64cjQGwJll64vEIU6iWiJk4ALAxvmK9
	wgJI06Vm9qSf7CcvpH9yUeI=
X-Google-Smtp-Source: AGRyM1vjxZ3LaYt2iroYaYC6yqBPM5QdYtXuGkJjk8H9N1njA0MUYRP5ggIbz4O4J7Zmd/vjCEw/YA==
X-Received: by 2002:adf:f581:0:b0:21d:1e01:e9b7 with SMTP id f1-20020adff581000000b0021d1e01e9b7mr16555540wro.529.1657548349537;
        Mon, 11 Jul 2022 07:05:49 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de. [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
        by smtp.gmail.com with ESMTPSA id g1-20020a05600c000100b00397623ff335sm6700494wmc.10.2022.07.11.07.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 07:05:49 -0700 (PDT)
Message-ID: <bb0aaee46261295e333c02d771a627d3695fdba2.camel@gmail.com>
Subject: Re: [PATCH v2 03/15] iio: inkern: only return error codes in
 iio_channel_get_*() APIs
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
Date: Mon, 11 Jul 2022 16:06:50 +0200
In-Reply-To: <CAHp75VcxcmH5QoheyERAXrUeqMtJidKLBYH1T6dr6vb7yGKqWg@mail.gmail.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
	 <20220711123835.811358-4-nuno.sa@analog.com>
	 <CAHp75VcxcmH5QoheyERAXrUeqMtJidKLBYH1T6dr6vb7yGKqWg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_070552_872469_314457FA 
X-CRM114-Status: GOOD (  29.91  )
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

On Mon, 2022-07-11 at 15:29 +0200, Andy Shevchenko wrote:
> On Mon, Jul 11, 2022 at 2:38 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> >=20
> > APIs like of_iio_channel_get_by_name() and of_iio_channel_get_all()
> > were
> > returning a mix of NULL and pointers with NULL being the way to
> > "notify" that we should do a "system" lookup for channels. This
> > make
> > it very confusing and prone to errors as commit 9f63cc0921ec
> > ("iio: inkern: fix return value in
> > devm_of_iio_channel_get_by_name()")
> > proves. On top of this, patterns like 'if (channel !=3D NULL) return
> > channel' were being used where channel could actually be an error
> > code
> > which makes the code hard to read.
> >=20
> > This change also makes some functional changes on how errors were
> > being
> > handled. In the original behavior, even if we get an error like '-
> > ENOMEM',
> > we still continue with the search. We should only continue to
> > lookup for
> > the channel when it makes sense to do so. Hence, the main error
> > handling
> > in 'of_iio_channel_get_by_name()' is changed to the following
> > logic:
> >=20
> > =C2=A0* If a channel 'name' is provided and we do find it via
> > 'io-channel-names', we should be able to get it. If we get any
> > error,
> > we should not proceed with the lookup. Moreover, we should return
> > an error
> > so that callers won't proceed with a system lookup.
> > =C2=A0* If a channel 'name' is provided and we cannot find it ('index <
> > 0'),
> > 'of_parse_phandle_with_args()' is expected to fail with '-EINVAL'.
> > Hence,
> > we should only continue if we get that error.
> > =C2=A0* If a channel 'name' is not provided we should only carry on wit=
h
> > the
> > search if 'of_parse_phandle_with_args()' returns '-ENOENT'.
> >=20
> > Also note that a system channel lookup is only done if the returned
> > error code (from 'of_iio_channel_get_by_name()' or
> > 'of_iio_channel_get_all()' is -ENODEV.
>=20
> LGTM (but I might miss something, it's a bit too many conditionals),
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>=20

Agreed. It ended up being more complicated than I thought...

- Nuno S=C3=A1

