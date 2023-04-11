Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AB2C7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dxn4NJiE3B4l0ky6etbuCAHmNrCsdSn8aiPhVJqzK0=; b=Xw2DJAF03O6BWOWR+GvlnQolD1
	dJXMegTrq0U13iV0jH1tfDhX4ivzPssu7s+zAIKqnvqVGBUWe/pdOgqOvkuL7eXK1it8EICuoSXeI
	DP91cKCzE8z2YRicf4gn3zFpatI8J66Gr6cdEz4CD7KcVz1Sg29yy4V0Ny5NeXj7UMu51Q7NzzFHE
	0z7Cp6MUqpIIUJdSllVLI9FP120xBx5Kc0wTsSjZv6ONElfTYDYFCpTaJ1XSIS+PT+E1UvCWtBEHm
	1k7d0p3SnNHn1ZKBUdTDAcnTe80tP76OLsniljfjGUC3vda9a5ygnbqVVYlnmrvReajNWDtEUSKAf
	aF15jzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9FJ-00GpOF-1v;
	Tue, 11 Apr 2023 08:20:57 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9FE-00GpJo-2O;
	Tue, 11 Apr 2023 08:20:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 86501C000B;
	Tue, 11 Apr 2023 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681201245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5dxn4NJiE3B4l0ky6etbuCAHmNrCsdSn8aiPhVJqzK0=;
	b=ZsU8dYwTOc46TPHSbq5p16/9AQmMS/uUngPw/Ep3ffxRbxNAvDSBCBvcAy2pJthLsUo170
	Rj2p9Mc9u19gW1370eOx7JvIAabcDATJDumAn+o4DLCQe7iYje0L16LYJobe4Ma8iY4S2M
	hVT2XlKE7FDCpaVqWTtgFMG9mm77zh0cU7Io21vdLB2MKPq3F4zr/E7ECZswWoUCh/54s9
	LxOZOxezaGsD/cMwwjzDu8L5qQzOGwesAiCNFf9eRpldZFKNpdmxXMmy52npYKIeX+l3mz
	4g3Xo/1Q9fGa3R74wYDYHo17n1DEYEktLz9cH0XxSNGHCrcLqbBdY32P+qBBmQ==
Date: Tue, 11 Apr 2023 10:20:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Lucas Stach <dev@lynxeye.de>, Vignesh
 Raghavendra <vigneshr@ti.com>, Linus Walleij <linus.walleij@linaro.org>,
 Miaoqian Lin <linmq006@gmail.com>, Stefan Agner <stefan@agner.ch>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-tegra@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>, Naga
 Sureshkumar Relli <nagasure@xilinx.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, linux-amlogic@lists.infradead.org, Chuanhong
 Guo <gch981213@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Heiko
 Stuebner <heiko@sntech.de>, Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Yang
 Yingliang <yangyingliang@huawei.com>, Jack Wang <jinpu.wang@ionos.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, kernel@pengutronix.de, Arnd Bergmann
 <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, ye xingchen
 <ye.xingchen@zte.com.cn>, Vladimir Zapolskiy <vz@mleia.com>, Roger Quadros
 <rogerq@kernel.org>, Wang Weiyang <wangweiyang2@huawei.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Matthias Brugger <matthias.bgg@gmail.com>,
 Han Xu <han.xu@nxp.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Stephen Boyd <sboyd@kernel.org>, Valentin
 Korenblit <vkorenblit@sequans.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, linux-renesas-soc@vger.kernel.org, Kyungmin
 Park <kyungmin.park@samsung.com>, Thierry Reding
 <thierry.reding@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-oxnas@groups.io, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Claudiu
 Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH] mtd: nand: Convert to platform remove callback
 returning void
Message-ID: <20230411102025.6b2fdc9e@xps-13>
In-Reply-To: <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
	<20230407101043.299f5e22@xps-13>
	<20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012053_088667_D96793A4 
X-CRM114-Status: GOOD (  30.10  )
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

Hi Uwe,

u.kleine-koenig@pengutronix.de wrote on Sat, 8 Apr 2023 20:53:32 +0200:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>=20
> Hey Miquel,
>=20
> On Fri, Apr 07, 2023 at 10:10:43AM +0200, Miquel Raynal wrote:
> > I've looked at the different patches, they look good to me but as they
> > are all trivial and exactly identical, would you mind sending this
> > again all squashed in a single patch? A subsystem-wide conversion seems
> > appropriate. In all cases I plan to take this for the next merge
> > window. =20
>=20
> I slightly prefer them separately, because I like small patches and
> because the Acks and Reviews only apply to the individual drivers.
> But I don't mind seriously, so here comes the series squashed into one.

For any non trivial change, I would definitely do that as well.

The thing is, by collecting the tags with b4, you lost all the Acks and
Reviews targets, while we could prevent this, see below.

> While going through the changed, probably the s3c24xx driver (which
> isn't exactly identical to the other changes) could benefit from an
> additional change throwing out the early exit (which---I guess---cannot
> be hit).

Yes, I believe the 'info =3D=3D NULL' condition is useless, feel free to
drop it in a second patch if you wish.

> BTW, I constructed the lists of acks/reviews myself and found the same
> set. However b4 wailed about each patch claiming:
>=20
> 	    =E2=9C=97 BADSIG: DKIM/infradead.org

No idea what this means, any pointer?

> And it didn't like you producing the tags, saying:
>=20
> 	NOTE: some trailers ignored due to from/email mismatches:
> 	    ! Trailer: Acked-by: Roger Quadros <rogerq@kernel.org>
> 	     Msg From: Miquel Raynal <miquel.raynal@bootlin.com>
> 	    [...]

Well, yes, I don't expect b4 to read plain english when I say "I
collected them for you" ^^ But at least my list had a '# <area>' suffix
for each of the Acked and Reviewed changes, which is now missing. I
don't know  how useful they actually are, but it seems to me that the
information was lost between v1 and v2?

Thanks,
Miqu=C3=A8l

