Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE95C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 10:57:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F170B60C4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 10:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F170B60C4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9fKtNpvUqU7yjW1Wyrr1RYZOB9CPRjIybzEmcVvSSs=; b=PohO4Zb0T+ZV9nwgOX3pL/FLAd
	BrSxImGYAP8M+nLdlaFj4qmUGdrAmU0/Y+JusiiI+zOyMALSr/IzLST7+dDFy/BHunI9aiw4kki4R
	FlTW3l/df7zAMrMjA/rUvi4Ht2inV+Oo2g5RYNVpxP2TdDTZWnVBq8wm8jXOhYGVIdGqJmyHxlVh5
	/P+yu0917B7nz5tJL1Uzwjd/gJNeYWMfsXaSIfUktf3Oe0MH1wMOCCjMXsQE132EZIxCgqLkHSVIf
	NhCHi6t5lysjjLTsMVNh7ieBkUdNq49jgy+8Tq0zSfGvhjjlBltTffgsUYNmdsmvQ31auBDbTal8i
	6udz4gsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZszN-008vyC-4A; Mon, 11 Oct 2021 10:57:01 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZsz9-008vuv-40; Mon, 11 Oct 2021 10:56:48 +0000
Received: from localhost (p54b3315a.dip0.t-ipconnect.de [84.179.49.90])
 by pokefinder.org (Postfix) with ESMTPSA id 45CB42C00A6;
 Mon, 11 Oct 2021 12:56:46 +0200 (CEST)
Date: Mon, 11 Oct 2021 12:56:45 +0200
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
Message-ID: <YWQYbaTIhud2QHNP@kunai>
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
MIME-Version: 1.0
In-Reply-To: <1891acec7f5c417f62081a8b10249b265df7ea62.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_035647_334812_9FBC8B93 
X-CRM114-Status: GOOD (  10.64  )
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
Content-Type: multipart/mixed; boundary="===============7897011480295589297=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7897011480295589297==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VEgwt+bxKre9p0ta"
Content-Disposition: inline


--VEgwt+bxKre9p0ta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> stretching. But if the slave device stretch the SCL line for too long
> time, our design still cannot make tSU,STA/tHD,STA/tSU,STO meet spec.

Isn't the new algorithm broken if it cannot support clock stretching?
What was the problem of the old algorithm not meeting the spec?

> However in the old (default) timing algorithm before the commit
> be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support"),
> tSU,STA/tHD,STA/tSU,STO can meet spec. So we want to define a new
> setting "default-adjust-timing" for using the old (default) timing
> algorithm."

What I still do not get: the old algorithm was able to handle clock
stretching. Why can't you update the new one to handle clock stretching
as well. I might be missing something, but what is it?

Happy hacking,

   Wolfram


--VEgwt+bxKre9p0ta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFkGG0ACgkQFA3kzBSg
KbZD3g//RihGqp/HqgzrerO26mwuF/kpOwfbJAoegQU0RTv+6k2GV/0x7lvxfxmj
hTRoxrNH+wQYSQLiAwwqPwJ+nXTzoob2WVFXd0+KPeVXm7C84+PIWEg5xth9kpfX
Kd+ReQezeCfSEthKN43pE0roJmobGBVK43PX2kxRjluZqN4NbmnaaWoV3xY6YJs0
RWM5gOESUyfAUr1s23uPXPI/+VwA27jpEXhabP5CxciQpJizJ4Agdtx9dkOZuCMF
TsgXrFj3ZD6EETIQXoNkTkjZyiSVVC5XyAdKVsGxHA966Vi+s9MCbqPZj9Hq1STO
v03VnlbCyQzL2cy/09XYDS8Mu0Xph1MQg8nbQEsD8SgsrR6BM7Lv6gRbXd//TaSH
xMz/+kU6B90pBnc+H+wjpwwjMxGTTcwLzRqYB0HsSJ7/kO3vHrXIVe9KyUrRmyHm
fHwKAkO0SNKjWyrLdhixR9pmgYTKpVKt4zwmEZiqTvbb923yZ9fU1qpnts7rtXZi
P8g5CaqtG2piS/5VLfRjinMbPH6Tl4KPT4OBMZAuoZ10EL16XjdODrrG6jA1oA5h
QzWdk8sbQiidCpZG/WGTz9yMQUlZeJZOefsfNyQwOJ5E0kxff+tWFLmF32fusrhm
Yoyg00b+KULq1E8zb7X9PCn0o0K8bwE3bhrlGdsHcpCR76p2r6E=
=1ToD
-----END PGP SIGNATURE-----

--VEgwt+bxKre9p0ta--


--===============7897011480295589297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7897011480295589297==--

