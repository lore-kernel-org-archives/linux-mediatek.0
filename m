Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC2AC35FFF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 10:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSX5wgQpGviIl9j796MwaDns+PlHxhknGnllWqJ5QFo=; b=gn1bRJ4lXBTWh61K84wxUGHhmA
	+CCvgBPJc4MGHXvwT590susw8VSC6avlbm2YuIr1YMFKuEfHWb9zzn4Vr/vOA9l6xRG9A0nGjo8Ri
	9/xfXHPsp0ewjKgbmdWUZII3ku1KHcY+DNpOaf9+ZLw8d2wsJFnNtXr1P73YIQhSMqLzvCO18YmVv
	Eb+LAww1eAm47YRSLVJ18GWb28g499ZMZVOW91CJ5dTvyNFoVzzXu7VOSbEGYPaC5+MQ6jxwwPZQg
	wXaP0wA6HgcJ91oP3F6DDrb+QQZ8DlS1RLWqHc0BCJ3J346scK+0IKJTEko42nA8eKPtI952J4+TM
	YSllxiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZcu-0000000EWbI-1dYj;
	Fri, 21 Mar 2025 10:29:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYz2-0000000EQYZ-2pBz
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 09:48:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E1835C6CF4;
	Fri, 21 Mar 2025 09:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97055C4CEE3;
	Fri, 21 Mar 2025 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742550487;
	bh=FSX5wgQpGviIl9j796MwaDns+PlHxhknGnllWqJ5QFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YC6O89GIBcbRsW6Izy2UHgotEkBbGnaE7WgDaDacZyyegTLmDQPxZK7S3etURRpmF
	 2UH5HK0hgXJHnTFNougjY4BhmGu/Ig1xTRwBSWKeXxjaxORlBvZR7GYPRU8EfhHTH8
	 RqpsYyJq9tSpcgr/7Wgc1JxNvoaO3jq+PHw+EQMRtmpi/sck9wm2K2xKhTnsRk9PBv
	 GTCLPlogntytBZvoc40lVDVWEmtobMORdjfPDB6LFlsf8W0L/TP2ZhxKeklAZ4tPU2
	 7CBf6zI7sYum3ZCfog82hNbwhzW+ix4AOo85OAviirHqthe58lRSNKfC+Dbu7pVq4A
	 C1N7G4QGC1TmA==
Date: Fri, 21 Mar 2025 10:48:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: lumag@kernel.org, neil.armstrong@linaro.org, 
	dri-devel@lists.freedesktop.org, dianders@chromium.org, jani.nikula@intel.com, lyude@redhat.com, 
	jonathanh@nvidia.com, p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com, 
	rfoss@kernel.org, chunkuang.hu@kernel.org, cristian.ciocaltea@collabora.com, 
	Laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge detect
 hook
Message-ID: <20250321-optimistic-prompt-civet-bdcdba@houat>
References: <20250321085345.136380-1-andyshrk@163.com>
 <20250321085345.136380-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="psdl227jg277o23m"
Content-Disposition: inline
In-Reply-To: <20250321085345.136380-2-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_024808_754957_23647C2C 
X-CRM114-Status: GOOD (  13.09  )
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


--psdl227jg277o23m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge detect
 hook
MIME-Version: 1.0

On Fri, Mar 21, 2025 at 04:53:38PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> In some application scenarios, we hope to get the corresponding
> connector when the bridge's detect hook is invoked.
>=20
> In most cases, we can get the connector by drm_atomic_get_connector_for_e=
ncoder
> if the encoder attached to the bridge is enabled, however there will
> still be some scenarios where the detect hook of the bridge is called
> but the corresponding encoder has not been enabled yet. For instance,
> this occurs when the device is hot plug in for the first time.
>=20
> Since the call to bridge's detect is initiated by the connector, passing
> down the corresponding connector directly will make things simpler.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

FTR, I'm against it and would have appreciated that you wait for a
meaningful closure to the discussion we've had on this.

Maxime

--psdl227jg277o23m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9010wAKCRAnX84Zoj2+
dpUPAX9qG8wGWX/jIylnSMvlLPoWW5QTzLixBoLyAKtU+LQ4ih9kDaR+T2+Jw3ZK
sF/MmZQBfivyGBZWnETXE8ErmIijVVrG0Ds9DeKvJyKxigYqbXaEmWDvYU2tYiyP
IaXj31fvOQ==
=X15G
-----END PGP SIGNATURE-----

--psdl227jg277o23m--

