Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485FCC54ED0
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 May 2025 14:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyPpXbcuqSIPDBMFEqspo4iXigHvW7uXfydpRN7Xbhk=; b=ZAM45y27090qbJth5u7VDvJcJ4
	2YnInh32+8Vq/ZvxUYW0zSKtgW6E9f0psPVhlF9iA3WfPDgB3V+/M4nBw2f4NRuWCs9YrvRXqbP3L
	d3TBZ2UPxIfSK8bwqtUIXiKlNuEezZLdiZk+eJBoC1jqv/xregUiS2mBZ0nVgXUphlqQRaYGH9lND
	BukGmu6VJw4A0iqEwpwzZ9AWepcT440rMJ+dUzti1wGeyBiaqO5Lpgg1VTH+gx1bUgSuN9cR6MqVJ
	NoBvUQsqlQz1ZnydoPzhi2HhZyjTkU3XcwWJW8yZPXLMWkvgxVUeY/q1tpz7dGYVBMP5vh9Ugre0C
	hsllqYsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkTy-0000000G7Ig-1Zjx;
	Wed, 21 May 2025 14:31:46 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkL4-0000000G5uM-3gSN;
	Wed, 21 May 2025 14:22:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FD7443B3F;
	Wed, 21 May 2025 14:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747837350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vyPpXbcuqSIPDBMFEqspo4iXigHvW7uXfydpRN7Xbhk=;
	b=fYSLMVVsQYfpq0UfcQjtXHhEeq5bfCS6ZfFtSy9WALjrRzfOI1oCmQiRh9/p/2Tov1lqL6
	6hd7ysvk/ltTNuZ3CAlJ8hxNJb1U4hh9oDe0vFEV7Qmtyyl2jnGS6vHAh+CJjT02k5hPnx
	/8mrP78Ua2u8o332sEOuGFEL01a6KTHTgbKtJYOaO92+nm28+YzX+fKLT5azjlVWA6wd7P
	QGZK2iH33WbGHOFi2Bk+4Ix+bA6ASPEQH4bi0kJlvRry4ViIVwFyHbkOYow1fiiPEcPty3
	9UYIHe6MjbBN6AI7Wu+J/2jCVZHKny42qJOnl6aqWr/VeHDBSzrL8xxwzk+UAA==
Date: Wed, 21 May 2025 16:22:16 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Liu Ying <victor.liu@nxp.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski
 <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Louis Chauvet <louis.chauvet@bootlin.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>, Adam Ford
 <aford173@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>,
 Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Christoph Fritz <chf.fritz@googlemail.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Dharma Balasubiramani
 <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, Heiko
 Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne
 Grunau <j@jannau.net>, Jerome Brunet <jbrunet@baylibre.com>, Jesse Van
 Gavere <jesseevg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Phong LE
 <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang
 <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan
 <mordan@ispras.ru>, "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan
 <yuanhsinte@chromium.org>, Pin-yen Lin <treapking@chromium.org>, Xin Ji
 <xji@analogixsemi.com>, Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Peter Senna Tschudin
 <peter.senna@gmail.com>, Helge Deller <deller@gmx.de>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Michal Simek
 <michal.simek@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <20250521162216.79dd3290@booty>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeffedtucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheelfeevlefgkeekvdffveehudeihfdtjefhieehgfejveduieffgffhjeejleevnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdhkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelhedprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhto
 hepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_072235_524295_68C16154 
X-CRM114-Status: GOOD (  21.65  )
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

Hello Maxime, Shawn, Liu, all,

On Fri, 09 May 2025 15:53:26 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a DRM
> bridge, and the only one supported from now on. It is the first milestone
> towards removal of bridges from a still existing DRM pipeline without
> use-after-free.

I applied on drm-misc-next patches 3-17,20-21 as they match all the
criteria:
 - At least a Acked-by (or R-by maintainers)
 - patch is for drm-misc

Being my very first commits to drm-misc, I tried to be careful, and
double checked all the patches with Louis (thanks!).

Here are the pending questions and plan for the remaining patches.

>       Revert "drm/exynos: mic: convert to devm_drm_bridge_alloc() API"

This reverts the commit applied my mistake:
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/91c5c7b5bb2dd09b43b025bce6d790d3c79f4518

Neither the  original patch nor the revert has been reviewed/acked.

As the commit was a mistake, I'm applying the revert by the end of this
week (i.e. on Friday) unless there are better instructions.

>       drm: convert many bridge drivers from devm_kzalloc() to devm_drm_bridge_alloc() API

This patch affects multiple drivers. Running get_maintainers.pl
points at Shawn Guo's repository. After reviewing the MAINTAINERS file,
this looks like due to the 'N:' line in:

ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
M:	Shawn Guo <shawnguo@kernel.org>
M:	Sascha Hauer <s.hauer@pengutronix.de>
R:	Pengutronix Kernel Team <kernel@pengutronix.de>
...
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
N:	imx
...

(https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAINTAINERS?ref_type=heads#L2511-2528)

Here 'imx' matches the 'drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c'
file that is touched by the patch. That regexp appears overly generic to me.

Shawn, can it be fixed by making it less generic?

If not, can we at least add a band-aid 'X:' entry for
drivers/gpu/drm/bridge/imx?

I think the other matching entry is the one to consider:

DRM DRIVERS FOR FREESCALE IMX BRIDGE
M:	Liu Ying <victor.liu@nxp.com>
L:	dri-devel@lists.freedesktop.org
S:	Maintained
F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
F:	drivers/gpu/drm/bridge/imx/

(https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAINTAINERS?ref_type=heads#L7940-7948)

However it does not list any trees. I _guess_ drm-misc applies here as
a fallback as well as common sense.

Liu, should this entry have a 'T:' line for drm/misc?

>       drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API

Not acked/reviewed, some discussion happened. I am resending it in v4,
possibly with updates based on the discussion.

But it has the same issue discussed above, with get_maintiners.pl
pointing at Shawn Guo's tree, so in the future I'm assuming this goes
to drm-misc unless there are news about that.

>       drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API

No feedback, resending in v4.

>       drm/todo: add entry to remove devm_drm_put_bridge()

This involves documentation maintained on another tree. Where should it
be applied? There are two matching entries in MAINTAINERS:

 * DRM DRIVERS -> the drm tree
 * DRM DRIVERS AND MISC GPU PATCHES -> the drm-misc tree

To me it looks like the second is obviously the closest match as we are
dealing with DRM bridges, so I'm applying this as well on Friday unless
there are better instructions.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

