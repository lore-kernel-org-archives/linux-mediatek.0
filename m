Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3881CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fWM8ulUu1lkGkUpGzd1ZwObZCIAEdVxMsijQBoQ+lY=; b=452XAZzSuvVFB0SB4e/C4Ri9uq
	MBwG2Dky2xI9QcbC9W0seTAO3EKWyhL/258t+LqIDaqXxs2fGkYmvudiapVaSgGijRGd+4EAgJJjo
	DdA2VCW0EmIEkyGXjsIWS8icDxU246LmWviTuIE+/x+AHevBx8HjYg5lPoF9TUmNTKSK73qxnCnRJ
	kxc3gdFNcHPnbtRmYYHqVs3Ga3L9hh/4LTJHX9GRlJhhnhlzGy+GEUMnX5SJU4O1O+AXW6egnb+p6
	Y8/ygKZ+A3Kh4tZcq39KwQKcfP8H9tuZaR8WyVgAXfHfmB3s3ix/CoEsRxfn6TPMvM/tNrHJVE/hS
	BOwejstA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSm14-000D2J-FG; Fri, 11 Mar 2022 20:37:38 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSm0r-000CyE-NX; Fri, 11 Mar 2022 20:37:27 +0000
Received: from localhost (i5E861B4A.versanet.de [94.134.27.74])
 by pokefinder.org (Postfix) with ESMTPSA id B77CD2C007C;
 Fri, 11 Mar 2022 21:37:21 +0100 (CET)
Date: Fri, 11 Mar 2022 21:37:20 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com, yuhan.wei@mediatek.com
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: update bindings for MT8168 SoC
Message-ID: <YiuzAJW6wp5FM1kU@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
 yuhan.wei@mediatek.com
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
 <20220307033649.11564-2-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220307033649.11564-2-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_123725_957467_D246CD99 
X-CRM114-Status: UNSURE (   7.05  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2128827719730311841=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2128827719730311841==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZOhpGpznujtjvgC1"
Content-Disposition: inline


--ZOhpGpznujtjvgC1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 11:36:48AM +0800, Kewei Xu wrote:
> Add a DT binding documentation for the MT8168 soc.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Applied to for-next, thanks!


--ZOhpGpznujtjvgC1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIrswAACgkQFA3kzBSg
KbZ30Q//dOWbpz8BmJ0OA6br6Fvjoj/q5NY3fYUt7B6BPGqkP9zOPKtZTOkP5s1p
aK1ityZxejamdR+6DPTXzpJIf1xQG+aM/l50R5MUwedvvwaTikFiG2Up8nkkn8fH
ni9dRoqj95SGVlz0BFWvRZJMbzioGkf3A3HsGZ7gvGCfsBDyj9g6wyIyTkZ/mq8V
FYhrD5euM+VYXJ36tss4nVDJbzfoDHdvqY1Q6hBLB7dC0iLmFkTmdvWgDhyceBtC
Ijq64aCujO4ZXE66VuZy0pPJV9slTmoPNpRgwDr+jasc4qeBH84ROOpvJEu44Q/j
rMArOOEt3E8WJfBPHZS7Yrgcziz682A/YJybquJJCFd00J/apP9TS/8ngWo/xkSr
271G3QoUmtMY7NBR0B3M8BX0mf+pC2yTB2fc7GGqy3uePMXb9AAEoIfBqSz27FKQ
l7K9gAMpXqhnC9i4FtZ7RznodwWDFWe/Be5K6+Psh6LKSZcGuEtjsRFcbyeJL2ZC
omllvzpGpO8WiordArphPXCW1Le64jQLwuWoKHmexsPKv7XvNsSEqBVG9vFmFQkI
diK5CQzBoMOy23pVfLuLjkotMZuAZUrz+nWyRZTk56T/sW+c38mWvEcfLscb89lZ
XzQQcG47eQVIsoLMNTmHjA7py9vs4hgnmDnOdAK2cbG0A9V7eK4=
=lRaC
-----END PGP SIGNATURE-----

--ZOhpGpznujtjvgC1--


--===============2128827719730311841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2128827719730311841==--

