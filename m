Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF28BD3C525
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Dec 2025 03:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVYJO2kwhv4Yxba9s/9uQ09UDjoRFIlZEAIr3Ozp7LQ=; b=hC0KynClTgD0aEzwAgHNWRDiCj
	HHN9wSwSo8gBZmz9nhkfJ8sR2GC+D6XswWssSnmQPfQenhoKxn6lmArA82ZEUs0s8dvCqjg+ZMiMz
	C+A1rKl5GiJJds7UEPaJKbOESQKuGAvac42hudyOHpdjZ25HH9DKsoB7irBKkXAIwxtXBiLvGNAhO
	NnpmkL0P2sEdW8ko0Ij2uLmdKwBNN/4yxy79O1g7YHxbPWR50s0D66N57xAIGNHt2Js9gzlZggBPn
	kTMUqRjGZ56GboeFoTVXsu9WoxGCR8CHhxrAGd//aQAqlm3mAt4KgxqFTZxYHXeMHZ4UmZ+lw7ufd
	eDaf0MUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTAis-0000000F38T-0cpr;
	Wed, 10 Dec 2025 03:18:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTAir-0000000F38H-0MeZ
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Dec 2025 03:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2759E60139;
	Wed, 10 Dec 2025 03:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70FEC4CEF5;
	Wed, 10 Dec 2025 03:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765336715;
	bh=HTnrHTpkg4dlBAzb/c3lsvZ7TW/iYXn/GA/ChEpNu18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPGin8o8C5hUdY6uDZFP4486rE2KwWH7P6oN2hgY8B0hJZ6GxD+Cg+iIk+75M4Wy3
	 8Syls95IL73FoT6SAJQVltrejOsILLI7euSmQOU7kssetxMJMjwmlpYDx8G4RrpKqV
	 RgxK8mHsXMxeg+bYioSe20XpAWDHTisUiK77e2bcPBpXGFAyAuiG173GVmRn3g0Bd9
	 SbKd1FW+jAuC18+re7pPZBp+IdN5oMM3EkAmO2QDQ50yiWRFu+HKkMnjzaPuguTsEp
	 HQ8xSglhMTPdrFMi2wBx1M+n5LZoKypGNWIBvA3KWBu1wfTFuVnzIiHJpDfQGmqkgG
	 drEsk3R3SCpvA==
Received: from johan by theta with local (Exim 4.99)
	(envelope-from <johan@kernel.org>)
	id 1vTAlD-000000008Gf-1FEi;
	Wed, 10 Dec 2025 12:21:03 +0900
Date: Wed, 10 Dec 2025 12:21:03 +0900
From: Johan Hovold <johan@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: mediatek: amend vpu_get_plat_device()
 documentation
Message-ID: <aTjnH_i0q0xyLysD@hovoldconsulting.com>
References: <20251028100454.4086-1-johan@kernel.org>
 <20251028100454.4086-3-johan@kernel.org>
 <836bcbc3e35c267abd93a4d2174a3e570ca9e181.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p2LLKI/CbsHhUYRj"
Content-Disposition: inline
In-Reply-To: <836bcbc3e35c267abd93a4d2174a3e570ca9e181.camel@ndufresne.ca>
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


--p2LLKI/CbsHhUYRj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2025 at 03:43:30PM -0500, Nicolas Dufresne wrote:
> Hi,
>=20
> Le mardi 28 octobre 2025 =C3=A0 11:04 +0100, Johan Hovold a =C3=A9crit=C2=
=A0:
> > Add a comment to the vpu_get_plat_device() documentation to make it
> > clear that the VPU platform device is returned with an incremented
> > reference count (which needs to be dropped after use).
> >=20
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> > =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/me=
dia/platform/mediatek/vpu/mtk_vpu.h
> > index da05f3e74081..5808311d2b15 100644
> > --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > @@ -120,7 +120,7 @@ int vpu_ipi_send(struct platform_device *pdev,
> > =C2=A0 *		device for using VPU API.
> > =C2=A0 *
> > =C2=A0 * Return: Return NULL if it is failed.
> > - * otherwise it is VPU's platform device
> > + * otherwise it is VPU's platform device with incremented reference co=
unt
>=20
> I picked this patch but rewrote with what felt like better and dense.
>=20
> - * Return: Return NULL if it is failed.
> - * otherwise it is VPU's platform device
> + * Return: a reference to the VPU's platform device, or NULL on failure.
>=20
> hope its ok with you,

Sure, my only concern is that just saying "reference" is too subtle,
that's why I explicitly mentioned the refcount.

Btw, why is patch 2/2 marked obsolete? That leak is still there both on
probe errors (which I saw someone else posted a fix for) and on driver
unbind.

Johan

--p2LLKI/CbsHhUYRj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCaTjnFAAKCRALxc3C7H1l
CD7xAQDkhBeScQ152BZaSbV4ibLwRlxYvwnVCHDXVy5IcQn7PgEAljZlQZKju7EM
w/ogKHitR+nWXaEDkkt3ylcnfUcGyA4=
=+thX
-----END PGP SIGNATURE-----

--p2LLKI/CbsHhUYRj--

