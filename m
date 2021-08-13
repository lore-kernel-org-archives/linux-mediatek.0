Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FEAC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 17:11:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3269B61102
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 17:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3269B61102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfywleHxl1JCqElb1oQdLxiZ/KCU0BkNPchY4rjx2Zg=; b=vvuByOXZv5q8BZOU7IFxEpstBH
	ojJM0Zcss69ROK+raOjcOKcUQ7hHKyqosudpAzOqXxQp9FO9KN1wjoZVnVKtEopsiq1IDoVlbrUKT
	dzjvjciAydixgLsZESbZXhgs4G6+e2zPeKhYNTuZaLijQdlr+1zmiT/SRz0+BSKVWI+KNfmQeBcMq
	75+eNvUd8Y/zgqjo4mCr2pLfkxglWVF+Us0ibu+HCWrut70K2V23+440Z+psymLfRDHdH0DU5JS86
	jdQAyonTlG/KKaRgkyAuROGGWqlH2JnRSixFVMYZrnwjnP5wBAy7mK8blhPXmr0r4Z4QBvvbN280F
	dWZEMiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEaiJ-00DDnG-Rc; Fri, 13 Aug 2021 17:11:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEai6-00DDlS-GU; Fri, 13 Aug 2021 17:11:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 469431F4132B
Received: by earth.universe (Postfix, from userid 1000)
 id 41AF23C0C99; Fri, 13 Aug 2021 19:11:06 +0200 (CEST)
Date: Fri, 13 Aug 2021 19:11:06 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Gene Chen <gene.chen.richtek@gmail.com>, matthias.bgg@gmail.com,
 matti.vaittinen@fi.rohmeurope.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: Re: [PATCH resend v6 0/3] power: supply: mt6360_charger: add MT6360
 charger support
Message-ID: <20210813171106.entpro4b6dstho4s@earth.universe>
References: <20210719033914.16990-1-gene.chen.richtek@gmail.com>
 <20210813155438.4ssph6deqksob2uv@earth.universe>
 <20210813155858.GD5209@sirena.org.uk>
 <20210813162029.q5slrkubelfy3mvh@earth.universe>
 <20210813163254.GF5209@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20210813163254.GF5209@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_101110_730101_13150580 
X-CRM114-Status: GOOD (  21.81  )
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
Content-Type: multipart/mixed; boundary="===============4127703711891028330=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4127703711891028330==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="till3xkqoa2uchbj"
Content-Disposition: inline


--till3xkqoa2uchbj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 13, 2021 at 05:32:54PM +0100, Mark Brown wrote:
> On Fri, Aug 13, 2021 at 06:20:29PM +0200, Sebastian Reichel wrote:
> > On Fri, Aug 13, 2021 at 04:58:58PM +0100, Mark Brown wrote:
>=20
> > > We're still waiting for review from Matti on the linear ranges bit -
> > > normally that goes through the regulator tree, do you have a tag to p=
ull
> > > in case of merge conflicts?
>=20
> > He actually already provided his Rb in v5, Gene did not carry it
> > over properly (I added it) and the patch looks simple enough, that
> > Linus will know what to do in case of a conflict. But if you insist
> > I can unroll my tree and create a topic branch for this.
>=20
> It would be better, the issues I'm worrying about are more general
> refactorings or whatever that create actual dependencies rather than
> just trivial add/add type issues - it can make doing some kinds of work
> really painful if things go via a different tree.

There you go:

-- Sebastian

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-su=
pply.git tags/ib-mt6360-for-5.15-signed

for you to fetch changes up to 0402e8ebb8b869e375e8af7243044df21b5ff378:

  power: supply: mt6360_charger: add MT6360 charger support (2021-08-13 18:=
37:49 +0200)

----------------------------------------------------------------
Immutable branch between regulator and power-supply for for 5.15

This immutable branch introduces the MT6360 charger driver,
which requires a new linear range helper.

Signed-off-by: Sebastian Reichel <sre@kernel.org>

----------------------------------------------------------------
Gene Chen (3):
      lib: add linear range get selector within
      dt-bindings: power: Add bindings document for Charger support on MT63=
60 PMIC
      power: supply: mt6360_charger: add MT6360 charger support

 .../bindings/power/supply/mt6360_charger.yaml      |  48 ++
 drivers/power/supply/Kconfig                       |  11 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/mt6360_charger.c              | 867 +++++++++++++++++=
++++
 include/linux/linear_range.h                       |   2 +
 lib/linear_ranges.c                                |  31 +
 6 files changed, 960 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mt6360_c=
harger.yaml
 create mode 100644 drivers/power/supply/mt6360_charger.c

--till3xkqoa2uchbj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmEWp6UACgkQ2O7X88g7
+ppLYw//Tmxqf+UT+LcdCta9hrvT6tKxd9T2vw6MSJIbp0C77IhaXfKoITwr28Rj
Cq+GI026tp2b9Q8EtZVuKw/44AOWlefD1JusL2AVLV11lrQpt65ULD9YiaXr2Wuq
XbIxE6Q97jVTVcGRtvgOKiG2+IYdS445BtLlVWlljvCl0UnC1Kie30JSlLjNwJ1a
BbpQb8QOmfL9EMByiq8lrBG3TyiCh4gnQ2N8JeOsWBJFzVX5Xw6AFTJfiyKGTEQ+
jOUm7yAcbAP8JoAdjVeYt5h+UX5RvBIlXY0AL10fvFXo+3hCnhvbXVWhWdfXZCXU
CcaTDLZUyLsIM9k9fRwxvYxUs9FIo3+UD+EwZMbDF4TwUQ0Y57uvh3gfhOOw/ZL5
1whGny7xLTFN3jv1UhuKX5+0fUuVtN7jzX4mtWWbtWlReH655LBdVpApq3GkiY3Z
BFnFSEPoQnbzCT1qnFWApaN2NjybgK5xlJVyJ7zhGxlYKDPolBTData35IF0ZdQz
u6hG5atJj1KJYNaQ4yFG54GcU5hzw+/63VONGDfAckuUNletGEC2Lrzb/mCYBDWz
C52e6afwwH0rkmZ9mTdkiKTm/ksxxwiySlKMBAvwOf7dGNULBeUUvIQUVAyiKrDm
Z3b4m1O0WNWXoTjqJoxQUDQUo2QhkRA+ZPO1zzalUDeHmzxG91Y=
=D8wa
-----END PGP SIGNATURE-----

--till3xkqoa2uchbj--


--===============4127703711891028330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4127703711891028330==--

