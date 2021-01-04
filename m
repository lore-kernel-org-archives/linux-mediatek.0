Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83681C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:30:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED1C021D94
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED1C021D94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BkOaDjjXw8fZVagGGmjV/jHTrfaYLPY/UDuorNkgqYc=; b=hZWAGy8TLdwzn1Bd2aLXVmq1Y
	vifn00KossJqDHJ/nBAetWLj0JWmmQ7j3xFBWtxgE7MbufZEhMhP+D/F6sUOxdJlKqrPa3ZKLPDqI
	NUafPpkVSjmw2IRL6WTM5HA7Sgjo+Yvpz8VUXu9oAAaNKsES9FsGQv/8I9mNPfAWVa+R/ak3jP+dg
	cOVZlPA+0LJSbBgsi1G6F5AmGfE+qiKXvANrRha5BvHFTeGSSffhdW9Dv7RGbRVCRRXD9s1XBDmqr
	pZOOjo1Pn4NztrMXxZb+0AdbXiYUNNPU8CU+h2FQrPV2+4GTmGQMsw4k4fzqDs7gHAj7gSzzQsrQy
	qOgAksrMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwUcG-0005ZL-Dx; Mon, 04 Jan 2021 18:30:04 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwUcC-0005Xy-NY; Mon, 04 Jan 2021 18:30:01 +0000
Received: from localhost (p54b33105.dip0.t-ipconnect.de [84.179.49.5])
 by pokefinder.org (Postfix) with ESMTPSA id 0EE372C04DF;
 Mon,  4 Jan 2021 19:30:00 +0100 (CET)
Date: Mon, 4 Jan 2021 19:29:59 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: qii.wang@mediatek.com
Subject: Re: i2c: mediatek: Fix apdma and i2c hand-shake timeout
Message-ID: <20210104182959.GC935@ninjato>
References: <1608812767-3254-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1608812767-3254-1-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_133000_884166_4C7CC2D0 
X-CRM114-Status: UNSURE (   8.40  )
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
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2809098270320598579=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2809098270320598579==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2020 at 08:26:07PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> With the apdma remove hand-shake signal, it requirs special
> operation timing to reset i2c manually, otherwise the interrupt
> will not be triggered, i2c transmission will be timeout.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks!


--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/zXqcACgkQFA3kzBSg
KbZQ8w/8DE+WVtoHYrCXAHx91n4/N6jsfZxOi7xLlm9x3FX55Lo0eiHeNIRHjgXV
puAT1I9S8RkBC7s2Sc9jDH0ZGXsGfSeeWxTJydK3RV1tq59EySpl6PZQ5GYjPRPJ
VXf12AEDnFFKOHiN4K5N1uRFMkP+mp8lYnher8fJvEN3qOhtg+kQPw/JZVwoJ2yf
uB4MxKGyYdKPGHgb9cVrJhNYg4wx0wfHGWt/wrai4jVqjcqezI74SiUmbvI9a3B5
lFAwZkMKKQ44MKclF31Ctil+GRUTDp/ZrpuMKIJMX6zn2yTSS+M174NcvatScm5D
jJBTOdjKOD7f4Yz1FWsJ+mKx7t+go8+ON5DguoEFxJBVqyjcw7FEgsZLP7f5yrgj
QaJwdUx5v7E/+WPVAZTb7cnllHrPXrAihrRm4VSKlzbqWxUr0q5CDuIAQLKe4mKV
EFbRol3wetWpT5y2YPEj9p3O3IZnhYQWMysrnwI9clNOdZ50ChlNRHKylugbBXxF
V5LmyIHkFXDg6GqZulqaArUkp2kh4bavOejN0JPEZkPg0cGzqb1jd74R8CZuorHL
JtdZ8hp3icd360VXxSZ3YWeIPOPUSeaBRxusMNnJqNiGS1+4qGeGNBEdY3wdufDh
lRdyjCKQcIR3Ren+c/A3tbS+TRFQ8A1h9IBpznbaqgc/TQbzoAk=
=L+pH
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--


--===============2809098270320598579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2809098270320598579==--

