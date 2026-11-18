Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B9160A2619
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 16:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W99i6om1;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mP4DwPyz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/cUldU1e2XAI/ZxV0Ch4uDE5FUyxfirjC3SAjGA4JrA=; b=W99i6om1m0mm/E
	Zrntr19jHMeOjDC0eKH0wKe49ULIvl5U25Ke0Aia93jUnKIhgV1Q5fjStyVRU40o6pav+C+RI0Nhu
	hsaO0+0W7DfKVHhqZ76hdwATVssslWWupzxaOGWYMNwSItflQ1q4x68k98/gS5BzUdBWawjbKqxrQ
	i887f4p3qNMOsvcwOrNKFF4KX6QaboT1t1L8jdo7eSwI1Uv+uP3WVdnMFN6BzM7PzUZuitLmDDS3n
	NXP39/aWHU7RvwO/wsQlwsnmAKKM9JwmKD33qn8LK8VQ7hcg9wBLWdR6v/xwkfRkMXbo29srfiHzz
	yuBOTkLn35oVRxMCYjNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTisk-00000009ajq-35e4;
	Wed, 18 Nov 2026 16:51:38 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTisS-00000009aT7-3KDx;
	Wed, 18 Nov 2026 16:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795020681; x=1826556681;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=ajDnh0zw+64dcFPrEUfvS5sWfWZYQWJZbcQwO+AcVNs=;
  b=mP4DwPyzA12OflFAs7cqsLyFUlGk851Vd/gqVwVcN25x8BrQL+i7AmOL
   8mYJpmast9tqACSNx8lBA4jZ4/q1QzUvavsA4vMpmrO4kXPI5tmgD7UvX
   RIKZkYtrXgFcDgMSDp8+RxF/Qsk0Pdt1zP/11+VRi9zgvwFg2kn0/zAaJ
   juFRnpN5gAXJQ16xhWq2lvyYTb3qIRMVB9Yj0aB5dYr71LMGSI/TCUXfu
   Q/vbbt3vkm3f9HlNHt84ek7qFjbaO9159QwvU9BrlJgluRx7ACzWJzJJs
   wtZ+6YyX/GEjAKJa7Ohka54I7IWU1FNw+PjgE6WXf82fCJhvvI5wWCOY1
   w==;
X-CSE-ConnectionGUID: oZ2rE8KxRlG7KJlEHRUcVA==
X-CSE-MsgGUID: 8DpQhJ4ORkulGvnvyMycQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3699699"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3699699"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 08:50:31 -0800
X-CSE-ConnectionGUID: k/DCmaX/Qp2q9S20vakyDw==
X-CSE-MsgGUID: YVFQiz1BSVmcIhLrCJbvrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9985477"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.187])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 08:50:21 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sasha
 Finkelstein <k@chaosmail.tech>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-riscv@lists.infradead.org, etnaviv@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imagination@lists.freedesktop.org,
 linux-mips@vger.kernel.org, lima@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
In-Reply-To: <av2rKJQ0AKU9CFZI@monoceros>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1795002467.git.ukleinek@kernel.org>
 <a2d5ce256b8ec150de4a6494c177b19693a33222.1795002467.git.ukleinek@kernel.org>
 <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>
 <av2rKJQ0AKU9CFZI@monoceros>
Date: Wed, 18 Nov 2026 18:50:19 +0200
Message-ID: <8ebe3b7219ffd963a498cccbcfe6cefc92717f0c@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_085120_862726_7CECB254 
X-CRM114-Status: GOOD (  23.59  )
X-Spam-Score: -4.3 (----)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> w=
rote:
> Hello Jani,
>
> On Wed, Nov 18, 2026 at 03:27:40PM +0200, Jani Nikula wrote:
>> > [...]
>> >  drivers/gpu/ipu-v3/ipu-common.c               |   8 +-
>> >  drivers/gpu/ipu-v3/ipu-pre.c                  |   4 +-
>> >  drivers/gpu/ipu-v3/ipu-prg.c                  |   4 +-
>> >  254 files changed, 1155 insertions(+), 940 deletions(-)
>>=20
>> How do you expect a patch of this size be merged?
>
> Using b4 am :-) Honestly, in the cover letter I wrote about an immutable
> branch and offered to rebase to 7.4-rc1. When trying to apply this
> series on top ov 7.4-rc1 there are only 6 conflicts (1x modify/delete
> and 5x content); these are all not so hard to resolve (and even dropping
> the respective hunks (i.e. resolving using `git checkout HEAD`) is fine
> for me.)
>
>> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i9=
15_pci.c
>> > index 84a7dc6ab5db..faceb3de4fa3 100644
>> > --- a/drivers/gpu/drm/i915/i915_pci.c
>> > +++ b/drivers/gpu/drm/i915/i915_pci.c
>> > @@ -870,7 +870,7 @@ static const struct pci_device_id pciidlist[] =3D {
>> >  	INTEL_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_info),
>> >  	INTEL_ARL_IDS(INTEL_VGA_DEVICE, &mtl_info),
>> >  	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &mtl_info),
>> > -	{}
>> > +	{ }
>>=20
>> Personally, I would *always* use {} instead of { }, and would rather not
>> change.
>>=20
>> Across the tree, {} is slightly more common than { }. IMO changing them
>> is pointless churn.
>
> It depends on how you count. My statistic looks as follows (on top of
> next-20261117):
>
> 	$ git grep -l device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/de=
vice_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | sort | u=
niq -c
> 	      2 	}
> 	      2 {
> 	      6 {  }
> 	   2598 { }
> 	   1262 {}
>
> So over all *_device_id { } is more common by a factor of > 2. This
> series fixes one {  } and reduces the number of {} by 37. For only
> pci_device_id it's:
>
> 	$ git grep -l pci_device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if =
m/pci_device_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | =
sort | uniq -c
> 	    159 { }
> 	     32 {}
>
> Without the context of an array initializer there are many empty
> code blocks (function bodys or `do {} while (0)`), empty dt nodes, and
> {} in Rust code, which IMHO have to be considered off-topic for this
> statistic.

I realize my phrasing was careless.

My point was not so much about one being more common than the other, but
rather that there are *thousands* of instances of both, specifically as
C compound literals with empty initializer list. I think it's pointless
to convert one to other, regardless of whether you're adding or removing
a space.

I mentioned my preference, because if I were to go on a style fixing
spree, I'd go the other direction. But I think that too would be
pointless.

I suggest to just accept either.


BR,
Jani.


--=20
Jani Nikula, Intel

