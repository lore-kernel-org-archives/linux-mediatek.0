Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4627ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 17:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdgQNuyUpaK4Qa2K1YgmQdW7vQY4H+d1cZ2faMsjPVc=; b=DPoWvh2RyrEFNJELjOs3H0Cy6b
	12SDrSDuO2fMmjNVjb8MuzP8gpLrSW8Ul7IbaQRSTiTkgDviv+MIZZOlOy4eBdKFmDfWX6OVB/PZv
	YWMTTyA39GW3FyZ2BOIyY6vFBMTJhm67FN/Us8hwIS8XvGYhvbUpsh0ksepg13FjraZiubXX4d8GX
	KPzPrZqIaLoc5q+X3sYLhxiI4JYwT+iJ977+qHzRGSXA8ZIEn1uyFY46d0uD+q9Qoe/JCRmQk9Qgc
	R10kfZGyCnJM9FumNEdACOFphGZIqgR5U4qT1opyheWQZBDPSeNGQC2SDjLq2AdaLWg+c/VERO9Aa
	XfoDi/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omeiy-00FpFg-77; Sun, 23 Oct 2022 17:25:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omeiv-00FpF2-72
	for linux-mediatek@lists.infradead.org; Sun, 23 Oct 2022 17:25:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A1D9EB80D90;
	Sun, 23 Oct 2022 17:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFF7C433C1;
	Sun, 23 Oct 2022 17:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666545918;
	bh=LdgQNuyUpaK4Qa2K1YgmQdW7vQY4H+d1cZ2faMsjPVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRWmf82tgoIDbOYVYCh8F47dj9a2t107xeMsn77CljIRxNJO7rTfH/Idh9SV2xZny
	 whXCMymhsyb+NXr+8mli6wQUZnRU87AmtDWI/xYRdAr4eJbv89/jCuMgAMNNYN1FSl
	 6FmrYdDQqTzA2rB/48ZiOnF2U1hcj1HnsZwTxB1jBqgh2cRga1JgDxOrnYfynVaOsw
	 lqS4iQGonoU8+dwgNnToGOLgWX9X/e9uFaSOazKQmHkJ2jPkuoA2dv5fOZ+fgnV2Lv
	 8grGy2d9ITEzdikvgLPgc41ohBes3Di8j0Z4qXZFH1VRtE+r9H/sZS/QzS189UZ/Hh
	 cUiSHLGMrYYSw==
Date: Sun, 23 Oct 2022 19:25:14 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com, Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com, ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com, devicetree@vger.kernel.org,
	robh@kernel.org, daniel@makrotopia.org
Subject: Re: [PATCH net-next 0/6] introduce WED RX support to MT7986 SoC
Message-ID: <Y1V4+jTPXFqN3YMS@lore-desk>
References: <cover.1666368566.git.lorenzo@kernel.org>
 <20221021211006.3c9b7f29@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i43KW9vR7CAOsKUx"
Content-Disposition: inline
In-Reply-To: <20221021211006.3c9b7f29@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_102521_427984_E26D210D 
X-CRM114-Status: GOOD (  10.61  )
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


--i43KW9vR7CAOsKUx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, 21 Oct 2022 18:18:30 +0200 Lorenzo Bianconi wrote:
> > Similar to TX counterpart available on MT7622 and MT7986, introduce
> > RX Wireless Ethernet Dispatch available on MT7986 SoC in order to
> > offload traffic received by wlan nic to the wired interfaces (lan/wan).
>=20
> Run sparse over these, please. There's warnings in them thar patches.

ack, I will fix them in v2.

Regards,
Lorenzo

--i43KW9vR7CAOsKUx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY1V4+gAKCRA6cBh0uS2t
rOp0AQDQNc0wwhW3l5aRc5qXLnkc5K1s1sE/e3sT89GFQjMUswD8D212gImgI+Nm
DUUU+WcMOeQ2LibMcVcZ+KQR8TdwQAA=
=/hsY
-----END PGP SIGNATURE-----

--i43KW9vR7CAOsKUx--

