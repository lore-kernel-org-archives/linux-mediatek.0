Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F25C54ED1
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 May 2025 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ls+q14bBbKBSSH85R41btg1RBJN5OvsL+OQ1fnPsL30=; b=oS3Da9GIEqxyRcx+wykEJcpod4
	L4DXg9GFq2Oa08/GC1Rff18nDvPjR1yZfEt6KAn0bc7yfNhIH7RtWe5GLMchWazzmoXC4yRMe+1ni
	tV1iGCB98fZ7xU4aRNE2emmxs/uJSxp/Ec53cn7mKzdbtd0h1SfZnnP5SrUDE1fEHHGKEPl5husup
	B28YYm87MnxAigx2UgsVJNEhrnLVAIx2pWslm9oYVMA9RdSamGNgqK/ToeSDb1vX4fbpoD4lfW9C6
	2bQXOAK9F3PDblZEtXm0igvBM2nsfW5SHWhcYEcznbntFtnJRgEqcb8jUOC6o98CsS2dJJw6KvOsH
	+p+a8Npg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJqdq-0000000ANfl-2a6E;
	Tue, 27 May 2025 09:30:38 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJqay-0000000AN7Z-2oA3;
	Tue, 27 May 2025 09:27:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 644551FD55;
	Tue, 27 May 2025 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748338055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ls+q14bBbKBSSH85R41btg1RBJN5OvsL+OQ1fnPsL30=;
	b=F8TaetyG1KRkwdnwsGP+2qn6/oOFTSaXtxLSp1w6jLX2vUC+84mLp/SeHOXMt13CrWyC5W
	5bpnUZ9ug8+YA0tkdAR6pVm2ZJU/Qfi3OLCF2F1polb7s1EuevM1diZZ7GTuzCUIXBf3pi
	NvnhXgJbEHpgWp55tKzp2Am3UoGGp75fHqkQPN/Roi5uIDraDxq70Yk0LMC0+kYZ3wL7J9
	yFyBZVyQKT9FIYeb9ztqRSDKGM4z1kkfgLjQjDx5Y0H8d3ViXjd/22DHx59KoB/kYDgZIy
	rDw0mKraSYVVaJ3uwKF3DldpjbWcRDW9Cei3KMUad2AnCYmjoiJXRVDAw9X1DA==
Date: Tue, 27 May 2025 11:27:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Adam Ford <aford173@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
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
 Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui
 Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Manikandan Muralidharan
 <manikandan.m@microchip.com>, Adrien Grassein <adrien.grassein@gmail.com>,
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
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying
 <victor.liu@nxp.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Phong LE
 <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang
 <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan
 <mordan@ispras.ru>
Subject: Re: [PATCH v3 02/22] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <20250527112725.3736e415@booty>
In-Reply-To: <CAHCN7xLPxmaZcOESvaU2W1gX4o1z-1A_atq4jZdrpAH5Wmht+g@mail.gmail.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
	<20250509-drm-bridge-convert-to-alloc-api-v3-2-b8bc1f16d7aa@bootlin.com>
	<CAHCN7xLPxmaZcOESvaU2W1gX4o1z-1A_atq4jZdrpAH5Wmht+g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtddtvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeikedprhgtphhtthhopegrfhhorhguudejfeesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhto
 hepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_022740_848777_0116F498 
X-CRM114-Status: UNSURE (   8.46  )
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

Hello Adam,

On Sun, 25 May 2025 14:40:46 -0500
Adam Ford <aford173@gmail.com> wrote:

> For: imx8mp-hdmi-pvi.c and adv7511_drv.c
> 
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit

Thanks for your testing, on the v1 as well!

Sadly your Tested-by tag won't be in the commit because the patch had
already been applied, but it is useful per se, and in the records
anyway.

Kind regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

