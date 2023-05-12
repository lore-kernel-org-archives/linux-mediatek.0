Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8079C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 11:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdr/QboOutQujzta21veyhN/BFRkmZJcWYh0ih36U+Q=; b=d8gkS6IaSkelB6CGT7jy6acj0q
	uXhjxtRtXXgKvvRV+QLxMA8DZnF3F7Nxr922VzMMHzAUg71SOkDlDJtHIChnRM6QvDc70/h0uUEzs
	fm060N849kBbTvvvLnSQIGa2k7afgPFOedrat98LJECpPtbv/BHgBposJ/fkMfaMgQWr/9eNbbVqh
	y7MwYIhrNIuQ7Abn0nGx8Whw55B6TUSiKR4UF7BjJeZmXIu8/TDNF7s8PVA5gRnu9WNlhnBeAqh/e
	T56eAT17cGnTKJVaMXtP4n3Ff9geIViJKfXP6x/h9jHTow8faBeHFXCIFB+J3Mo/9gQJk52dWRQyc
	FFOWRfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQX8-00Bipl-0f;
	Fri, 12 May 2023 11:01:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQX3-00BioE-3B;
	Fri, 12 May 2023 11:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683889313; x=1715425313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rdr/QboOutQujzta21veyhN/BFRkmZJcWYh0ih36U+Q=;
  b=1o9MqtENB1p7FqnCn3WEl+FxkGlerLxqb1261Z9nxpRT/F78tdGP+rV7
   OoroSGaOSDE/bHsry9vutVsV8tnUUEfqKAEQrQ+rz2oEbbfYdMGRaOF1W
   eyvx3tqcNs7WSbAbASr9F/q8r7QRhyQrt446/IogT+UMDMkUs7fTV7rQA
   aUxW7EqYJkOW786Vvrmh263pqNqRrj3IRc4QmMnznCINhiqsByr2Y5s9M
   BM40Qc46/E4THvCb1o1n3f1IuyzsZ9wJZ7MAbjWesURksWMSsAu3Xcw/J
   8e69rvMNxdcn+o3epAFbXb7O1IB14sHeiL6l8So9d5uNkCShNRyCqSika
   A==;
X-IronPort-AV: E=Sophos;i="5.99,269,1677567600"; 
   d="asc'?scan'208";a="215055820"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2023 04:01:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 12 May 2023 04:01:43 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 12 May 2023 04:01:39 -0700
Date: Fri, 12 May 2023 12:01:18 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yi-De Wu =?utf-8?B?KOWQs+S4gOW+tyk=?= <Yi-De.Wu@mediatek.com>
CC: "robh@kernel.org" <robh@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, MY Chuang
 =?utf-8?B?KOiOiuaYjui6jSk=?= <MY.Chuang@mediatek.com>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"quic_tsoni@quicinc.com" <quic_tsoni@quicinc.com>, Shawn Hsiao
 =?utf-8?B?KOiVreW/l+elpSk=?= <shawn.hsiao@mediatek.com>, Miles Chen
 =?utf-8?B?KOmZs+awkeaouik=?= <Miles.Chen@mediatek.com>, PeiLun Suei
 =?utf-8?B?KOmai+WfueWAqyk=?= <PeiLun.Suei@mediatek.com>, Liju-clr Chen
 =?utf-8?B?KOmZs+m6l+Wmgik=?= <Liju-clr.Chen@mediatek.com>, Jades Shih
 =?utf-8?B?KOaWveWQkeeOqCk=?= <jades.shih@mediatek.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dbrazdil@google.com"
	<dbrazdil@google.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Yingshiuan Pan
 =?utf-8?B?KOa9mOepjui7kik=?= <Yingshiuan.Pan@mediatek.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "arnd@arndb.de"
	<arnd@arndb.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Ze-yu Wang =?utf-8?B?KOeOi+a+pOWuhyk=?= <Ze-yu.Wang@mediatek.com>,
	"will@kernel.org" <will@kernel.org>, Ivan Tseng =?utf-8?B?KOabvuW/l+i7kik=?=
	<ivan.tseng@mediatek.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: hypervisor: Add MediaTek GenieZone
 hypervisor
Message-ID: <20230512-marine-kilowatt-44a642124ac7@wendy>
References: <20230428103622.18291-1-yi-de.wu@mediatek.com>
 <20230428103622.18291-3-yi-de.wu@mediatek.com>
 <20230428212411.GA292303-robh@kernel.org>
 <ec4cae2e6da4a64bc3983ffdde03f51e185d3609.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SGI1uxhA9flSLqZg"
Content-Disposition: inline
In-Reply-To: <ec4cae2e6da4a64bc3983ffdde03f51e185d3609.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_040154_222183_87964905 
X-CRM114-Status: GOOD (  18.76  )
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

--SGI1uxhA9flSLqZg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 06:42:51AM +0000, Yi-De Wu (=E5=90=B3=E4=B8=80=E5=
=BE=B7) wrote:
> On Fri, 2023-04-28 at 16:24 -0500, Rob Herring wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >=20
> > On Fri, Apr 28, 2023 at 06:36:17PM +0800, Yi-De Wu wrote:
> > > From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> > >=20
> > > Add documentation for GenieZone(gzvm) node. This node informs gzvm
> > > driver to start probing if geniezone hypervisor is available and
> > > able to do virtual machine operations.
> >=20
> > Why can't the driver just try and do virtual machine operations to
> > see
> > if the hypervisor is there? IOW, make your software interfaces
> > discoverable. DT is for non-discoverable hardware.
> >=20
> > Rob
>=20
> Can do, our hypervisor is discoverable through invoking probing
> hypercall, and we use the device tree to prevent unnecessary module
> loading on all systems.

Please do not wait until immediately prior to submitting version N+1
before replying to any of the comments on version N.
This creates a confusing scenario, where some review comments may be
missed due to parallel discussion.

Thanks,
Conor.


--SGI1uxhA9flSLqZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF4cfgAKCRB4tDGHoIJi
0sIUAQCB81kFCDM+sykANmi0tAinLKojHS+RwXtrVqk3OUoxcAEA06+Iy8V0A75T
x/4Pd33AIh4X9j7/BLZ90YVbOSYWVQ0=
=ydlj
-----END PGP SIGNATURE-----

--SGI1uxhA9flSLqZg--

