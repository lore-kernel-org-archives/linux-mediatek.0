Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C2FC25B79
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 May 2024 18:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaUMhhMd54dtFhNkn184MRajR59ypgb42tdYKRQ0e/w=; b=A6ezi37SqWD/jPrIs3Ww7dkVow
	qksNfvwQImaR0ADN55ug8s48TUkk0ii6bmsks3tCll22nD8CE+86xmcRnQdBsvb+495mJb60dLEmS
	56fP7LeyHmLIFGiaEhqx3qx4bfKkoRZQ/rugA7J4e9aT7nHoQmSJjargSGjwKdPZh0oPvICGDy69+
	e7Uk4ldHwOLR+ASPsSVMVN28X/m7AX5rFrLQvOgS8/rRAmV9/egEa5qZaP9NX+pl1I7R8AVWakLF1
	1B2nuPBTxWwILPq3cokUrSsTpnxYOJx4qByhnUI8u69mouk55ZlbW9rH5/lquykcVglwRqKtlI2m3
	pDu9K+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAZgk-00000009b6V-44vh;
	Fri, 24 May 2024 18:30:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAZeL-00000009ZP9-3c3j;
	Fri, 24 May 2024 18:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iaUMhhMd54dtFhNkn184MRajR59ypgb42tdYKRQ0e/w=; b=KTlS6TwzczCt1/R3y4SsJZLzzy
	gyxNP2rzC+avinUvkqhDHoOrFZENmIwe7/LXZI6HJ+V7hau9D6qQB93NCp4ge6RYD0ZvOEM7q0w6q
	W1yMqT/qn9UfHH3+ocm8QdT732e/Hj77/aLRGhfhGh9Aqq77MaFILCwgCtMvPlmPn70EY5s3qD5eL
	fKv2+ac01Iyecv1ilfPVAOF6VRC+ZPn7YTFDV/XeBFjp4ERowXIU7xfcBO0lnj386BbjhIAMWx7Wa
	Xfwb4bdQfreFeisxKzeQ6puOSJ2q4G4LNCLQnNmkLo2guRtPimPlDUkoEC9JaQnkztLZq/V9BETy0
	kq8CRiYA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAZeF-00000009vKP-1re2;
	Fri, 24 May 2024 18:28:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A39476324B;
	Fri, 24 May 2024 18:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0203C32782;
	Fri, 24 May 2024 18:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716575280;
	bh=iaUMhhMd54dtFhNkn184MRajR59ypgb42tdYKRQ0e/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZhUH4aWWWqt0PgRmttC7fMf6OKQMKFQaHx8QA5i5qnWu8kaDHTUUXhD3PO6Sa7FJ
	 Zx49qQ8UmPSZ+TrCFfZwqS9Afm00Up9R3z7rqsG5edO+A7m+BcF3A5xpYuCVlPfj8X
	 Tcp8nU3vzO9CguXj3x6bEadMjMvPrDTzwVSMzeOQLrP/aDoLz+CwOT/DRrfTXsF7Fn
	 d8CaonqaKTBjxLjSBo9Y1dimcwQfBV3dnS9abLxfTmV2d6M2+Rzqu9s780YXYuMfG1
	 IDrcbU8MDHhzJU6qu6K/MgZPweJktjReCeIoP92+hVIMoOIwbQEB7zlQL89Iuzaw4y
	 5P4YONSSIG1eA==
Date: Fri, 24 May 2024 19:27:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Julien Panis <jpanis@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: thermal: mediatek: Rename thermal
 zone definitions for MT8186 and MT8188
Message-ID: <20240524-clatter-antivirus-b1939900ee58@spud>
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
 <20240524-mtk-thermal-mt818x-dtsi-v5-1-56f8579820e7@baylibre.com>
 <20240524-concerned-fritter-262f5e16293e@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="joiORIfrHLDgKDZJ"
Content-Disposition: inline
In-Reply-To: <20240524-concerned-fritter-262f5e16293e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_192813_601232_5CAD1073 
X-CRM114-Status: GOOD (  18.94  )
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


--joiORIfrHLDgKDZJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 07:24:47PM +0100, Conor Dooley wrote:
> On Fri, May 24, 2024 at 11:04:34AM +0200, Julien Panis wrote:
> > Use thermal zone names that make more sense.
> >=20
> > Signed-off-by: Julien Panis <jpanis@baylibre.com>
>=20
> Removing the defines is an ABI break. If these are all the same devices,
> but with more accurate naming, then keep the old defines and add new
> ones. However, the GPU1 define changes in the course of this patch which
> is more problematic.

> > [RFC] When PATCH 1/6 and 2/6 are squashed, checkpatch raises this WARNI=
NG:
> > "DT binding docs and includes should be a separate patch." That's why I
> > split them in this v5. The problem is that the driver can't be compiled
> > any more at PATCH 1/6. It needs PATCH 2/6 to be compiled. Should the
> > checkpatch warning be ignored here ? Should I finally squash PATCH 1/6
> > and PATCH 2/6 ?

Heh, and there's just one of the issues caused by your ABI break...

> Why do these names even make more sense? Where did the old names come
> from and where do the new?


Thanks,
Conor

--joiORIfrHLDgKDZJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlDcKgAKCRB4tDGHoIJi
0utTAP9kxCXNzFNcl8MrqFN8BJtQIS/Kvm+fTRGjMzR4A9EE5QD/UeZmmXbOuHu7
Gpb2kaTXJjMEecS77c+BSdgxlowavgM=
=xYN6
-----END PGP SIGNATURE-----

--joiORIfrHLDgKDZJ--

