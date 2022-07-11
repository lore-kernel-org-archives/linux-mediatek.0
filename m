Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33328C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/s/OGdlF8gDduadx4LnZlsIPtzs9KiJR7EJ+peqCSpc=; b=NS0LrHRiSndnMc2vANOPthrBFf
	60eTMDjJ+ohk+k7gGTCRLBYpRSG7zq9jhpRovl1DPi2XTJdVDEGQDnokzOI7x0n3PdJ2pP8pIf9ov
	w6+MlCbSdvjcLJ1Q40OjfZJOwQcB6bDoWveYuVUrsHQuiYzV+Fuuh6JNTxTv+f2uTp/ppRy/vSFAE
	4UykaUb4PB3+Q84PBVSqBUOSJphGIKN/jAhOu6iuNXwUk4Dmel7bQfu3D+Ksltn99AoRb6w3BgPDm
	110TIaZhb0p9dXUReAh8PFVy6qx3VzEyCKjDdUbPtLxzJxlqPFtdV0z3aQHBd+ZhQ4CvcynNdeps9
	tBYyyJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAu0m-0028ae-Pd; Mon, 11 Jul 2022 14:03:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAu0j-0028YK-CB; Mon, 11 Jul 2022 14:03:42 +0000
Received: by mail-wr1-x435.google.com with SMTP id b26so7162006wrc.2;
        Mon, 11 Jul 2022 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=/s/OGdlF8gDduadx4LnZlsIPtzs9KiJR7EJ+peqCSpc=;
        b=f7S5z3cJiEVRqzrgIcyYJ0WR48nsA/Ndj1Rkr2kt+NBRFf5eg2uWQrd/MXBzfhne0y
         iwh/biJoo/tUnIBZ59D1UJ2MZhAd0MJTzEororHJvT2kKF7rr+wcIRgEfNSE1+2a6p7G
         OTHEuRl5gLgHP31ivAK1JB/JwBHsZMpAlTnI0rp0AP169bYRyzn0Sbgo3owVHS/vUchj
         bn51mIT64xCPri2REasD0Ixtyf721cJrRYoZotxL7o5vXaQqOL0QF2Kg8IOgZvG+YLsK
         jE3UtLdrl5C2cRH0WAbkqmpFI93w/iA4Kl4QpyYBkAtSdwo2/ZUzjWYGfJgdmdkKZaYX
         wW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=/s/OGdlF8gDduadx4LnZlsIPtzs9KiJR7EJ+peqCSpc=;
        b=sj3PfE5Tg6yX6J0bnbLUXtLZxBC0Y4FJ7su6HgrFZm/r4Sl7PEEnSO36nipAIcLXDV
         BSOh1rO4iCtln7s75un+BKC3ZitA/9hjOlIcIYdD6dwX9A7ZL0VliO2wMn2NFo35IjCh
         IHzkEinw5rQBayHWNvdjFAe+6R7gXhsKVTXStR5zfISM1SjrsNUcJea1huEtFgeLZokF
         F3qUv+0v8owX6MWFtOSaZ2SuvqQisqhALEb7PGR5Y5FkoZN68U/xnuoDuyUi/0xf+HVX
         GIFmnjiKgl5V9yWYoO6I8i5VxMHdldEW6qt9CiAg90gDKNZEGBAnYmMzt9jizHEEveND
         p96g==
X-Gm-Message-State: AJIora9RiozE0E/MGUwlllrH83L9z7/D5U0ALsoZlBU24jFxuTsLUQB+
	aGceDgkz2XW+7QrHApuB4X2cU/+qt4tLKNMu
X-Google-Smtp-Source: AGRyM1uVKiSNZ63xvM1SkZGg8MDD3NqDak8QVg5CmjgLLJR/63rBoop6xkxZjGyO50qafCZExu5qgw==
X-Received: by 2002:a05:6000:a0c:b0:21d:a699:d54e with SMTP id co12-20020a0560000a0c00b0021da699d54emr5172920wrb.605.1657548214450;
        Mon, 11 Jul 2022 07:03:34 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de. [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
        by smtp.gmail.com with ESMTPSA id a13-20020a5d4d4d000000b0021b91d1ddbfsm5816067wru.21.2022.07.11.07.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 07:03:34 -0700 (PDT)
Message-ID: <8417d206124ba823a907bd27f4f6ce53a9080249.camel@gmail.com>
Subject: Re: [PATCH v2 00/15] make iio inkern interface firmware agnostic
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
Date: Mon, 11 Jul 2022 16:04:35 +0200
In-Reply-To: <CAHp75VeMXP1WyQcFQU_RW-a_CSGVMF_NsgHtLEbL8hi-n8gSVw@mail.gmail.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
	 <CAHp75VeMXP1WyQcFQU_RW-a_CSGVMF_NsgHtLEbL8hi-n8gSVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_070341_432724_392045F9 
X-CRM114-Status: GOOD (  13.20  )
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

On Mon, 2022-07-11 at 15:22 +0200, Andy Shevchenko wrote:
> On Mon, Jul 11, 2022 at 2:38 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> >=20
> > First version of the series can be found here:
> >=20
> > https://lore.kernel.org/linux-iio/20220610084545.547700-1-nuno.sa@analo=
g.com/
>=20
> I'm under the impression that I gave tags for some of these patches
> when they were the part of the bigger series. Am I wrong?
> In any case for patch 6-14,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Yes, you're right. Should I have dropped them?

- Nuno S=C3=A1

