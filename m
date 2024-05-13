Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44238C25B10
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 May 2024 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOVFZJ+BqcOUrfYAc+t3JTl1Px9e1RzXz+g9BZGFk4g=; b=42sAGj1potikjSC/nIQZdgXgRg
	P+C2POC0GZajZv+VnET9D9OEOM5BvNK9+zbLYZKtTG0ytbWR1bucUxVYLgHLBEx1kdIIZNt86QVGg
	OJ/rGngtyteW9DsMsNcZLd52L3cvAjCl58XNvqJwESJGRrWk4lzhhldkHColvyk7i4pR+ppqKhUcc
	rYC3WwQ28ND2YZ6dQn55/wWSpfW6d8A+ZFFn684YGgE3LeW6b94e7PeZBhwe9KFu99OGLH4AhfRYS
	c94ZfkEnUXVao3vZvgz3nVBp3bnHK08L2eGX7WbSzHqXvShQpSWRaw6DQj3f2BnU+NdJ2QoOTAauN
	+/aVqNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6YIk-0000000DU19-1GRp;
	Mon, 13 May 2024 16:13:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6YIe-0000000DTuA-1wu2
	for linux-mediatek@lists.infradead.org;
	Mon, 13 May 2024 16:13:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E52CBCE0F21;
	Mon, 13 May 2024 16:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBA6C2BD11;
	Mon, 13 May 2024 16:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715616792;
	bh=9X9buD5qIepHwJgVEc7Tyvi2IGtdfBBEoBZf+F32eEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4T9yt8zd7VwONxhyB9dqukJEUzFjzdKvhaeSeqHS1SazgSP6+4gca6CZSNOZZwLF
	 6AV3Gsf1pSE/BUQhM/uxyqztiDVqDanKO/8K3WjtMObBq44p9+svVN76dEdrVwHafy
	 KcSKVZTjUzaiEc9LjNyhijFGEQtsJa9nBC/Pt5Wgv5Ze4CzfWKKmbIRFlLIw40nqMh
	 OY4SL+jq1vruxkYZGruP4RxAWSC/nmL7iwW0E/U+0tETVov3iZL5eKtNK2T7FVo9NP
	 GOIxTsh4cXLnAbfC9aD3dO9ClndE+kV8tdSK8me3ZBBoUFaOCDlfd+fyql1qm3cwX3
	 A6eovMVw1wJiw==
Date: Mon, 13 May 2024 18:13:08 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sicong <congei42@163.com>
Cc: nbd@nbd.name, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
	sean.wang@mediatek.com, kvalo@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1] wifi: mt76: mt7615: fix null pointer dereference bug
Message-ID: <ZkI8FPNxOQAUFeyU@lore-desk>
References: <6206228d.bdee.18f72609cf4.Coremail.congei42@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rp72CSPL56MRPJkI"
Content-Disposition: inline
In-Reply-To: <6206228d.bdee.18f72609cf4.Coremail.congei42@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_091316_831837_E3D3B7D8 
X-CRM114-Status: GOOD (  15.44  )
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


--Rp72CSPL56MRPJkI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Function mt7615_coredump_work will call vzalloc to allocate a large amount
> of memory space, the size of which is 1300KB. There should be a null
> pointer check after vzalloc. Otherwise, when the memory allocation fails
> and returns NULL, the function will cause kernel crash.
>=20
> Fixes: de791098459d ("wifi: mt76: mt7615: fix null pointer dereference bu=
g")
> Signed-off-by: Sicong Huang <congei42@163.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mac.c
> index 7ba789834e8d..04eb52904520 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> @@ -2341,6 +2341,9 @@ void mt7615_coredump_work(struct work_struct *work)
>  	}
> =20
>  	dump =3D vzalloc(MT76_CONNAC_COREDUMP_SZ);
> +	if(!dump)
> +		return;
> +
>  	data =3D dump;
> =20
>  	while (true) {
> --=20
> 2.34.1

I guess the kernel will not crash here since we check the dump pointer in t=
he
while loop, we will just flush the msg_list queue.

Regards,
Lorenzo

--Rp72CSPL56MRPJkI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZkI8FAAKCRA6cBh0uS2t
rH1PAQC/NKiI0N81cddugxpBRaXspuRUoF19NUeJfif9gvHdsgD/VuFcYRSNEGoW
GUwuGu32v2UJhfMKmHJtcJPVj6QV9g0=
=8TYy
-----END PGP SIGNATURE-----

--Rp72CSPL56MRPJkI--

