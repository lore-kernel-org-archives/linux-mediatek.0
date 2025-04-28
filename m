Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F14DC369D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/KM50XoeWonitoxoMaOHFeoOtZjamWkVO4Sfztxz2s=; b=SvpY8Jw8dhX4vQ6Z19/ABz3Ech
	9TMwU54S1JLmp7ypHx2K7mXgeT5ovw8Z5rVhPFAxb8VOFDCJSRpasVgv0K0koYE9NDDa7+B7FNCyz
	B8g79duKi1U/3r95oh4nnfUMehHFoiUbJ6sRwZUhjJatz7wvjt2yWEs+isE66jIv4Gta1SEyjCa1E
	A2uey9sIGhgxjCpZCFg5oRmeZQ153TSm92U+6LNtI5GavrmSO+n1x6I2S9mt//HkXBbVNwMtAEt1c
	fPrnTaf/bHYHIc9pMQZu7/YC6v63Gn5xngeLKpS1YEW6eeAYg1vgFIr2ymTfHv3SPMLJoKlCiX6Ps
	4CvaIQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Q0g-00000006i2k-0E2t;
	Mon, 28 Apr 2025 15:03:06 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Pyk-00000006hmE-0Y8Q;
	Mon, 28 Apr 2025 15:01:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F84F4397F;
	Mon, 28 Apr 2025 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745852455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l/KM50XoeWonitoxoMaOHFeoOtZjamWkVO4Sfztxz2s=;
	b=cTAHqyDfWqZQRajnA0jCJJTRWgntMZ9qCGKU473NOxESwutCLvKkGP9L3GMlUIUf1TVfoJ
	rSml0e13bS9W5xL7vpWnRG/Gf8DwWyNIkXZ07glmnEui2hZC2Xoq/8/xjrvJp5r3ePSFuU
	njtoTq8LUpcrENa9NLXi3tWAr4COusan12TyNUvMZQZfaHrdfuVf/DcDoxsqC3HUZd6Oxa
	xFrGUT/PhDw09LZJgn+fTcnrJMlbI4kHX39u8mbqL16gwmh6HE2DuFmuNLvVbhBpuVI1WK
	hOs5l7kG8ZpIdaFhDwnEIRvdHjqsZaRpzN9lTpgipOlJKjv7cuiqF1qRk9Zf2g==
Date: Mon, 28 Apr 2025 17:00:45 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Andy Yan" <andyshrk@163.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Douglas
 Anderson" <dianders@chromium.org>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "Paul Kocialkowski" <paulk@sys-base.io>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 "Adam Ford" <aford173@gmail.com>, "Adrien Grassein"
 <adrien.grassein@gmail.com>, "Aleksandr Mishin" <amishin@t-argos.ru>, "Andy
 Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Benson Leung"
 <bleung@chromium.org>, "Biju Das" <biju.das.jz@bp.renesas.com>, "Christoph
 Fritz" <chf.fritz@googlemail.com>, "Cristian Ciocaltea"
 <cristian.ciocaltea@collabora.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Dharma Balasubiramani"
 <dharma.b@microchip.com>, "Guenter Roeck" <groeck@chromium.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Jani Nikula" <jani.nikula@intel.com>, "Janne
 Grunau" <j@jannau.net>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jesse Van
 Gavere" <jesseevg@gmail.com>, "Kevin Hilman" <khilman@baylibre.com>,
 "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Manikandan Muralidharan"
 <manikandan.m@microchip.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Sasha Finkelstein" <fnkl.kernel@gmail.com>, "Sugar
 Zhang" <sugar.zhang@rock-chips.com>, "Sui Jingfeng"
 <sui.jingfeng@linux.dev>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Vitalii Mordan"
 <mordan@ispras.ru>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <20250428170045.5ca315ce@booty>
In-Reply-To: <656e493e.a551.1967c6d0c53.Coremail.andyshrk@163.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
	<20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
	<656e493e.a551.1967c6d0c53.Coremail.andyshrk@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepieelpdhrtghpthhtoheprghnugihshhhrhhkseduieefrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_080106_955251_A97B4270 
X-CRM114-Status: GOOD (  13.82  )
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

Hallo Andy,

On Mon, 28 Apr 2025 20:44:03 +0800 (CST)
"Andy Yan" <andyshrk@163.com> wrote:

> Hi ,
> 
> At 2025-04-25 02:59:08, "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
> >devm_drm_bridge_alloc() is the new API to be used for allocating (and
> >partially initializing) a private driver struct embedding a struct
> >drm_bridge.
> >
> >For many drivers having a simple code flow in the probe function, this
> >commit does a mass conversion automatically with the following semantic
> >patch. The changes have been reviewed manually for correctness as well as
> >to find any false positives.
> >
> >  @@
> >  type T;
> >  identifier C;
> >  identifier BR;
> >  expression DEV;
> >  expression FUNCS;
> >  @@
> >  -T *C;
> >  +T *C;
> >   ...
> >  (
> >  -C = devm_kzalloc(DEV, ...);
> >  -if (!C)
> >  -    return -ENOMEM;
> >  +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
> >  +if (IS_ERR(C))
> >  +     return PTR_ERR(C);
> >  |
> >  -C = devm_kzalloc(DEV, ...);
> >  -if (!C)
> >  -    return ERR_PTR(-ENOMEM);
> >  +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
> >  +if (IS_ERR(C))
> >  +     return PTR_ERR(C);
> >  )
> >   ...
> >  -C->BR.funcs = FUNCS;
> >
> >Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

[...]

> >diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >index 5e5f8c2f95be1f5c4633f1093b17a00f9425bb37..9b1dfdb5e7ee528c876c01916c9821d550cad679 100644
> >--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >@@ -1045,9 +1045,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
> > 		return ERR_PTR(-ENODEV);
> > 	}
> > 
> >-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> >-	if (!hdmi)
> >-		return ERR_PTR(-ENOMEM);
> >+	hdmi = devm_drm_bridge_alloc(dev, struct dw_hdmi_qp, bridge,
> >+				     &dw_hdmi_qp_bridge_funcs);
> >+	if (IS_ERR(hdmi))
> >+		return PTR_ERR(hdmi);  
> 
>            This should return hdmi or ERR_CAST(hdmi);

Indeed, thanks!

My coccinelle patch is clearly not clever enough. I'll see whether I
can fix it, otherwise I'll handle these 3 special cases manually, along
with another similar one (imx/imx-legacy-bridge.c) I just spotted after
your report.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

