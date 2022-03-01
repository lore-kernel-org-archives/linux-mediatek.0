Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05EAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAPzFxe7DTCbZOe7jERtrU1H5Lgp6YWd+HKL/Eb5TR4=; b=AooBl/Ki0GPdb3undRSnZkwTO4
	VAoC3YpAapY0SKEYwbJbSeavGZV5A2Q+oyJGDO+78ezhW7j+FlIrsOs1uVD7Lhyaj/WiEkrDdA4vL
	89ALcdC6gJOeA7GHH2pvd6vi7p+cvFoLCHq8itgjVep2HacHHgG8j72c5KsvArHpf7DCosWpxGK0n
	8Tu1AA6Oe2ZWNh2GuUWZVR/cozQGa/UTM2mgie0vtmLtJrorXth3yMUlY9dYYSD9VImE2eYnO6OJf
	9szW3NXzkbuim3zao/ZkImFS2LP6TBWqjjbffS7+lAnd3fBsAEcv4yiOYjXnOwT5jnj6OCuuR+f5/
	iekDv7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP4IS-00HFz2-LW; Tue, 01 Mar 2022 15:20:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP4IE-00HFrP-TL; Tue, 01 Mar 2022 15:20:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5DA86B8185E;
 Tue,  1 Mar 2022 15:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CC0C340F2;
 Tue,  1 Mar 2022 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646147999;
 bh=6WdPYlRRYto5saZQjAt1aU5OIon76Psy0U/rtvu70N4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CUN8wPn0R5ePSFVEDi7CXzu+mFoVutS8zL840uGDozHncQ3f9NJVnWdB3V2ZCW96Q
 zOhBrBT+3q7v8FNuVS1vxNpJCIhReo3sXEnGi5vlYtVkjoqO4BZURHwYiaMUkpHDND
 m5+L1YjejTUkeWC22opPIbAh9kEUHeR3rI7Jn7LMGvtrFe8EQAaxOKJvvWWfxzSuBs
 /6qkEg8HGxRKTdNbi1f6X1xDKJ/guWC8M/POOsgL0u6adeBdlZBfv+q5NcDEBmhHEz
 swbZ93vgZex9QCapkMFETOPBBXoNPp3bQvWTjX5ApzAC1zS0EeHQZQs4R5tCZT5Zmi
 T6226jrkbqYig==
Date: Tue, 1 Mar 2022 16:19:56 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Boris Lysov <arzamas-16@mail.ee>
Cc: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
Subject: Re: [PATCH 0/2] i2c: mediatek: remove mt6577 support
Message-ID: <Yh45nDwqnLInrzzE@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Boris Lysov <arzamas-16@mail.ee>, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
References: <20220120185853.24266-1-arzamas-16@mail.ee>
MIME-Version: 1.0
In-Reply-To: <20220120185853.24266-1-arzamas-16@mail.ee>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_072003_351774_B23419B0 
X-CRM114-Status: GOOD (  16.84  )
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
Content-Type: multipart/mixed; boundary="===============3008548249762100503=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3008548249762100503==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ipGfr5olEQRqqROr"
Content-Disposition: inline


--ipGfr5olEQRqqROr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 20, 2022 at 09:58:51PM +0300, Boris Lysov wrote:
> This small patch series removes mt6577 support from the i2c-mt65xx driver=
 and
> devicectree binding documentation.
>=20
> The existing i2c-mt65xx driver relies on DMA since it was first introduce=
d.
> mt6577 does not support DMA [1] for I2C and SoC's Generic DMA engine cann=
ot
> be used for this purpose, too, which makes this particular driver incompa=
tible
> with mt6577 and other similar SoCs with same I2C IP.

Qii Wang, what do you think about this series?

>=20
> [1] see references in
> https://lists.infradead.org/pipermail/linux-mediatek/2021-October/030333.=
html
>=20
> Boris Lysov (2):
>   dt-bindings: i2c: i2c-mt65xx: remove compatibility with mt6577
>   i2c: mediatek: remove compatibility with mt6577
>=20
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  9 +++---
>  drivers/i2c/busses/i2c-mt65xx.c               | 28 +++++++++----------
>  2 files changed, 18 insertions(+), 19 deletions(-)
>=20
> --=20
> 2.20.1
>=20

--ipGfr5olEQRqqROr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeOZsACgkQFA3kzBSg
KbYnbA//RaP6PPZwNSxx0W0QIDttAVjKfk8/PHBn1Dhjn+AoD1y8UTnw7R9wlxDd
dyyaT32xrfpRfMkgrZNTcl9+S0qcAVCpjsAvVZ5ZHw/3MEdlCdLjEos/zcOHrEoi
6Y8T4m0DbPYlgmIlQ/3KBTswT5IPkWxSzx5yIlC1/QrVS360xqE6e+6GNZDnbc+X
v/CmTZcHcpqiEcOiZRbXw/REV7FQWzK/LiA5DqKxRBBeem0XJhLO1lJXxx5ja+Z4
rKnZL0b9iCkag3WhJ9lT2j6EGAVr/zT011VR4h3IM5sA4TyhfMKULuv3V6W50Ybx
ITlnhf4C19v2MRiFyo+rOCUwZyToRR7PD/W9duK4Mwntx38c3IwJFOTo59ukUlQe
6RgA6VkRy5JbII7Mpzdk1cAuhxmlaUkWuL9CgHpkJ7UnX1VR1kY+aq9sR8QlrXHQ
JRYfmxLdrDP75Bjg1X3Ny5UcHcHyGcI6a45y+qXufm64k6ikl55kPVoZxYwPpLsF
q4cebFNoM+lXf2xT0LL+q1wLMABtQajMETit9Y809QmTg2oqSOFy8TRaGB3z2qS+
g3oa6jVRdodKrWDheJL1GvPNAQ5xItlUSilrQziPSpzX98EG2+bFSz5HBwem6EnW
5NqkNBjjSYRp/OoS/Mx7bVf7t8nENiw5UKmqNE7jOqf8MzzYw9E=
=05Mr
-----END PGP SIGNATURE-----

--ipGfr5olEQRqqROr--


--===============3008548249762100503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3008548249762100503==--

