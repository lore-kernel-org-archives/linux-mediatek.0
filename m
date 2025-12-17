Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C486D64088
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Dec 2025 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujozvAR/egQa+0OwQ9Aeym97mJvVMjkPUclMUt6mE28=; b=ZT3oaTcDW1G5kCrCtBbThg1+vm
	p/2xTeM5uUcK0rcbAuWqyPi/RCQD8DWnalBjAwA5MMEwbsEsxe27pKXRGiicH+sdI6YlfWmCxSXj9
	G4KB4u6VkUY2Uj17OthZhzj1mS1e/AvqDJZfuGZbkdxePrsmXJDeb6r6DN6z4gxofzLhZwNi9K2x7
	j2uIVf1xwYrbod3QSZZ2EElDYqBe3bXTcdTCwiuMi/SJKP151c+R0Jw1SuZUnLSdgGkLLVa0mb/sD
	+p2w3SGP5iqwQmZ8iikuKrpu2o6Ung9ERtjrEqoFpLKr0rHarEH6o5BWO14AwnxwDmBmYpO/PQC5w
	AfYmNUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmhm-00000006KYO-3dcs;
	Wed, 17 Dec 2025 08:16:18 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmhi-00000006KXC-11i3;
	Wed, 17 Dec 2025 08:16:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 875FCC1A594;
	Wed, 17 Dec 2025 08:15:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E824A6072F;
	Wed, 17 Dec 2025 08:16:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B75111950295;
	Wed, 17 Dec 2025 09:15:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765959364; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ujozvAR/egQa+0OwQ9Aeym97mJvVMjkPUclMUt6mE28=;
	b=Ayn6HVBxPDFZQPsofDALTubSwQYYhWe28r/JxNzT2jwfqVPYB7L1I838PbDqUA2VUIhOqj
	T/p4Xd7+cEZfKoKVw2hurXHe5vkPMT19dkYgFzdXbeOY64a8mz9tBTIzqiLJh+GRQDwPsD
	VjAj9SUjWDu+mnsDdX0xgZ/mlF+pzcRkZRkq2CszNx2kC9Ltjs6UjvGcm1OTBOr2Np/bLn
	NV1CdrC5Y70iuSm3WZgQtjFIEPVbj0wIEJonCx4y0ASyFHkHSoAirTeo3ptVJUHuNJrcDq
	2uOgFYfMi01DRPjYnMRS09aqCaxaU09vJzqAbOE6JqfuzC65rEyPdzG9DDpNlg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 09:15:48 +0100
Message-Id: <DF0CCD6EW5DR.3CYNK65T1GSAO@bootlin.com>
Subject: Re: [PATCH v2 17/26] drm/meson: encoder_*: use
 devm_of_drm_get_bridge() to put the next bridge
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan
 Corbet" <corbet@lwn.net>, "Alexey Brodkin" <abrodkin@synopsys.com>, "Phong
 LE" <ple@baylibre.com>, "Liu Ying" <victor.liu@nxp.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Adrien Grassein" <adrien.grassein@gmail.com>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Anitha Chrisanthus" <anitha.chrisanthus@intel.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com> <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com> <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com> <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com> <CAFBinCBaXRNBHpY2uYy4FxyAOnRA4NxJtHbraG0=j_U6Dzz2=A@mail.gmail.com>
In-Reply-To: <CAFBinCBaXRNBHpY2uYy4FxyAOnRA4NxJtHbraG0=j_U6Dzz2=A@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_001614_795632_9D2A6FEB 
X-CRM114-Status: GOOD (  21.12  )
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

Hello Martin,

On Wed Dec 17, 2025 at 1:01 AM CET, Martin Blumenstingl wrote:
> Hi Luca,
>
> On Tue, Dec 16, 2025 at 1:46=E2=80=AFPM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
> [...]
>> > What I'm not sure about is how this series interacts with
>> > devm_drm_of_get_bridge() which is why I'm asking before cooking a
>> > patch.
>>
>> Apologies for the long delay in getting back to you. You might have noti=
ced
>> some discussion about the overall approach, and I waited for it to settl=
e.
> That hasn't gone unnoticed!
>
>> About devm_drm_of_get_bridge(), it is a very different function so it do=
es
>> not affect this series. The name similarity is confusing indeed, but
>> devm_of_drm_get_bridge() has been removed from my approach, so one less
>> source of confusion.
> I have to confess that I'm still confused. drivers/gpu/drm/drm_bridge.c s=
tates:
> "Display drivers are responsible for linking encoders with the first brid=
ge
>  in the chains. This is done by acquiring the appropriate bridge with
>  devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to=
 the
>  encoder with a call to drm_bridge_attach().
>
>  Bridges are responsible for linking themselves with the next bridge in t=
he
>  chain, if any. This is done the same way as for encoders, with the call =
to
>  drm_bridge_attach() occurring in the &drm_bridge_funcs.attach operation.=
"
> Does this mean your series effectively deprecates devm_drm_of_get_bridge(=
)?

Well spotted! I theory yes, my series kind of implicitly deprecates other
functions based on it, including drm_of_find_panel_or_bridge() and
*_of_get_bridge(), which are problematic in case of bridge removal. But
before explicitly deprecating them we need a good alternative. Which in
turn depends on the rework of the panel_bridge lifetime, which was also
discussed with Maxime in the same thread.

Bottom line: for now *_of_get_bridge() usage is still OK, but stay
tuned. :-)

>> I'm soon sending v3, and I have updated my patch to
>> eson_encoder_{cvbs,dsi,hdmi}.c, actually splitting it in 3. I'd be grate=
ful
>> if you could reviewd and/ot test them when I send v3. But I don't think
>> there is a need for you to send any patches related to this topic.
> Regardless of the questions I still have around
> devm_drm_of_get_bridge(): I'll give your patches a go in the next
> days.

Thank you, v3 is there awaiting you!

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

