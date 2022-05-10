Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91280C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 11:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pgs7xOJE55nr3bJ311xGtLGMLxTFJi8pfq2MlOvF9CI=; b=iVSW6ImeTPoqpJ+KFhkrJZOz5N
	acXyoQXrPqh20m+XITs+GVDonw8rqv1+Mkx4hGtn+vSHiS/5R7VZdMOZrEX/8AO3uPfKcletZu8yR
	dWvU1yUvzBnmSjzdor3y3vIPgM4aShHwf2191Mxu/AgIjiLZLf3iHHVJEo4Wtt66QBSMryulZmRsX
	snh7A/o/vxETVJwCB9MX9DCPAAOH/J2Pixjv+qnQu6Qp/tWtgDim+U9ydeaM77vJDXvvemIazwHRG
	Iq316SOQ8ZVcjCF7mIfXeZ1q7PtORThctw8mQJXmgwX1aVX0iTuBQAGHRDIOHjEH/46lTyqiUp3tY
	PAwTAnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noO7a-001ax3-Qn; Tue, 10 May 2022 11:33:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noO79-001aoE-5A; Tue, 10 May 2022 11:33:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BFCDAB81CF2;
 Tue, 10 May 2022 11:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42477C385C2;
 Tue, 10 May 2022 11:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652182392;
 bh=QilHbgP4OJJFhu6pWZ/iD/7nzOdj3ua+XvagKgVvp/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F5/ij1/HwGtN9IwgdHuFn/51Mo5tG/ZR/teTcfU6EycepK8Jm0gvxTFHKjuhJcb8r
 hkgL/QGAYBGixQgIRMl0r1Ur+ayk5AVNhQUodp4wqhulX9FcBZqS66bps2rl7t4cP7
 eafSAKiQL8KIcYf8P82Z9LDDccNzXz7wHSUr/khhkzT9vedyENzv4v/HXIfAg3ychL
 DjZq3oJFWd0+2Pw1V/itE1SlE5hvnZJNpKrzRtOVtwAuu0RUv4P9gEb04HcBbS63Eu
 oVstgiCK8JUHdj277lGUPkIVNQYiLVlZb6nXGjqjS4QTIbMPgvEAwL0U1ge2j+BWhh
 UFOAeW8sHZvbA==
Date: Tue, 10 May 2022 12:33:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pmic: mt6366: add binding document
Message-ID: <YnpNb258/JRSjZFQ@sirena.org.uk>
References: <20220510064603.15920-1-zhiyong.tao@mediatek.com>
 <20220510064603.15920-2-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220510064603.15920-2-zhiyong.tao@mediatek.com>
X-Cookie: I've read SEVEN MILLION books!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_043315_424060_E298E17F 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, tinghan.shen@mediatek.com, wen.su@mediatek.com,
 srv_heupstream@mediatek.com, hui.liu@mediatek.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 macpaul.lin@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 eddie.huang@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2397240223325077430=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2397240223325077430==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eivqfnsOGQBavwky"
Content-Disposition: inline


--eivqfnsOGQBavwky
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 02:46:03PM +0800, Zhiyong Tao wrote:
> From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
>=20
> The commit adds mt6366 binding document.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

--eivqfnsOGQBavwky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ6TW4ACgkQJNaLcl1U
h9Cqhwf8DVRTOtYWL6Y7xwHw2INdvAT+AmpFFwIuu6NrjGJzK88XnPHoXaHGBRhj
RnVchCU8AwLEohvJWg3hNTw5u/nOgro8PPhYZ8O6jnmqy4MNpYEUKfsYdiUjjtTv
PSpUp9RDJAyJ+Ug2eywKFEkMg6+zrQkayzqet6c1lKIaRUA+L6ldgpRSen8qAccC
8CGa9YAcmfuhKln7kpeVLWjDKpQybh0kWmiOZYLluu61rj32X+UWwULTPm/CRw4W
VZyUpl6B8COQN/HwPMfuAvzLmrw8TP/DAiAKXCSr/3382l0iJNdjQ4v3YSHKSitW
lhkIok52I973FY2hPvXt8gOsoFziEQ==
=T3z5
-----END PGP SIGNATURE-----

--eivqfnsOGQBavwky--


--===============2397240223325077430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2397240223325077430==--

