Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23D9C8303C
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Jul 2025 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+smnfJ0bY+IFawuGcGZ/H4RoAnFNYqIwx8+xfv8nVE=; b=SHCkkfEC2D75sSrmLvL6qV0Uho
	okCDh7sMwaV6joobb2o3RbaukoFDl+PhEVZgtSBVS23w2HbulmTxGBKpg6+5IX8dM8KHvt5INbFmB
	v+UTvEjldiXwOPEA1TMi/5qvQL0dAdnjziy1O1/HMVrysC06gCzMQefWNSTqUB9AbH/sToAYmI7sM
	8/QvKXGtrPbndVfBsPjtu57xgWCYVDLJCSNEtqaBlfy5py1JIdttqVyJpJ16+XTD6z7ltaOvOIlY1
	PvNjGzczlAe7VX9zPa94L+9By8u4GsGRomsdlt8cr1vCmCtW2Z36bxNgsS5BdkJSNdcWTKM5u66dz
	CkcdiGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxi5-0000000GFYB-2yeO;
	Sat, 05 Jul 2025 07:53:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxV8-0000000GEUJ-15pI;
	Sat, 05 Jul 2025 07:39:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0DEB6A4F45B;
	Sat,  5 Jul 2025 07:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA7CC4CEE7;
	Sat,  5 Jul 2025 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751701196;
	bh=4+smnfJ0bY+IFawuGcGZ/H4RoAnFNYqIwx8+xfv8nVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spfl7yhjw229noSAYcjPw2hNzzUOhogF/lLOZxen7eRbmvKUCPRZNDN0tHFNQztgV
	 vYIS3RH+1xiGAiDy1XQzXBF3ZrRF26ZQyDWb7LRFP30cQ7uV9TqZr5VoqzS7J5U+DS
	 srgEkfZhP8/vAtGvtXcbWA/gyGzBC54xzdVfrp+O9tcPWzVeWAV7c30qDWz5f8KCra
	 +bGme6OaEeT+KlAyM80rE+CChREQbYqD6g1dOocfwWJ8CRt1u9vIV+pnKK1nEKpbt+
	 rGJ9yHrY/BaOMyiZOM0Sy2LWgTaoqFAN0LZzO7lZaQXJjOJgmSBv/nVicriWOxCdFL
	 pksO9saAXJeMA==
Date: Sat, 5 Jul 2025 09:39:53 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 4/6] net: airoha: npu: Read NPU interrupt lines
 from the DTS
Message-ID: <aGjWySVX1VosLjyd@lore-desk>
References: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
 <20250702-airoha-en7581-wlan-offlaod-v1-4-803009700b38@kernel.org>
 <20250704145604.GD41770@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lvihB4WnHkB75gUf"
Content-Disposition: inline
In-Reply-To: <20250704145604.GD41770@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_003958_364163_C574E278 
X-CRM114-Status: GOOD (  13.96  )
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


--lvihB4WnHkB75gUf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Jul 02, 2025 at 12:23:33AM +0200, Lorenzo Bianconi wrote:
> > Read all NPU supported IRQ lines from NPU device-tree node.
> > This is a preliminary patch to enable wlan flowtable offload for EN7581
> > SoC.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Hi Lorenzo,
>=20
> I think a bit more information is needed on how you plan to use this.
> Ideally in the form of a patch that does so.

Hi Simon,

These irqs are described in [0] (wlan irq line*). They are the irq lines fi=
red
by the NPU when the wlan traffic is not hw accelerated. These interrupts wi=
ll
be consumed by the MT76 driver (I will post the MT76 patches in the near fu=
ture).
I will improve the commit message in v2.

Regards,
Lorenzo

[0] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/net/airoha%2Cen7581-npu.yaml

--lvihB4WnHkB75gUf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaGjWyQAKCRA6cBh0uS2t
rFk8AP96S3uwwMjqG+gxNeu0vYtPO8k0wpSE8h8jcVdsA9LSxwD/TgAgGrhtQ0MH
X/X+uJ3xtH8+ZjGezUAS+b0IkEiR+Ag=
=z6Q3
-----END PGP SIGNATURE-----

--lvihB4WnHkB75gUf--

