Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8731C3ABC3
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 May 2025 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9sYTZQj22xPoW/QRyiBT8ULSaRBAKtHRHeWzEHazyE=; b=oofkayNfhHX5XxpivNjdllC8nc
	HBh3qBRl0g/tkQA2Sq+2qOxH2sIvhfPBheycbgb20rTYdMGJeO4P8AvQ2tpXyCOQdvNJopo8/uc7i
	FkphIvkQw9Rvhn6YDQ4IG0FBWi6VQoHDi9FMIO2mGfsxa7VNGiQ7xVwCQ5XAe/LK7LL+iunb/6i1c
	m1y+mNLipLtDW109xV941hKIPqBZ05Db6KVay9wU4XXPz3pn9y59U37OvNyRfqYUmSmdY1L4fVGhr
	yRGHfrRQoyUmetrupkLOP33pUoyIwGATz0jADxKSD0ETd8afrzXoUWXrLZAZcw4ivSo8jWpIh21xO
	nFMnhyuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDgks-00000005kyT-3CQk;
	Sat, 10 May 2025 09:44:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDgit-00000005kmw-1UDN;
	Sat, 10 May 2025 09:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 920B45C40C4;
	Sat, 10 May 2025 09:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83767C4CEE2;
	Sat, 10 May 2025 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746870141;
	bh=G9sYTZQj22xPoW/QRyiBT8ULSaRBAKtHRHeWzEHazyE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=jlVr2zbbJuiI24eEJxS+199kMPtpdarNQhO042/lb4Yc8VQ58YTh8v/KGvIVvQ+6K
	 oen+VX3n6hHvHfJe2ATsRM6vYFRaULbUG+Yao8Mgrx1kxODCleHdLKqKgUilj5jXRO
	 WR/ozntmFI90brgHMEyLOROkMAjUuHhAAnEl0cD6XBcKO9mP4tGh2eDKx7NgR7O06J
	 +2HnrUWOoTfYzFWzGjsB6eGqQm4ptgTcrKyzJvpNzh5bMMKsfT6y+pwmpIkZWCWEkv
	 hULrNvc6guSud4ZcCK05J4svZDNhGc9NE3sVlbOlJmZUOOK0oWFRPH/kY9F2ckg8xO
	 orlNF6f9H+hXQ==
Message-ID: <217864a52bc7770419e5da062d43aaa7@kernel.org>
Date: Sat, 10 May 2025 09:42:16 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 21/22] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-21-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-21-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Kocialkowski" <paulk@sys-base.io>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_024223_449777_9CEDAA0A 
X-CRM114-Status: UNSURE (   5.86  )
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

On Fri, 9 May 2025 15:53:47 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> The devm lifetime management of this driver is peculiar. The underlying
> device for the panel_bridge is the panel, and the devm lifetime is tied t=
he
> panel device (panel->dev). However the panel_bridge allocation is not
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

