Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80B7C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 07:17:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A331420759
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 07:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FRfZ3E7P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTc7sF9d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A331420759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TkSIP49JDtBIZf9kvevW35ZID37szHov1VGQwXgr8/M=; b=FRfZ3E7P8KTVZ10YWF1iQlP3S
	mUaB4X/G8lubi7vy8fCebcgQogzthtjpVLSRLH3YU4qAxsQHUhxu5xPfegnn8yvoszlVTEfesjSvl
	Qero6k2A8qBHa10rpMVXcaGJmNd7h0ZwI5F+/kX2V8tkKqxd1LNXApx04G1rOnmGIduMN5QuRqGPA
	J5dhfQzMTzSxvGPSYtRma1KxrqPFMbqasefwv47sTdrVP4BqJJa3EPSfjEDXA/5TVBjgzZiJLzalw
	5F7rSEJ20/6ADJ8bur5OhdN6IGd6nRtbQ/TAIUD3qOVYT1CgzXjQbfd/0o6qDmAXWk6aMtn5EvAOp
	CCgi12ugA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqAVx-0002fU-1I; Tue, 30 Jun 2020 07:17:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqAVu-0002ey-Ly
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 07:17:07 +0000
Received: from localhost (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67F2F2073E;
 Tue, 30 Jun 2020 07:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593501426;
 bh=5synz2C3U8p1pf1ipeeJ9gOueO9mxDSTwbasc+QhT74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QTc7sF9dri+9YwUbUHXmXr2Y/sQZhmYmAVlC7jghbeRA8/Jz2fy95Lv4DsSVDu1NI
 TZPhXe26/2or6G3dNUUx8zOEMo/yqqNoxUC2pqe/BDFsBIFx90dcKOKAjHLLzAp3C/
 5Hs79htAzqv9egFUqOZU7ap90JhU0O7ZqNDG69c4=
Date: Tue, 30 Jun 2020 09:17:01 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Subject: Re: [PATCH 3/3] mt76: mt7615: fix potential memory leak in mcu
 message handler
Message-ID: <20200630071701.GC2169@localhost.localdomain>
References: <5e8786d9cf0ccd09dd9c13c24c48ce441afbf0ff.1593491298.git.sean.wang@mediatek.com>
 <b1dc67b62bcc53ad02e86099ac0aab312109094b.1593491298.git.sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <b1dc67b62bcc53ad02e86099ac0aab312109094b.1593491298.git.sean.wang@mediatek.com>
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, nbd@nbd.name
Content-Type: multipart/mixed; boundary="===============3514505066512460557=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3514505066512460557==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline


--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Fix potential memory leak in mcu message handler on error condition.
>=20

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> Fixes: 0e6a29e477f3 ("mt76: mt7615: add support to read temperature from =
mcu")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mcu.c
> index 1b46cccd93c5..58e3838a3dba 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -183,8 +183,10 @@ mt7615_mcu_parse_response(struct mt7615_dev *dev, in=
t cmd,
>  	struct mt7615_mcu_rxd *rxd =3D (struct mt7615_mcu_rxd *)skb->data;
>  	int ret =3D 0;
> =20
> -	if (seq !=3D rxd->seq)
> -		return -EAGAIN;
> +	if (seq !=3D rxd->seq) {
> +		ret =3D -EAGAIN;
> +		goto out;
> +	}
> =20
>  	switch (cmd) {
>  	case MCU_CMD_PATCH_SEM_CONTROL:
> @@ -215,6 +217,7 @@ mt7615_mcu_parse_response(struct mt7615_dev *dev, int=
 cmd,
>  	default:
>  		break;
>  	}
> +out:
>  	dev_kfree_skb(skb);
> =20
>  	return ret;
> --=20
> 2.25.1

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXvrm6gAKCRA6cBh0uS2t
rDXrAPsGccYGcgDDRw98f6tuG0QktsFKLRJItNtuQG+mGY2YjgEA4FLMj9tcQOx3
Mz+xeYKB+byp9MDd87Yju/h2fQV1Xws=
=zdsp
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--


--===============3514505066512460557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3514505066512460557==--

