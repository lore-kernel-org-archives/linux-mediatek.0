Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2A9C369D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Apr 2025 11:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sw7RZH8uXkQJtcp9eADpOTsFW7ewdwsHMspom6OVyU=; b=lp85oTiXt370L3C8ao/077dYwM
	JekamjLPyvtMDyRlppjSuE2nVzQgE3UYNKNau1td2swAJAbl7C5SyC1JFFimIDPopk6IRpElqp7fu
	SGWoRrSjg2Y9Qc+jr18G+GhCiz2HH7eyC5ewNvRjbLC7ETsCmb+CnK644JNwK3i2XGzn1jd3uez0a
	I8QMdTCMLOabGs1M58EaljR6tCy4vT0advmTFY773GOZZotUvWyO1K1uB6KukCat9ck03nHrxfNRQ
	5DEqbfdRNYRqmNedW1YbnoKMu986APtiImdPWo3HO0nqwk2gAJIfHJrNR9f3PrW3UEOzaLY/DW/ed
	En7qP12Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5eo-0000000CgxM-3h2N;
	Wed, 30 Apr 2025 11:31:19 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4nV-0000000CYGY-2znI;
	Wed, 30 Apr 2025 10:36:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60CEE43ACD;
	Wed, 30 Apr 2025 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746009368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0sw7RZH8uXkQJtcp9eADpOTsFW7ewdwsHMspom6OVyU=;
	b=DR1nbnNEQEtiK8PPunmQqt9W1Xj7ZM/jEiwqOCgctAmP0VwxUOGRIawDqTkf8B0IK00FRA
	e4YRU+HDhv339jGc70wzPfD5wJIMGOZJtq+wQedaruk9gGiAwI9R9yAa5wEOr9vk8kxdQw
	627rC9lZsSU3ZGLbq+C2PhsQX/bR8nvzOTRzyQl1Zf/PaIZdia9lZ4X9d0WZSkRsiJySZO
	jFC3GpXnaiJtMzeSlCkr4lePSMQaiv7ddSajpXS7HGtEJdO9rXgHadivnaO4qHOLV9Wyr8
	mkKsgPj/j0YjkWu1Zwp1VfbyGSF9BUtzw3Y3mrcjL4tz5tbBwc+HBbIC6E26rQ==
Date: Wed, 30 Apr 2025 12:35:57 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Anusha
 Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Adam Ford <aford173@gmail.com>, Adrien Grassein
 <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, Andy
 Yan <andy.yan@rock-chips.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benson Leung
 <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Christoph
 Fritz <chf.fritz@googlemail.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Dharma Balasubiramani
 <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, Heiko
 Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne
 Grunau <j@jannau.net>, Jerome Brunet <jbrunet@baylibre.com>, Jesse Van
 Gavere <jesseevg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying
 <victor.liu@nxp.com>, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Phong LE
 <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang
 <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan
 <mordan@ispras.ru>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <20250430123557.3d8b1de4@booty>
In-Reply-To: <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
	<20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
	<CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeigeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepieekpdhrtghpthhtohepughirghnuggvrhhssegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghru
 geskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_033615_170236_18E051F7 
X-CRM114-Status: GOOD (  10.28  )
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

Hello Doug,

On Mon, 28 Apr 2025 13:59:50 -0700
Doug Anderson <dianders@chromium.org> wrote:

[...]

> Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
> Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640

Thank you for your review!

However I'll be sending v3 with some differences w.r.t. v2, in order to
fix the 3 bugs reported by Andy Yan plus a similar one I spotted. The
fix just is replacing PTR_ERR() with ERR_CAST() in the 4 cases where the
involved function is returning a pointer instead of an int.

Your review/test tags appear global to the whole patch, thus being the
patch different I think I cannot include your tags in v3.

Let me know if you think I should do differently.

Sorry about that.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

