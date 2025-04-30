Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D73AC3ABA9
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Apr 2025 11:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCqPYAYDeSC4T6gsM+8/d4/R4hTjtWts9K3/InF+2yg=; b=OrAY3hz1sMbDopdIz09Fr8zzNN
	AjC/8FVof7nhRMrLqWmvZfagN6O9HukNPwBFpurqoFOr2BULE5qKABp93YjapDnaR3pgL8skuQq4d
	lTzUbEUB2aUCkvJCya4ccCp7EREi8v9xWXxPTqPWLxngWmZIalFqRRbXma6WDCJTc7PATpt1+o2UQ
	RNG+AmXZclWGKhzgGuwFBebX6da+DCEgZOKnvUcm4XCShY6i+VR6RgJrRse42ba8N/shMZVF91NgP
	PXjN0HCOmcFV892V3P+oOqrdW2h38qlVSt9N3jxlXVos7PJGXFN2jW/jeP2ToGowBW8En/jecG+PN
	7hYEcg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5ep-0000000Cgxo-3DAN;
	Wed, 30 Apr 2025 11:31:19 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4oJ-0000000CYSe-3lW6;
	Wed, 30 Apr 2025 10:37:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59B1343155;
	Wed, 30 Apr 2025 10:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746009420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HCqPYAYDeSC4T6gsM+8/d4/R4hTjtWts9K3/InF+2yg=;
	b=j5IGpt96m3GS1GgdAQYb0DMF9BS9VJKNh0+D/2DDE2MQcbaP8QshRiOSUeBtDIq10LHfcK
	da6Rz6IPzqh72skLr3qzo8sCS1PQhKF2edPzJp4eG6QBBwrh5nrxL51ckveG3zavYd3qUP
	J2jx1+yN1XlBcUb/xgzlUVBCN3TYadasJXfR27IzS3EZ5METDQ7Zoy8F1/pK4SrZPTMcLs
	EeISxDq5NZi4vcUbvqFr2+DghQmkq4QWjiUcMCuSrjLoJhKePJalZDcGyOqVuDEsI237bq
	COMqwTuYqRY83cpYZO0vAcYqKCUzKgW8Qg5QF6JVH87BqsDr4JvKUr2eOLVdmQ==
Date: Wed, 30 Apr 2025 12:36:51 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: <Manikandan.M@microchip.com>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <jagan@amarulasolutions.com>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <dianders@chromium.org>, <chunkuang.hu@kernel.org>,
 <krzk@kernel.org>, <asrivats@redhat.com>, <paulk@sys-base.io>,
 <lumag@kernel.org>, <Hui.Pu@gehealthcare.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <asahi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <chrome-platform@lists.linux.dev>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <aford173@gmail.com>,
 <adrien.grassein@gmail.com>, <amishin@t-argos.ru>,
 <andy.yan@rock-chips.com>, <angelogioacchino.delregno@collabora.com>,
 <bleung@chromium.org>, <biju.das.jz@bp.renesas.com>,
 <chf.fritz@googlemail.com>, <cristian.ciocaltea@collabora.com>,
 <detlev.casanova@collabora.com>, <Dharma.B@microchip.com>,
 <groeck@chromium.org>, <heiko@sntech.de>, <jani.nikula@intel.com>,
 <j@jannau.net>, <jbrunet@baylibre.com>, <jesseevg@gmail.com>,
 <khilman@baylibre.com>, <kieran.bingham+renesas@ideasonboard.com>,
 <victor.liu@nxp.com>, <martin.blumenstingl@googlemail.com>,
 <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>, <ple@baylibre.com>,
 <fnkl.kernel@gmail.com>, <sugar.zhang@rock-chips.com>,
 <sui.jingfeng@linux.dev>, <tomi.valkeinen+renesas@ideasonboard.com>,
 <mordan@ispras.ru>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <20250430123651.37be3e38@booty>
In-Reply-To: <e90b9ef2-ace0-4b98-9d49-5a62e529cf8a@microchip.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
	<20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
	<e90b9ef2-ace0-4b98-9d49-5a62e529cf8a@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeigeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeikedprhgtphhtthhopeforghnihhkrghnuggrnhdrofesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_033704_074322_9C7483AA 
X-CRM114-Status: GOOD (  13.25  )
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

Hello Manikandan,

On Wed, 30 Apr 2025 09:42:16 +0000
<Manikandan.M@microchip.com> wrote:

[...]

> > diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
> > index 1d4ae0097df847d9f93c79eecff0c4587ae331ba..9f4ff82bc6b49010f8727da3b367f5a744a28edc 100644
> > --- a/drivers/gpu/drm/bridge/microchip-lvds.c
> > +++ b/drivers/gpu/drm/bridge/microchip-lvds.c
> > @@ -157,9 +157,10 @@ static int mchp_lvds_probe(struct platform_device *pdev)
> >          if (!dev->of_node)
> >                  return -ENODEV;
> > 
> > -       lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
> > -       if (!lvds)
> > -               return -ENOMEM;
> > +       lvds = devm_drm_bridge_alloc(&pdev->dev, struct mchp_lvds, bridge,
> > +                                    &mchp_lvds_bridge_funcs);
> > +       if (IS_ERR(lvds))
> > +               return PTR_ERR(lvds);
> > 
> >          lvds->dev = dev;
> > 
> > @@ -192,7 +193,6 @@ static int mchp_lvds_probe(struct platform_device *pdev)
> > 
> >          lvds->bridge.of_node = dev->of_node;
> >          lvds->bridge.type = DRM_MODE_CONNECTOR_LVDS;
> > -       lvds->bridge.funcs = &mchp_lvds_bridge_funcs;
> > 
> >          dev_set_drvdata(dev, lvds);
> >          ret = devm_pm_runtime_enable(dev);  
> 
> Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Thanks for reviewing!

In v3 this patch will be slightly different from v2. See the reply I
just sent to Doug for the details.

If your Reviewed-by tag refers only to the microchip-lvds driver, for
which there will be no change in v3, I think it's correct to take your
tag and add a comment like:

 Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com> # microchip-lvds.c

Anything against this?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

