Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8DAC388F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 08:39:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C382246DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 08:39:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gXnagB/q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C382246DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ocM1zYRAWf3Eqa37FlnzYWmTayo7u/vbNsa5JEwJUps=; b=gXnagB/ql2gxwziN3ZFK6zrFC
	2cEy4mEXWlCKPLleEoPUfHzdHEJXZHYej+/DO3DNlIS2MDdWeVkaIo5DGwJ+hB1oaeqELCFlcznVu
	GOZ3LwulD3ZkHuqYV/ywJ1Qj9RmetPecS8dA/0DlYdy5SeSN5NtWmXYh3dI7cQDQQovPM1KvVDARE
	Itiy0qi8mA0XLGhPGAkAPI0e4PWFPoo9gcnUYcTUv5CDTk+hosg3xNV2sDNlkpyMxJQRlA2lqA8RL
	vB/df0K9PWtfFmcy23/ZQaOLsxSv5IKQovKFFHYXcFF3zC1T108d9FyRIXwLUdU0uPo4AYh7S0gmG
	nDyEV4GLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kffT7-0008Uq-Ak; Thu, 19 Nov 2020 08:39:05 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kffSc-0008H3-Jk; Thu, 19 Nov 2020 08:38:36 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 69BA71C0B87; Thu, 19 Nov 2020 09:38:31 +0100 (CET)
Date: Thu, 19 Nov 2020 09:38:30 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
Message-ID: <20201119083830.GA31871@amd>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd>
 <CAE+NS36rnHzhdk5Os+vL=uK225HJT-bUHSRJ6KccaOHc-kCjpA@mail.gmail.com>
 <20201119074416.GA27576@amd>
 <CAE+NS3430=-WynyXQr+8MghmtmiCR+2VeTt4aD5cT8UmA+1Qrg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS3430=-WynyXQr+8MghmtmiCR+2VeTt4aD5cT8UmA+1Qrg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_033834_846415_F79E690B 
X-CRM114-Status: GOOD (  15.86  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: multipart/mixed; boundary="===============4838350230924506113=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4838350230924506113==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Moonlight has more current level(150mA) from general RGB LED (24mA).
> > > It can be used as night-light and usually use color AMBER.
> > > Camera flashes are usually use two flash LED. One is YELLOW, and one
> > >is WHITE.
> >
> > From what I seen, night-lights are usually differetent "temperatures"
> > of white. Cool white + warm white.
> >
> > I believe "warm white" would be easier to understand than
> > "moonlight"...
>=20
> ACK, I will change color "LED_COLOR_ID_WHITE"

If you have two leds that differ only in one being "cool white" and
one being "warm white", you may need to introduce defines for one of
them.

If not, keeping "LED_COLOR_ID_WHITE" is enough.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+2LwYACgkQMOfwapXb+vJyQACfYV2csyAq22QDr0kWaNLt5aNT
ifoAn1b7uWaQPwk6nYu5GiDDzNFsPLup
=d2jd
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--


--===============4838350230924506113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4838350230924506113==--

