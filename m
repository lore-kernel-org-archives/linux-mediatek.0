Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8002C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 20:42:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95FBE23A9D
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 20:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95FBE23A9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=48PDNghTv/Q7pfPh7yoZLFtdSJ5WjO0MzzEapXXmTLE=; b=Wor0cAMVC80V75kqIC+jY9JcB
	BfDMaxlJps/ukUSxZFVrSaibM2BRywiKF3OCNEkSksLk+97iOl3KJsAz/OheAElgd6g9uDwvtU24c
	KwAhex1aOW6znhfYkZxOcMHAgQUyGsZCQOS+rDLczAYZ7kEYCVr7W2wwWnG38Eo1vjTFmU5F8ddxh
	Vo1cw3tdsXVylMqxEICNKTvUEVW0wd+j03GesO5DQuF7ChL9DfIxOsunsSLE58apZVOUHkWVTa1bk
	gQydunbsnZ6I4mVnJEbj5sGSrozvmHLHdqOaqZSOoTs4ZiINktGN3YMW5433dOb5p1nR/Jmc2FTck
	Uqu++nUhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0VvY-00006U-FE; Fri, 15 Jan 2021 20:42:36 +0000
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0VvV-00005i-LX; Fri, 15 Jan 2021 20:42:34 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6768E58B;
 Fri, 15 Jan 2021 21:42:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610743351;
 bh=YM0UFEEnI3+Rh/NmmpBAyHwTyu8kF8Q6d7WaAvXYXmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ePDFtIg2t/f8Sh35gudyogfQHgJctjLWaOxjX9MALH284FX8TVNfetW4hT9f9t6Zs
 RkKSbZK9kxaFvE9rFVQDu2VmmTQ6+yQ/IEntNmQ4OGrAWr43Z8LNSl81omX5DWIITd
 FZb6j2pMbH2Kg7TVoFuIiyWnRsiWGYMJt85Nq3bg=
Date: Fri, 15 Jan 2021 22:42:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 05/10] drm: Use the state pointer directly in planes
 atomic_check
Message-ID: <YAH+JvNnlx73BA+Q@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-5-maxime@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_154233_834787_B826A0FF 
X-CRM114-Status: GOOD (  17.52  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 Rob Clark <robdclark@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 linux-rockchip@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 freedreno@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Harry Wentland <harry.wentland@amd.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans de Goede <hdegoede@redhat.com>, John Stultz <john.stultz@linaro.org>,
 Stefan Agner <stefan@agner.ch>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Melissa Wen <melissa.srw@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, virtualization@lists.linux-foundation.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Vincent Abriou <vincent.abriou@st.com>, Edmund Dea <edmund.j.dea@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Brian Starkey <brian.starkey@arm.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Maxime,

Thank you for the patch.

On Fri, Jan 15, 2021 at 01:56:57PM +0100, Maxime Ripard wrote:
> Now that atomic_check takes the global atomic state as a parameter, we
> don't need to go through the pointer in the plane state.
> 
> This was done using the following coccinelle script:
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> static struct drm_plane_helper_funcs helpers = {
> 	...,
> 	.atomic_check = func,
> 	...,
> };
> 
> @@
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier plane_state;
> @@
> 
>   func(struct drm_plane *plane, struct drm_atomic_state *state) {
>   ...
> - struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
>   <... when != plane_state
> - plane_state->state
> + state
>   ...>
>  }
> 
> @@
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier plane_state;
> @@
> 
>   func(struct drm_plane *plane, struct drm_atomic_state *state) {
>   ...
>   struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
>   <...
> - plane_state->state
> + state
>   ...>
>  }
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[snip]

>  drivers/gpu/drm/omapdrm/omap_plane.c              | 2 +-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c                | 2 +-

For these, with the small issue below addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[snip]

> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index b0a3ba528718..d749acc78c85 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1152,7 +1152,7 @@ zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
>  	if (!new_plane_state->crtc)
>  		return 0;
>  
> -	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
> +	crtc_state = drm_atomic_get_crtc_state(state,
>  					       new_plane_state->crtc);

This now holds on a single line.

>  	if (IS_ERR(crtc_state))
>  		return PTR_ERR(crtc_state);

[snip]

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
