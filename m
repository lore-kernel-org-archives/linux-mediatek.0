Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4DFC87FCF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Aug 2025 18:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcZLAPBrcBRZbgAiiOIrhCddWIN8mlNpYkGIS5xui4Q=; b=JbT2eqpKaobBb20vHEt3UnQvBL
	chyNEkprXPdOiAAz0IfVh24EFgue9b7/+/5BTkkXYvLPrP1KGD8S+j3sEzrDtG+ZnWLXswlbiZ7ny
	frm5feEEDHuCQzeoEFT21W8vPAb/cndGYApV8AYDmdQz2x9T0lKk2Q+2JqI32xrByS/mmfDwx1DsX
	WMlbn9zwma84Hc0S2tn1/Qrxv++JpXN/jEnEUmuop9lMW/KeImMFwN0kmaL4y/a5rt/I6LI4GY+ic
	uoseNO5q03rrJFoRWLei68OU7rvYR4vedUnyNW449hZTEpEKDICAO9FXs7gZ82IKnH9cRhVtxAs3j
	mVuxgAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrD-0000000EeWz-1sR3;
	Wed, 13 Aug 2025 18:05:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEhL-0000000ETMW-1CW3;
	Wed, 13 Aug 2025 16:51:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8DC6458EB;
	Wed, 13 Aug 2025 16:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F9FC4CEF1;
	Wed, 13 Aug 2025 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755103894;
	bh=alZxexKuJRxDY0e4fO9bj6yA3dNEp3f4NpaBSvlkKBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDg2ZCyH4ajXLj2AbKVypeCzSlWWhmIXAAed3U43vAolmHFPzJIq9xj+2SQS2CGnf
	 A1fi6/1H5G+qtbMRoasHX2D6eKcY7JszjfW52QpacYgT0YMP1tdEpe3HcD3GPv1r9W
	 L+ly6AHYVg70ypQulceswIE+sAUx1g8krjGpvCa5mkV1MvbaYlhbUgx0jXWenuEEW1
	 0Y/ijSPMoHWjq09GvXB9cDpHC78faqTjOJrKxCVp9OzqMF/CRWYgyw/Nytt75o7mC/
	 mXe15yxiS0h6ZqTBOcAYQLMsJ2t4ZW1SCbELcvZBCUDtI+ztjNd7dOaiutegNF+mse
	 RHfwFT3XnI0Dw==
Date: Wed, 13 Aug 2025 17:51:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, dlan@gentoo.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	lkundrak@v3.sk, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org, spacemit@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] dt-bindings: serial: 8250: allow "main" and "uart" as
 clock names
Message-ID: <20250813-squint-glass-b68c6520a229@spud>
References: <20250813031338.2328392-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1anDfOTh12y5hzMv"
Content-Disposition: inline
In-Reply-To: <20250813031338.2328392-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_095135_347119_0507C4AA 
X-CRM114-Status: GOOD (  15.58  )
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


--1anDfOTh12y5hzMv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:13:35PM -0500, Alex Elder wrote:
> There are two compatible strings defined in "8250.yaml" that require
> two clocks to be specified, along with their names:
>   - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
>   - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"
>=20
> When only one clock is used, the name is not required.  However there
> are two places that do specify a name:
>   - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
>     compatible serial device is named "main"
>   - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
>     serial device is named "uart"
>=20
> In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock
> 'uartclk' and 'reg' for nxp,lpc1850-uart"), Frank Li added the
> restriction that two named clocks be used for the NXP platform
> mentioned above.
>=20
> Change that logic, so that an additional condition for (only) the
> SpacemiT platform similarly restricts the two clocks to have the
> names "core" and "bus".
>=20
> Finally, add "main" and "uart" as allowed names when a single clock is
> specified.
>=20
> Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional sec=
ond clock")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@i=
ntel.com/
> Signed-off-by: Alex Elder <elder@riscstar.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--1anDfOTh12y5hzMv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJzCkAAKCRB4tDGHoIJi
0hf5AQCJLTs84F3yXa+J58tT2Ytl+UUy+1ftd0PWZy75L6EgiQEAqd0HSvhT8Kdp
3558GIp4PpqlN9n18fVGmK6z3ca8Cgo=
=iaPg
-----END PGP SIGNATURE-----

--1anDfOTh12y5hzMv--

