Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D37C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 10:41:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1339660E90
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 10:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1339660E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwswP0wvJicVGJ1ApRZkUNZE+kgG2fbI+ryLn7EQ1wQ=; b=ogVfEiJCPbto5wayGaUlB8TEup
	AZcCflEN4g23Aq0WYNYvcNhaltA1OrIxLJURGTQZ/qEdw+rM3hEcycFxrEREEqveN3wiTZyWpEJT9
	91fj67b24GZPXv/my7ltCs0T8Cer8JQhhaoPsH5klKbSfI6vfuKDmjNCtbE0BBitKIAuM2sbwjba0
	2sFXSVKUgIDMvwjGol/hKBRKArqNjU+hwyqxRxJuYkY1Fx/WvqMAa8aKqaIIaWF/Kym0XenfWr64E
	uvwd//MfFmQjlgOs1BOJ1rvr0WkV/7NZBgKMAGT/Ry7XwXRAS6JRdbf9sMYJhwfeKwhRuaX6WDJ8C
	fXH364EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZskA-008sqA-Up; Mon, 11 Oct 2021 10:41:18 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZsjt-008sjw-Vn; Mon, 11 Oct 2021 10:41:03 +0000
Received: from localhost (p54b3315a.dip0.t-ipconnect.de [84.179.49.90])
 by pokefinder.org (Postfix) with ESMTPSA id 47DA82C00A6;
 Mon, 11 Oct 2021 12:41:01 +0200 (CEST)
Date: Mon, 11 Oct 2021 12:41:01 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
Subject: Re: [PATCH v8 2/5] i2c: mediatek: Dump i2c/dma register when a
 timeout occurs
Message-ID: <YWQUvV2papMMoMlM@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
References: <20211010070516.26763-1-kewei.xu@mediatek.com>
 <20211010070516.26763-3-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20211010070516.26763-3-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_034102_219170_5FB99312 
X-CRM114-Status: GOOD (  10.10  )
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
Content-Type: multipart/mixed; boundary="===============0896240548064890824=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0896240548064890824==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JtSQ7rtXR1c2yVew"
Content-Disposition: inline


--JtSQ7rtXR1c2yVew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 10, 2021 at 03:05:13PM +0800, Kewei Xu wrote:
> When a timeout error occurs in i2c transter, it is usually related
> to the i2c/dma IP hardware configuration. Therefore, the purpose of
> this patch is to dump the key register values of i2c/dma when a
> timeout occurs in i2c for debugging.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--JtSQ7rtXR1c2yVew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFkFLwACgkQFA3kzBSg
KbaUeQ//VSuKXbSjtpnmqhB/rNYBemDzI/uIR1UVNHnMegYbHmnxIsjnYKTDcJpA
xYsVjufqGagxzSPSED6xQ6tcIVl/I6NJ/D5XOZyVSYHOaXF6Y0OgfxlFXcrokLL+
UWblDSIAcoxOqnIcKv5CFUvpfocIO8pQeHNFD+v+bn1is/dNxzCmuKOF70tsT0Qu
hMNRUV1C/sVULBd9Kl5JBdBQxRSeTEnhYpx3X1WBOe6xlptSh26j2VlaUEl0E2C2
L6erBq6K9MQoYDX7Zolyt0759HxNJjRH4bJxZQ2xMTDO29u3c6/a2DjPGKQ/p31c
P+viAE53Csz6ooV6krMfR+hYSa6uEvG1SZ4l+6buUHTJ8tSSPpU7srNISofHgSzO
a+VPrnNOI8RuxP/XKWNO13pPsc9+pULXXUOOi4Ozt+0y0Swql+Cdkvx+HNZ8TXIF
eIaYJLMTuebxNjWMcJuX6wvT8L2UwLhpAo3XY93a+FJgUCdfPzCFd9uxHfWYX1Ad
B8oLzJQw/XsVHOF/97fm64ODVBy8ndQyIy6yPSBBdsZ1a9Sn5SgDjehHunJP5b4B
jDCdB0EBeA7R0bp58UCROkxcE17JMTfe+kVM6KPMw/RD2Sv/VG6wTawUl8+cax44
LlUQssHqGedkJsg4DHMFpF7L/U+knIq6iqtmzd9/fscD50y5zEY=
=pHeR
-----END PGP SIGNATURE-----

--JtSQ7rtXR1c2yVew--


--===============0896240548064890824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0896240548064890824==--

