Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F277BCCD187
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Oct 2025 04:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edq5aRZNXIsGbVfDKoR5V8HDpKiMtyPuD0kQllY59Mc=; b=t/NqaPeXh4gK2OoQAzgVFxvrP9
	0lmOaOonhFxpwKdkkDBzQkQB+gJvfEeGoLa/M0xE8ypT9ds4b6YPJ5n2NPaiL/bHotS7ZkOOhV8KA
	pQcRAou3DLqYVvPXfy3dKmwYJsEjBVynHbbll4TUp98ahViVO+pnjqelM/aXQflZcZG7Ezut+Z32F
	5kX3gMLEZ+6MYA5ggmScj04kA1oo6MeC/lTJcrQxjNW1OXjas9dkxb1jZYd5AnIS4OIbrUq2Wj7HY
	QRTnxHJp/10op6H91hSGQa4DXrWemNW7F+kaML4NixIVFK3qPhdy0QFrnd6ujoFO2BK0dN9Vc0y4N
	iUO9ZjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Wao-0000000F6Zq-1DzT;
	Tue, 14 Oct 2025 04:24:58 +0000
Received: from [195.187.100.5] (helo=ni.piap.pl)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Waj-0000000F6Z7-2Si5;
	Tue, 14 Oct 2025 04:24:56 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 13FA2C3EEAC9;
	Tue, 14 Oct 2025 06:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 13FA2C3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,  Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Hans Verkuil <hverkuil@kernel.org>,  Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>,  Leon Luo <leonl@leopardimaging.com>,
  Kieran Bingham <kieran.bingham@ideasonboard.com>,  Jacopo Mondi
 <jacopo+renesas@jmondi.org>,  Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,  Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>,  Niklas =?utf-8?Q?S=C3=B6der?=
 =?utf-8?Q?lund?=
 <niklas.soderlund+renesas@ragnatech.se>,  Julien Massot
 <julien.massot@collabora.com>,  Jacopo Mondi <jacopo@jmondi.org>,  Daniel
 Scally <djrscally@gmail.com>,  Dave Stevenson
 <dave.stevenson@raspberrypi.com>,  Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>,  Sylvain Petinot
 <sylvain.petinot@foss.st.com>,  Yong Zhi <yong.zhi@intel.com>,  Bingbu Cao
 <bingbu.cao@intel.com>,  Tianshu Qiu <tian.shu.qiu@intel.com>,  Tiffany
 Lin <tiffany.lin@mediatek.com>,  Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>,  Yunfei Dong <yunfei.dong@mediatek.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Rui Miguel Silva
 <rmfrfs@gmail.com>,  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Martin Kepplinger <martink@posteo.de>,  Purism Kernel Team
 <kernel@puri.sm>,  Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Dafna
 Hirschfeld <dafna@fastmail.com>,  Heiko Stuebner <heiko@sntech.de>,
  Sylwester Nawrocki <s.nawrocki@samsung.com>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Alim Akhtar <alim.akhtar@samsung.com>,  Yemike
 Abhilash Chandra <y-abhilashchandra@ti.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  linux-input@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-media@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  imx@lists.linux.dev,
  linux-renesas-soc@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-samsung-soc@vger.kernel.org,  linux-staging@lists.linux.dev
Subject: Re: [PATCH 05/32] media: ar0521: Use %pe format specifier
In-Reply-To: <20251013-ptr_err-v1-5-2c5efbd82952@chromium.org> (Ricardo
	Ribalda's message of "Mon, 13 Oct 2025 14:14:45 +0000")
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
	<20251013-ptr_err-v1-5-2c5efbd82952@chromium.org>
Date: Tue, 14 Oct 2025 06:24:43 +0200
Message-ID: <m3ldlertys.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_212453_810005_5BFC2BE4 
X-CRM114-Status: GOOD (  10.38  )
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

Ricardo Ribalda <ribalda@chromium.org> writes:

> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR()
>
> This patch fixes this cocci report:
> ./i2c/ar0521.c:1113:31-38: WARNING: Consider using %pe to print PTR_ERR()
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks,
Acked-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -1109,8 +1109,8 @@ static int ar0521_probe(struct i2c_client *client)
>                                                 ar0521_supply_names[cnt]);
>
>                 if (IS_ERR(supply)) {
> -                       dev_info(dev, "no %s regulator found: %li\n",
> -                                ar0521_supply_names[cnt], PTR_ERR(supply=
));
> +                       dev_info(dev, "no %s regulator found: %pe\n",
> +                                ar0521_supply_names[cnt], supply);
>                         return PTR_ERR(supply);
>                 }
>                 sensor->supplies[cnt] =3D supply;

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

