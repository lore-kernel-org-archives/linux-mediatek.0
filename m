Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8B2C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 08:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXVZ68cdpgp0Oc06O+iDMDHFl7uPsJSDhRHvYoDqwWY=; b=LWSGHZei2DdUzwQIBHZzwDgSOU
	BHufIPJJO3OK6harD6IgqR+iTTYzBqmAdU7Z+zAFVZUtKcT/J1ehUpyFjqQa+h8NziZOvBWmOMsig
	n+XFfjSeYLg56XUkjkmfPkkW9ta5XtHGskn28lV9zY89YcgUox0ZCwuzcz+tOyg7f8g3kOWKJsCM9
	va4+H0jzUavLWONSfjy3vo20ngQX3+kaBwZ6ik3dZIx4z+c9EpRkqxEO+6zLH6X2StnS0QBpNVD/P
	pyke7iWg1a9WiV2s8HD5pgJXr5pKdEVrVS3PbpErCHei6g5bBwKU23Zxx5Ruqx5j337/d3VsTEWuV
	N8ORxI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0nX-006q7J-00;
	Thu, 10 Aug 2023 08:13:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0nT-006q5W-1p;
	Thu, 10 Aug 2023 08:13:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9D00652F9;
	Thu, 10 Aug 2023 08:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83019C433D9;
	Thu, 10 Aug 2023 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691655210;
	bh=gXVZ68cdpgp0Oc06O+iDMDHFl7uPsJSDhRHvYoDqwWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSQJ3MDGIPvJ0HMdmJojPNOITtyTnIaObs3s8neo3b0T4ZqDx67kFFQVnWaIlvSq0
	 XbT2KMjZ4kRCPECjY9wzhAZIaEpnY8sOrR6YoMMkBhomarPH2yUscPuKDgMwVXygvL
	 931+QUJn8LtveKV+Uc+R4qqJYghlHkz7D5jRSTwBFNp5MlKKPGF92rAFNid/YCWjt5
	 wdoO/S0kBgRa9gvVkt8X79r5m0kQBttlpf/RvPowbcQWJMqkxTWaUIF7ln+O7O75gx
	 +/Z3QFtPJJd7fJuxGaoYpZUxAebuqPOXjPYpPpP2zE6JtAnsUtzsJNw2q7VYEwiMAs
	 Rw5p2OsG22CmA==
Date: Thu, 10 Aug 2023 10:13:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Emma Anholt <emma@anholt.net>, Helge Deller <deller@gmx.de>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] video/hdmi: convert *_infoframe_init() functions to void
Message-ID: <ibwl2bpz5bs72co4ivkvjcc35lv5mqyuvj2hbr3p54hliujklm@uje662ldqfdw>
References: <20230808180245.7474-1-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="syn7hsjtm3zubtz2"
Content-Disposition: inline
In-Reply-To: <20230808180245.7474-1-n.zhandarovich@fintech.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_011331_705102_AF226B0D 
X-CRM114-Status: GOOD (  14.36  )
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


--syn7hsjtm3zubtz2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 08, 2023 at 11:02:45AM -0700, Nikita Zhandarovich wrote:
> Four hdmi_*_infoframe_init() functions that initialize different
> types of hdmi infoframes only return the default 0 value, contrary to
> their descriptions. Yet these functions are still unnecessarily checked
> against possible errors in case of failure.
>=20
> Remove redundant error checks in calls to following functions:
> - hdmi_spd_infoframe_init
> - hdmi_audio_infoframe_init
> - hdmi_vendor_infoframe_init
> - hdmi_drm_infoframe_init
> Also, convert these functions to 'void' and fix their descriptions.

I'm not sure what value it actually adds. None of them return any
errors, but very well might if we started to be a bit serious about it.

Since the error handling is already there, then I'd rather leave it
there.

> Fixes: 2c676f378edb ("[media] hdmi: added unpack and logging functions fo=
r InfoFrames")

I'm confused about that part. What does it fix exactly?

Maxime

--syn7hsjtm3zubtz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZNScJgAKCRDj7w1vZxhR
xSWxAPkBKpcYa8fvgV9S3h2fxehetHD5UXS8LuBJb/F6EtKr5QEA1tv3DgElGqJD
Vd+9ES535Sb39MjXfvkcbNMyPRxsjQU=
=6V+A
-----END PGP SIGNATURE-----

--syn7hsjtm3zubtz2--

