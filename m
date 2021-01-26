Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09583C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 13:25:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE96207A0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 13:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAE96207A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DZU1qukygw88lJ8y8+bNjIg6omQ35wLZVgWWd6kH2os=; b=fK/T0yMylMg0buDes27rpt3NX
	9a1XGVNTUNxu1R3AWpWsIx2sd8694GWhhQC14g/tMifjja6Za+ri6tDDKhaUzTuksbG6k0/6z/PI6
	1VWrrlPpiCnK4IAc7ZiqCAQaRwBSxi+xKU6TQ1YM+IMIr5a50swCEs6CYCbCvbt+be4JMR1y6PSqq
	gYySdQYnhB8hBMghekpYxon2oheeabzyjZ80Jh7+IAh+gVr8GG9WtbudjUtIkepNQokLStr1r6dbJ
	/rbCkO69Rk1qbZT9NZRg4mHG9LOkToIJNWNo05jKqktx6eeUtOUpDICxZECJDouwFjFUm+gnn0n5s
	7JR8+WkTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4OL6-0007pf-8B; Tue, 26 Jan 2021 13:25:00 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4OL4-0007om-A2; Tue, 26 Jan 2021 13:24:59 +0000
IronPort-SDR: XaU55DbI5Qo+hlSSIRltyDZkcArTX9POvwvs0bOX/cq/ChDOqLhm4R+evFI10/X9aiAHDTIgM2
 dq92SLkxzfsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="198687066"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="198687066"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 05:24:54 -0800
IronPort-SDR: g4Zswe3qz4zMid/EyEG5xz4WWhFPriWd/t2t5KrG0ShP0j9WNEEJayXNCJQTEkRkM2/IHRNzgx
 zk+bb8SSGplQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="369103591"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 26 Jan 2021 05:24:36 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 26 Jan 2021 15:24:35 +0200
Date: Tue, 26 Jan 2021 15:24:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 10/11] drm: Use state helper instead of the plane
 state pointer
Message-ID: <YBAYE4YH4bgURmuf@intel.com>
References: <20210121163537.1466118-1-maxime@cerno.tech>
 <20210121163537.1466118-10-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121163537.1466118-10-maxime@cerno.tech>
X-Patchwork-Hint: comment
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_082458_491685_9F77754B 
X-CRM114-Status: GOOD (  17.07  )
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-rockchip@lists.infradead.org,
 Alexey Brodkin <abrodkin@synopsys.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chen Feng <puck.chen@hisilicon.com>,
 Dave Airlie <airlied@redhat.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mips@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mediatek@lists.infradead, Hyun Kwon <hyun.kwon@xilinx.com>,
 Philippe Cornu <philippe.cornu@st.com>, Sandy Huang <hjc@rock-chips.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 21, 2021 at 05:35:35PM +0100, Maxime Ripard wrote:
> Many drivers reference the plane->state pointer in order to get the
> current plane state in their atomic_update or atomic_disable hooks,
> which would be the new plane state in the global atomic state since
> _swap_state happened when those hooks are run.
> =

> Use the drm_atomic_get_new_plane_state helper to get that state to make it
> more obvious.
> =

> This was made using the coccinelle script below:
> =

> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> =

> (
>  static const struct drm_plane_helper_funcs helpers =3D {
>  	...,
>  	.atomic_disable =3D func,
> 	...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers =3D {
>  	...,
>  	.atomic_update =3D func,
> 	...,
>  };
> )
> =

> @ adds_new_state @
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier new_state;
> @@
> =

>  func(struct drm_plane *plane, struct drm_atomic_state *state)
>  {
>  	...
> -	struct drm_plane_state *new_state =3D plane->state;
> +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(st=
ate, plane);
> 	...
>  }
> =

> @ include depends on adds_new_state @
> @@
> =

>  #include <drm/drm_atomic.h>
> =

> @ no_include depends on !include && adds_new_state @
> @@
> =

> + #include <drm/drm_atomic.h>
>   #include <drm/...>
> =

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Looks great.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

-- =

Ville Syrj=E4l=E4
Intel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
