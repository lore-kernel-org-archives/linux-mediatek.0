Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE94EE4996
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Aug 2023 07:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+g2kGOBzDKIkQEMz+5a35V4YETSzQ5TABcO8d37tkY=; b=ex7hS3PssE3ZauqNI4Z5JF8l8B
	GgnziBhG3IrCJzLexRsBNCB/e6zmbIspC0sJJCyEcn5ylW7Wi5yCcrHAhp92iy/j2zpTCVClTKLEb
	XiowRBy6ibc8P9Zn9paPOmf4jIMS98IE+hhddZdvsw2pVWKI/pRPP2WWKL/bdjndsLquV46h3XsD5
	nVmxYK3WAv2xt8TcBhKXNyVKK3CtIsdxDBjWkrQiU6AZaN1mwwKyyaOWPq3L84SFmXW52338mideb
	t+SmYC2/7AjDjViirHDl4PTjhdYAwRRq2DryI3LKoyboHMuOZ0CHK5sK25bwcTnB2aPGpZliy/u26
	YEk47a2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzk7-00DPCL-1x;
	Mon, 21 Aug 2023 07:54:31 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzk4-00DPB9-10;
	Mon, 21 Aug 2023 07:54:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7635840005;
	Mon, 21 Aug 2023 07:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692604463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+g2kGOBzDKIkQEMz+5a35V4YETSzQ5TABcO8d37tkY=;
	b=e6TJ8JFxedqGlPsXUusWjKkr3z72B+pv1khOZOKYpRv1ROEOVD3qqAc+rJt/vHqikAAa4U
	TkcBiBN5tg9aQtzGapIkSvUjOA2s0Q5rdj/vUIOKVnzm+k7RPK0UNDjtDxV14NhbW1triP
	a7l0o6bGyOGT65J9F9/kJz/rZbJbAkSTrO1XUeXm/ioQ9fbbiwfnR24fmqEJxdK4kxHW+X
	wqMbFeEViqDukrDtclTwjLKrRFwQKMG5jNMrERk6wHkaIY66YDu8fZ/j6Wkj60uIgo9ShA
	cy7K3K5aaXJEpZc+7VtCmaQrXjGCu56nkVVZJ+7DpFww7QmRAO9rBx6Za4L6SA==
Date: Mon, 21 Aug 2023 09:54:17 +0200
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
 <paul@crapouillou.net>, <philmd@linaro.org>, <pratyush@kernel.org>,
 <richard@nod.at>, <robh@kernel.org>, <rogerq@kernel.org>,
 <samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
 <u.kleine-koenig@pengutronix.de>, <vigneshr@ti.com>, <vz@mleia.com>,
 <wens@csie.org>, <yangyingliang@huawei.com>
Subject: Re: [PATCH -next v3 11/12] mtd: spi-nor: nxp-spifi: Use helper
 function devm_clk_get_enabled()
Message-ID: <20230821095417.121990be@xps-13>
In-Reply-To: <20230821093825.22280e33@xps-13>
References: <20230818101004.4f2cd343@xps-13>
	<20230821031737.1973183-1-lizetao1@huawei.com>
	<20230821031737.1973183-12-lizetao1@huawei.com>
	<20230821093825.22280e33@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_005428_496373_23D57A8A 
X-CRM114-Status: GOOD (  10.64  )
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

Hi again,

miquel.raynal@bootlin.com wrote on Mon, 21 Aug 2023 09:38:25 +0200:

> Hi Tudor,
>=20
> lizetao1@huawei.com wrote on Mon, 21 Aug 2023 11:17:36 +0800:
>=20
> > Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepa=
red
> > and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> > replaced by devm_clk_get_enabled() when driver enables (and possibly
> > prepares) the clocks for the whole lifetime of the device. Moreover, it=
 is
> > no longer necessary to unprepare and disable the clocks explicitly, so =
drop
> > the label "dis_clks" and "dis_clk_reg". =20
>=20
> This patch seems very simple, do you mind if I apply it directly into
> mtd/next for the next PR?

I see you already took that one, perfect ;-) Sorry for the noise.

Thanks,
Miqu=C3=A8l

