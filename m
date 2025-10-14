Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0BECCD184
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Oct 2025 07:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2ao7yOlmXtTR+gAWOXEYdjwi7rdtHCkxzZCJ5XFR9E=; b=3XtU3dEvW5y35BtoNs3EAF6cQJ
	d1OV7gJ1PVLAqdMcNv/K+Jbum5uV0zje6cHv857pTxJrp2WAvAQIWzySCtd4wK/VpSsgC78z40LNq
	PfOwrNCKYephxigvwenr7zlYXRiz167ERGWhoFXRf1NqBu0ldUBRB5xP5cWbbYZpFHr89ZWLoHCEU
	jaOmA8D0Ta4V9xiCZtcMiC/Uug3ytW7Nw2unW2fg9k+7ZSmSwf4PCmGKJO0z1MB/KhIbTeufci8ef
	KBE6gZ1PTlBWnCT+AXaEn5TQefSXXN/POpr1wW1LntDnQSLRjUruDLx4SH6qzPQBQiPixC77RhBBO
	hjgaMR8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Z7r-0000000FOzo-1xTY;
	Tue, 14 Oct 2025 07:07:15 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Z7o-0000000FOyi-2MzG
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Oct 2025 07:07:14 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 015F3240028
	for <linux-mediatek@lists.infradead.org>; Tue, 14 Oct 2025 09:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1760425628; bh=m2ao7yOlmXtTR+gAWOXEYdjwi7rdtHCkxzZCJ5XFR9E=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=iGohrgTaUHe7PR+MwDgFxlKm8I4ZxkhKy/OBhk6ZDQCWh2Gq+zlxsMgB6o2QUEA/D
	 1ioE1BodqUpgNdKVrXwgNOs93gp2baHiGE0L16sW5bOw5lm2QID/oZz6PZD2jsKWeG
	 oHTNW6ycLVCJutGFVexQ6lQhRXmUbtV39VuDkyzMN/fKe/dHHiiIr7wCmi/jOjQ4BD
	 1r9SF7vdLrbW8T3JPizwKZrUV/HyfWbtbagly7DN+2HTsVuH8yXIjO3he2G4KF/MeQ
	 sW0RI/+mT5ZP+3m6bhuZuqR9x1XSbNpfFcvKg3QCFASKeCdtN0wQnRCvor5A9j6Xn7
	 HBDts5WcqeKjw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cm4yp6z2Tz9rxR;
	Tue, 14 Oct 2025 09:06:58 +0200 (CEST)
Message-ID: <f30b137685be9148e69f18065d811d011bfe3409.camel@posteo.de>
Subject: Re: [PATCH 25/32] media: imx8mq-mipi-csi2: Use %pe format specifier
From: Martin Kepplinger-Novakovic <martink@posteo.de>
To: Ricardo Ribalda <ribalda@chromium.org>, Linus Walleij	
 <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@kernel.org>, Sakari Ailus	 <sakari.ailus@linux.intel.com>,
 Krzysztof =?UTF-8?Q?Ha=C5=82asa?=	 <khalasa@piap.pl>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Leon Luo	 <leonl@leopardimaging.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,  Jacopo Mondi
 <jacopo+renesas@jmondi.org>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,  Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund+renesas@ragnatech.se>,
 Julien Massot	 <julien.massot@collabora.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Daniel Scally	 <djrscally@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>,  Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Sylvain Petinot
 <sylvain.petinot@foss.st.com>, Yong Zhi	 <yong.zhi@intel.com>, Bingbu Cao
 <bingbu.cao@intel.com>, Tianshu Qiu	 <tian.shu.qiu@intel.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Rui Miguel Silva
 <rmfrfs@gmail.com>,  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Purism Kernel Team <kernel@puri.sm>, Shawn Guo	 <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Dafna
 Hirschfeld	 <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Sylwester Nawrocki	 <s.nawrocki@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Yemike Abhilash
 Chandra <y-abhilashchandra@ti.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Date: Tue, 14 Oct 2025 07:07:05 +0000
In-Reply-To: <20251013-ptr_err-v1-25-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
	 <20251013-ptr_err-v1-25-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_000712_871201_10672B47 
X-CRM114-Status: GOOD (  12.89  )
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

Am Montag, dem 13.10.2025 um 14:15 +0000 schrieb Ricardo Ribalda:
> The %pe format specifier is designed to print error pointers. It
> prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
>=20
> This patch fixes this cocci report:
> ./platform/nxp/imx8mq-mipi-csi2.c:422:23-30: WARNING: Consider using
> %pe to print PTR_ERR()
>=20
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> =C2=A0drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index
> 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..d333ff43539f061b8b9cf88af2c
> da8c44b3ec2a9 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -418,8 +418,8 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct
> csi_state *state,
> =C2=A0
> =C2=A0	src_pad =3D media_entity_remote_source_pad_unique(&sd_state-
> >sd->entity);
> =C2=A0	if (IS_ERR(src_pad)) {
> -		dev_err(state->dev, "can't get source pad of %s
> (%ld)\n",
> -			sd_state->sd->name, PTR_ERR(src_pad));
> +		dev_err(state->dev, "can't get source pad of %s
> (%pe)\n",
> +			sd_state->sd->name, src_pad);
> =C2=A0		return PTR_ERR(src_pad);
> =C2=A0	}
> =C2=A0

Reviewed-by: Martin Kepplinger-Novakovic <martink@posteo.de>

thanks you,

                             martin

