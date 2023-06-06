Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA23C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 16:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTp9kr3weat8A81o11J1xfLOzUYxOKz47o1J9HVTerw=; b=Ssn9ouvte0RxV/WLvIgPko3bXn
	jEb7VUlLPcoTku86HTgQLlMRzZPmZ+z/nUCMeb7EQBt671+Mj4/FPD11mMZ9QadwChIzzbQ54XCLB
	mlqz+0BGNWix4xLesnwfqrtob7Uw4tkdyoQzahzaTnrW0iXeG5LAgEIm8gM5Pw+AIusr6Houd5UXL
	J0BVcSARZgsMZL/Bhx8ciqlp0whlH9IBJ467eCS8HdUuz5yuz5/ZDR2+SBGILvUMaDWe7JxClN6Ec
	vQ9dw2p2aUvbKBpYC+S/40cmyRBMDGu3YOCpaa9QzYiPK5tGjCbm/KpZLTccQpbv8J9SM8EvIqjnz
	ntx06+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Z9R-002Lds-2n;
	Tue, 06 Jun 2023 16:03:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Z9O-002LcW-24
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 16:03:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q6Z8u-0001e5-46; Tue, 06 Jun 2023 18:02:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q6Z8l-005Xat-NX; Tue, 06 Jun 2023 18:02:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q6Z8k-00BkQ7-PH; Tue, 06 Jun 2023 18:02:34 +0200
Date: Tue, 6 Jun 2023 18:02:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Toan Le <toan@os.amperecomputing.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-rockchip@lists.infradead.org, Joyce Ooi <joyce.ooi@intel.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rahul Tanwar <rtanwar@maxlinear.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-msm@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	linux-tegra@vger.kernel.org, kernel@pengutronix.de,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Ryder Lee <ryder.lee@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Tom Joseph <tjoseph@cadence.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH 00/15] PCI: Convert to platform remove callback returning
 void
Message-ID: <20230606160234.elcvyqlz2j3mggih@pengutronix.de>
References: <20230530140742.ebbrxmpieuphbmz3@pengutronix.de>
 <ZHphHkNLO4tEJIm/@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zxsm4y3nhwayyseu"
Content-Disposition: inline
In-Reply-To: <ZHphHkNLO4tEJIm/@bhelgaas>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_090314_677023_431969B0 
X-CRM114-Status: GOOD (  31.33  )
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


--zxsm4y3nhwayyseu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[dropped Tom Joseph and Joyce Ooi from Cc:, my last mail in this thread
resulted in a bounce for their addresses.]

On Fri, Jun 02, 2023 at 04:37:34PM -0500, Bjorn Helgaas wrote:
> On Tue, May 30, 2023 at 04:07:42PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello Bjorn,
> >=20
> > On Tue, Mar 21, 2023 at 08:31:53PM +0100, Uwe Kleine-K=F6nig wrote:
> > > this series adapts the platform drivers below drivers/pci to use the
> > > .remove_new() callback. Compared to the traditional .remove() callback
> > > .remove_new() returns no value. This is a good thing because the driv=
er core
> > > doesn't (and cannot) cope for errors during remove. The only effect o=
f a
> > > non-zero return value in .remove() is that the driver core emits a wa=
rning. The
> > > device is removed anyhow and an early return from .remove() usually y=
ields a
> > > resource leak.
> > >=20
> > > By changing the remove callback to return void driver authors cannot
> > > reasonably assume any more that there is some kind of cleanup later.
> > >=20
> > > All drivers were easy to convert as they all returned zero in their
> > > remove callback. Only for iproc the conversion wasn't trivial, the ot=
her
> > > were converted using coccinelle.
> > >=20
> > > There are no interdependencies between these patches. So even if there
> > > are some concerns for individual patches, I ask you to apply the
> > > remaining set. Then I only have to care for the review feedback of the
> > > refused patches. (Having said that I don't expect any serious objecti=
on,
> > > just things like squashing or separating patches, or maybe I picked a
> > > wrong subject prefix.)
> >=20
> > These patches wait for application for quite some time now. They apply
> > just fine to v6.4-rc1 and next/master. Would be great to get them in
> > during the next merge window and ideally give them some time in next
> > before.
>=20
> Thanks, these seem fine to me, and Lorenzo normally takes care of
> drivers/pci/controller/.  Lorenzo, if it's easier to have me apply
> them, that's fine, too, just let me know.
>=20
> The only tweaks I would make would be:
>=20
>   PCI: j721e: Convert to platform remove callback returning void
>   PCI: dwc: Convert to platform remove callback returning void

If it's easier for you (or Lorenzo) I can resend with these tweaks.
Otherwise if these are adapted when applying them, that's fine for me,
too. Just tell me if I should do anything here.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zxsm4y3nhwayyseu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR/WJkACgkQj4D7WH0S
/k6o4QgAswvhCfm74HQnoTwnC+IoMm4EP1uz/xxeEg2IRLGbrC34TS1Z84R+TfOq
npW+Bvfva1xto9TqFtxPapMCURjsueSiw5mqKI4wkMiNqBPBmCoR1kzsPM4zY/v1
hI83Ar+x5UD94+L6lMpQKKl4diNnzFZPAJGX5576Pb/OsrYPBelBsiD2CPyas+ij
CvVl7AhNVPfTIr8db3ngHUE+Dc47kiTXmrgk9PMd7v4gFWRMLmF0jcRLX5Ri0TbA
G4d95IrdAHIC/okElC+mPjfp6Ilgzlhvaxupaw26oS0mEKSqG9ZOZh5E17boefVN
cISjXwl3/zNxHdQUilLemtYFK/fyTQ==
=aXLj
-----END PGP SIGNATURE-----

--zxsm4y3nhwayyseu--

