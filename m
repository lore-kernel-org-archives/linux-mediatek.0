Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC21C10DCE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 12:36:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F21A2208C3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 12:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k81nzJOn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F21A2208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7CPB7JAvqaRDI2BhE4oIEbW69UdpXxICfbDNZh8DW5U=; b=k81nzJOn+IXQVN/qxTpJ8+8Ad
	dh48+91o27oERgRmALsmRVBVv9phzJLFRGN8VnhbnO2JbXUm8oXNcVemxXi2vn8iRehPTfEFF3aZB
	L/O7RAj1WQyBYcYI7uriZtMEVoipCH/vM/8fMNRhvZUQ1Qe8Ohyx02qdp6HUOj2JRP024o8ybkB4z
	lBVuw0+JT7CfzJW4CyEAuc89k6lV4DTQLeiZ6Kl06UC9UvmCNtmpkawdGPURu+q/b33k+29krAUkr
	bAg/EY1p+IO0hXRHADXFpEoxH3b17rHP0CKSSU3IopsccFqzoUVIUwuilPPOU9Uy9CqxRwIRzAjnI
	Gdm+5pAkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jACD2-0003VE-9F; Fri, 06 Mar 2020 12:36:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jACCm-0003Gv-UK; Fri, 06 Mar 2020 12:35:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id EE776297096
Date: Fri, 6 Mar 2020 07:35:43 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v5 0/4] Add dts for mt8183 GPU (and misc panfrost patches)
Message-ID: <20200306123543.GA1821@kevin>
References: <20200306041345.259332-1-drinkcat@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200306041345.259332-1-drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_043553_112857_1D87B9CB 
X-CRM114-Status: GOOD (  19.77  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Nick Fan <nick.fan@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4022390129147575395=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4022390129147575395==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Series has my r-b :)

On Fri, Mar 06, 2020 at 12:13:41PM +0800, Nicolas Boichat wrote:
> Hi!
>=20
> Follow-up on the v4: https://patchwork.kernel.org/cover/11369777/, some
> of the core patches got merged already (thanks Rob!).
>=20
> The main purpose of this series is to upstream the dts change and the
> binding document, but I wanted to see how far I could probe the GPU, to
> check that the binding is indeed correct. The rest of the patches are
> RFC/work-in-progress.
>=20
> So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
> backports to get the latest panfrost driver (I should probably try on
> linux-next at some point but this was the path of least resistance).
>=20
> I tested it as a module as it's more challenging (originally probing would
> work built-in, on boot, but not as a module, as I didn't have the power
> domain changes, and all power domains are on by default during boot).
>=20
> Probing logs looks like this, currently. They look sane.
> [  501.319728] panfrost 13040000.gpu: clock rate =3D 511999970
> [  501.320041] panfrost 13040000.gpu: Linked as a consumer to regulator.14
> [  501.320102] panfrost 13040000.gpu: Linked as a consumer to regulator.31
> [  501.320651] panfrost 13040000.gpu: Linked as a consumer to genpd:0:130=
40000.gpu
> [  501.320954] panfrost 13040000.gpu: Linked as a consumer to genpd:1:130=
40000.gpu
> [  501.321062] panfrost 13040000.gpu: Linked as a consumer to genpd:2:130=
40000.gpu
> [  501.321734] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor =
0x3 status 0x0
> [  501.321741] panfrost 13040000.gpu: features: 00000000,13de77ff, issues=
: 00000000,00000400
> [  501.321747] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00=
000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [  501.321752] panfrost 13040000.gpu: shader_present=3D0x7 l2_present=3D0=
x1
> [  501.324951] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu=
 on minor 2
>=20
> Some more changes are still required to get devfreq working, and of course
> I do not have a userspace driver to test this with.
>=20
> I believe at least patches 1 & 2 can be merged (2 depends on another
> patch series, so maybe we could start with 1 only for now...).
>=20
> Thanks!
>=20
> Nicolas Boichat (4):
>   dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>   arm64: dts: mt8183: Add node for the Mali GPU
>   RFC: drm/panfrost: Add mt8183-mali compatible string
>   RFC: drm/panfrost: devfreq: Add support for 2 regulators
>=20
>  .../bindings/gpu/arm,mali-bifrost.yaml        |  25 +++++
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 ++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  17 +++
>  drivers/gpu/drm/panfrost/panfrost_device.h    |   1 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  11 ++
>  6 files changed, 166 insertions(+)
>=20
> --=20
> 2.25.1.481.gfbce0eb801-goog
>=20

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl5iQ5oACgkQ/v5QWgr1
WA2Wfg/5Acx01qtWt1r6N8Am7rBvPeoVpmq9TkjjQ4RxwOUOdNmY0EdHiFThQMh+
IcRWZd7FYzM43WLebWWFVxcPgajS9PXB6MPiJcYwxVGvck0F6AW1SbZysoLdY4S8
AkaNQ5FLVHdr0sa5dkD80nAbLEnIyzkE48WXg7g1hIbdOjompFKdsHyv8UllLDdh
exBzqdVkfCd4UWCF+89cxDhGFUB/KFKdzk3jezMTCzkFzH6U0NWSn54oRJNFYdn8
x+1IscTm8NEZ9ghuldVcTLkiw+HDeEJ7tOgIq9REuUelwk312INaju2cxhF60Id0
JgIrNn+p7G9E3sEMlrrfDkEAm2kzS9WDVQGJ2vG2hNpwAZZBmLPnGQuV0pFuUSCB
Te5JrsafvUHZVWa3WrwFAxWM6F1iIfPlSXSQ1OYE6TrcSE2jWTZpWfXrHTg1oZOn
vTg+ZPyg7VfH/VtI/BmjIGeCPDVvPwCmlIbLv351H/uZ+sLWbT0Q1c9Y8qptg0MY
ldn2eRHR//yugNzH1QIWr6aPz0HTRHhEomrckZONP+40n1LinxHZEapOeTQnw0Ch
IoQjaQCaNW615SGOd3z2ncpg84xcc9SS3xb8Lb2WZZb9GHCIP3479jdCj52fnlQG
hYdjTL7nX7jwJkAXIUza7jiC2KIw7J8AfU10nxdyM9F5pHU9KS4=
=SWdB
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--


--===============4022390129147575395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4022390129147575395==--

