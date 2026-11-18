Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D01606A31C
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 14:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nz/RAEjE;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=a7OWiBHH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=; b=Nz/RAEjEQx49MCsmsxRaTZrWWY
	QLRvjDI6lIJKDDezvhc1bHu/yuSrB6X2bQLUHTFum93AMU3AcxAPDTdTCfiq8ZUqQlnKXjqq7hVuB
	SFjtd/Ix9hKrk9gNW312qzCdv79M6V1+3lqRWcUiVo3Uil5C/tO84CCxtdZgEhWxezNnwe6K/sdzB
	IhD9ZqiOeAPddhDe9BCa9J9Nf1xM7yxOuiFiaKlTwFmh4tHMUwTUTQJ6VpOIy6ZKdS4hXf8NJsthl
	A2hEYzuFBUXmd/PFonIZOEX1E1NINNBLlpahv3MTLKZPu/YBLSWxA17iPrHTNAsLZhEEjyfBtySNL
	PhilDQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgJH-0000000939d-2g3I;
	Wed, 18 Nov 2026 14:06:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgJC-0000000936V-0igo
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 14:06:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so14096885e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795010804; x=1795615604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
        b=a7OWiBHHeBpBKtUK3YqsZwYROT3IvgmEwhlPetuS3hbUlbRr10imUpHdv6Dpp+R+wT
         KisRdOfJX0VF6DabLD35EFA7Dui7hBEV6T74DFHVSHKTnC6bNPb3AqpLJL6WxQUzy9eW
         o46uMoRW/+HvWciMAq3Mel5tp/M52RDky/6heoKBFRcfJqg2/nYFG2NDy+4XndV4ye9a
         QWm7RfulzKFt1uWqtft6CanEwUoMrKppKO1/y1pVW73bPzoHJh/i3GJ3c+cpJxyZpCwE
         bFErBKRMhS1T/x0cnLX3y2jGeKTryHHkifoYXmPkVSqhfIIhbnnxtx3mUHBjxhMPlGM8
         xpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010804; x=1795615604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
        b=pUUmr6B+krzUcsDFuQWuitmkodWnPnATVQDOgc/vVuByg7B6o7cPWH/0P5vH4V/8Dh
         5TIdlgRa3LPCFisbLcHAW2J5kbRUDjB8sFW7XCWDOLuujTsCPesx/lMadTPAq2bDOAam
         M0HX6mO1SGUFifobj0k7IRJMGGQFWDqPa33PKSvilOYkbhvfWg61l99j97aixZPTlHMo
         XrRVUgCAtmspRRZF+ZbdJErefBpFKURRSb6MHsqxFsy22+Nlr5925hNGpt6LTVs7P7Zj
         XZPLoObs1pFoXPg1zpnT1SsY9VQuWLdgMc12UnwF7xZaXYWYrveFoM4WGYsvztPurUjh
         hRSA==
X-Forwarded-Encrypted: i=1; AL+hErHataFaK7elrsePCJuvLD6xXgRqdQIzP+VmQxqTeWwCL7Ru/BqPUbqTfsurcYbgXPCbZlWP1jbRbjuKW68H7A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/x6PDjpmmkHcoQVMTuQxitOESnyiNjpHilEf3jcNSdxMhTYgUp
	19yJ16PJUA6YcKvLGDvV8ZX4iXEeVcRD6DT9QwqQyPgxkGNBiSwu71Cv22+OkAp9baQ=
X-Gm-Gg: AYBFou3ADzFgxw7XUaLwSVp1D/QyGsRKgvsDFHiijXF+KTxg8jN1rkJNzrewj8oy0e6
	hsfMcQreTeCgeb4KQXmxZ5KfW58tbdu+HYi63bfVllaIp8SgWFkAtg1vmgmvh87Xjv27WNEbZzL
	PX0UI5PWNlmFtBHeH+NeZOZ0aP5xArNdrIeUlSukV7L5zENbNL4sv+WXOxk2Cge+iIletdseBe7
	8kK/N1wIoudEgntNNEEl4cADOd0mwIz573Zf6o35UUwWU0UO9FEp1N2vi3R+5Waj38kBFxlQf0P
	GVj5hEn30gF4VEjBlwYs2fxJh/Z1mEQ/mXvwiynFv1STkrUhIDH0AcmfUpHXCvXdCooljJkErp9
	lxOwvvJk9d3iqX6wXyl98G4M0buQOUvN7eTqx6QZgiuEuxlYmTwO1z6QZFturzP6RT5Rvz4XmuX
	fQ5b3qKf5HkFcq+h7GCP3ECCbXVqx5dAbp351rRXP4FUWdI3Kkxc+26FTcNVUhzHvkgDFgeug7Z
	5CAnLgTlstf7umkCrHbGov0tyQFmngIIvDRmuK+ECBfty2i00zkosXNMcE2v/OZhWSYLdqvAZrQ
	xEB5Dd5ekLDasC8HKE6I7PLDJOT99K0gwjA=
X-Received: by 2002:a05:600c:3509:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb7da03954mr52120315e9.9.1795010803953;
        Wed, 18 Nov 2026 06:06:43 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb7d256f64sm61534715e9.1.2026.11.18.06.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:06:43 -0800 (PST)
Date: Wed, 18 Nov 2026 15:06:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <k@chaosmail.tech>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	imagination@lists.freedesktop.org, linux-mips@vger.kernel.org, lima@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
Message-ID: <av2rKJQ0AKU9CFZI@monoceros>
References: <cover.1795002467.git.ukleinek@kernel.org>
 <a2d5ce256b8ec150de4a6494c177b19693a33222.1795002467.git.ukleinek@kernel.org>
 <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5c6ped4sw6nigwko"
Content-Disposition: inline
In-Reply-To: <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_060646_608286_49A32888 
X-CRM114-Status: GOOD (  19.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--5c6ped4sw6nigwko
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
MIME-Version: 1.0

Hello Jani,

On Wed, Nov 18, 2026 at 03:27:40PM +0200, Jani Nikula wrote:
> > [...]
> >  drivers/gpu/ipu-v3/ipu-common.c               |   8 +-
> >  drivers/gpu/ipu-v3/ipu-pre.c                  |   4 +-
> >  drivers/gpu/ipu-v3/ipu-prg.c                  |   4 +-
> >  254 files changed, 1155 insertions(+), 940 deletions(-)
>=20
> How do you expect a patch of this size be merged?

Using b4 am :-) Honestly, in the cover letter I wrote about an immutable
branch and offered to rebase to 7.4-rc1. When trying to apply this
series on top ov 7.4-rc1 there are only 6 conflicts (1x modify/delete
and 5x content); these are all not so hard to resolve (and even dropping
the respective hunks (i.e. resolving using `git checkout HEAD`) is fine
for me.)

> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i91=
5_pci.c
> > index 84a7dc6ab5db..faceb3de4fa3 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -870,7 +870,7 @@ static const struct pci_device_id pciidlist[] =3D {
> >  	INTEL_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_info),
> >  	INTEL_ARL_IDS(INTEL_VGA_DEVICE, &mtl_info),
> >  	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &mtl_info),
> > -	{}
> > +	{ }
>=20
> Personally, I would *always* use {} instead of { }, and would rather not
> change.
>=20
> Across the tree, {} is slightly more common than { }. IMO changing them
> is pointless churn.

It depends on how you count. My statistic looks as follows (on top of
next-20261117):

	$ git grep -l device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/devi=
ce_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | sort | uni=
q -c
	      2 	}
	      2 {
	      6 {  }
	   2598 { }
	   1262 {}

So over all *_device_id { } is more common by a factor of > 2. This
series fixes one {  } and reduces the number of {} by 37. For only
pci_device_id it's:

	$ git grep -l pci_device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/=
pci_device_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | so=
rt | uniq -c
	    159 { }
	     32 {}

Without the context of an array initializer there are many empty
code blocks (function bodys or `do {} while (0)`), empty dt nodes, and
{} in Rust code, which IMHO have to be considered off-topic for this
statistic.

Best regards
Uwe

--5c6ped4sw6nigwko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr9sOcACgkQj4D7WH0S
/k4vggf+PQfM4MkbLgaQRCdXRWWsc4/Fa0tTMBQAl4gjx2p5NE/N7TDUO571o3+N
oWcelzY5O1uRcc2qHZVnu3vAxFqzk4YHfGjsbGHsxQAibxnIFW7ttYTzt0w5a9NH
v65V6+sebCdwLrPVE5ilcqzFFSgmnv1wTNm2vCEUxdKGacifySaGRmg4+ax+fLb1
CL+RS7fM2EkQxG1k4iDEPv1Onrm9S4DtwTts0wxkK780rWYD9FoSLjHyX/x21Y8x
SZKaXeNZlxtHJpQLq8ub8AL/t6k82nC020wYZOUbUmvPyqxhNoUuuS0/RVlz9xT6
kXiliIwWzcMtAKt4ik8nbTRO5JERhQ==
=0alU
-----END PGP SIGNATURE-----

--5c6ped4sw6nigwko--

