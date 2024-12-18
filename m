Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3463E77188
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2024 16:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2SBxETvm52Px3OUzaEAAKhG+ijEolqfdP64sqQHZgM=; b=ROmAHbrjGIn6W1lKl704AYlQGv
	PL4LHXCAGJ1DSvxu/aC4H4tN+KWcER8XLhNUdPQ51BQlVQLSQtRLce9hep0cjYK5Qx9SVIEXtoEjB
	JLXirYg0Hvma3u3HpLAkWupMJIeIpYKfVytd6noeqZPmaaG45qpdfRFfslp8nupmHXGwJXcJILeqK
	NTsWZEEeCZORRXNsZhgf0Gp+PUhlBmdIlrCCXmpP+/28h3pBrZkRktKdDIJC85ste+NUiJ3nAG9pZ
	gsL5e2rqOEoxQUU8bPmfwYx/eLNiqY8aNHeZimMTMM9CGV76tpGr+wlr3qQZ00qo4wZILxKYhGyaj
	Ig7wjKeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxLB-0000000HExh-3XkP;
	Wed, 18 Dec 2024 16:56:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxJz-0000000HEhN-2Vxj;
	Wed, 18 Dec 2024 16:54:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C013A40B3B;
	Wed, 18 Dec 2024 16:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A029C4CECD;
	Wed, 18 Dec 2024 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734540890;
	bh=s2SBxETvm52Px3OUzaEAAKhG+ijEolqfdP64sqQHZgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pv18xzywipaGaOM6nq9UTilWK5sjSM1kEbxjo6Xpw6inXfOKAzFSfOIvKrq2aYGxv
	 ZudnAiQMcr8FqgqxMKyW7V1YQcbrFARCSOslU8PYjNq6hrBis9sZMjbFCnDRcoaRx1
	 smsgh2c6ieXd4V1gGP9WJv3t1s0/R8+O6yQSTzaXgB/5vxxLWFoiV9kwdfD6boPhbj
	 7X9RosnFG5JafHWbSsywmbT0Rz+dY95UHjJNZ6E9cd79dDsX7G28l0xqujYahkGC9v
	 XZpd71NE2vlVhstAi0ztSHn0qSQJdv21w1cIHaI7Emdk/4YEtF490hDc2GBl5hncXA
	 9jhnLbyHwXwrg==
Date: Wed, 18 Dec 2024 16:54:44 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mchehab@kernel.org,
	matthias.bgg@gmail.com, moudy.ho@mediatek.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, sebastian.fricke@collabora.com,
	macpaul.lin@mediatek.com
Subject: Re: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles
 for MT8188 MDP3
Message-ID: <20241218-skeleton-rockband-e25b7d60e7f3@spud>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
 <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HAI+tP8+x8Vxvsmq"
Content-Disposition: inline
In-Reply-To: <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_085451_701387_F77FB486 
X-CRM114-Status: UNSURE (   8.54  )
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


--HAI+tP8+x8Vxvsmq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 11:53:18AM +0100, AngeloGioacchino Del Regno wrote:
> Add compatible strings for the AAL, COLOR, MERGE and PADDING
> hardware components found in MediaTek's MT8188 SoC.
>=20
> This hardware is compatible with MT8195.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--HAI+tP8+x8Vxvsmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2L+VAAKCRB4tDGHoIJi
0u5SAP438pw1N/Szkws84SNvpbsLnX57vLfWAKvOv2y+wBPsVQEAwtZ4NMQzmlEn
7IK6CjupfLWoWguKpgjnYhFNDzV9MAQ=
=YaS1
-----END PGP SIGNATURE-----

--HAI+tP8+x8Vxvsmq--

