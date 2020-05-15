Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F24CC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 09:40:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE40206F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 09:40:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K4b6u4CM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DE40206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1ukxJwbuhyw4Ug2pnCbkVKk2eGUtGQrr2sKoMM7Ycig=; b=K4b6u4CM8llSycyk5SQ6kCbYp
	wbJlGaTwQg4x3nilfIuIJRS4TyZlzMrFXj07nvCFdJ3UVdIzYKhGGSni7Rp/48itnIMWevQZ2Xsh2
	2vHj5aX6WNkB58MTeqJ4Jm7yS9fMD59gwEFYgev22YB8Dru2w61lroMDnCWZ4gKMMSCGr/FCvkLeu
	FPYo31qe6kS+Dn34xccooy4jfMS23fEBF4dTApvpCL24d5R9bleIyujz0iv6R9LDxTSfG93DuLXcP
	Qqcy+6sUmU9TkbwWHXEjDTWyr4WpsuA107EgHpaO0yhS+SWSGZNEjZTW+7Tv4/QBLfLC+1UYybRxO
	eI/t5iZ0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZWpS-00005H-SF; Fri, 15 May 2020 09:40:30 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZWpD-0008Id-Uc; Fri, 15 May 2020 09:40:17 +0000
Received: from localhost (p5486CC07.dip0.t-ipconnect.de [84.134.204.7])
 by pokefinder.org (Postfix) with ESMTPSA id C49A12C1F6B;
 Fri, 15 May 2020 11:40:11 +0200 (CEST)
Date: Fri, 15 May 2020 11:40:11 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH v2 1/2] MAINTAINERS: add maintainer for mediatek i2c
 controller driver
Message-ID: <20200515094011.GF2077@ninjato>
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
 <1589461844-15614-2-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1589461844-15614-2-git-send-email-qii.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_024016_135557_11C07E38 
X-CRM114-Status: UNSURE (   6.02  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8474595399162023185=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8474595399162023185==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ni93GHxFvA+th69W"
Content-Disposition: inline


--ni93GHxFvA+th69W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 09:09:04PM +0800, Qii Wang wrote:
> Add Qii Wang as maintainer for mediatek i2c controller driver.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks for stepping up!


--ni93GHxFvA+th69W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6+Y3sACgkQFA3kzBSg
KbZugg//TK0hfveJTlzciqv+okPXLT19EfLiDbZcb1Vd4QOqHwyzVuswobDqKlb5
FYUJwJ4mGytlwxPqa39dZKzCtwQlE/xPjISB+oPyiuESDrnlU/xXNIH6+prfbG7X
dbJkgNqpAg6hsaWlDh6QzZa+rr+TsBbmF3pm3q6SPZpXXUvp79YPgSE4k2RJJ5Ev
mF2QFCP88zK/0MsP1+/Dq0G51TE4Qzku8D35ysOB0ENIvtlCQp5RfeSX4OnhXzuP
Ne5dztd9S6HxoPKKyB0XNtSu1t0nf0Omsd+zagDLTVFJORe3D7MDxCLrAARWdPvA
c04rpnRuTewEihDJtyNJg3DovgqqGrN4sA4GINzIKkb9wV0L7mH1/4TU30OyhCRS
ZMce3FcP5gCg70L5E7pNy05EX3xMY8IltUok2AvWEpae6PnuauaxKLJjfgcxLtwz
xrNlNbZEsbvzAwdmGLZ6+PJMfa5tgEs1Wf0yfqgBrVPModxblx4Z+OrY/xt8rZz1
8zfQPQYIEeHArP07FIx7TzcdPCG8afJls2o9N6mzo84pJ8kLBOR/6yWGEUb1AuPV
A+gpFzP+XkrKf648i2YRE8EDVWnJkh42aiyZSBJZgsjYvej65W6nsLkpW5su2KUP
+f0Bf0k+9a6FF9ph+L8s1IRfrFoSzTT5X/Iay5Utatv/zF2ETP8=
=Bb7H
-----END PGP SIGNATURE-----

--ni93GHxFvA+th69W--


--===============8474595399162023185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8474595399162023185==--

