Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2115BC678DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqOgD7ZoLrRwoPQ6qx0lOE1XYmfnede4CdcT9bV4Jsc=; b=1zo+7rSsuqd+65FWSBUsWFqZYX
	EL5iTSftHo6FNbQ4kOJon7bYqyS+HOdeN6SHhv6ckPik9U89U6E37gqO6xxnQyiB0YNhTCEIEN86/
	7onKECq6NAZE6xDi17XodvWB3AnSvYc8xfMXRJeBT2huARrkxCi6IbGjKJN3fJLFl08it+V/rMJhZ
	jLNsFHrkBCBUp8ZYRTIPRVSNO1rGVSLz3FSK2zA3H84bP7lwn4EyHXKBGG3C+UtkCMm/93MZKlkCB
	htZNH4NvmktkZJJNMB1Dxm2D0VruJRrJPrKP9Jvswg4HzwJdc6OWmR0eFWqyhLxTzy9OEefYeKgM6
	biseRU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuYo-007xKN-2K;
	Fri, 18 Aug 2023 08:10:22 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuYk-007xJI-1o;
	Fri, 18 Aug 2023 08:10:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4AEDC0006;
	Fri, 18 Aug 2023 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692346210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqOgD7ZoLrRwoPQ6qx0lOE1XYmfnede4CdcT9bV4Jsc=;
	b=DnB9JI4Ca7uwgiF0bvp+pcJaDAuqYCJFY4nlqFC5yPHpDNq3HQ4B2BO/O0jiugKRq+M5rS
	pHfQqN4xZ06WVRAIjE+lqx2jNgpH5a49WKKW/n+v2eHeZ+D7JBEoYxf3Y0EDEU4U89nTRV
	4YlnozEQRShzs8M472CrjUtXqqv/ns9UlZQhBoQEgM//jbhn+Hq3YhhfVzFahxMoKObu0w
	47MrHQXFEbxePXUDhEEvTjQvM9WvnWYk2mDmkCY7BiZ1PuPN+3yU9RgZWVp5g8Mnr+sg5S
	rEYfY8cWATOtHZFMNFs0jZUXnimcdlVD0joK56CH+QWcWbbm2jXtgFHq4AHd1Q==
Date: Fri, 18 Aug 2023 10:10:04 +0200
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
Message-ID: <20230818101004.4f2cd343@xps-13>
In-Reply-To: <20230818074642.308166-3-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230818074642.308166-1-lizetao1@huawei.com>
	<20230818074642.308166-3-lizetao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_011018_902197_2612D300 
X-CRM114-Status: UNSURE (   8.65  )
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

Hi Li,

lizetao1@huawei.com wrote on Fri, 18 Aug 2023 15:46:32 +0800:

> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be

> replaced by devm_clk_get_enabled() when driver enable (and possibly

For all the commit logs:		  the driver enables (and possibly prepares)

> prepare) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clock explicitly, so drop

For all the commit logs:		       the clocks

The ",so drop the label xxx" is not needed I believe.

> the label "disable_bus_clk" and "disable_controller_clk".
>=20
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---

Thanks,
Miqu=C3=A8l

