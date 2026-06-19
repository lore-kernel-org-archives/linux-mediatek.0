Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1336CD98F2
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRl+p8NKZ4Uqi2DbJxfA0N/bImQMn69IfQP2gWfdIn0=; b=cbWeFNpHV3i+/I3if2WZXGbDRu
	1yjTIXc2pQLuYLVvhtwDTknF/4m1w8iDpyRbyGYdzHJ5EPWRUZj/b8eJJ4jN+Q9YetJ7D/r+wrYXt
	7x/fx2TpemIf63YMzcK5i4Dsc9CRd3coC9B3Trz2SwbiEK14xImd9ukFuaRfcHE4Z+KdyzpIbMp5W
	DgQ53OoBmHeaa+hIr+lVZqTjO0xOBhR9csXw1buQ9yd+PkleJbV65px/3osh3tlsvI+8QnEV1IAXc
	ry0g7ykL24neSF+vOULjt/2dM1gh6UoIsIdHjovA8Z12pdJGff4pIvTttOuoeU5Sj8+zQpYc07lnp
	+ritKLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waciF-00000002oFy-02yp;
	Fri, 19 Jun 2026 17:09:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waciB-00000002oF4-0XFY
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jun 2026 17:09:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BD524C2BB20;
	Fri, 19 Jun 2026 17:09:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB24A601B7;
	Fri, 19 Jun 2026 17:08:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABDCB106C81BC;
	Fri, 19 Jun 2026 19:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781888933; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mRl+p8NKZ4Uqi2DbJxfA0N/bImQMn69IfQP2gWfdIn0=;
	b=GtrXlAr82THdxC+x0ULzqK2LukzejYV/HHoWOhy0rnLT9OCpYYx7DI0Ca2otXI9MC6rt/O
	PsvsTGMeYR1QQyMhXODXb0bsnVpo8b1AJ5+BgWuRE1TXpWDRyaaCCbnZP5H1KaZxDHKOq8
	LO9lu7HAld9YGGFAMtt1mZ3JVL+4nqR9ev+P20IAsV/TdprJ6Y3Ojqy3AdzA+jesc0ToOp
	juIU32H7fFGeN2OVgc7cbk8rehCcARkdf3oE9Mh7qI0ISz6SprChxJjgB103aMMhEs3RCn
	air8p6ZpJxAcff89Au6uOVPjVLW7KZvMw6SPD2Zm3W+p1HNv5XsA8iGWnatxuQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Jun 2026 19:08:35 +0200
Message-Id: <DJD6WITJWQHS.1XR1LK4S8N5H5@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 00/78] drm/bridge: Convert all reset users to
 create_state
Cc: "Dmitry Baryshkov" <lumag@kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Liu Ying" <victor.liu@nxp.com>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Phong LE" <ple@baylibre.com>, "Douglas
 Anderson" <dianders@chromium.org>, "Inki Dae" <inki.dae@samsung.com>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Cercueil" <paul@crapouillou.net>,
 <linux-mips@vger.kernel.org>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Kevin Hilman" <khilman@baylibre.com>, "Jerome Brunet"
 <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, <linux-amlogic@lists.infradead.org>,
 "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>,
 <linux-renesas-soc@vger.kernel.org>, "Biju Das"
 <biju.das.jz@bp.renesas.com>, "Heiko Stuebner" <heiko@sntech.de>, "Sandy
 Huang" <hjc@rock-chips.com>, <linux-rockchip@lists.infradead.org>, "Yannick
 Fertre" <yannick.fertre@foss.st.com>, "Raphael Gallais-Pou"
 <raphael.gallais-pou@foss.st.com>, "Philippe Cornu"
 <philippe.cornu@foss.st.com>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Dave Stevenson"
 <dave.stevenson@raspberrypi.com>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Icenowy Zheng" <zhengxingda@iscas.ac.cn>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Michal Simek"
 <michal.simek@amd.com>
X-Mailer: aerc 0.21.0
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
 <DJD2IQSFENH4.337VSFOU7OJ29@bootlin.com>
In-Reply-To: <DJD2IQSFENH4.337VSFOU7OJ29@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_100859_358276_4B4555A3 
X-CRM114-Status: UNSURE (   6.62  )
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

On Fri Jun 19, 2026 at 3:42 PM CEST, Luca Ceresoli wrote:
> On Fri Jun 19, 2026 at 2:24 PM CEST, Maxime Ripard wrote:
>> Hi,
>>
>> All the bridges use reset to create a blank state only and don't use it
>> to reset the hardware at all. This is what the new atomic_create_state
>> is exactly supposed to be doing, so we can convert all existing bridge
>> users to it, and remove the reset hook and helpers.
>>
>> Let me know what you think,
>> Maxime
>>
>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> Whole series:
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

And now also:
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # imx8mp + sn65dsi84 +=
 bridge hotplug

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

