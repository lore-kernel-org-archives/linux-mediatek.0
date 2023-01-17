Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C510C00A5A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 22:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JV448xgdKigFspuXtocf8jAzZBAPpr5vYg2B4Y33eqg=; b=bnnqh54mUhDRRqdwdSuxF0ditO
	kb3kom2uKzB5etv2CWbgKaA+xRBNSL36xhdqtIluiqPCC/btIdOfiatIwoLY1d+qX9vP3T09ca3a6
	ZKGIctD2zbr8y9IpZFpjsGONWpM1QAHTKF7uao1kln14fi0ka9CT0Xcif8pH7gQBifLnFQ3aztmaS
	jmLEL4J83bUbA8ne41gfBlv25wcYipH/oSGLam8xsxlT+y9rgji20KwP3CjU2nH/RjC6YKYXAAf15
	vIHwyN2y9gbJEQt6F6hB9Pxubm/OzDu4bjNGC+yXN3eAdZVMSBMeaAFBpbbqUhGTHHtYfdBtv9eH7
	mJbVnGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHufp-00G99m-0B; Tue, 17 Jan 2023 22:43:21 +0000
Received: from relay06.th.seeweb.it ([5.144.164.167])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHufZ-00G93M-6j
	for linux-mediatek@lists.infradead.org; Tue, 17 Jan 2023 22:43:07 +0000
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DF99E3F428;
	Tue, 17 Jan 2023 23:42:53 +0100 (CET)
Date: Tue, 17 Jan 2023 23:42:51 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	openbmc@lists.ozlabs.org, linux-imx@nxp.com,
	linux-stm32@st-md-mailman.stormreply.com, linux-iio@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-msm@vger.kernel.org,
	Gwendal Grignou <gwendal@chromium.org>,
	Fabio Estevam <festevam@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Eugen Hristev <eugen.hristev@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3 12/15] iio: adc: qcom-spmi-adc5: convert to device
 properties
Message-ID: <20230117224251.wzxexdlfe5ydzjw5@SoMainline.org>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-13-nuno.sa@analog.com>
 <20220806192048.0ca41cc5@jic23-huawei>
 <20230116204452.il4gase2szipeexz@SoMainline.org>
 <CAHp75VdX9sFgn9STyzwcDCK1KYbU00ejFNcEP3FVnLk5J=Pktg@mail.gmail.com>
 <CAHp75VdTftm1BE21rH1HVHiwUye-0Dvc66uCK2LE2qF4_zA6hg@mail.gmail.com>
 <CAHp75VdyCA7mQdm--kg=hUbmQqX4-jfFMHgLxref5mNSM1vnMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdyCA7mQdm--kg=hUbmQqX4-jfFMHgLxref5mNSM1vnMA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_144305_420821_03EE9204 
X-CRM114-Status: GOOD (  19.44  )
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

On 2023-01-17 11:40:42, Andy Shevchenko wrote:
<snip>
> > > > This CC just surfaced in my inbox while searching for our current
> > > > discussion around missing labels in qcom-spmi-vadc - and on the side a
> > > > userspace @xx label name ABI break (in qcom-spmi-adc5) caused by this
> > > > patch's fwnode_get_name change - we could've caught it if I had not
> > > > accidentally marked it as read and/or forgot about it.  My apologies.
> > >
> > > Does the following addition to the top of the
> > > adc5_get_fw_channel_data() fix the issue?
> > >
> > > +       name = devm_kasprintf(adc->dev, GFP_KERNEL, "%pfwP", fwnode);
> > > +       if (!name)
> > > +               return -ENOMEM;
> >
> > Okay, it probably the same, so it might need additional code to
> >
> > + name[strchrnul(name, '@') - name] = '\0';
> 
> I have just sent a formal patch, please test on top of non-working kernel.

I would've preferred to fix this in the same way as qcom-spmi-vadc by
implementing read_label instead and basing it on the DT label or driver
string literals instead [1], but dropping extend_name (hence changing
sysfs filenames once again) would be considered an ABI break.

I've instead gone for a similar change that also ignores the node name
in favour of falling back to the driver string literal (if no "label"
property is available) while retaining extend_label [3] and the -
however ugly they are - sysfs filenames, but that'll likely get rejected
as strictly being an ABI break as well, not in the least because DT
needs to be patched up [3] for it to work out.

I'll at least test your patch when getting back to one of these devices.

- Marijn

[1]: https://lore.kernel.org/linux-arm-msm/20230116220909.196926-6-marijn.suijten@somainline.org/
[2]: https://lore.kernel.org/linux-arm-msm/20230116220909.196926-4-marijn.suijten@somainline.org/
[3]: https://lore.kernel.org/linux-arm-msm/20221209215308.1781047-1-marijn.suijten@somainline.org/

