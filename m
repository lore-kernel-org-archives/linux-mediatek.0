Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D64C433E5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 12:22:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E6D20737
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 12:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TFSBRYVM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGqQpuA/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24E6D20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u4KWo0/iEs0sA2bSnAOXcjs1omNqdMiUmorOTikjVoo=; b=TFSBRYVMXD+7Izs6FkvcHnOlp
	QfBG7HPcExRQ01SQ2gEgTqqLnQmio6/J9jNVKOrQWX8/Xjbinl5aZmGFz4/hpKlY3ZLFsGPe6AXw0
	uwYhOQRuCVU1m8zudIRS3qbjAmbVGX4B88GR6arpwyXjWj6WI7IOU9G1JayJQWHYdh3/FzOpihc3l
	fjpo53SSeUfw3OH5Knq4aW2KVWSgfMp/dCiSzDI2/1QtZhqhflTK76+e0dXX937Yhr2mvgWFtnZHZ
	nG10QbP+vW8kcHMCJy84HQY9ZMwxBCzWbPbfuJYjJhrRDIiNZI2csF8NmiKa9fU5kqFmg3+YBlkhn
	pcTaHK+4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jywi3-0001Qq-FK; Fri, 24 Jul 2020 12:21:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jywhz-0001Pb-17; Fri, 24 Jul 2020 12:21:51 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 711D520737;
 Fri, 24 Jul 2020 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595593310;
 bh=pKwG7sz23Jh8BAXh9JAwkl7Df1oVbQNtNUXu8orqNB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eGqQpuA/nsqH8Q973vZszR/rnh/Gp5nGlYXQ1nr618nI+UDrFjh+iwCE+FtDhHtRJ
 H67R5n7U58FQi2AGdugQWmDDzk2TcDK2M2m4cyNXW3rxp+zb/RBBASKxXMfWLB7b+v
 6SUBkDL9SMis3R1e/0A2t/1yCCJx3dM7P8ExrEcY=
Date: Fri, 24 Jul 2020 13:21:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH 5/8] regulator: mt6359: Add support for MT6359 regulator
Message-ID: <20200724122134.GD5664@sirena.org.uk>
References: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1595509133-5358-6-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1595509133-5358-6-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: You will wish you hadn't.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_082151_176354_391C272D 
X-CRM114-Status: UNSURE (   9.25  )
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
Cc: devicetree@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>,
 Wen Su <wen.su@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5430042637493148119=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5430042637493148119==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Content-Disposition: inline


--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2020 at 08:58:50PM +0800, Hsin-Hsiung Wang wrote:
> From: Wen Su <wen.su@mediatek.com>
>=20
> The MT6359 is a regulator found on boards based on MediaTek MT6779 and
> probably other SoCs. It is a so called pmic and connects as a slave to
> SoC using SPI, wrapped inside the pmic-wrapper.

Acked-by: Mark Brown <broonie@kernel.org>

--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8a0k4ACgkQJNaLcl1U
h9Du2gf/U/MC+yoZc1bEJJ7ZixaCMK6ZSIJlbMh6RlAKO1kQAQhLz9i3yinQPaai
p8cRi3iERLnXzA3RxbvtG/Tq8JOSXZ6PjCVxjHp8OHmc+WMOb63rivRx4fyEzFj3
FzQJWg7RxoBiJOQQm0dx0KPd0Di4ITh6UxA7jSGtQVVdkI24V/D+Hb47KeZGlOxt
6awjyRSsyRgrwh686lJq9hinUieKmcyASf8ZnKuDUzqlI4FMC6xsz86/YGwKB82N
m38XL/zdOMGDDC8yWdAkyn1PWKqgfYa9B3qkAUheivyiXWy1+6sN4UQ59cHoO2+B
Z7DhweBclspPwW6xEE8Ts/MNL/TlvQ==
=pp/5
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--


--===============5430042637493148119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5430042637493148119==--

