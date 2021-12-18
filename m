Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC2AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdhKPxk6MYEddlt/EhyoAFKKT0+uftpFDtYcHpAfaxQ=; b=FRsxTybBxfZ/kxRGi9kLhALTyf
	KUaZvc8zrQ3hR9U9ND5OQhfsMhhQ0x1/xLHC06VegPwnRFhhax0qbLHH5MOS9l9revVhm03qaomDJ
	6hwN43Sz+GQcsuNNqKAZhBnIZZPkfssCMRZ7gzG2UQDohSXMAFu9eyx7lBy6Wwmcx6xZVLuJ/qx7S
	gHR7FhDlYCDwQ/LVl3WAAGO+AxU6bDB8tGCGJGEG+yfLy6X/a8urbg+njTbZ6Zkhoguklh+lbK4rK
	kd2VCDLMWfdD7m0avgD38NETzw0UQFLDdmu4hffd2Aa/sxb5cah7w6GQgqweQKdclE1Q34T3+rX6X
	/qEw1o+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myWmG-00DUSN-3i; Sat, 18 Dec 2021 10:17:20 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myWm3-00DUQD-KE; Sat, 18 Dec 2021 10:17:09 +0000
Received: from localhost (i5E860F57.versanet.de [94.134.15.87])
 by pokefinder.org (Postfix) with ESMTPSA id 0C7152C0095;
 Sat, 18 Dec 2021 11:17:01 +0100 (CET)
Date: Sat, 18 Dec 2021 11:17:00 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
Subject: Re: [PATCH v7 6/7] i2c: mediatek: Isolate speed setting via dts for
 special devices
Message-ID: <Yb21HBSm4VVjy1cr@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
 <20210917101416.20760-7-kewei.xu@mediatek.com>
 <YVf+83LdUEPjoLdI@kunai>
 <1891acec7f5c417f62081a8b10249b265df7ea62.camel@mediatek.com>
 <YWQYbaTIhud2QHNP@kunai> <YaTMQQhENmJAIUk4@kunai>
 <dfd50de5149a38ad1bc5faf9bb26a8a04be7d314.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <dfd50de5149a38ad1bc5faf9bb26a8a04be7d314.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_021707_865855_2D601A4D 
X-CRM114-Status: UNSURE (   9.10  )
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
Content-Type: multipart/mixed; boundary="===============2942118160382971718=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2942118160382971718==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yMbAyQku0qgAJOHf"
Content-Disposition: inline


--yMbAyQku0qgAJOHf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kewei!

> I'm very sorry that I didn't reply to your information in time due
> to my many personal affairs.

No worries, there is no pressure from my side. I hope you are all well
now!

> We found that when the ac-timing calculation formula is updated, the
> new algorithm can make i2c ac-timing meet the spec and function
> normally. So we plan to replace this patch with a patch that updates
> the calculation formula.

Cool! I'm glad this is possible.

Looking forward to the new patch,

   Wolfram


--yMbAyQku0qgAJOHf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG9tRgACgkQFA3kzBSg
KbYLVg/+MYdXhcFoux7eY+v6Q/G7l/f9aprzW9913QcUcuTxfnR4LOB/Kc+ztvU2
p3oZDNTa3yR90gF9TvSLrEVa3bBOGk5lYFWmmh1BCIkeveRBn9hQStPvQkJAVesS
2xCF4rIsP6DaVoSnpoWSwSZl6DfmeJpXxpArf6XT1hu8FiSVbxD2ZqAezsjxeMNE
0kjFQvIgKuKxdsZylV6HDCw0qscL2usHm7pG4Nz8+yoB4Z75uUqkcXoEz/cliOG6
+RkWM0VnP3tX8UQhOlZTqnQZmLd5dep/gurBYnDood2p0/4urtlh8xAOczWbOXBl
wt2cDF/X/vWmRR/kp7CN9avJS3RTShotNkhbdwiSbQ4s8FvS55v9vQZ3TVwhH1GY
JGWwcAAqs3uLtxyuN5cea+RklEVVjAwcOftjWVSrdBVeUUSh3M+uAz6x8LyOyK9l
++WJPYa/xuIYvCg+WdLCnuYD9F78bbkej7MKMGn0PDo2L4cJ8LihHX1ewvROXsuv
oVUUc70IZ06el5nXWEVUd588JxKZjTe7EkO5n0d6EQhv8X6AwUZC4M6y5CaM6BHm
68cwkGHirGfU79Gm6mZ5ck3d7SSLrj+pSmiGfVVB+dvanV206PH03NjCppNR+z1m
85QVqu8ErV0T0OzaTZcg5ISHFyWIiuo3tN9DZOnQBsiWAbPoqcs=
=HuU7
-----END PGP SIGNATURE-----

--yMbAyQku0qgAJOHf--


--===============2942118160382971718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2942118160382971718==--

