Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA00C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 20:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McaoZ+7Dkbq9jEM9b4UoYkn0ULYk5tb0S1SNSyF9RUA=; b=OAuUi0iDd5Re4OPutXEI7PylyI
	IzO2SvdpP6hNAvreipEF39eK0hYkIhZi4gKMD7UdLs4g3tAyxLgZH1oXj4B8iaOzzHTqmcRXivGR3
	RtOfuvr2XQ6+GyilLY+3OiDUSSvrH7qDap0OqursiHibsu278zyg8LTTSIQII6IZYcbGLVY1FmZcm
	GZCBfGoqaET2GTeLQhWeeI9WK+1DKwq0BGZU62VjE6YNKx7u/xMgLqCWWG03cAZ8x2OKN8pd0aLIN
	pAiYQ8F2Vk8PoGlvJXmR1AJXa06maESsaBGn2rmESkaC3wMdPppFdCx2GWou6q7EXTYcP6XvKZ70t
	GBfTRCGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHWLm-00C1Ol-Il; Mon, 16 Jan 2023 20:45:02 +0000
Received: from relay03.th.seeweb.it ([5.144.164.164])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHWLi-00C1O6-3V
	for linux-mediatek@lists.infradead.org; Mon, 16 Jan 2023 20:44:59 +0000
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7A08D1FAA6;
	Mon, 16 Jan 2023 21:44:53 +0100 (CET)
Date: Mon, 16 Jan 2023 21:44:52 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, openbmc@lists.ozlabs.org,
	linux-imx@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
	linux-iio@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-msm@vger.kernel.org,
	Gwendal Grignou <gwendal@chromium.org>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Thara Gopinath <thara.gopinath@linaro.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Benjamin Fair <benjaminfair@google.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Patrick Venture <venture@google.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Benson Leung <bleung@chromium.org>, Nancy Yuen <yuenn@google.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Christophe Branchereau <cbranchereau@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Avi Fishman <avifishman70@gmail.com>,
	Eugen Hristev <eugen.hristev@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Guenter Roeck <groeck@chromium.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Andy Gross <agross@kernel.org>, Amit Kucheria <amitk@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH v3 12/15] iio: adc: qcom-spmi-adc5: convert to device
 properties
Message-ID: <20230116204452.il4gase2szipeexz@SoMainline.org>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-13-nuno.sa@analog.com>
 <20220806192048.0ca41cc5@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220806192048.0ca41cc5@jic23-huawei>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_124458_328160_61A1882D 
X-CRM114-Status: GOOD (  18.99  )
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

On 2022-08-06 19:20:48, Jonathan Cameron wrote:
> On Fri, 15 Jul 2022 14:29:00 +0200
> Nuno Sá <nuno.sa@analog.com> wrote:
> 
> > Make the conversion to firmware agnostic device properties. As part of
> > the conversion the IIO inkern interface 'of_xlate()' is also converted to
> > 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> > dependencies from IIO.
> > 
> > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> +CC Marijin who happend to post a patch for this driver that I just accepted
> and hence probably has hardware access.  Any chance of a test for this series?
> 
> If not, no problem as this is fairly mechanical and we have testing on some of
> the other drivers using the new code.
> 
> I'll probably queue this up in the meantime but it won't end up upstream
> for a few weeks yet.

Jonathan,

This CC just surfaced in my inbox while searching for our current
discussion around missing labels in qcom-spmi-vadc - and on the side a
userspace @xx label name ABI break (in qcom-spmi-adc5) caused by this
patch's fwnode_get_name change - we could've caught it if I had not
accidentally marked it as read and/or forgot about it.  My apologies.

- Marijn

