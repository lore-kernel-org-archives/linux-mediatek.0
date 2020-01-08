Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F162C282DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 13:00:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F79206F0
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 13:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jWAJsuhs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F79206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V3oKCOX2qEB1Dq1/ldKqUjFeABWo0ibv/8r/etcO86c=; b=jWAJsuhsFn+uATigD6kn4Bo0r
	dHNsWkxYAO9Z7Ku7Tdh22IVPApN2/QUzPI+5NWrcZ0wymED2995F+iv7UsR+WjSPNA1Y/ZODvl6Gj
	UUVDsk9nKpiXWzT/nMQ38AB9eqYuh/XCxdQhVRIT0u/Mwwg8v5DHkrj7jYGROp6X/SxJabkLJhw9/
	M74wGdZl0pJCbJwHJ2DiPXdlE0K7BL3ur8xseGSLQEs9ET8u7ICaaQW5oL6zEGnNFGS0aLghe3XRo
	K5dtIbuD025R4E9lkv9Sqm98iwlzkImw26xiWfgvh1ohItJUPbR5AniEN04OsjXsR2iIMTcggq6a1
	u2n62IJkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipAwi-0007i5-PF; Wed, 08 Jan 2020 13:00:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipAtK-0003Hl-CH; Wed, 08 Jan 2020 12:56:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 18140292E2E
Date: Wed, 8 Jan 2020 07:56:45 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v2 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
Message-ID: <20200108125645.GA3057@kevin>
References: <20200108052337.65916-1-drinkcat@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200108052337.65916-1-drinkcat@chromium.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_045655_159025_F5CEF9A1 
X-CRM114-Status: GOOD (  21.35  )
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
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6581840729732064312=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6581840729732064312==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Patches 1,2,3,6 are:

	Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

The remaining patches in the series are Acked-by.

Reportedly the kernel should work on certain Bifrost boards more or less
as-is, but I'm not positive about the details. It's possible some of
these are G72-specific or MT-specific issues; Robin and Stephen will
know more.

Very nice work so far!

Alyssa

On Wed, Jan 08, 2020 at 01:23:30PM +0800, Nicolas Boichat wrote:
> Hi!
>=20
> Sorry for the long delay since https://patchwork.kernel.org/patch/1113238=
1/,
> finally got around to give this a real try.
>=20
> The main purpose of this series is to upstream the dts change and the bin=
ding
> document, but I wanted to see how far I could probe the GPU, to check tha=
t the
> binding is indeed correct. The rest of the patches are RFC/work-in-progre=
ss, but
> I think some of them could already be picked up.
>=20
> So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
> backports to get the latest panfrost driver (I should probably try on
> linux-next at some point but this was the path of least resistance).
>=20
> I tested it as a module as it's more challenging (originally probing would
> work built-in, on boot, but not as a module, as I didn't have the power
> domain changes, and all power domains are on by default during boot).
>=20
> Probing logs looks like this, currently:
> [  221.867726] panfrost 13040000.gpu: clock rate =3D 511999970
> [  221.867929] panfrost 13040000.gpu: Linked as a consumer to regulator.14
> [  221.868600] panfrost 13040000.gpu: Linked as a consumer to regulator.31
> [  221.870586] panfrost 13040000.gpu: Linked as a consumer to genpd:0:130=
40000.gpu
> [  221.871492] panfrost 13040000.gpu: Linked as a consumer to genpd:1:130=
40000.gpu
> [  221.871866] panfrost 13040000.gpu: Linked as a consumer to genpd:2:130=
40000.gpu
> [  221.872427] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor =
0x3 status 0x0
> [  221.872439] panfrost 13040000.gpu: features: 00000000,13de77ff, issues=
: 00000000,00000400
> [  221.872445] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00=
000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [  221.872449] panfrost 13040000.gpu: shader_present=3D0x7 l2_present=3D0=
x1
> [  221.873526] panfrost 13040000.gpu: error powering up gpu stack
> [  221.878088] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu=
 on minor 2
> [  221.940817] panfrost 13040000.gpu: error powering up gpu stack
> [  222.018233] panfrost 13040000.gpu: error powering up gpu stack
> (repeated)
>=20
> So the GPU is probed, but there's an issue when powering up the STACK, not
> quite sure why, I'll try to have a deeper look, at some point.
>=20
> Thanks!
>=20
> Nicolas
>=20
> v2:
>  - Use sram instead of mali_sram as SRAM supply name.
>  - Rename mali@ to gpu@.
>  - Add dt-bindings changes
>  - Stacking patches after the device tree change that allow basic
>    probing (still incomplete and broken).
>=20
> Nicolas Boichat (7):
>   dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>   arm64: dts: mt8183: Add node for the Mali GPU
>   drm/panfrost: Improve error reporting in panfrost_gpu_power_on
>   drm/panfrost: Add support for a second regulator for the GPU
>   drm/panfrost: Add support for multiple power domain support
>   RFC: drm/panfrost: Add bifrost compatible string
>   RFC: drm/panfrost: devfreq: Add support for 2 regulators
>=20
>  .../bindings/gpu/arm,mali-bifrost.yaml        |  20 ++++
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 ++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 104 +++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  18 +++
>  drivers/gpu/drm/panfrost/panfrost_device.c    | 108 ++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h    |   7 ++
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |   1 +
>  drivers/gpu/drm/panfrost/panfrost_gpu.c       |  15 ++-
>  8 files changed, 267 insertions(+), 13 deletions(-)
>=20
> --=20
> 2.24.1.735.g03f4e72817-goog
>=20

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl4V0YcACgkQ/v5QWgr1
WA2z0Q//WX513kQuB2ztPrVdeEsNW0mXDe8s1n5AKMDsEY0qTeR48HQjPkug4+vX
RCioXDCqH4EJDlQ+JSJZHD+Ehsy9NgMxFpBeJZNO/S9yh05ThDuxi1Cpp0jAan5L
Xe1DqD9LeyOeH3UIOUkiUASyKs7JVozgO6x40jYa2z8bt4WN1aI4GOrJ0s0CpSOh
2oaN9oSPeCZYkAPk40m1Ygk/MNa+mpaVA5kDOF90YyhSh8fjXfhCopjRRTQh7koH
O94imgpCBY6WPDSQGQv9itX54ZR41JUTjE+APpGMG4wnoVt7bdRF/YZdePz8LNlZ
IqFWQ1e0EM0/BkoIGje9DO+jdC+Gu3ADBNrs67kqDlwaHMS7yb7q7HfGVYyS0+tF
cJylSj1GQ2ChQXu6KwyMf44IEloUfFZ7y2oJWBp1BMvLbu+Sgdr6uEBu2tYJ0AYA
L4WnOrEADX6BWjbo1BjKRflVYyjiz1SWptE4BrADD7aDuXH9w0OSE70x1fCscVBN
hhyT6aZSESsKSilhgCwrnacA+9htvu3uEmDS0YWpCZ9UpVw9a7rb/S4T6wUJZBBG
MoGXDDbLnFq2JcI48k45gp2HTGnjHwTsLmTpxrEo+QfnawFRVmnqWyPrHFJ1lVVO
BE0kDN4lbWYYZCZ4vKT4GLHwXGBLTaTI6b7/V2ZaLQtv4tCuHzM=
=jsFA
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--


--===============6581840729732064312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6581840729732064312==--

