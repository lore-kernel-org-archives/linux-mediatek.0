Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08BDEE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 09:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+WwY1tO4nVCMI8BvPHbf6saEdvnkI5ml/gFZQoIuls=; b=XrHScIvA6x60ReMoEzOuRm9585
	YkAUSQ8o1egrm1VGStTvHz6MvEbG0pbh9h0Q3yIQCAn2vEvDhS9SlbdEQ62ZcS8dXeNjRPPapXIPN
	j7AjO4sO1/pPZXYSALJCCMLc5iyBpwRE5MdZdgbtEYUvRyKPGuEjzJnCqUrXzE2p9LH8Cw84tTZRJ
	X557FPL2c4Vz/3p8sWol+DNdpF/eLwh0eOYqZvV0qjyA7DPA3/40fRmxch9Vk9d8SqvU2P0N/zcky
	ouatmc6RIe/OL0ys8ki7joM4oocdROkoHuhAve46yDPwurD53bSAR1vn1KtFyexUqEYId0BuBEy0K
	h5lrfB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdc5-00059L-1V;
	Mon, 11 Sep 2023 09:53:49 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdc1-000585-1F;
	Mon, 11 Sep 2023 09:53:46 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id A24FA1C0006; Mon, 11 Sep 2023 11:53:43 +0200 (CEST)
Date: Mon, 11 Sep 2023 11:53:43 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, CK Hu <ck.hu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, p.zabel@pengutronix.de,
	airlied@gmail.com, daniel@ffwll.ch, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.1 18/22] drm/mediatek: dp: Change logging to
 dev for mtk_dp_aux_transfer()
Message-ID: <ZP7jp1UDgJMqJzO4@duo.ucw.cz>
References: <20230908193407.3463368-1-sashal@kernel.org>
 <20230908193407.3463368-18-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4qeMU1aw+NQuf6wD"
Content-Disposition: inline
In-Reply-To: <20230908193407.3463368-18-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_025345_574896_5F49CDB7 
X-CRM114-Status: GOOD (  13.85  )
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


--4qeMU1aw+NQuf6wD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>=20
> [ Upstream commit fd70e2019bfbcb0ed90c5e23839bf510ce6acf8f ]
>=20
> Change logging from drm_{err,info}() to dev_{err,info}() in functions
> mtk_dp_aux_transfer() and mtk_dp_aux_do_transfer(): this will be
> essential to avoid getting NULL pointer kernel panics if any kind
> of error happens during AUX transfers happening before the bridge
> is attached.
>=20
> This may potentially start happening in a later commit implementing
> aux-bus support, as AUX transfers will be triggered from the panel
> driver (for EDID) before the mtk-dp bridge gets attached, and it's
> done in preparation for the same.

This is preparation for patches we are not going to apply to
stable. Please drop.

BR,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--4qeMU1aw+NQuf6wD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZP7jpwAKCRAw5/Bqldv6
8vYyAJ9Nk540JZqEdAv0hwqmNlfia7uUQgCggql3UPEMcq+KKIag1e2oo6SCcaU=
=O3KV
-----END PGP SIGNATURE-----

--4qeMU1aw+NQuf6wD--

