Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA15BC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE2mAjvNqXWB2ZmmfkBzebNZ3UKFN3Q87ghm1dunraM=; b=hq8mNL2SA1Q5lF5/xTBhTYVjcv
	gERY17hMjgByz6xzCVTUmuR7d1XzBihWA8kLD5daLWZXD/ysS1oftGvTa7pbwhWX34iZ9/L/VIY4S
	CsGwfvad4s+kfHO0vGYln9k5/kI4SjIQnNsICA0HJWNYEF82ZmeaPjpx/h2j4EAhrVNaKF2iF8lsh
	4xwTYJyCYhR8U2D83w82Oa4fQmzsRUzg+f3OrPD4BVokU3lJk3pB+9ffbMI31k9Ybuo5X0KfHoeoM
	sMAUUMCwbo2q4DmShGwSMfkg6caCJBCzSzgbho03vT04hR2VfaP/j5P9+Sak9PKb9iAnLO1fgPOuG
	1/MGT/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyZl-006Mtz-B9; Wed, 08 Mar 2023 18:31:45 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyZg-006Ms3-7g; Wed, 08 Mar 2023 18:31:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9E339240005;
	Wed,  8 Mar 2023 18:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678300295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IE2mAjvNqXWB2ZmmfkBzebNZ3UKFN3Q87ghm1dunraM=;
	b=W9bpmY3/KK4H8XkPR5AErqDMuVx7gx1E72W3ekylox5c6Sb1rEoaG0nwEeCbQsUc6fByxS
	3PZpBawbq5O55tiA1JKMB5WB+fl+xGlvZNIIkCxD0BVegUIaYhJ86Z7HDmbu6JgNt7O36Q
	KczTEKWoIBBtiUPEE1mzlJ8L3xWUVUHSuQq9Fv2DewrgLpVSiS05S/U+XBCe5KjNrcLjrq
	zJjci2YlnX3uHUsv5p9FYMGHzDICiiJZDFiKjvNvjG0iu7BTOTVKX/AFVZKghFBpWyCpwD
	wYIXSzk/QdQeStQWTRLDE6ufZtwkm0Ub+sRPvLPoXU1/cVvB2P656eC6WpRDow==
Date: Wed, 8 Mar 2023 19:31:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy
 Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Orson
 Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vincent Shih <vincent.sunplus@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org
Subject: Re: [PATCH V2] nvmem: add explicit config option to read OF fixed
 cells
Message-ID: <20230308193121.7f5b3d02@xps-13>
In-Reply-To: <5974d28426057975e701c4a8454b5a13@milecki.pl>
References: <20230224072903.20945-1-zajec5@gmail.com>
	<20230308173256.3837b87b@xps-13>
	<91ff425b4c901648b1faf34c784f20ad@milecki.pl>
	<20230308190636.7fabab9c@xps-13>
	<5974d28426057975e701c4a8454b5a13@milecki.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_103140_627966_6DB5820D 
X-CRM114-Status: GOOD (  43.39  )
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

Hi Rafa=C5=82,

rafal@milecki.pl wrote on Wed, 08 Mar 2023 19:12:32 +0100:

> On 2023-03-08 19:06, Miquel Raynal wrote:
> > Hi Rafa=C5=82,
> >=20
> > rafal@milecki.pl wrote on Wed, 08 Mar 2023 17:55:46 +0100:
> >  =20
> >> On 2023-03-08 17:34, Miquel Raynal wrote: =20
> >> > Hi Rafa=C5=82,
> >> >
> >> > zajec5@gmail.com wrote on Fri, 24 Feb 2023 08:29:03 +0100:
> >> > =20
> >> >> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl> =20
> >> >> >> NVMEM subsystem looks for fixed NVMEM cells (specified in DT) by=
 =20
> >> >> default. This behaviour made sense in early days before adding supp=
ort
> >> >> for dynamic cells. =20
> >> >> >> With every new supported NVMEM device with dynamic cells current=
 =20
> >> >> behaviour becomes non-optimal. It results in unneeded iterating ove=
r >> DT
> >> >> nodes and may result in false discovery of cells (depending on used=
 DT
> >> >> properties). =20
> >> >> >> This behaviour has actually caused a problem already with the MT=
D =20
> >> >> subsystem. MTD subpartitions were incorrectly treated as NVMEM cell=
s. =20
> >> >
> >> > That's true, but I expect this to be really MTD specific.
> >> >
> >> > A concrete proposal below.
> >> > =20
> >> >> Also with upcoming support for NVMEM layouts no new binding or driv=
er
> >> >> should support fixed cells defined in device node. =20
> >> >
> >> > I'm not sure I agree with this statement. We are not preventing new
> >> > binding/driver to use fixed cells, or...? We offer a new way to expo=
se
> >> > nvmem cells with another way than "fixed-offset" and "fixed-size" OF
> >> > nodes. =20
> >> >>  From what I understood all new NVMEM bindings should have cells >>=
 defined =20
> >> in the nvmem-layout { } node. That's what I mean by saying they should
> >> not be defined in device node (but its "nvmem-layout" instead). =20
> >=20
> > Layouts are just another possibility, either you user the nvmem-cells
> > compatible and produce nvmem cells with fixed OF nodes, or you use the
> > nvmem-layout container. I don't think all new bindings should have
> > cells in layouts. It depends if the content is static or not.
> >  =20
> >> >> Solve this by modifying drivers for bindings that support specifying
> >> >> fixed NVMEM cells in DT. Make them explicitly tell NVMEM subsystem =
to
> >> >> read cells from DT. =20
> >> >> >> It wasn't clear (to me) if rtc and w1 code actually uses fixed c=
ells. >> I =20
> >> >> enabled them to don't risk any breakage. =20
> >> >> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl> =20
> >> >> [for drivers/nvmem/meson-{efuse,mx-efuse}.c]
> >> >> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >> >> ---
> >> >> V2: Fix stm32-romem.c typo breaking its compilation
> >> >>     Pick Martin's Acked-by
> >> >>     Add paragraph about layouts deprecating use_fixed_of_cells
> >> >> ---
> >> >>  drivers/mtd/mtdcore.c          | 2 ++
> >> >>  drivers/nvmem/apple-efuses.c   | 1 +
> >> >>  drivers/nvmem/core.c           | 8 +++++---
> >> >>  drivers/nvmem/imx-ocotp-scu.c  | 1 +
> >> >>  drivers/nvmem/imx-ocotp.c      | 1 +
> >> >>  drivers/nvmem/meson-efuse.c    | 1 +
> >> >>  drivers/nvmem/meson-mx-efuse.c | 1 +
> >> >>  drivers/nvmem/microchip-otpc.c | 1 +
> >> >>  drivers/nvmem/mtk-efuse.c      | 1 +
> >> >>  drivers/nvmem/qcom-spmi-sdam.c | 1 +
> >> >>  drivers/nvmem/qfprom.c         | 1 +
> >> >>  drivers/nvmem/rave-sp-eeprom.c | 1 +
> >> >>  drivers/nvmem/rockchip-efuse.c | 1 +
> >> >>  drivers/nvmem/sc27xx-efuse.c   | 1 +
> >> >>  drivers/nvmem/sprd-efuse.c     | 1 +
> >> >>  drivers/nvmem/stm32-romem.c    | 1 +
> >> >>  drivers/nvmem/sunplus-ocotp.c  | 1 +
> >> >>  drivers/nvmem/sunxi_sid.c      | 1 +
> >> >>  drivers/nvmem/uniphier-efuse.c | 1 +
> >> >>  drivers/nvmem/zynqmp_nvmem.c   | 1 +
> >> >>  drivers/rtc/nvmem.c            | 1 +
> >> >>  drivers/w1/slaves/w1_ds250x.c  | 1 +
> >> >>  include/linux/nvmem-provider.h | 2 ++
> >> >>  23 files changed, 29 insertions(+), 3 deletions(-) =20
> >> >> >> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c =20
> >> >> index 0feacb9fbdac..1bb479c0f758 100644
> >> >> --- a/drivers/mtd/mtdcore.c
> >> >> +++ b/drivers/mtd/mtdcore.c
> >> >> @@ -523,6 +523,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
> >> >>  	config.dev =3D &mtd->dev;
> >> >>  	config.name =3D dev_name(&mtd->dev);
> >> >>  	config.owner =3D THIS_MODULE;
> >> >> +	config.use_fixed_of_cells =3D of_device_is_compatible(node, >> "n=
vmem-cells"); =20
> >> >
> >> > I am wondering how mtd specific this is? For me all OF nodes contain=
ing
> >> > the nvmem-cells compatible should be treated as cells providers and
> >> > populate nvmem cells as for each children.
> >> >
> >> > Why don't we just check for this compatible to be present? in
> >> > nvmem_add_cells_from_of() ? And if not we just skip the operation.
> >> >
> >> > This way we still follow the bindings (even though using nvmem-cells=
 in
> >> > the compatible property to require cells population was a mistake in
> >> > the first place, as discussed in the devlink thread recently) but th=
ere
> >> > is no need for a per-driver config option? =20
> >> >> This isn't mtd specific. Please check this patch for all occurrence=
s >> of =20
> >> the:
> >> use_fixed_of_cells =3D true =20
> >> >> The very first one: drivers/nvmem/apple-efuses.c driver for the =20
> >> "apple,efuses" binding. That binding supports fixed OF cells, see:
> >> Documentation/devicetree/bindings/nvmem/apple,efuses.yaml =20
> >=20
> > I'm saying: based on what has been enforced so far, I would expect all
> > fixed cell providers to come with nvmem-cells as compatible, no?
> >=20
> > If that's the case we could use that as a common denominator? =20
>=20
> Sorry, I don't get it. Have you checked
> Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> ?
>=20
> It's a NVMEM provied binding with fixed cells that doesn't use
> nvmem-cells as compatible. There are many more.

Oh yeah you're right, I'm mixing things. Well I guess you're right
then, it's such a mess, we have to tell the core the parsing method.

So maybe another question: do we have other situations than mtd which
sometimes expect the nvmem core to parse the OF nodes to populate cells,
and sometimes not?

Also, what about "of_children_are_cells" ? Because actually in most
cases it's a "fixed of cell", so I don't find the current naming
descriptive enough for something so touchy.

Thanks, Miqu=C3=A8l

