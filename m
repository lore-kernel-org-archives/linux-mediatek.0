Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6B6C678DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 08:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzCVM+bK0VlZhouGuHfDfVW0KdhBecM197MixCtRvfQ=; b=Pj7P2R2wbIa76Q06UnXuhKuJa3
	QuxgA/panQtK2piUmDjnnrWpA8pwu5gPVV9/7/s3O+fz9QPaiKzGAYK9tzGx0hV8LJsSnWZnCxa8c
	r/zbiB9SD6NPPVHcOTHE+ybIiAuQ0bmHmCbKSelT+sq9ZUPgJFio4YNooOQyZnzPEHSUFBxKauHfN
	VXqBSPJXk5jeRS1tgSFVscGUckRqlphIRJ/e6k8jiymQBZmOV8oq78xzoR1kosuSrIvCtnPsKSh8+
	tITqbjJLKKzbTA9ETbPuitYcnNv5ou8yFudGBjHGvkkRKAeHn59d05r0motYyZgpCn++t2imzbyxL
	ILrFmoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWubL-007xoP-2Y;
	Fri, 18 Aug 2023 08:12:59 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWubE-007xmi-1e;
	Fri, 18 Aug 2023 08:12:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2973FF803;
	Fri, 18 Aug 2023 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692346367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzCVM+bK0VlZhouGuHfDfVW0KdhBecM197MixCtRvfQ=;
	b=Jmp83XkDTC2MO6piwR/S+JMNYHW0Y17nyiWqjHmyKqLeJqK0dnwSYn4/4EZ8nhuwB95D6l
	DK6mzVDiQeV2or5bZ/qCdESjI+eJ0d5I35Y4K+n1kp7aV0dBDct1+0GnUjTinv72HIAIuJ
	GXIKPdqOkWIdD19loGNKnSoo5AKAzWMX+58BKdjhkYcEZeQI9RFkgdggJNxO8z27J43LKK
	ztYe9QtVJymUiC+HoooqV10fY6+WTU0F2yUV3rd5jWJpzak1WbkF1rSa4beE/zB0TIv1ad
	+StZn7GOnXF/njiTIb/fCXUqwnHVKZyH3c7ML+WKoXdBACeSHBlBedQMaOaVMw==
Date: Fri, 18 Aug 2023 10:12:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <alexandre.torgue@foss.st.com>,
 <angelogioacchino.delregno@collabora.com>,
 <christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
 <dmitry.torokhov@gmail.com>, <frank.li@vivo.com>,
 <geert+renesas@glider.be>, <heiko@sntech.de>, <jernej.skrabec@gmail.com>,
 <jinpu.wang@ionos.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
 <mcoquelin.stm32@gmail.com>, <michael@walle.cc>, <michal.simek@amd.com>,
 <nicolas.ferre@microchip.com>, <paul@crapouillou.net>, <philmd@linaro.org>,
 <pratyush@kernel.org>, <richard@nod.at>, <robh@kernel.org>,
 <rogerq@kernel.org>, <samuel@sholland.org>, <stefan@agner.ch>,
 <tudor.ambarus@linaro.org>, <u.kleine-koenig@pengutronix.de>,
 <vigneshr@ti.com>, <vz@mleia.com>, <wens@csie.org>,
 <yangyingliang@huawei.com>
Subject: Re: [PATCH -next v2 02/12] mtd: rawnand: arasan: Use helper
 function devm_clk_get_enabled()
Message-ID: <20230818101242.12f54b5d@xps-13>
In-Reply-To: <20230818101004.4f2cd343@xps-13>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230818074642.308166-1-lizetao1@huawei.com>
	<20230818074642.308166-3-lizetao1@huawei.com>
	<20230818101004.4f2cd343@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_011252_744574_7B557082 
X-CRM114-Status: GOOD (  12.08  )
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


miquel.raynal@bootlin.com wrote on Fri, 18 Aug 2023 10:10:04 +0200:

> Hi Li,
>=20
> lizetao1@huawei.com wrote on Fri, 18 Aug 2023 15:46:32 +0800:
>=20
> > Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepa=
red
> > and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now b=
e =20
>=20
> > replaced by devm_clk_get_enabled() when driver enable (and possibly =20
>=20
> For all the commit logs:		  the driver enables (and possibly prepares)
>=20
> > prepare) the clocks for the whole lifetime of the device. Moreover, it =
is
> > no longer necessary to unprepare and disable the clock explicitly, so d=
rop =20
>=20
> For all the commit logs:		       the clocks
>=20
> The ",so drop the label xxx" is not needed I believe.
>=20
> > the label "disable_bus_clk" and "disable_controller_clk".

Actually it does not bother, just keep it.

> > Signed-off-by: Li Zetao <lizetao1@huawei.com>
> > --- =20
>=20
> Thanks,
> Miqu=C3=A8l


Thanks,
Miqu=C3=A8l

