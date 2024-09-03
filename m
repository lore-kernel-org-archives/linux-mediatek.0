Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43247CD343F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 21:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qHICJ+RAcGRCnpgdhCixc2OxonZkWe7me3aQgYEYOM=; b=sA9vWlaAzeeyVfEEBOhFKfmvhP
	9ZLFip/aHipUtqhHFInYLDZ5CEOpW4iPUJmYY2y9NfmkufrxCd94doC0Mt0XRBHJ/0vd2/L7LJGtl
	ux1PZ/N7ZG3ilXNp1MukXa/3j2N4nw8iwibF+U5dq9Ae6P4Xb/mF/MFz+jdigs3UiZa604480z+9g
	TZpbNnozGPYZV4pVTn0p47G8Jm/zC7x9Z7d7PBtU+l2qvKLrwCix6NicssU4Z+UcpVmaxvUo06dSW
	5KWMUxYStzBdZ4sX7jjdy28DsSOqt/c7jyBE/ypqC/CzOUOGf/vdR3JK5UPXET6UW88IeyO2yYnN+
	j2UbZO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slbNG-000000022wJ-17TE;
	Tue, 03 Sep 2024 21:47:42 +0000
Received: from a7-48.smtp-out.eu-west-1.amazonses.com ([54.240.7.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slbIl-0000000223C-3E7F;
	Tue, 03 Sep 2024 21:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725399779;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
	bh=dLHUYW+anAec76+kbDUnumPoN0JI3zrYqb+KYi9Mfyk=;
	b=lMfG8Gnb7WSgcjDHwbAjt8nliSctfd9FSccuFxJMzfxUmghwmi/ll023knExvIje
	T76OrzClxvGrS39/nnsoTHSUjTa9m3TRcDHsr5ZNtMycGg3gQBPTaPWYvqnZN5Em/RE
	2tXPSwAKsYx0PkVBm2mvXqW3jYMbOXn8SrBmyqJilQ5lBVlSbuQzKmVkHtJ+CpUbKGZ
	C+yNSBuaIz04hJ5vkRKmByZf+XcTg4fIqJdddmH0qErCUr6FREh4RM8/yLsnDH38+kG
	XsWREL9kyciv4zLzURqXEDXKAUX80FYS9dR6meK9tX39/LTpG/LG3UM90XQeaeRpZK4
	gNqKiGKoDg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725399779;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
	bh=dLHUYW+anAec76+kbDUnumPoN0JI3zrYqb+KYi9Mfyk=;
	b=jEDRXUVVSNn2ElOUJtgpRiDI68S3FjpZ+u4qVyK5evcLahYcpeG91rjbix3BefHt
	K3npYXS6fF9pQMcBLk1lqbbqittI8Wc6G8ZKabQZfHJgnzmfzNEFfqBnGTxsttWnZYw
	wDxXv1QH48CvZ5pztV/p+2iX6lZnlrKhWjaaoyCQ=
Date: Tue, 3 Sep 2024 21:42:59 +0000
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Pavel Machek <pavel@ucw.cz>, Sean Wang <sean.wang@mediatek.com>, 
	Lee Jones <lee@kernel.org>, 
	Alexandre Mergnat <amergnat@baylibre.com>, 
	Flora Fu <flora.fu@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Sen Chu <sen.chu@mediatek.com>, 
	Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: power: reset: mt6323: merge to MFD
 mediatek,mt6397 DT schema
Message-ID: <01020191b9d74883-4c4deeb2-1be0-4c45-9fff-c228767de23d-000000@eu-west-1.amazonses.com>
References: <20240830110732.30080-1-macpaul.lin@mediatek.com>
 <20240830110732.30080-6-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="faghrlhi2opkikcu"
Content-Disposition: inline
In-Reply-To: <20240830110732.30080-6-macpaul.lin@mediatek.com>
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.03-54.240.7.48
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_144304_140189_F2CA89CA 
X-CRM114-Status: GOOD (  25.40  )
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


--faghrlhi2opkikcu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 30, 2024 at 07:07:31PM GMT, Macpaul Lin wrote:
> Convert mt6323-poweroff.txt to be compatible with DT schema.
> Since this is a power-controller device node, merge it into parent
> mediatek,mt6397.yaml. Subsequently, remove mt6323-poweroff.txt with a
> separate patch.
>=20
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---

Please merge this into PATCH 2/7 in the next version of the patchset
(i.e. the patch creating the new YAML binding).

-- Sebastian

>  .../bindings/power/reset/mt6323-poweroff.txt  | 20 -------------------
>  1 file changed, 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/reset/mt6323-=
poweroff.txt
>=20
> Changes for v1 and v2:
>  - This is the first version of converting mt6323-poweroff.txt.
>    This is because converting mt6323-poweroff.txt together
>    with mfd/mediatek,mt6397.yaml, so we've create a patch set
>    instead of submitting single patch for each subdevice.
>  - This patch has been made base on linux-next/master git repo.
>=20
> diff --git a/Documentation/devicetree/bindings/power/reset/mt6323-powerof=
f.txt b/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
> deleted file mode 100644
> index 933f0c4..0000000
> --- a/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Device Tree Bindings for Power Controller on MediaTek PMIC
> -
> -The power controller which could be found on PMIC is responsible for ext=
ernally
> -powering off or on the remote MediaTek SoC through the circuit BBPU.
> -
> -Required properties:
> -- compatible: Should be one of follows
> -       "mediatek,mt6323-pwrc": for MT6323 PMIC
> -
> -Example:
> -
> -       pmic {
> -               compatible =3D "mediatek,mt6323";
> -
> -               ...
> -
> -               power-controller {
> -                       compatible =3D "mediatek,mt6323-pwrc";
> -               };
> -       }
> --=20
> 2.45.2
>=20
>=20

--faghrlhi2opkikcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmbXgtwACgkQ2O7X88g7
+pq2Ug//XIP0j2lD0cd3LM44blAIjUl0UgZJriEZiG3wsjlv/FuOtluDjrcvM3mI
UByVatgwToo/El3VOtKZQuLw9KZwczJ41SINA+fhCAoEfgYq9kHd/iU3TMA2CW7m
O9OnSo68rcy7gl8hefaKoh+YE8K3rEO5D1brjEqNF7bV1WJjDOH1KZ05QHMDJLcy
FlZJbjJrtKOIOjAhcS6dOMXqKdGBdeC2JjRDPI3LkzpYY64aiC9Z/xzwOsPomsLo
7+tgWUToTVZYXB79Wefk6SPXupXKwLFPed47jEnUG9AwQdxniHs8P/d8KOGNdFdG
5KotyKni2BsLXQsUiRoa4W1xeOtgkHdYxdKXAK51Fu8O4cFpkly/7GddGH09WXQt
SO1nDh85su1X3NJSEU9cpiRgfInAHlaaLPAwbZSUe9GMDvJyqqkJcOJACmVCYKMb
3H4Oa22kXbgcTOiL5NwkH2Bw6o0dtbzRrE1d8liKlDAiuMwLdfxiiClMkFKGL2Ib
4z5kaGdTHETsgbJIiCGiQvuR2+ST4NOWIjbjUNMTeTn3ByOX5QGmmetgO/HgX2G1
c1/CAqKKvpvHI0CIYvQEX/MW27aLlTvzwJMW4inml2ZMwg6EubzrgGGqz0cXKgm3
87q67pasYQCR6GYLOLpSr6AL/qb4M3FpAkcKDTX1m5Y4lEIAZHw=
=L2y9
-----END PGP SIGNATURE-----

--faghrlhi2opkikcu--

