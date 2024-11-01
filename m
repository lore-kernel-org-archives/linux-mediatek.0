Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9A9E6F084
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2024 19:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sa/HhTUDVpk4NXfCGGmyvJmpwzaluhlGU0TChrjB+bo=; b=Q2Ih/WZdCj25nOk96j6sWGnduL
	V47000p5fA/Y/o/rW7uyEJhdyB99qpJDrCbycHe6qSBmH45QE7F8L/aijQpjIjWz605LGp2pCSKd6
	g8AywbeQsSvehlP+CclL2+jmJHSalZI6ECOqn0aCP6G2CXa9spda7xYzfKsuNqF9WDiueMTf825WA
	kbJJoecHkfDw+cyDGgFmbuiSkMOsq0Fkc1TJrEgTBygZd8vP4QHUpawWnTpF2vjc1M1VMJqvu2Dnr
	Ck7StA+b3YSWqJfF1i0zlSZiVWsmxi3PnnBZ6o+mQtilnRX7JQ4oLrnmhLLm4T2uCM0Hm2LVMy5Cn
	RUTR8GQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xQZ-00000008961-3a4j;
	Fri, 01 Nov 2024 19:35:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xIK-000000087Ig-25ij;
	Fri, 01 Nov 2024 19:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88B595C5A4A;
	Fri,  1 Nov 2024 19:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691F2C4CED1;
	Fri,  1 Nov 2024 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730489211;
	bh=Sa/HhTUDVpk4NXfCGGmyvJmpwzaluhlGU0TChrjB+bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SaFXkfUuVpXBA4XRS/CsNDgnVARbi2alUSb+Hi/XtJC1GKki1zmHwC/kEqPNARka3
	 9A8fYPfozklJGgLPZ2Dk7KQbLBQTUftc76f5NWJF8nfXehWeNU8NtYmxAWbSXJfFWi
	 H/KN35oAasjjbOuYK9HMZI3TK6h68sKN2QJJNH1ZIgJWT9oyLceeERvCkBX+JFo5ji
	 QUPRvx+waOf0+Gs6+GQQQ0LNiCHD6GdNfjU15c0Hd2Tx4CgIis6LL4602aCUmdOyy4
	 GuJcEublpLssP2OKfyLFXaTvkVpaAza+PmxCx0JeSEftPfqu8JO5YyRy2y0y005DDz
	 HIHZCCTxXvtEg==
Date: Fri, 1 Nov 2024 19:26:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Phong LE <ple@baylibre.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH RFC v2 2/7] ASoC: hdmi-codec: move no_capture_mute to
 struct hdmi_codec_pdata
Message-ID: <e57aa9c7-1a35-4ed3-94c7-f3acd3293b6d@sirena.org.uk>
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
 <20241101-drm-bridge-hdmi-connector-v2-2-739ef9addf9e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xe2LhHWxNYWP+TP/"
Content-Disposition: inline
In-Reply-To: <20241101-drm-bridge-hdmi-connector-v2-2-739ef9addf9e@linaro.org>
X-Cookie: We read to say that we have read.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_122652_644960_35A97AE5 
X-CRM114-Status: GOOD (  12.11  )
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


--Xe2LhHWxNYWP+TP/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2024 at 12:19:03PM +0200, Dmitry Baryshkov wrote:
> The no_capture_mute flag might differ from platform to platform,
> especially in the case of the wrapping implementations, like the
> upcoming DRM HDMI Codec framework. Move the flag next to all other flags
> in struct hdmi_codec_pdata.

Acked-by: Mark Brown <broonie@kernel.org>

--Xe2LhHWxNYWP+TP/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmclK3AACgkQJNaLcl1U
h9AmVwf/dWfRKRI7gD3AqmFK1DexdVqm2bNZhFPhh2L1LOQy2vXI7nvVt/2acOos
2JHf3BYuLSIWMThTjkBKh173OCY3MTjzfkZIXRpsK6c7DuqPKLvJSakMt7/bWzvI
fb7j49YV7k/kD7rEZBGA6cm4UTMLe9STpUG3fyNqIBBWEtnxZmGLR99iBXiM+m5R
PoqILxDPVsroDHtz5xX/rUOxM6Fj9vG8TRgkfdHLvRdOjmYQxDD67WiUJKH8RSJ+
li+pH4COp9QU4likh9C3pYaLUEZ4s8Jm9boYt2IZtt66rnGl8vsAjoSW8LOnKlQM
3gmYAtofdaWiOHyS73Z1FO3Eu1quBw==
=ZSKp
-----END PGP SIGNATURE-----

--Xe2LhHWxNYWP+TP/--

