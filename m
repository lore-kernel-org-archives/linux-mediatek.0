Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3119C28B24
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Mar 2025 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNcfgkruRbdQ2LTcDlb82l2rtv263h9UvbuoZgmPSdM=; b=Tx7CZQV4BuZmOhUYS8IQIe3cqT
	kNiHKsBcLtjm28N9W0Kmh1EAMlqzFD7uxfbcnJZ8zRchMWzFH1HkrKgcbxHAriagaAQI6ZAKpk+xx
	EAubjQ0tkD0BmgKelIHUOKnpdPSPhWvhyxCHu7Y1KsEmdcHrXGbTf5sAXo25iHYsbmz/p6cCFDPr3
	bJAo7+wyAPMvTZ6Y3mm+NkTa9rXNXLpUTRAKQaOtOtWuVfnGRWIZNXHzMZCHsD8QtJ5ZZaDMn/SnM
	pyY8Ou+AsogsCmnUzO07mN/u+6XYvNVifl9K4oVmplKRMiObSeMInodZNkxggQF0/J+JNK2cXnARk
	2fM+97CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGrh-0000000C0DZ-3w4N;
	Thu, 06 Mar 2025 19:26:41 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGrf-0000000C0Cu-3wsq;
	Thu, 06 Mar 2025 19:26:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3912c09be7dso687464f8f.1;
        Thu, 06 Mar 2025 11:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741289198; x=1741893998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNcfgkruRbdQ2LTcDlb82l2rtv263h9UvbuoZgmPSdM=;
        b=iQjwfqplfqA2jXkTJxTgUYfbMTOJsNwoB6gg4G67GGU9yUNEtgLVY+ecmK3QOQYsPo
         eU5hr39awP3mcgefnFcO4obbBSZ3MZdSxCcuMA3xmXu+1slUU20huhnJOlgWfZcB9AGg
         DluA2ljJBYAukS7Zudbe2DFajBZNmP5HI0s9qLPVtfj2ePdex9fwXMXWO7v1Muco8fEi
         AqWrGIIPP/EUmdD9V0Tr64FaEm98owu4dPTOFcdgNsunPwITIBBMF5bZv31Hf14Av9mA
         KchmxcmS+Cd3ZUz178LkZId4/lFWv82vdGYqRFPh5zdZjc2+HvLy4zy1MF2oYjcVGemf
         QUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741289198; x=1741893998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNcfgkruRbdQ2LTcDlb82l2rtv263h9UvbuoZgmPSdM=;
        b=VqESd8WXSghioPD+OdJQ3ViE1RHIU3DNNhrCK/DNcqcIVHvGvWvX3xorqstvDcbYbc
         DZuthWseo+afL9yJTs04UvVHZJzsIE8ihrorZxPep8z+MSqZIy56fKtWqrx10nVU1Hyh
         dmnJZKI8Nz7LncmtEAf6UZlhjAmZPigiYpuTdWb7G1bBDelBRQU16HYeRZrEGBxs18ry
         vb2hA577y7T+m40SD8UoknOwl2+G+PF+yNi9Ujv01GOOqxGQI+dSPgE3gPc9fy7XdM+D
         Q2PJjD0px5XFuF251trRVrngl4FvDrd1wEHsADZTbVhRQxNjqkU3gcGgPFBP+tf4MZqL
         bFuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIEDK0E8SwR/u1C7wZuQOTvlMH02RoR8Alc0+CJoiqvT8mr/fqgyE61MB8rzXqaAt91YX3Na/DrLzppY+5zQ==@lists.infradead.org, AJvYcCXu7brrhgSBbqh4S8/squL4ujT2srKwOs5z6o5GcPelSBZTWaOjT9WntKhj62dVk+VHTzuphQVQHV24uERV8Fs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXh0cFKVLwxd4c0olUB+5Hl1TGirpSA3O4yQDc4SVLBcMfVQJW
	Dr1umi3iLnOD43OH23hCuEc4mEp5wxKqStQw/MXjv+DqH6g5VEdsI+DKbA==
X-Gm-Gg: ASbGncuWTB9jnWq4jh0jn+laooINBXhroMlvSt/SPYaCdn6XTgV7QANUV32VeuhLmVK
	3uHyTcHwsI8xDUUSErf6iExt3/HjYP7bwk/ehtr0djGPzrY1kDyFrtwFIbYKgEP5YDsgIqRzw9x
	s7KG/GvHTcGuhYfeHJrZknwaujIIXKo1vI4HONOHUwlQol+3I66OPqGL9zaAB/MTt+ncV7BMtc1
	uSBdmHJlTjdmkhuV7qF3vITnrCnjINhtuh5B8BG295j3Lte4UEpMMvQh5ROcIQHATqYEspBsPXY
	B1DYhAH1QEEGCMcMX5Ng1RO0kbYk0nTBnWcnO84Oqiw1v16IYlTXvVUpcPgcXMABaG7wGDRMLt+
	9K4P1QmY9rgIkrUnRmHEjOG/LGsfPzX8=
X-Google-Smtp-Source: AGHT+IGse2HrwvQit3ez+Tb+IZmcWPgul6Oz1Of3MncB8IKv5GiNEYehZwUGHa/gmdRGfttFwUyGrw==
X-Received: by 2002:a5d:5f45:0:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-39132da8fecmr291664f8f.48.1741289198054;
        Thu, 06 Mar 2025 11:26:38 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e1d67sm2905872f8f.74.2025.03.06.11.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:26:36 -0800 (PST)
Date: Thu, 6 Mar 2025 20:26:33 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v3 20/25] drm/tegra: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <mtsi7lohn4nq75y3mdzk7eomloxvswjn4blsmruutpejhppd5i@wexuiu7yfea3>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-21-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y6cp6aqkj6w24xiu"
Content-Disposition: inline
In-Reply-To: <20250218142542.438557-21-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_112639_978643_A8221502 
X-CRM114-Status: GOOD (  10.68  )
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


--y6cp6aqkj6w24xiu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 20/25] drm/tegra: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 03:23:43PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch according to hardware requirements.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--y6cp6aqkj6w24xiu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ9ukACgkQ3SOs138+
s6GThw/9F553EWmmWz8ONopI5pY7Fy+Pu8kzqsU5bhKSKO2aqJ8y4PFOQAzaacO8
2HuvhLXsP6l91B+R49oebJTWnbgcl9ThzcA4njgdKRFc7yZU/EZUEUGdwDkU6qsh
/rkDnM+a+MzIAd3Z31B0Kvb0tUsl4e0UBueDHmjfP554dbtnMr94eIHuqLVRb1/D
LB6ddm8DbZVoDKT9Ji2gLQpW84oFuIzRZPOV8JmPe+wE8Xf6A9sLloqJndErnvHg
B8X2K8PzxkNNJGaZtQMUpiJ+S1oDNZnnKtzt0Wb+b9itJqUgykve29vGBDBImsb5
8JLFlkdPFdKpFsbAvGyHv8b+F2rDVu4Oelg88WWDUSMc9Ut274u5/a2DTUOwF806
DtCADAFUOOcIyDZKfPpeQuWDPeScN3/ANW8iQMlyPaNO5fBKlisFjiF1Bh0gS+vQ
shkKb74wChg/4jgq1+M+I4DPdCQRe0kGIqbNZ4yK71owOjoSE6WIxxEt0UUKxPwh
XZyf8ZF2O9TCPMigN6Qw2AGUhaC3HsAG9KbhOTSeUAsOwohFtYY+3B6Hkb8SQHEM
i05OutqXEhtdSZgBK+HuweZtYWCBfy/BcMeD99Rkg01C+aMZcNPGVLpvGqpryNaB
Ga0hQwFdIjbnMbXxjzyfJfs7GqNyTAJtpiqBO3uDhWH2LxJHZ7M=
=2m1E
-----END PGP SIGNATURE-----

--y6cp6aqkj6w24xiu--

