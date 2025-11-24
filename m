Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6B3CFA466
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Nov 2025 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+QBWKtawqpPzZu9LPDyPm5gsgmOzV7hJRZ5Ebshggc=; b=m9tOY1qVxr0LME/58Cuc0z28W5
	SfoA1Nc7TS1nSXW2cZjrnixANnGer2xv+MbGKUdhTp8bAMckn4qibS+Q/xrAYScAgJcQ3GOF+pqVv
	IK5/IZq/bbtRvMMfO36nEzqnAstzNPbuEiQBET4m/Y+Lh2JlFXzLiYuU3LiqkTbhdBAyyKEi8aHPG
	g1gRKBxW4XnI1EdRKGOb+uMbtd8foYbhGOyP/I2lNXu0df+N1TzBehnqHBPEctX2x5LGJXkhoRcVN
	P7wOg9EcdGnREmawCrzDPTctzDN3vSFtO5uE3We7go6dm66ftpIbDVuJcDjELtKdEql2qULoTx5wa
	BM7uWzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZ29-0000000BxqD-1wno;
	Mon, 24 Nov 2025 16:03:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZ26-0000000BxpD-2onv
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Nov 2025 16:03:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 632914E418A2;
	Mon, 24 Nov 2025 16:03:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2CA36606FC;
	Mon, 24 Nov 2025 16:03:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4CDF10371A40;
	Mon, 24 Nov 2025 17:03:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764000193; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p+QBWKtawqpPzZu9LPDyPm5gsgmOzV7hJRZ5Ebshggc=;
	b=cc20tvebhyskRFsehgbMDtN58mFWJzw3+meTYMQYXrWdpw5VV3uKvGIpPD9HS8R83EmRZH
	qALe8e5UUI6C7MJXNERyWBLmNk5WfzKKvn8Wss/BPa1OVvmct7arm5zW27QDKgInGVcz6k
	oi6j2QLmL3GbqobdqI1pyE5V0TLsDjFvq2MBjZC1AlbLsk1PMdr+v727PXLGHuuUayjymh
	vV+Lgfi2eIyHigvvg8KiU75iRe8JFjVl6qwYhTFrQuO5g/Z240s/dFBsN/mdGefIWxxz3z
	LHntkwUmsv/8hiteqTu/SKAu006LhE9TFbOO34cMGYjkq2/kVuVeteyUjoVDQw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 17:03:00 +0100
Message-Id: <DEH1VJUEJ8HQ.MIS45UOLCPXL@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 01/26] drm/bridge: add drm_of_find_bridge()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>, "Alexey Brodkin"
 <abrodkin@synopsys.com>, "Phong LE" <ple@baylibre.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Anitha Chrisanthus"
 <anitha.chrisanthus@intel.com>, "Edmund Dea" <edmund.j.dea@intel.com>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com> <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com> <pv56bl4p7lfflloocozxaeufd6udkk3jhehrtne65cidrvlfwn@wvrkw6mjmhwp>
In-Reply-To: <pv56bl4p7lfflloocozxaeufd6udkk3jhehrtne65cidrvlfwn@wvrkw6mjmhwp>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_080318_837980_2D90A780 
X-CRM114-Status: GOOD (  13.45  )
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

Hello Maxime,

On Mon Nov 24, 2025 at 11:15 AM CET, Maxime Ripard wrote:
> Hi,
>
> On Wed, Nov 19, 2025 at 02:05:32PM +0100, Luca Ceresoli wrote:
>>  #ifdef CONFIG_OF
>> +/**
>> + * drm_of_find_bridge - find the bridge corresponding to the device nod=
e in
>> + *			the global bridge list
>> + * @np: device node
>> + *
>> + * The refcount of the returned bridge is incremented. Use drm_bridge_p=
ut()
>> + * when done with it.
>> + *
>> + * RETURNS:
>> + * drm_bridge control struct on success, NULL on failure
>> + */
>> +struct drm_bridge *drm_of_find_bridge(struct device_node *np)
>
> So the convention we've mostly had was that the first argument would
> define the prefix, ie. if we pass a drm_* pointer, the prefix is drm, if
> we pass a device_node pointer, then the prefix is of.
>
> Considering that convention, of_drm_find_bridge would be the ideal
> candidate, but we can't use that obviously. What about
> of_drm_find_and_get_bridge, or of_drm_get_bridge?

Ah, it sounded the other way around during the old discussion [0]. :-) But
no problem in using a different name of course. of_drm_get_bridge() looks
like the best to me, so I'll rename that way in v2.

[0] https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad=
@houat/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

