Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFE1C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6U5R+biQoLlTBUXzGiL+MKPgSZE2CpCj8RYH2I/yUo=; b=YPcSsfvIgyXin9ZtdPl8xV5APR
	PLJpmu/apSOYJA1TGEaY4qyH0bjVV7w06ZL7Yy9kCl3eAN3bW/0GuuWxPqRNok/u8ubLUVoioHkLP
	L7Dm0QcqR9BYcsjOMS531acLXIS5vcRHE8kq2qh/11gPk1KU+U7YbVq3s5hh7T9CAjgMf53sykg5N
	5Buq3yyaIntmD+r/9FU6Kuf/+rq+r9MSen7BHIS759Ej9rKh23J+iAi2ztU3AKDT2F1wc/v/GighI
	dLdwB/bltLCHyc6Ugf1eSmJ5Zfsn38vuSIY7AOGA9ajCrloN6AutojKfi/SYEnrGOUmjwk1gpZmMw
	vB4Vn3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZZFP-00GEbg-VE; Wed, 30 Mar 2022 14:24:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZZFD-00GEYc-Sr; Wed, 30 Mar 2022 14:24:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A7DB61450;
 Wed, 30 Mar 2022 14:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F97DC340EE;
 Wed, 30 Mar 2022 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648650258;
 bh=8mGhUsP282BlInxzYzns/CDUIBuGHFUwBxqH317vbiI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aQkJxwf6qzT0NoAl/UXsj4Hc+5tHiEnQ52giQEXLKNANq8yCfIyEpxPSrkZx5UlhX
 kME5m6BljI6TEs5IcgxKa/AB7DOGHrCWPlahmcE8cUuW40U+zkdmI65Avc8jWV6Q7M
 UBzP4RRsJlEF+dKKHEXwIfGnmAVhjRRfJTi9YJ8LSM4ZvHAV/BNoDumoK7SHaa8r6H
 AFwSkLy+uUkmeU8HFYbTVWaPefLN1A65DhfqTJjQVuKghpq1Awj2I4yZvNhH/wiOIV
 vMbzyqLs6Zc8BOB8iLN+CWMCsxD/2M3qpxVOocVXf3b8zkjb4gPvAzqxN3YU4ZJsUk
 cyMELuCjDI3dg==
Date: Wed, 30 Mar 2022 15:24:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>, 
 robh+dt@kernel.org, tzungbi@google.com,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <YkRoC30JLDMeVi1B@sirena.org.uk>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
 <20220329223002.uo7kiemopkh7ak4x@notapiano>
 <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
 <YkRNSoBKFvYYyZLu@sirena.org.uk>
 <61e9fb59448837cfc8e3ec862b711294bcb68872.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <61e9fb59448837cfc8e3ec862b711294bcb68872.camel@mediatek.com>
X-Cookie: Two is company, three is an orgy.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_072419_993506_32C8EBC5 
X-CRM114-Status: GOOD (  19.11  )
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
Content-Type: multipart/mixed; boundary="===============7821589907122433927=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7821589907122433927==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GNUxLScWaSBFpiDm"
Content-Disposition: inline


--GNUxLScWaSBFpiDm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2022 at 10:06:24PM +0800, Jiaxin Yu wrote:
> On Wed, 2022-03-30 at 13:30 +0100, Mark Brown wrote:

> > Making a previously optional property required means that systems
> > that
> > previously worked may stop working unless they update their DT, DTs
> > may
> > be distributed separately to the kernel and perhaps even baked into
> > firmware or similar.

> Thank you for your detailed answer. I should keep the driver's behavior
> consistent with the description of dt-bindings. The "mediatek,hdmi-
> codec" needs to be set as the required property. Is my understanding
> right?

The binding document and code should match so if one is changed the
other needs to be changed too.

In theory we should never change a previously optional property to
required which would mean that the code should be updated to reflect the
binding document, however sometimes the DT isn't actually used as a
stable intereface by anything for a given property or device type so we
can get away with changing things.

--GNUxLScWaSBFpiDm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJEaAoACgkQJNaLcl1U
h9AhxQf+PZuCmGnFAmuUHNlVpmiRjr++vB0m1T22WhLGrda5HR7LQ87SMHwwffi9
xnkVrr30xgbSxZy7Sn5nfjPAo7EfnomIxlDu50xmlNM5nXoIchxDl83NiGRcHoWT
RfiId1J9P5ztudpTLcVLbj+uN5rLunutEkcHBWBxKymDy8wLA0nIX9fsER8xk8Zo
L40Yv45UohIvFclHx21U+eBGenN5kJKih02NQTvbcoy2Cjh/iMCWPprQLpjpY5s8
s/8dnyUGWx9SUBPfJJdtecq3riFE8MbQQrRLi1P+CaOfIonzYv1L0yEe5+7kBQHR
WZaz1EZs9fORae+t52imAuWFVCd0kQ==
=UCGf
-----END PGP SIGNATURE-----

--GNUxLScWaSBFpiDm--


--===============7821589907122433927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7821589907122433927==--

