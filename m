Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2055EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 19:47:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA9F61A56
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 19:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCA9F61A56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42OU5VM4OT2NRYu+nSOws/B1w8Vtx8UuyPe2tfSKHd4=; b=uUz8ZcdgP6N91VrNfqBJhXFKJK
	cFy9C/IYZ8gQtkQhm7+F4+DffCOuXHbrOSW+F8OODmLKHzg40yK2hv9fzQtDo7o2+EJ/VRowYeu9i
	mjX3fQjdCFsrTUlBCn42YKxWz4TXQa8TFRcwc7yQrqxOTzDXAdWCcPVqCGXj2OHOJ9PsG8MWO095c
	3nhDcuIzkfi2oagF1jSsXyUoGu4y6UEv8Rm0Qx72jmLrOQl3+XHncpkvBXOY+1fuQzgdjJOwgwEkO
	7IkrDgXoSePC79VRZ1QCBNZ1+MdkDxiGSkAEoFo19vVUogd0UwUGWZvcsaGiM91SQF1a4Butxb2hL
	sQARIOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnnNX-008mBy-5W; Thu, 18 Nov 2021 19:47:27 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnnNJ-008m8S-W8; Thu, 18 Nov 2021 19:47:15 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 73D8D1C0B76; Thu, 18 Nov 2021 20:47:08 +0100 (CET)
Date: Thu, 18 Nov 2021 20:47:07 +0100
From: Pavel Machek <pavel@ucw.cz>
To: cy_huang <u0084500@gmail.com>
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com, gene.chen.richtek@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 gene_chen@richtek.com, wilma.wu@mediatek.com,
 benjamin.chao@mediatek.com, ChiYuan Huang <cy_huang@richtek.com>
Subject: Re: [PATCH] dt-bindings: leds: Replace moonlight with indicator in
 mt6360 example
Message-ID: <20211118172232.GB30480@amd>
References: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_114714_214556_5BFA0DDE 
X-CRM114-Status: UNSURE (   8.84  )
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
Content-Type: multipart/mixed; boundary="===============1638253356010652160=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1638253356010652160==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Replace moonlight with indicator in mt6360 example to prevent the below
> build error:
>=20
> Error: Documentation/devicetree/bindings/leds/leds-mt6360.example.dts:114=
=2E24-25
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:385:
> Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml]
> Error 1

Thanks, applied, hopefully it makes the checker happy.

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYZatuwAKCRAw5/Bqldv6
8mlKAJ90vIi/sBn9q2sGJqCTPZFZYHji5gCglAM3pvcMIDm3gdkd/95Ylnf6wiI=
=N/xf
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--


--===============1638253356010652160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1638253356010652160==--

