Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22230C5B543
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 09:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/J4JSHATnk9TCsjKFzEkFQy2OXqCakBAt2qzrcv/bCo=; b=Rex8x54csbmG3AAn/murl5u0gv
	ZTJInyXP93fqMAZDnSnuN7V1net+U8vYDDNSSra3IgLLiuOlGb7mYSNSFlxQ1qtHI7R+M1jXGeM2A
	bNuY2Czi/0WGtihw37SBmsx3zzIhOiywK9BSqoqNdlQbLxwrdQnshJXbLTfZkKCEQwpGxq+Z2uZ2+
	DBz0AMwzIs7Iq1A6nJAAbeBSYkA6aVRVmdp8T0dc0WzXdIghMtnXIaojWdr4Mb8YONalxbLIgJahz
	9o04eTA9nYeRqBy8oiU/ZAmH5n2K9IkGDjm7wGya8Hst2yx7YFgv3ORkZaywCm4/f7Goz5XMrd9aX
	ow2A3vdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvLa-00000006LhM-27KF;
	Tue, 10 Jun 2025 09:32:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOv15-00000006HgE-3gVM;
	Tue, 10 Jun 2025 09:11:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1992431f8f.3;
        Tue, 10 Jun 2025 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749546694; x=1750151494; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/J4JSHATnk9TCsjKFzEkFQy2OXqCakBAt2qzrcv/bCo=;
        b=LdRXOhoCL6bnQW/iPKdF2b0fIssP4C9Dp3FMx/2Lu/beNHkuDoqpOSpFCppubMQKt+
         Tb4YMwE1TaEQI7KSUfIBzIzEIZY0UutycfUTJ92WIo20PmDK2Cn7PUrBbyRXHcktaECC
         mIlhQYZT7/wTt+7OFi7pczlfncRmM4Tb9zIwcAuOsR09xyIXGPGw1t3hDwExuILWMPPi
         Ns/r3VAMIrfNA4jYDJvxlPsrr/fnQwre2TxKRqozKcIyNP0NsLZkxzH8muHM5kzrz4lH
         /IUqelD+tO5LwlQHtEkTyRlwQA94qBiTKR8kzQdzShCCQcPshFJlro3hR5vMip5LMEG5
         jCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546694; x=1750151494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J4JSHATnk9TCsjKFzEkFQy2OXqCakBAt2qzrcv/bCo=;
        b=GnwDs6vG7Wb5zVcI6hyYyzqTqxm7HnzCtmGL5uUZv7FvBwX+FsKb3tVdC2+1QmGqxA
         wiufLJCBFpG7MCNars1+mCZZukg3YOWhzhJQQUf/8ArwgtNdfBpYSxKauPl0/Yc+OaRu
         kAMb/VQgvEmjWkEHhd/NUwiwh60O4k4owIBcSK1YDtKqZg/zuE0HKBJLET1i67a/GXHZ
         jLrMikx/3i+svgJOt+wTXJ6mZGiJQeY/IgqU/mhwYnGzLZtXqRuyN2PtXMjqhaRrZgWi
         4Z8iWo3BT6lzvjNhChtnJe0q2mc4odvro/d0Dw/s1zrzNXvRudhd3N97LAyXQHOM0aZL
         aCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoCpspZibDoi6eGdAX+fTu0my6F1W+DW6h0//4G9er4kPFJqG/Z5AB353Q77ZCZu4NE3nIjya3NAHYh2U=@lists.infradead.org, AJvYcCV+imfYYwEK7IrHDiwxAg8pxmPB20e+gJcIAB/1bL9dcSmHMVeuAkVe+Kvlb1njS+GEAPUg3LZbJAl/QtJWD40=@lists.infradead.org, AJvYcCWIiM/lri7bAdfo+hJ9yxUVNHnaLbsC/zW4ep8zfTAg5m+El2T9Nx14ZS6plLzThxVniWRqpU0XCLyz2SLatl6Q@lists.infradead.org, AJvYcCXg+SKNZIWnv8jg4vGCnS2xpK57tUY/iWHqxtOTzbVPml1665OOQyrX3jD0p6kEXSUl7Z8MwYXmGYnr7t8KVkk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9ViRlOF21LGJTDLYFUmD2Jjs6GNxlu9TMauImrpOSxsP6eOvw
	7mXQwmT3cvmaQSF2EqndwMUVBsqxAfJfu2qc5gVPy3CO4f/aHBrovKQ/
X-Gm-Gg: ASbGncuOOFLEussdvPpA+/XFa07OwoEX+t1/dYSfOqAWuGVwa3Cu8QHp7t0K7h3iKcP
	pLTn2SNkfBLF5PEvqjqqIGE6NJ7Xq8EMNiS93tcbLhzuXvZxJJcOhWBnCqgzlIagxFXDu77na45
	69l1Ehp9aNrdf4yVb+iudv8bKfohJCMoar3nxpX079s5gcyafeFiKAnSOjeuu3kuT+L0XXHP9Tg
	CBAVv1bthXqgSx7Ag97ORYWQ1agDk2oBkOiBWGrGkugrR6oxhjLPWNiLr+NDmAyJcaVVk9V9hoa
	qXlhFTjfx/TG+5J8WOEXgaGuq0Zy0ZpErcnniPXe1EhzhQ7UzF4cLPuiFmQfO3hlChcCz0bROgf
	EWJ9k9lGb+Nob1cWlpsv2oasq2LIE69FmNq65joxjAIF2uzgv
X-Google-Smtp-Source: AGHT+IGiaud+NmiD3BNjNEkh0KdS8oAZ8TPOqcLbBsZsD4cCdkMv4OiwbthBO25zWdPhWgZ1rXZiAA==
X-Received: by 2002:a5d:588a:0:b0:3a4:f936:7882 with SMTP id ffacd0b85a97d-3a531ced06fmr13875069f8f.55.1749546693846;
        Tue, 10 Jun 2025 02:11:33 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320580af6sm6174635e9.1.2025.06.10.02.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:11:32 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:11:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Woodhouse <dwmw2@infradead.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, 
	Janne Grunau <j@jannau.net>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Robin Murphy <robin.murphy@arm.com>, 
	Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>, 
	virtualization@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>, 
	Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 4/7] iommu: Remove iommu_ops pgsize_bitmap from simple
 drivers
Message-ID: <zkfsgkps6z5wyjxdl3wmn2piwgir7swgml4jomuhxxkedne22d@hwzwxvcwpu3h>
References: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="noll3rebw4hmh74s"
Content-Disposition: inline
In-Reply-To: <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_021135_915162_30816192 
X-CRM114-Status: GOOD (  15.18  )
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


--noll3rebw4hmh74s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/7] iommu: Remove iommu_ops pgsize_bitmap from simple
 drivers
MIME-Version: 1.0

On Mon, Jun 09, 2025 at 05:41:28PM -0300, Jason Gunthorpe wrote:
[...]
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 61897d50162dd7..fa0913e9346c71 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -318,6 +318,8 @@ static struct iommu_domain *tegra_smmu_domain_alloc_p=
aging(struct device *dev)
> =20
>  	spin_lock_init(&as->lock);
> =20
> +	as->domain.pgsize_bitmap =3D SZ_4K;
> +
>  	/* setup aperture */
>  	as->domain.geometry.aperture_start =3D 0;
>  	as->domain.geometry.aperture_end =3D 0xffffffff;
> @@ -1002,7 +1004,6 @@ static const struct iommu_ops tegra_smmu_ops =3D {
>  	.probe_device =3D tegra_smmu_probe_device,
>  	.device_group =3D tegra_smmu_device_group,
>  	.of_xlate =3D tegra_smmu_of_xlate,
> -	.pgsize_bitmap =3D SZ_4K,
>  	.default_domain_ops =3D &(const struct iommu_domain_ops) {
>  		.attach_dev	=3D tegra_smmu_attach_dev,
>  		.map_pages	=3D tegra_smmu_map,

Acked-by: Thierry Reding <treding@nvidia.com>

--noll3rebw4hmh74s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH9sIACgkQ3SOs138+
s6HNrxAAo93PCboo986Da72XguJIozPLAKyIbWbaeG0mAjcZN8YUqcSh21C3Xp4m
qkNL3FwIbtg55H/1upzln07ZErFxc56r95b+GjnH7G4+X4608YnbKmdlZMxzkhpk
Hiqglce9T205CGZdT2oaZeO26+zHlTeh3LBiiR4o0eurhupQldQ9evEZ5qVseZDA
FOHY9nWWRDf0/HkM/+MpPA/8cXnNUpME3+OMZIWf6E0Fk0YJnGKS/FIj/aoYPvJI
9cHiJLi/xs2mxDGh9xUuYDXRcapqzGw6fpsFzJM4G1dEDbYctUR9IOgvdWJ/vzNk
zYnCdPC4tMYkkOwW85wmXbkVUkbTplxVlLUrVBDVjsou2gKfhKOj/lXWBQjWXJ2w
PWaIHU9l+OSWsvXB3qkUtROmoqFqrf4+XA/2kV9AlRJO7rrb0hK8yj42rtjec2ix
y5aU/5/v0Hcr+d09jaikpqhAx1miE9mHEFObqRBtOVko2pZ4l/DD6OVWBNDJyqHM
9fX438+BucatKIy11m72MpW4m9FdBxwhPEfpyQSc79NCDtoKzoxE0wGFzxqcKyys
EMGegmdKh0OKQke0uP2Ieo02BIp7sCoCf4m98nTRTYfOGTgfXO4kmfccAUeki59x
5ez2fDP654E1ESVH+Xn7bWfBKtFiuw6IlaPL+CPNnjcaAxxtDUk=
=E5td
-----END PGP SIGNATURE-----

--noll3rebw4hmh74s--

