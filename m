Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56181C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 11:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLdHfwt2KHkXdO9Fv5u6W9J8O+EvBCSjdRRGmbSIzco=; b=TT1Omgm/aVXpoF4VNs3Dhk/IMa
	zxiiOYbppk2QKJJtM+i70sq1n+cM87xdoYxOszP7FHh1Q/geUmoqaRwi6ozlk0gG0UENrTO3p/PgD
	hmkGj/JGDosTNjDwf/xf05S7vh35/XkzzdVfxTErvvxne8jNFHUaJPLFmVi2Mgbv3y+jvr+KwdRDF
	+T1H015uUpSY1G+xbMeRm6csGCq/f76mnBI7sYT8r1pdiEBnUHah7HSqzWwjfydOxAwkhZvOyIJmU
	HIw92hzTUcYJ1Orxyu9zMgBr1KxShEFDCmR0nPw6mCxScvMgDMHdbC8LfN68YoIF1llv88uwWWw1r
	Mc/w/FpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no1uY-00EBRw-N6; Mon, 09 May 2022 11:50:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no1uO-00EBPV-9D; Mon, 09 May 2022 11:50:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 566C4B81161;
 Mon,  9 May 2022 11:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D88FC385AB;
 Mon,  9 May 2022 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652097033;
 bh=b4aTBZ4v+rVQoWlkbu6lUJp1RJHxYYLupXeHe22aK+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PlNdM41fWWZMMZ5VmLAz0aq7w+uOUXEjhHnW6/VgxfsZMoyrZEny2Hkk0t+Qv65VK
 Aj8zV/bpPwgdiVytEIyiebz+eM7UwsQiIejW1ruXiyORKicJHyx39i5753qVcKZKlB
 /bGzM/mn/8gwltwCt0274kMqGFL/a2QWaY1zOPYn+f5PfNRs80fuUoZb53eo0vyYUi
 SJf1xPUdJiVa5yYAvrwkBL9jW1ugsH/fByazvJobZTvXZzsrMCaCqV9ESFKrgA1Nmn
 IygHhchmdKOTVFwPQM7Vf5JivhSD2Ks2GjaxTh2CgBtZpo7rp/rteudTZB27n7F3V4
 Ciy68yOBXKDyw==
Date: Mon, 9 May 2022 12:50:27 +0100
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, tzungbi@google.com,
 angelogioacchino.delregno@collabora.com, trevor.wu@mediatek.com,
 arnd@arndb.de, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: mediatek: mt8195: Fix build warning without
 CONFIG_OF
Message-ID: <YnkAAx3VAXCMFOTn@sirena.org.uk>
References: <20220507021424.12180-1-yuehaibing@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220507021424.12180-1-yuehaibing@huawei.com>
X-Cookie: Anger is momentary madness.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_045036_495811_7D79928A 
X-CRM114-Status: GOOD (  11.75  )
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
Content-Type: multipart/mixed; boundary="===============1739221058556901850=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1739221058556901850==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dR5KuFyvd2qk11zt"
Content-Disposition: inline


--dR5KuFyvd2qk11zt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 07, 2022 at 10:14:24AM +0800, YueHaibing wrote:
> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1639:32: warning: =E2=80=98mt81=
95_mt6359_max98390_rt5682_card=E2=80=99 defined but not used [-Wunused-vari=
able]
>  1639 | static struct mt8195_card_data mt8195_mt6359_max98390_rt5682_card=
 =3D {
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This doesn't apply against current code, please check and resend (it
looks like you have additional patches in your tree, am doesn't know the
base SHA1s?).

--dR5KuFyvd2qk11zt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5AAIACgkQJNaLcl1U
h9CSpAf+JWlnlwHrSebKB8rGFYewj7XuvxJYOCgKGxDjC0jGkchj3AvBNkFD2Kq1
oKVPST+oVCaXX3JrpiWXMJzRjyokDkQsXjQFuQ3xOLDyuohNk/lwI6KKLk04edeh
0DIySvexNYhTyNPrP3MjLrYvb9VTLJVSiNpmkCFBjg0ZMd3mZu37nmpMwXsE0HFu
go20cHPF9WoxMI6KUBmYD2sWaVqJzwXbnZBpY0Nf+HABKDX2tnjtXNqje7eAJ8Ai
WwiEC0IYZh1tmINQ87V4TahiDHNu7Sx+gFzEL410N557iw7AR/HLjxcdpUulA1zY
CcLY4c5Cj+UjV8DRBrLtzzxzZmEzcw==
=GTnm
-----END PGP SIGNATURE-----

--dR5KuFyvd2qk11zt--


--===============1739221058556901850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1739221058556901850==--

