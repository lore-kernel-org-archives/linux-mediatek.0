Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DDAC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 12:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfIzrfEEE8NbW5N1HosiMtuONeAnqgToWdW1EjUjzV4=; b=YhAHudGmBdQYXlN3UBYIr0qvgz
	XuEL7Nty+Tt3cAYrK1PLG3taGDb7lZoflYksWBbzhgQNW5rxQYR7Z547BRZ4yclhaRf0gW0FBt//M
	t+1sK9emtvL7lgXDQl6ygOrDTDD/nLqUlb8d7hB6ThG+UNiAjV2YVbxfAXuuX7BC5m7aA52v4TFVF
	1+GNCbRoAiMAGWiA81urwHVF6eA/wiN+tOfDvV3RTeIZ+I6KyOt75lHsSpiovT4tRmu47oQP0kyjQ
	YchpHrgQbCSGwTH6IuBxMoXygMeKIepZ1oqJIbKYFANoKss1rDeP9y1NXxdhrSp2bxQniBtHEQPQQ
	NIXcQ72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrg64-000jsr-Sb; Mon, 29 Nov 2021 12:49:28 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrg5n-000jpM-Pg; Mon, 29 Nov 2021 12:49:13 +0000
Received: from localhost (p54b33788.dip0.t-ipconnect.de [84.179.55.136])
 by pokefinder.org (Postfix) with ESMTPSA id 177802C00AC;
 Mon, 29 Nov 2021 13:49:06 +0100 (CET)
Date: Mon, 29 Nov 2021 13:49:05 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com
Subject: Re: [PATCH v7 6/7] i2c: mediatek: Isolate speed setting via dts for
 special devices
Message-ID: <YaTMQQhENmJAIUk4@kunai>
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
 <YWQYbaTIhud2QHNP@kunai>
MIME-Version: 1.0
In-Reply-To: <YWQYbaTIhud2QHNP@kunai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_044912_076142_06BFD998 
X-CRM114-Status: GOOD (  14.10  )
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
Content-Type: multipart/mixed; boundary="===============6208640675388186581=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6208640675388186581==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jENikAxoMoLFIwSJ"
Content-Disposition: inline


--jENikAxoMoLFIwSJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > stretching. But if the slave device stretch the SCL line for too long
> > time, our design still cannot make tSU,STA/tHD,STA/tSU,STO meet spec.
>=20
> Isn't the new algorithm broken if it cannot support clock stretching?
> What was the problem of the old algorithm not meeting the spec?
>=20
> > However in the old (default) timing algorithm before the commit
> > be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support"),
> > tSU,STA/tHD,STA/tSU,STO can meet spec. So we want to define a new
> > setting "default-adjust-timing" for using the old (default) timing
> > algorithm."
>=20
> What I still do not get: the old algorithm was able to handle clock
> stretching. Why can't you update the new one to handle clock stretching
> as well. I might be missing something, but what is it?

I am still interested. Especially in the last question. Is the last
question clear to you? I can explain some more otherwise.


--jENikAxoMoLFIwSJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkzD0ACgkQFA3kzBSg
KbZJ4w/+KijOL+ZUEZ6LpgcHKAXFLv5FFa7WMHqAT6VluNHAVbrHkqyv1Ezlk8fh
fNYgiB80C3VNLIyuBDiarW4yqIgw3v9HVOSqdpkTnF9uo4QFEmh6k1cmMcsjoVb2
biNx5LnauS95Prup1NPApFsCX4X/pSyN28AZF9VwCZTkHOGHcXzqZs9sEX3+ztyd
PnhQZvsn89nBBdwTNY+SqmsIWapYVBeQ+Cii1y88ZTfWCH6PJMBIineUCmRDAYZc
8uLMnxh1y+RjLIda3KrtfScv/YhpsaXZ6LZjgNBIO5OTsGTrLodgoTLa+AKuZuyw
fAg55T+gQEtPYW3bFB+Ereu6sA4Nk99QL9588VSowT/A2aiHWCJN0eyNhSBVgFDO
bgzRgZIaB/bXAC+WdEtNBoH78j4gX+REtgWESTRA1MZdAxFZ7j1m3N19s9TTin78
CD1ESqS6WkUVUnvrT49uJJtPqE859IPd64N9egpYBASbMniJMImHVdkbpeZVXD4O
ffYV40aL/frsHqTZGPmoqrVfgUa90OnMExdwfeR1Ei45ptUhxHWiSlw2rUj5/QmA
fIyXoOBWLaKSfRZDRvQK6mnCWfEipYIZPd3GB1bXGl8OgO09xfELzgVjM4+EQgZy
qEnZyfpSHw0CeqEOupM7gstslBxmMaw8Ryx88BMfbDQmPcnpQOY=
=PbfA
-----END PGP SIGNATURE-----

--jENikAxoMoLFIwSJ--


--===============6208640675388186581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6208640675388186581==--

