Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57C1C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:15:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A21E23437
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A21E23437
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jb+kNNZO7kyRyBO4AB8ivGxPH4Q6EXeM1gZt2Jc3azU=; b=wUErZSIQe9vqg13i1EQxORin0
	4uIrxEMcSBch3rZLDFwQt51NJSEMOw3iqA6KL3cM3s/34dqed6CqYMqfqKKI/OkYBoIu3OOZzk9mY
	BBv85JMj/6OYjtBXWodEpcxnF8tZ2wvhtiaIMwoR7n6fgqSNAm61hZzMWZ5hRgc0jqyizqJ3R3WsX
	kvMSwbn7Bmjc0MYUo475SMnRh4nmhNWSIINthS8S6+AaUTWgxENMseePJEKx9QKpSrQ5SypOrnf4E
	eBOM33kKDIxlJdfsoGoQW8j6pIxNpOpKYyVQa62GlgSXSf1iHyGnse6vnEJJpV7ZxPLhUHP3SjWV/
	T+QSeKriA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2vLh-0008Vc-Os; Fri, 22 Jan 2021 12:15:33 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2vLa-0008PI-BI; Fri, 22 Jan 2021 12:15:27 +0000
IronPort-SDR: h0WCbHDDq4QmpmWPy/SMFfX82jk5fy6K2M9GOqwzF2BjKXvvlTuMXZFsbVRMsmyFP0BBFOId5I
 3DfxuPpaar1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="198192075"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="198192075"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 04:15:19 -0800
IronPort-SDR: vxhEFHoBM4hXws2Gfq3XVEXWbVHJjZt+mKNZqWwfpNFtZ+x/7C1X0hk8QBjs48BMnxsKHMbW17
 KXS9hV06ZNpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="467909062"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 22 Jan 2021 04:15:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Jan 2021 14:15:07 +0200
Date: Fri, 22 Jan 2021 14:15:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 08/11] drm: Rename plane->state variables in atomic
 update and disable
Message-ID: <YArBy2DKdCct5cYW@intel.com>
References: <20210121163537.1466118-1-maxime@cerno.tech>
 <20210121163537.1466118-8-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121163537.1466118-8-maxime@cerno.tech>
X-Patchwork-Hint: comment
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_071526_625808_46FE96C4 
X-CRM114-Status: GOOD (  18.43  )
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
Cc: , Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-rockchip@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sandy Huang <hjc@rock-chips.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chen Feng <puck.chen@hisilicon.com>,
 Dave Airlie <airlied@redhat.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Philippe Cornu <philippe.cornu@st.com>, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 21, 2021 at 05:35:33PM +0100, Maxime Ripard wrote:
> Some drivers are storing the plane->state pointer in atomic_update and
> atomic_disable in a variable simply called state, while the state passed
> as an argument is called old_state.
> =

> In order to ease subsequent reworks and to avoid confusing or
> inconsistent names, let's rename those variables to new_state.
> =

> This was done using the following coccinelle script, plus some manual
> changes for mtk and tegra.
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

> @ moves_new_state_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol old_state;
> symbol state;
> @@
> =

>  func(struct drm_plane *plane, struct drm_plane_state *old_state)
>  {
>  	...
> -	struct drm_plane_state *state =3D plane->state;
> +	struct drm_plane_state *new_state =3D plane->state;
> 	...
>  }
> =

> @ depends on moves_new_state_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> identifier old_state;
> symbol state;
> @@
> =

>  func(struct drm_plane *plane, struct drm_plane_state *old_state)
>  {
>  	<...
> -	state
> +	new_state
> 	...>

Was going to say that this migh eat something else, but I guess
the dependency prevents that?

Another way to avoid that I suppose would be to declare 'state'
as
symbol moves_new_state_old_state.state;

That would probably make the intent a bit more obvious, even with
the dependency. Or does a dependency somehow automagically imply
that?

-- =

Ville Syrj=E4l=E4
Intel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
