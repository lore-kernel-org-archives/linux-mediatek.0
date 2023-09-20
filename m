Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC0ACE79AE
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 06:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCA6t4YXZyc5rNhGUjMitz7bxr3cqh7547VPQO5z/NI=; b=4WoyWC/TvM+6CYymMGkCZkO/vL
	liq8MBy/HPMqaeUPRrT/k6vYzfB1a9zU/ux9Km5aUrbltBWdEwq+BQejhHlGpAkqQlMlB0LCIcTvh
	tILiA0Gv4eEF7kqBUmpwaAwuyghOUMAPvhtWAWpq9nZLWaWN5o6kgZgVnmigrHxlu18ScjT5hIMRW
	WVmkOJHFB1iGMOl4LfIQwJqi311qGVkVEJmWUTDPaA01xR/lI5hhdx7uhsIr9GxVNFP8EaZOvg2Jd
	owZF4++I2ZaUQtK79oyOSpCV7Be+OrAsLxy6QjTFmxuIuo7748R8aiAOIZhIN3OhFs7Z37vf1vu3i
	PKOJ37mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqT5-001zyy-08;
	Wed, 20 Sep 2023 06:13:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqT1-001zxI-2j;
	Wed, 20 Sep 2023 06:13:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7813AB817F4;
	Wed, 20 Sep 2023 06:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81A7C433C7;
	Wed, 20 Sep 2023 06:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695190418;
	bh=sCA6t4YXZyc5rNhGUjMitz7bxr3cqh7547VPQO5z/NI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bAlxtLY7YcvLrOxMsiqbf4Le3cggE28w/GyZvSzTDZ1LWDwulDeA7PXnKNpr818wD
	 Oh+RcbcyXLMQ1tgsLYKsmcnCjgqn7nw17NhnFRG2sf6fZqAWsTyVntPFQNJ1gQznQl
	 Z/8P+WUcfjIsCbf2DDTDTZgaL9Z/nof0KsFVEZnR+YebobrMgn1ZjbdqcWqlJZ7mvp
	 n4I8Ng33kgHK/NeDt1jY1mHRFccpKgGmT4P8ig310BOcLXlEFgXlrd/9zmXznCUfrR
	 EIIkSZeDvR3Tk/vs8xkZq3VqsfPYYM6XXCEVWowAgfrsI6GzCgTFn4udr6WvmV5moq
	 kPNKybovu1lEw==
Date: Wed, 20 Sep 2023 08:13:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Helen Koike <helen.koike@collabora.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, 
	linux-arm-msm@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, 
	p.zabel@pengutronix.de, linux-mediatek@lists.infradead.org, heiko@sntech.de, 
	jani.nikula@linux.intel.com, intel-gfx@lists.freedesktop.org, alexander.deucher@amd.com, 
	amd-gfx@lists.freedesktop.org, airlied@redhat.com, daniel@ffwll.ch, michel.daenzer@mailbox.org, 
	daniel@fooishbar.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: drm/ci: add entries for xfail files
Message-ID: <56iam34xkp4gnffi7cdqkzn33nqkb53ttttersctoa7b2rvvpn@ukaj2ceo4f2y>
References: <20230919182249.153499-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="snkfr47lvwx67rio"
Content-Disposition: inline
In-Reply-To: <20230919182249.153499-1-helen.koike@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_231344_063821_9CF7F74A 
X-CRM114-Status: GOOD (  11.68  )
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


--snkfr47lvwx67rio
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 19, 2023 at 03:22:49PM -0300, Helen Koike wrote:
> DRM CI keeps track of which tests are failing, flaking or being skipped
> by the ci in the expectations files. Add entries for those files to the
> corresponding driver maintainer, so they can be notified when they
> change.
>=20
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Thanks for sending this

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--snkfr47lvwx67rio
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQqNjwAKCRDj7w1vZxhR
xXAYAP9Bj69+O1sa6mIVvufb7pxaegBC7CPhLcZvoTbWo7giVwEA6DxfglNf7WDj
GvhfiMjoMJRWAeagnk3gM2FAxR30aA0=
=48R+
-----END PGP SIGNATURE-----

--snkfr47lvwx67rio--

