Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367C9C77B7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 11:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxJCDzIA48b//fv9e6rdygKudsP+QYXovUJ5vLhRsUU=; b=4Fq7+CgTTAyq6RjvSz7Uj3qgIN
	RMdKNpb3UWNSt98NXqaR7+i6ClpoKrxCRe7PjS+HpR301Y750ldQN4D96H1WiatlPk0oEbvCF6/TG
	+DTnnJ9oAEcd0MXwWmzGhGVvLirU8P24oKGttjJn6smWqxujgC+BxP08yn6+InNDbpsmFgrV+Qqbl
	1cq0amxhikrrcC3sWLr5fHb85JE4cyh3BBhhnz1NKlSDZirjFNES8G7KbMoGuVySKU5+dey6+fh+l
	cdQY9PZnP7EjvByLy940veqocDaBW7pbPJlB3+Ms1LFJ5NKyPKtVMvs5vN8Bg9da9UTplUXBAjXWE
	Nt1cH5Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQeu-00Bjom-0N;
	Fri, 12 May 2023 11:10:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQeq-00BjnZ-2f;
	Fri, 12 May 2023 11:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683889796; x=1715425796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NxJCDzIA48b//fv9e6rdygKudsP+QYXovUJ5vLhRsUU=;
  b=tp/FYrkJIQr6E2mJwzKGXez+blko+mdDWnWWDMc/Z27KLQyNWN1TleRy
   EMxlQG/AWhpwms0zWxMXhhoxgxiyYzLybNFK4xU/Ok0W62bhvvG5VtQPc
   nVwdNP57yu7GY6ZGvMyo4H2qd8YG3WKv47HrbGU6+vood7RFrB8HKJ34b
   ktlo0cfRNOg6E5baTvuCd1FLS5w5eWdnboQrzJuTspsL10bvSEnVxctgR
   8uMvTSPcsM68zavVr0UXA9KeVUeS1CMGBE2smYk4qCs+SSO9ckSSLe4Cg
   FBzmpCOXZd/GzbSER5yevPai44CVh2dI9/9x21/xxfIAOSHAoDmofxB+3
   A==;
X-IronPort-AV: E=Sophos;i="5.99,269,1677567600"; 
   d="asc'?scan'208";a="213036513"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2023 04:09:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 12 May 2023 04:09:51 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 12 May 2023 04:09:47 -0700
Date: Fri, 12 May 2023 12:09:27 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yi-De Wu <yi-de.wu@mediatek.com>
CC: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang
	<ze-yu.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arch@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Trilok
 Soni <quic_tsoni@quicinc.com>, David Bradil <dbrazdil@google.com>, Jade Shih
	<jades.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Ivan Tseng
	<ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>, Shawn Hsiao
	<shawn.hsiao@mediatek.com>, PeiLun Suei <peilun.suei@mediatek.com>, Liju Chen
	<liju-clr.chen@mediatek.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: hypervisor: Add MediaTek GenieZone
 hypervisor
Message-ID: <20230512-kudos-stunt-489ee651bdd8@wendy>
References: <20230512080405.12043-1-yi-de.wu@mediatek.com>
 <20230512080405.12043-3-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jm8a6vav6fCrVMuQ"
Content-Disposition: inline
In-Reply-To: <20230512080405.12043-3-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_040956_871577_5A2CC118 
X-CRM114-Status: GOOD (  16.44  )
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

--jm8a6vav6fCrVMuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 04:04:00PM +0800, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
>=20
> Add documentation for GenieZone(gzvm) node. This node informs gzvm
> driver to start probing if geniezone hypervisor is available and
> able to do virtual machine operations.

Propagated from v2:
> > Why can't the driver just try and do virtual machine operations to
> > see
> > if the hypervisor is there? IOW, make your software interfaces
> > discoverable. DT is for non-discoverable hardware.
>=20
> Can do, our hypervisor is discoverable through invoking probing
> hypercall, and we use the device tree to prevent unnecessary module
> loading on all systems.

Rob is out of office at the moment, but that appears to be a request to
drop the use of devicetree entirely. Mainly re-posting so that that
conversation appears on the latest version of the patchset, given you
only replied to Rob today.

Thanks,
Conor.

--jm8a6vav6fCrVMuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF4eZwAKCRB4tDGHoIJi
0heIAQCuxzD4xO33tzAFrZou3AdawoxEN1YCIboEGZHW1IgEtQEA26XugE38j868
giM/FmO9kzgghTusFmhvQtjaEFFiPww=
=t/9L
-----END PGP SIGNATURE-----

--jm8a6vav6fCrVMuQ--

