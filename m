Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05558C63777
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 21:57:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C9BD2222F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 21:57:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wvkmQa+C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C9BD2222F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ASxt1ReB9VwXLoJtNzFy5toCbwEet0qBUesgZ9LWUi8=; b=wvkmQa+CB8MW2bY5xbS2PbkNh
	0HjZACynpGdsejoUDUpO0V8VNs51diP4SNAkCd+gqH24wpljT2yOvXXWwAMWVYNhlXFp6IAtcmxji
	pvyDWALfTTUHLHNMJcNStRn9/+y/0d1aiyXpx0de5t1u7oIriBt0WYQEf9U0bryEkTuTI16RVeDDV
	PPDUGQyneXH9xqwzf7WkMsKFBa5bnEtDdKphk6Y2k1TITUhHk3qu0QcsXtuGDarJSIHRUFvnnB6Yw
	+Zkyj4qlVB3o6tp/6c0cNfNe5SMhWM4sBJ7iDPa5lh3vp1N0zhNlBbiRp0w53vd6DjY1NfqERCbpV
	CdNOeBwAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfrvu-0005bA-Pc; Thu, 19 Nov 2020 21:57:38 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfrvn-0005X5-K8; Thu, 19 Nov 2020 21:57:32 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 1A8D11C0B87; Thu, 19 Nov 2020 22:57:22 +0100 (CET)
Date: Thu, 19 Nov 2020 22:57:21 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
Message-ID: <20201119215721.GA5337@amd>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd>
 <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_165731_784898_0AC630DD 
X-CRM114-Status: GOOD (  14.17  )
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
Content-Type: multipart/mixed; boundary="===============3574067403840670376=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3574067403840670376==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-11-19 22:03:14, Jacek Anaszewski wrote:
> Hi Pavel, Gene,
>=20
> On 11/18/20 10:37 PM, Pavel Machek wrote:
> >Hi!
> >
> >>From: Gene Chen <gene_chen@richtek.com>
> >>
> >>Add LED_COLOR_ID_MOONLIGHT definitions
> >
> >Why is moonlight a color? Camera flashes are usually white, no?
> >
> >At least it needs a comment...
>=20
> That's my fault, In fact I should have asked about adding
> LED_FUNCTION_MOONLIGHT, it was evidently too late for me that evening...

Aha, that makes more sense.

But please let's call it "torch" if we do that, as that is already
used in kernel sources... and probably in the interface, too:

=2E/arch/arm/mach-pxa/ezx.c:    	       	  .name =3D "a910::torch",

Best regards,
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+26kEACgkQMOfwapXb+vKrkQCeOnUki/+AAb7OvcuVl9km4zJ7
pT8AoLcioYOxJI356ZmTRwZvWeNdo/i3
=YtzM
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--


--===============3574067403840670376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3574067403840670376==--

