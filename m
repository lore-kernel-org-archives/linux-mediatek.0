Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535EBC54E90
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 May 2025 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBpkT+X12qTj4ZXFWwDHYvuVR5JkpgqcjljjqtTRTxw=; b=I0IqVEc9H072DSHVnSMGcZD5Wd
	Q3hFFOHxl7BaauK8eQUVXYd+Pnm6ksw0gAlRkcl1L8Ic6sac57nRotJ8QCQbMUbunBGnJ2qHIR/T6
	uKDP+ynS4mlQ4Af7g6QlR4JwsRpEqjqtfY1yLD6rGeOn7PxuiES4lNlKhD7Qk50hLeMq3u8ncoc/q
	co/VTQVzM+cT1asYWWvDOh/J+T8ftyoQuK86x60Fbr1RWGu+aTPZiADfZu+M4p8VgA5tUlMEk+Tw3
	CJR9u7sQ/ftlm5gdC2lmcAJo5TyHIX0zENoNWUUcqPq1n1MyLC4pnlrpvzmIf5AlzhKBBB3ph/UY8
	OHZeoBPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI81b-00000001T1V-1AN4;
	Thu, 22 May 2025 15:40:03 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7aV-00000001OoY-3rAP;
	Thu, 22 May 2025 15:12:05 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6f8d663fa22so69100846d6.0;
        Thu, 22 May 2025 08:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747926722; x=1748531522; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBpkT+X12qTj4ZXFWwDHYvuVR5JkpgqcjljjqtTRTxw=;
        b=f+bmS+g1UYlBFN+Cg4rvP/p7BtQqyGL2tYOHiO6monBWM3u4PNHskeEtaZOTMW0tNP
         OasEl0uQvRRHRH/QLKqMseMRE4mYaACAPHMSsxDuloeWqJPSI6V+0FK29a8rwgxjpgcj
         giCutIouYSWbp1MI7VUEXL0WEbNV8T8WFeZJN4GxMXL1Qhqf012cR3T3aE2DDfprgz+R
         vVQIX0zKa5KTfX3s6w72V/8lR+HAFj7RNVr+dhGrZ4YvFr+HNs2YhPDPQQs52YR+an+3
         aqpkAptTM0J6AZsagrZOE1M+tvEhU7YaDfczzVOe1eJ66bvSvR2BJFvZoD1dOcRBcyre
         vE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926722; x=1748531522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBpkT+X12qTj4ZXFWwDHYvuVR5JkpgqcjljjqtTRTxw=;
        b=IJ9BX4OpY2NeP5fuGS3339VulrdNwHtyXPXkfRTJTrHEvStcYSLz5Jd6vu5/1fqHCI
         IV8Sl+2QjXZG9JHTRR63VZHliN7pKGY+7VAkm43fza//B2O+ziPgx8Oa194PeYKbG/RQ
         ZBPuWdnLz1l2qWVs/dvzayJQ/J9PjnX6akyr77XBSyV3R0VWH1JKCz2K+Yy/ECwdsspJ
         Tq2JGwJVve9PlPLetKYnQOfFfTJKrTzoJDW68g+Q1YuARkB6c0bepWf8344/Kd0tmIho
         zdPUalc2rvcA29OhUNnS8QGdt72z74LuBiSoAJG81pa7qfJTDLtco9WnBbHBLpZePO3H
         5vTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOiTkuOmC9Z9WJLPgzEc00OqPAlg5lsiF4G2vgKunCYG8K2y+fayUnJ2WysTV0ZI1IJCP3zHbN5UsebLSm@lists.infradead.org, AJvYcCXJC7I5Z4P1w7pqQ73UV2O8CwY2HsF1iew5xGC+ku/OtYSedht9lrZh9pqvr0Dt2t7DiQxSdVCn1MOlDQDOaMU=@lists.infradead.org, AJvYcCXV6+awvkdIwS4HUN9jn7o7rkgyTyUOYrKTUkIVGjPZbdI0gwnAVToQQzJpFHpn1q9JEO5+z9P4AB9drhB658RwJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPb2b0WwpC+a1w7u2AORu2wu7n18R1lH4b2sAt6mwjitr+M+rh
	wiG6NesM+P43uspJQGpIbySprQ0yIv5V00vDTutrLJ3LS1mnBT/swCHJnH1laxcECD7WmPrVTCI
	MCSQgkoUQHQ6zlqqH+b5qn3Um0jWOwrs=
X-Gm-Gg: ASbGncs4FHcn8QmI2J8XG8EgqoEqf4HNz6OQL85WSGjV0wNb6JbucP+OuxrZIuN7lr9
	JwyURP5If01oIAgoTOAnu/CxLOpZ8hVttgiuEudpE5h2GMnagzvDwAGrxbMrL5D0n6KoV8vfOy8
	1wHYfvnhvvfvEbQe7fnSRiSZsFfnceJkA=
X-Google-Smtp-Source: AGHT+IFlBlVnRPEejI7uEQI0m4iJ7XD5elQtat++i3WnHxfOw553GLb37rOpDc90WmrXZut9Lu8B9Qiwq9FX49Bc1Ek=
X-Received: by 2002:a05:6214:f0c:b0:6eb:28e4:8519 with SMTP id
 6a1803df08f44-6f8b2c7b1d5mr412061496d6.21.1747926722029; Thu, 22 May 2025
 08:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
In-Reply-To: <20250521162216.79dd3290@booty>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 23 May 2025 00:11:24 +0900
X-Gm-Features: AX0GCFtvRxj4ujyC4Z2jHUwkVIe890MFPlPN-fSj8wgEwb2IYi_zfj6mGd98q30
Message-ID: <CAAQKjZPX3iQgNhEydDZXMyC9BRuep7kL-XYEsjnkCxSt_1UsQg@mail.gmail.com>
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to devm_drm_bridge_alloc()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, Adam Ford <aford173@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Christoph Fritz <chf.fritz@googlemail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Martyn Welch <martyn.welch@collabora.co.uk>, 
	Peter Senna Tschudin <peter.senna@gmail.com>, Helge Deller <deller@gmx.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_081203_958603_17655A54 
X-CRM114-Status: GOOD (  34.11  )
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

Hello Luca Ceresoli,

2025=EB=85=84 5=EC=9B=94 21=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 11:23, =
Luca Ceresoli <luca.ceresoli@bootlin.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> Hello Maxime, Shawn, Liu, all,
>
> On Fri, 09 May 2025 15:53:26 +0200
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> > devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a=
 DRM
> > bridge, and the only one supported from now on. It is the first milesto=
ne
> > towards removal of bridges from a still existing DRM pipeline without
> > use-after-free.
>
> I applied on drm-misc-next patches 3-17,20-21 as they match all the
> criteria:
>  - At least a Acked-by (or R-by maintainers)
>  - patch is for drm-misc
>
> Being my very first commits to drm-misc, I tried to be careful, and
> double checked all the patches with Louis (thanks!).
>
> Here are the pending questions and plan for the remaining patches.
>
> >       Revert "drm/exynos: mic: convert to devm_drm_bridge_alloc() API"
>
> This reverts the commit applied my mistake:
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/91c5c7b5bb2dd09b4=
3b025bce6d790d3c79f4518
>
> Neither the  original patch nor the revert has been reviewed/acked.
>
> As the commit was a mistake, I'm applying the revert by the end of this
> week (i.e. on Friday) unless there are better instructions.

Really sorry for late. I was made aware of it later through a
colleague's remark. There is no need to proceed with the revert.
Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae


>
> >       drm: convert many bridge drivers from devm_kzalloc() to devm_drm_=
bridge_alloc() API
>
> This patch affects multiple drivers. Running get_maintainers.pl
> points at Shawn Guo's repository. After reviewing the MAINTAINERS file,
> this looks like due to the 'N:' line in:
>
> ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> M:      Shawn Guo <shawnguo@kernel.org>
> M:      Sascha Hauer <s.hauer@pengutronix.de>
> R:      Pengutronix Kernel Team <kernel@pengutronix.de>
> ...
> T:      git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.=
git
> N:      imx
> ...
>
> (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAIN=
TAINERS?ref_type=3Dheads#L2511-2528)
>
> Here 'imx' matches the 'drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c'
> file that is touched by the patch. That regexp appears overly generic to =
me.
>
> Shawn, can it be fixed by making it less generic?
>
> If not, can we at least add a band-aid 'X:' entry for
> drivers/gpu/drm/bridge/imx?
>
> I think the other matching entry is the one to consider:
>
> DRM DRIVERS FOR FREESCALE IMX BRIDGE
> M:      Liu Ying <victor.liu@nxp.com>
> L:      dri-devel@lists.freedesktop.org
> S:      Maintained
> F:      Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.=
yaml
> F:      Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixe=
l-combiner.yaml
> F:      Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixe=
l-link.yaml
> F:      Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2=
dpi.yaml
> F:      drivers/gpu/drm/bridge/imx/
>
> (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAIN=
TAINERS?ref_type=3Dheads#L7940-7948)
>
> However it does not list any trees. I _guess_ drm-misc applies here as
> a fallback as well as common sense.
>
> Liu, should this entry have a 'T:' line for drm/misc?
>
> >       drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_al=
loc() API
>
> Not acked/reviewed, some discussion happened. I am resending it in v4,
> possibly with updates based on the discussion.
>
> But it has the same issue discussed above, with get_maintiners.pl
> pointing at Shawn Guo's tree, so in the future I'm assuming this goes
> to drm-misc unless there are news about that.
>
> >       drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
>
> No feedback, resending in v4.
>
> >       drm/todo: add entry to remove devm_drm_put_bridge()
>
> This involves documentation maintained on another tree. Where should it
> be applied? There are two matching entries in MAINTAINERS:
>
>  * DRM DRIVERS -> the drm tree
>  * DRM DRIVERS AND MISC GPU PATCHES -> the drm-misc tree
>
> To me it looks like the second is obviously the closest match as we are
> dealing with DRM bridges, so I'm applying this as well on Friday unless
> there are better instructions.
>
> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

