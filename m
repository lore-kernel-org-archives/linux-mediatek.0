Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF1EC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 07:05:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C92D21D81
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 07:05:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQLZr3mm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C92D21D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XtaI/OETLYztkgW/yVPflptWY/ZDGSivI/wTYdPGM9U=; b=nQLZr3mmFG20sraHzLcdIsmtU
	u/EkWjQ18rIcas0VG33JWEod3SbpilB2JQCC/2bODGaGe10PRmC3TqJrMk73yENDPgbHPWI+SUHgY
	dk7Onha6rWU8GJINSO1zkmMi1wM9GGOVghuO4EHcPGgIAaJ3UrqsdAhanemGlJARDUlvOUywsV1kJ
	k/HPQYepPlNHNnfUR1YxGayCVEb+BRasNFtWoR1Ojag495VBjcjbNA6FLuG1w22ZlHDimMyGCnjvU
	LtDyo6I45XU6sTMpdzx1aomnRkvh6iUxPIVJoPQyPff3VZYrfgQQV3n2kYw5uzj/N7OijtLdmIpF8
	UazZVmz3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGd7X-0002Dg-RB; Fri, 11 Sep 2020 07:05:19 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGd7Q-00029K-PX; Fri, 11 Sep 2020 07:05:15 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id D936F1C0B76; Fri, 11 Sep 2020 09:05:03 +0200 (CEST)
Date: Fri, 11 Sep 2020 09:05:03 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200911070503.GA9818@amd>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <559a568e-3a2e-33c6-43aa-547a18f8e26b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <559a568e-3a2e-33c6-43aa-547a18f8e26b@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_030512_971466_AA8ECD7A 
X-CRM114-Status: GOOD (  12.86  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org, gene_chen@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, matthias.bgg@gmail.com,
 Gene Chen <gene.chen.richtek@gmail.com>, Wilma.Wu@mediatek.com,
 linux-leds@vger.kernel.org, shufan_lee@richtek.com
Content-Type: multipart/mixed; boundary="===============5013064622949108686=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5013064622949108686==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >+{
> >+	struct mt6360_led *led =3D container_of(lcdev, struct mt6360_led, flas=
h.led_cdev);
> >+	struct mt6360_priv *priv =3D led->priv;
> >+	u32 enable_mask =3D MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_=
no);
> >+	u32 val =3D (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> >+	u32 prev =3D priv->fled_torch_used, curr;
> >+	int ret;
> >+
> >+	dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
> >+	if (priv->fled_strobe_used) {
> >+		dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled=
_strobe_used);
>=20
> Doesn't hardware handle that? IOW, what happens when you have enabled
> both torch and flash? If flash just overrides torch mode, than you
> should not prevent enabling torch in this case.

Yep, this is strange/confusing... and was reason why I asked for not
supporting strobe from sysfs.

Could I get you to remove code you are not commenting at when
reviewing?

> >+MODULE_AUTHOR("Gene Chen <gene_chen@richtek.com>");
> >+MODULE_DESCRIPTION("MT6360 Led Driver");

Led -> LED.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9bIZ8ACgkQMOfwapXb+vIelgCePgj6nGNi1tecOoGv2il2xaai
cg8An3XTOtdxJXBTbkGrDdoc9j8KA4Wx
=c1KM
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--


--===============5013064622949108686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5013064622949108686==--

