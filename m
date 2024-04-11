Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C36EC04FF0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsq522d6tBLA0EgLvLx/2ydEzcQONAA1WnvR7lz0yE0=; b=dNOs146G8wF11CSVXQZlC5/sFt
	dC4BhdHlgQEFv5zw7Sa07mxAnbtSKlgNV83yHfoPr4oa/PETTXRSGiCruMJKlcAE7D068mqmwaAYW
	o19MnkGHsJdDQUyxxIahtqhTEgV588RkvorV9JGzTg+aH2TC6USgOJrJIZaeLl+bhopAwQQiIM69F
	KJqmxLGy2fwscKfCwGG+GOQzoFz6OB05+utSW10pjG+6IFQI92nJe0NiZOGZOX2TcFYBdycwLdFWX
	gFoiqJFMizO3PVCCflhryaRySSLtLtM4JF+IeAfV4uMHnz0yWqeHQvUKZirB+SNZRjNEy0YKWFwhC
	4q3zeROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw5i-0000000Cfzu-2ZpB;
	Thu, 11 Apr 2024 15:11:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw5f-0000000Cfy5-0fTx;
	Thu, 11 Apr 2024 15:11:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3AF76CE0C72;
	Thu, 11 Apr 2024 15:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDB7C072AA;
	Thu, 11 Apr 2024 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712848308;
	bh=6T6KZL6GFm5dCTrVlwn00hy4RM4V0SGfVe6aPd1R7eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2A2hrdjEIVuibFBNrpS6BXjfhhCO05wWLAaKYLRqQcVPWKaqNLFKaPHciCf3PO+F
	 mj/sg8ThQ0VSWezR2Ba75wqGNZOulphcaRR3aChjQbQ+Cl9PdIPdbfzxKzCYDUeBXV
	 yYXUVuThosnEIAeahGHEiqkyTG565GwMW1PJ8ZYRN84BB2CgsqM0d3FM1zO3jVYhGf
	 /rRDrgcSDXhXdoMCORo9IqTgYHSttoNdoqoHSK9/B5s5wzsAPKKr/WTmWwUoN5Yg0T
	 N5Czod5VdhjhP/CjgtlndGxZ13eDoXQkV8j2tR5HsbENJ1Jt6RcXJdwVSsQlM1o8aa
	 aiSi8C2dYJSuQ==
Date: Thu, 11 Apr 2024 16:11:42 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-scsi@vger.kernel.org, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	peter.wang@mediatek.com, chu.stanley@gmail.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, lgirdwood@gmail.com, broonie@kernel.org,
	matthias.bgg@gmail.com, stanley.chu@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 8/8] dt-bindings: ufs: mediatek,ufs: Document optional
 dvfsrc/va09 regulators
Message-ID: <20240411-oaf-stove-b291a21ef404@spud>
References: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
 <20240411114300.169055-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eEVVjrii83EVReKE"
Content-Disposition: inline
In-Reply-To: <20240411114300.169055-9-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_081151_399882_E18958D8 
X-CRM114-Status: UNSURE (   8.76  )
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


--eEVVjrii83EVReKE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 01:43:00PM +0200, AngeloGioacchino Del Regno wrote:
> Document the optional dvfsrc-vcore and va09 regulators used for,
> respectively, crypt boost and internal MPHY power management in
> when powering on/off the (external) MediaTek UFS PHY.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

btw:
<stanley.chu@mediatek.com>: host mailgw01.mediatek.com[216.200.240.184] sai=
d:
    550 Relaying mail to stanley.chu@mediatek.com is not allowed (in reply =
to
    RCPT TO command)

We should probably delete them from the binding (and maybe add yourself).

--eEVVjrii83EVReKE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhf9rgAKCRB4tDGHoIJi
0gdGAQCnKsqnZe2hv36Mjb03LruoALs7tf9nb2U0ZuIQcbhPMQD+LNrShTAhHbLs
R7ovr7nrZo1R+StUSKtpTyBux4Z+KQ8=
=LZcM
-----END PGP SIGNATURE-----

--eEVVjrii83EVReKE--

