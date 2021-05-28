Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17E4C47087
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 08:16:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 675B16128B
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 08:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 675B16128B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVn/KpcOHMnQWWAmbOvcg3HWQNuarypyUpeEM3cm7gI=; b=ThNVoRShR+q/ckjhc0bXVIYKhX
	I8zG6Fxw49r+0odljhwgyBGGe8AMPtfErrAWdtXTSZhvqSWGtCyuZAEpZkGGOBM/rVTioJ1ABZCJt
	OH7OehVDWweEKT4wZMb/QWwhJ/u/HRka98MBN8OaNBaQf6qSh/J/Vgkt0T6QlTe9W38jJlXrkFlsr
	wNgG9jSz4PzP1rESiXJe3cWQjIgGzeqjmkJThNP3QbHCZt7NS1dZjtt7p7DR/hhyB/mey6YyQLDmo
	SplihhG9lCE52Vnela5SaNRBkSaj8bSMsPH//uZnTrwrhho0kdEA97hNXHq2VIHNfo2LryTnN1J0o
	RimdXcng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmXfb-00DLrR-9P; Fri, 28 May 2021 08:16:39 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmXcf-00DK6S-59; Fri, 28 May 2021 08:13:38 +0000
Received: from localhost (p5486cda0.dip0.t-ipconnect.de [84.134.205.160])
 by pokefinder.org (Postfix) with ESMTPSA id 65EA72C0537;
 Fri, 28 May 2021 10:13:32 +0200 (CEST)
Date: Fri, 28 May 2021 10:13:32 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
Subject: Re: [PATCH] i2c: mediatek: Disable i2c start_en and clear intr_stat
 brfore reset
Message-ID: <YLCmLNDUqe/AiQ+I@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Qii Wang <qii.wang@mediatek.com>, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com
References: <1622117044-7583-1-git-send-email-qii.wang@mediatek.com>
 <YK/9wMhoACc0beN/@kunai> <1622165863.15667.3.camel@mhfsdcap03>
MIME-Version: 1.0
In-Reply-To: <1622165863.15667.3.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_011337_398968_32C8FBAC 
X-CRM114-Status: GOOD (  17.42  )
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
Content-Type: multipart/mixed; boundary="===============4275135228559913856=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4275135228559913856==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OJPvFYrtr07vTo0J"
Content-Disposition: inline


--OJPvFYrtr07vTo0J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 28, 2021 at 09:37:43AM +0800, Qii Wang wrote:
> On Thu, 2021-05-27 at 22:14 +0200, Wolfram Sang wrote:
> > On Thu, May 27, 2021 at 08:04:04PM +0800, qii.wang@mediatek.com wrote:
> > > From: Qii Wang <qii.wang@mediatek.com>
> > >=20
> > > The i2c controller driver do dma reset after transfer timeout,
> > > but sometimes dma reset will trigger an unexpected DMA_ERR irq.
> > > It will cause the i2c controller to continuously send interrupts
> > > to the system and cause soft lock-up. So we need to disable i2c
> > > start_en and clear intr_stat to stop i2c controller before dma
> > > reset when transfer timeout.
> > >=20
> > > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> >=20
> > Is there a suitable Fixes tag for this?
> >=20
>=20
> Can you help to add the following tag, thanks
> Fixes: aafced673c06("i2c: mediatek: move dma reset before i2c reset")

Added this tag and applied to for-current, thanks!


--OJPvFYrtr07vTo0J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwpisACgkQFA3kzBSg
Kbb03RAApmrkJIj//VaDqHQN7GyWM+5ruaKD22kJSm4fL8ozUu28fCSIk3ni1aK0
Pn2mXRSzGWzBWXFIaHEPISfaQSYYaeoGD5sgJJMcf/y6weyLlgn4SeIASsY+ijkY
rIfV1uqyzBUdUjAKXD9MfS/2VpNB5aj/5NXvqBv/wiKbjFRGZfIQ8JDv3oHViSmM
Fom+2RtQSbrZlO6eRafzIcfRUzDsFNL3umd4bG+35FQ+WVvRUzOKlKVRRECmj8aE
lpTNsaFTYfkr9L287bZxnOVb2bikxw6PnFQ842U3g9UZnM1IlVCUZws7V1tOVnFm
LpPvzevBtJ+sD248PRhpq6HT1ZtZC6fD6Ngi36aScsk1KbaGktomG+Av7VvN4fgA
/k2KiDJ2hH5g1XfeVvtxr6exyiDKVJDuDv4jgDobsDNlZdP1G+gum1mp4R5CjC5V
N8mr0dvc1YzZWHsSS/JAI6coKMqnO4E16NuVLHuTc10a+sfE4aXsYoKppsSZQHBA
ptvEQSc/WWCKG9lskmCuwdFd8DSywnk+1HPCZw4WfppDX40USMSSmKsZUCjG5Tz/
PFz6vy4qYZB0aYDAkuA2fhkZZD4VgwWBy08xbubSSGmePWGwvRsHdYRq0OyClA/R
6HfLbcT5Ch3IflK03jUJYNEyisJsIPVp4qB1BocG6jmoeXha9Qc=
=sw0e
-----END PGP SIGNATURE-----

--OJPvFYrtr07vTo0J--


--===============4275135228559913856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4275135228559913856==--

