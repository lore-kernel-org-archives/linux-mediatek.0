Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D908C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 20:18:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F27E761206
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 20:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F27E761206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fwWszlCAHLw+UAID1EjJPx7FH86Un1Dv3WSWlPBsYDA=; b=l3BuVkCtB4NUctuW86Rgc3MHs
	yU3/wwskd+3MbxgCTQIeMAQf2I/bV6IQw17jI6JoVPupw5+PtdPZYfmgiodvmVNqwFkHURy4yGnOu
	PRuBzzqDk16u55G6Tysb2IaRJAm8dcdv9ccDxD38p8j37KL6lWuL3iN//QLm765SpJyZeNtZUdtxp
	viZXryBYodVRMDwGj0w7xiUnVy7VZfRa8vqyCku3mc16nkUbwu3jHOo69TXGVjyuUA5dOWxEBUF1o
	Gue0UyDBJXZquVJBKWSnicpBJJ+rzL21PhU6rsz5mS3YPZs6pvHRML3aeQ8bW+eO/Sb2PYZE2Ss5C
	uzAIE/8/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWPUB-00AN97-HK; Tue, 13 Apr 2021 20:18:11 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lWPTp-00AN5t-Sg; Tue, 13 Apr 2021 20:17:53 +0000
Received: from localhost (p54b33d59.dip0.t-ipconnect.de [84.179.61.89])
 by pokefinder.org (Postfix) with ESMTPSA id E9D332C0570;
 Tue, 13 Apr 2021 22:17:40 +0200 (CEST)
Date: Tue, 13 Apr 2021 22:17:40 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
Message-ID: <20210413201740.GC2751@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Qii Wang <qii.wang@mediatek.com>, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
 <20210406194856.GF3122@kunai> <1617797706.32076.1.camel@mhfsdcap03>
 <20210407181936.GA1614@kunai> <1618228994.32225.3.camel@mhfsdcap03>
MIME-Version: 1.0
In-Reply-To: <1618228994.32225.3.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_211750_713398_A95BACA7 
X-CRM114-Status: GOOD (  16.99  )
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
Content-Type: multipart/mixed; boundary="===============4047112060282533404=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4047112060282533404==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline


--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 08:03:14PM +0800, Qii Wang wrote:
> On Wed, 2021-04-07 at 20:19 +0200, Wolfram Sang wrote:
> > > Due to clock stretch, our HW IP cannot meet the ac-timing
> > > spec(tSU;STA,tSU;STO).=20
> > > There isn't a same delay for clock stretching, so we need pass a
> > > parameter which can be found through measurement to meet most
> > > conditions.
> >=20
> > What about using this existing binding?
> >=20
> > - i2c-scl-internal-delay-ns
> >         Number of nanoseconds the IP core additionally needs to setup S=
CL.
> >=20
>=20
> I can't see the relationship between "i2c-scl-falling-time-ns" and clock
> stretching, is there a parameter related to clock stretching?

( you wrote "i2c-scl-falling-time-ns" above, didn't you mean
"i2c-scl-internal-delay-ns" instead? )

Not yet, and I wonder if there can be one. In I2C (not SMBus), devices
are allowed to stretch the clock as long as they want, so what should be
specified here?

I suggesteed "internal-delay" because AFAIU your hardware needs this
delay to be able to cope with clock stretching.

> If you think both of them will affect the ac-timing of SCL, at this
> point, "i2c-scl-falling-time-ns" maybe a good choice.

Do you mean "i2c-scl-falling-time-ns" or "i2c-scl-internal-delay-ns"?


--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB1/GQACgkQFA3kzBSg
KbaUfw//WWDtCLJl71HVdmHWvPxYnsr5Q4WBAWP/wumIKyK7zaRS3r65zjoNv2d5
ozx5g3tlGjdfZWqa46V/y4M6V+7/UyREfhO+SEbz8UGE4Ch81+pDhLuc4lZMa5B7
tmt+mrZi1aHk0YsVxSXlPzTCfjbz4FbKDvNeOIsOyMj05Ar42RPBGnpeEKII9iJR
MmU9CpYv9y2kdejX/GiLwCwOihra71aahOwpR9iBsMTbC3ffFr4Xp6mhkWQaX7nG
8hhZbSomeBvgfQuLbVrzMbX0MzCh8W7Jy42xmLjJeJALt7EziJl6la+ANy16XqM0
azhtH6wLzPJnmrqN80EfEU43zENk3A1wpgEhz4iacoj/06sPinN8SXl10Ofeknzq
iFBK/kBcI9gtUsfs6q05uqS4sWvkZz6xZeRRAkSDRr7WKIt3np+o8tVQXX9tHBWz
/YnXwrbx4Vph5LO7dAF1RX3bfoBql9ElBPNsFexuEmNG54f6gBH5HEUoVfN9Vy2R
qxAcXgYPmZe5c9JpgASu9ehRYDCa2iVPTiSaxfYfbv+cZEtP40PaLrKnrnycOIi9
wMl4Dzr1llwrPqsCQpk5PvmZk4z5mEtCEKkTMn1lKTUF7xBVf9RPJbj588M8wLem
YrcqHgG4fmYb45AwlZEq4P66P9cuUowM1WVndjEBLPJO9pIM9hs=
=RODH
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--


--===============4047112060282533404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4047112060282533404==--

